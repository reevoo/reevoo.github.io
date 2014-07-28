---
layout: post
title:  "Git Bisect For Great Good"
date:   2014-07-28 09:44:44
categories: blog
navId: blog
author: Ed Robinson
github: errm
---

Git bisect is an awesome way to quickly find a regression that might have found its way into your code.  While benchmarking ruby HTTP libraries I found that at some point a performance regression had been introduced into [excon](https://github.com/excon/excon/issues).
That bugged me and I wanted to find out what had caused the issue.

Luckily the authors of excon had included a benchmarking suite to test the performance of the library. With a bit of fiddling I quickly found that while the 0.28.0 release was quite performant:

~~~ bash
$ git checkout v0.28.0
$ bundle exec ruby benchmarks/excon_vs.rb
  +--------------------------+----------+
  | tach                     | total    |
  +--------------------------+----------+
  | curb (persistent)        | 2.081572 |
  +--------------------------+----------+
  | Excon (persistent)       | 2.084404 |
  +--------------------------+----------+
  | StreamlyFFI (persistent) | 2.306583 |
  +--------------------------+----------+
  | Typhoeus                 | 2.452101 |
  +--------------------------+----------+
  | Excon                    | 2.874154 |
  +--------------------------+----------+
  | Net::HTTP (persistent)   | 3.028383 |
  +--------------------------+----------+
  | Net::HTTP                | 3.031087 |
  +--------------------------+----------+
  | open-uri                 | 3.386483 |
  +--------------------------+----------+
  | HTTParty                 | 3.905072 |
  +--------------------------+----------+
  | RestClient               | 3.979432 |
  +--------------------------+----------+
  | em-http-request          | 4.906282 |
  +--------------------------+----------+
~~~

There was a big drop in performance in the 0.29.0 release:

~~~ bash
$ git checkout v0.29.0
$ bundle exec ruby benchmarks/excon_vs.rb
  +--------------------------+----------+
  | tach                     | total    |
  +--------------------------+----------+
  | curb (persistent)        | 2.207292 |
  +--------------------------+----------+
  | StreamlyFFI (persistent) | 2.279119 |
  +--------------------------+----------+
  | Typhoeus                 | 2.422294 |
  +--------------------------+----------+
  | HTTParty                 | 2.823677 |
  +--------------------------+----------+
  | Net::HTTP (persistent)   | 2.829175 |
  +--------------------------+----------+
  | Net::HTTP                | 2.850466 |
  +--------------------------+----------+
  | open-uri                 | 3.241452 |
  +--------------------------+----------+
  | Excon                    | 4.287840 |
  +--------------------------+----------+
  | Excon (persistent)       | 4.583336 |
  +--------------------------+----------+
  | RestClient               | 4.888536 |
  +--------------------------+----------+
  | em-http-request          | 8.476425 |
  +--------------------------+----------+
~~~
Well things went south there quite quickly, let's use git bisect to find the culprit.

To get going we need to run `git bisect start`. 

Next we need to tell git the last known good commit `git bisect good v0.28.0` and the first bad commit we know about `git bisect bad v0.29.0`.

Git now checks out the first commit for us to test.

~~~ bash
Bisecting: 6 revisions left to test after this (roughly 3 steps)
[0fca6f1ae8f9731df0bd4fdc8b57844db3cf8150] maintain IO.read EOF behavior in Socket#read
~~~

Lets get started and run a benchmark against this revision to see whats going on.

~~~ bash
$ bundle exec ruby benchmarks/excon.rb
  +--------------------+----------+
  | tach               | total    |
  +--------------------+----------+
  | Excon (persistent) | 2.222341 |
  +--------------------+----------+
  | Excon              | 3.102237 |
  +--------------------+----------+
~~~

These results seem good let's tell git - `git bisect good`

~~~ bash
Bisecting: 3 revisions left to test after this (roughly 2 steps)
[82ca80e642d83803c9c4a51679979d63c7faae2b] Merge pull request #312 from burns/response_parse
~~~

Git checks out the next candidate for us to test...

~~~ bash
$ bundle exec ruby benchmarks/excon.rb
  +--------------------+----------+
  | tach               | total    |
  +--------------------+----------+
  | Excon (persistent) | 3.662519 |
  +--------------------+----------+
  | Excon              | 4.429722 |
  +--------------------+----------+
~~~

Things went south there, looks like a bad revision - `git bisect bad`

~~~ bash
Bisecting: 0 revisions left to test after this (roughly 1 step)
[a859976b2a2cda5abade319d98df7110607aee09] read response until status-line is found
~~~

Time to test again . . .

~~~ bash
$ bundle exec ruby benchmarks/excon.rb
  +--------------------+----------+
  | tach               | total    |
  +--------------------+----------+
  | Excon (persistent) | 3.633823 |
  +--------------------+----------+
  | Excon              | 4.397266 |
  +--------------------+----------+
~~~

Uh oh another bad un ... `git bisect bad`

~~~ bash
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[579a987824b62c79673ae84023aa81261e1a3e69] add Socket#readline
~~~

Ok one last test and we should know what caused the issue.

~~~ bash
$ bundle exec ruby benchmarks/excon.rb
  +--------------------+----------+
  | tach               | total    |
  +--------------------+----------+
  | Excon (persistent) | 3.568544 |
  +--------------------+----------+
  | Excon              | 4.386674 |
  +--------------------+----------+
~~~

Ok, this one is bad too, lets tell git - `git bisect bad`, and blammo we have our answer:

~~~ bash
579a987824b62c79673ae84023aa81261e1a3e69 is the first bad commit
commit 579a987824b62c79673ae84023aa81261e1a3e69
Author: Brian D. Burns <iosctr@gmail.com>
Date:   Thu Oct 31 20:40:17 2013 -0400

    add Socket#readline

    Uses Socket#read for non-blocking readline and respects :read_timeout

:040000 040000 e0c9cafab1f78e85999157673df033dd8e114d75 efba95d94ed3d61def9ce6a2bd6a16027c6bd2da M      lib
~~~

Git bisect is performing a binary search, rather than testing every revision in turn. Git held our hand and
led us down a path that meant we only had to test four times to be sure what caused the bug, sure here we only
had seven revisions to test, but this would certainly save some time with a bigger list to wade through.

## More fun with bisect
Git Bisect has a few more nice features that might be useful to you.

There are a couple of commands that can help you to see what is going on as git leads you though the 
commit history. `git bisect view --stat` will show you a git log style list of candidate revisions remaining, 
you should see this shrink as you start to test and narrow the search down. If you want to see what 
you have done in your bisect session so far, `git bisect log` will show you a list of the revisions 
you have marked good and bad.

If for some reason you don't want to test a particular commit, perhaps the code won't run for a reason
unrelated to the bug you are chasing, you can `git bisect skip` and git should give you another nearby 
commit to test.

When you are all done with bisect `git bisect reset` will clear your bisect history and check out
the commit you started with.

## Automation

If you have a script you can run to test your code you can automate the bisect process with 
`git bisect run <yourscript>`, git decides what to do based on the exit code.
A 0 exit code is analogous to `git bisect good` whereas 125 is used for `git bisect skip`
anything in the 1-127 range except for 125 will mark the revision as bad just like `git bisect bad`.
And anything above 127 will end the bisect session.

This feature of bisect is a really great reason to keep your code (and tests) runnable at every commit.
