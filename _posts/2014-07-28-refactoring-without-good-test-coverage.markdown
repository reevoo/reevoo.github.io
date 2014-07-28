---
layout: post
title:  "Refactoring without good test coverage"
date:   2014-07-28 10:10:10
categories: blog
author: Alex Malkov
github: amalkov
navId: blog
---

Any system will degrade eventually - new practices, software updates, new requirements, number of implemented features, number of people working on the application etc. In fact, with every single line of the code you make your system more complex and therefore the system ultimately degrades.

Not optimistic, right?

Also, as time passes by you lose knowledge about some features and edge cases in the system. People moving in and out of the company, working on different projects. This is how some applications become __Legacy Applications__.

What is a Legacy Application?
-----------------------------

Just out of date? - Probably not. The one that uses old version of programming language / gems / libraries? - Yes and no.
A legacy application is an application which requires a lot of attention from developers, support is burdensome, any change become hard, new features do not work as fast as expected or current functionality does not perform well.

When working on such a kind of applications you start using sentences like "I am sick of it" or "my head exploded" instead of "easy to change", all of the time...
This means you cannot defer your architecture decisions any more; you definitely need to start changing things.

First of all, you need to make a decision on wherever you will be start from scratch or refactor the legacy application.
In most cases, refactoring is preferable. Constant improvements and slow pace equals happy customers.

Also, keep in mind that legacy code is not completely broken / unuseful / unpleasant, it was created at some point in time for set requirements within a particular time frame. Don’t blame - people were doing their best. Everyones code will be blamed for sooner or later, even yours.

## Testing tools

At Reevoo, we decided to follow a Service Oriented Architecture strategy. It meant that some monolith applications would, and continue to, be split into smaller functional applications with single responsiblities.

To do this, we have started wrapping some behaviours into models or extracting logical parts into engines.
We found that Rails Engines were extremely powerful for refactoring - often the easiest option if you need to extract some business logic out of your application.

However, one of the biggest problems with monolith legacy applications is test coverage.
Unfortunately, we realised that some edge cases were not covered by our tests and this is a very common problem.
Therefore we started looking at alternative ways of verifying our refactored code.

Refactoring is the process of changing/improving internal structure of software system without changing its external behaviour.

Apart from improving internal test coverage, we decided to focus on two external ways of verification: “System Test" and "Shadow Stress Test”.

**System Test** is a full life cycle testing process that checks that all modules and applications interconnect correctly.

**Shadow Stress Test** is a real time stress testing system running live mirrored traffic (More details in the coming blog post).

System Test's are unable to cover all known edge cases, however they give you a good taste of new code. It covers the standard flow and as a result covers most our customers.

For performance testing we have chosen **[New Relic][newrelic]** and it has proven itself as a strong tool. Memory or CPU consumption, database query performance, slowest average response time and much more is available to compare after new code have been deployed.

Also it was a valuable way to visualise benefits or disadvantages of code refactoring.

On the graph below you can see that after deploy response time from one of our endpoints become nearly twice as fast than previously.

![Good case](/images/refactoring1.png)

Here you can see the graph go up right after a deploy, highlighting that we need to look at this...

![Bad case](/images/refactoring2.png)

Moreover, it helped us to highlight top database calls using highest throughput filter, during the process of decoupling one of the applications from the database.

To sum up, in is fair to say that refactoring is an ongoing process which should never stop, even if you don’t have an opportunity to run a separate project for this.
Every little code optimisation/restructure will allow your application to be robust instead of fragile and you will surely feel better as a developer.


[refactoring1]: /images/refactoring1.png
[refactoring2]: /images/refactoring2.png
[newrelic]: https://github.com/newrelic/rpm
[shadow]: /blog/2014/08/02/shadow-stress-test/

