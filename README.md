# Reevoo Engineering Blog

[![Build Status](https://travis-ci.org/reevoo/reevoo.github.io.svg?branch=master)](https://travis-ci.org/reevoo/reevoo.github.io)

## Contributing

1. Clone the repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

NB:

 - Blog posts should be made under the `_posts` directory.
 - Documentation pages need to be added to the docs.yml
 - Project pages need to be added to the projects.yml

## Adding a new blog post

### Setup

To modify this site you'll need the following:

* [A GitHub account](https://github.com/join)
* [Git](https://help.github.com/articles/set-up-git/)
* [Ruby](http://guides.railsgirls.com/install/) (don't bother installing rails)
* [Node](https://nodejs.org/download/)
* A text editor such as [Atom](https://atom.io/) or
  [Sublime Text](http://www.sublimetext.com/3)

Ask the devs for help if you need it.

### Installing the website locally

Open a new terminal window, and [clone the repository](https://help.github.com/articles/cloning-a-repository/) so you can edit it.

```
$ git clone https://github.com/reevoo/reevoo.github.io.git
Cloning into `Spoon-Knife`...
remote: Counting objects: 10, done.
remote: Compressing objects: 100% (8/8), done.
remove: Total 10 (delta 1), reused 10 (delta 1)
Unpacking objects: 100% (10/10), done.
```

Enter the newly cloned project directory.

```
$ cd reevoo.github.io
```

Install the Ruby dependencies.

```
$ gem install bundler
Fetching: bundler-1.9.4.gem (100%)
Successfully installed bundler-1.9.4
Parsing documentation for bundler-1.9.4
Installing ri documentation for bundler-1.9.4
Done installing documentation for bundler after 4 seconds
```
```
$ bundle install
Using addressable 2.3.8
...
... lots of stuff here
...
Bundle complete! 2 Gemfile dependencies, 41 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

Run the Jekyll compiler + server.

```
$ bundle exec rake jekyll:serve
Configuration file: /Users/louis/reevoo/reevoo.github.io/_config.yml
            Source: /Users/louis/reevoo/reevoo.github.io
       Destination: /Users/louis/reevoo/reevoo.github.io/_site
      Generating...
 Auto-regeneration: enabled for '/Users/louis/reevoo/reevoo.github.io'
    Server address: http://127.0.0.1:4000/
  Server running... press ctrl-c to stop.
```

Go to [`http://localhost:4000/`](http://localhost:4000/) in your web browser.

Ta-da! You've a working local copy of the website.


### Writing a new blog post

Open your text editor, and save a new empty file in the `_posts` directory with
a filename fitting the pattern of `YEAR-MONTH-DAY-title.md`. For example
`2015-01-05-its-louis-birthday.md`. Don't use spaces, uppercase letters, or
punctuation in the file name.

At the top of this new file, type in the "yaml front matter". The values you'll
want to change from the example below are the title, and the date.

```yaml
---
layout: post
title:  It's Louis' Birthday!
date:   2015-01-05 10:00:00
categories: blog
navId: blog
---
```

Now you should be able to navigate to your new (empty) blog post on the
localhost site.

Below the front matter you can write your blog post. Posts use the [markdown](https://help.github.com/articles/markdown-basics/) format. If you would like more examples of markdown, open other .markdown files in the `_posts` directory in your text editor.

When you wish to view your work, save the file, and reload the page in the
browser.

### Getting your post live

Once you are happy with your blog post, go back to the terminal window and stop
the server by pressing `ctrl-c`. Make sure your article has a Soapbox Content ID (you may need to re-run `bundle exec rake jekyll:serve` to get this!)

Then create a new git branch.

```
$ git checkout -b my-new-post
switched to new branch 'my-new-post'
```

Commit the changes to the branch

```
$ git add .
$ git commit -m "New post about Louis' birthday"
[guide f6ff9b6] New post guide
 1 file changed, 110 insertions(+), 2 deletions(-)
```

And push the new commit

```
$ git push origin HEAD
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 1.90 KiB | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
To git@github.com:lpil/reevoo.github.io.git
 + f366b80...f6ff9b6 HEAD -> my-new-post
```

Now open a
[pull request](https://help.github.com/articles/using-pull-requests/) on the
`reevoo/reevoo.github.io` page, and get someone to review it. Once everyone's
happy it can be merged, and the live site will be automatically updated with
your new post.
