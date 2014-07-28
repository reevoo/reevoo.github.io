---
layout: post
title:  "Refactoring without good test coverage"
date:   2014-07-28 10:10:10
categories: blog
navId: blog
---


Any system will degrade eventually - new practices, software updates, new requirements, number of implemented features, number of people working on the application etc. In fact, with every single line of the code you make your system more complex and therefore the system ultimately degrades.

Not optimistic, right?

Also, as time passes by you loose knowledge about some features and edge cases in the system. People moving in and out of the company, working on different projects this is how some of applications become ‘Legacy Applications’.

What is a ‘Legacy Application’?

Just out of date? - Probably not. The one that uses old version of programming language / gems / libraries? - Yes and No.
Legacy application is an application which requires lot of attention from developers, support is burdensome, any change becomes hard, new features do not work as fast as expected or current functionality a does not perform well.

When working on such kind of applications you start using sentences like "I am sick of it" or "my head exploded" instead of "easy to change", this is the time…
It means you cannot defer your architecture decisions any more, you definitely need to start changing things.

First of all, you need to make a decision what the best for you will be either start from scratch or refactor a legacy application.
In most cases, refactoring will be more preferable. Constant improvements and slow pace - happy customers.

Also, keep in mind that legacy code is not completely broken / unuseful / unpleasant, it was created at some point in time for particular requirements within particular time frame. Don’t blame, people were doing their best. Everyone’s code will be blamed for sooner or later, even yours.

## Testing tools

At Reevoo, we decided to follow Service Oriented Architecture strategy. It means that some monolith applications will be split into smaller functional applications with single responsibly.

To do this, we have started wrapping some behaviours into models or extracting logical parts into engines.
We found that Rails Engines are extremely powerful for refactoring - easiest option if you need to extract some business logic out of your application.

However, one of the biggest problems with monolith legacy application is test coverage.
Unfortunately, we realised that some edge cases were not covered by our tests and this is something very common in similar situations.
Therefore we started looking at alternative ways of verifying our refactored code.

Refactoring is the process of changing/improving internal structure of software system without changing its external behaviour.

Apart from improving internal test coverage, we decided to focus on two external ways of verification: “System Test" and "Shadow Stress Test”.

**System Test** is a full life cycle testing process that checks that all modules and applications interconnect correctly.

**Shadow Stress Test** is a real time stress testing under live mirrored traffic (More details in the coming blog post).

System Test is unable to cover all known edge cases, however it gives you a good taste of a new code. It covers standard flow and as a result most customers.

For performance testing we have chosen **[New Relic][newrelic]** and it has proven itself as a strong tool. Memory or CPU consumption, database query performance, slowest average response time and much more available to compare after new code has being deployed.

Also it was a valuable way to visualise benefits or disadvantages of code refactoring.

On the graph below you can see that after deploy response time from one of our endpoints become nearly twice faster than before.

![Good case](/images/refactoring1.png)

Here you can see the graph go up just after a deploy, highlighting that we need to look at this...

![Bad case](/images/refactoring2.png)

Moreover, it helped us to highlight top database calls using highest throughput filter, during the process of decoupling one of the applications from the database.

To sum up, in is fair to say that refactoring is an ongoing process which should never stop, even if you don’t have an opportunity to run a separate project for this.
Every little code optimisation/restructure will allow your application to be robust instead of fragile and you would surely feel better as a developer.


[refactoring1]: /images/refactoring1.png
[refactoring2]: /images/refactoring2.png
[newrelic]: https://github.com/newrelic/rpm
