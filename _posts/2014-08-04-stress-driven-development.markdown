---
soapboxContentId: 941c3beb-8ede-4317-934f-fd8884e4cbe7
layout: post
title:  "Stress driven development"
date:   2014-08-04 10:58:44
categories: blog
navId: blog
author: Philip Stevens
github: plcstevens
---

Grady Booch wrote about this [a long time ago](http://web.archive.org/web/20050203010041/http://www.manamplified.org/archives/000203.html). It was written as a response to __Test Driven Development__ (TDD). He spoke about architecture decisions, language choices, and library choices. He talked of the importance of prototyping your system, stress testing alpha builds, and making decisions on scale vs power early on and throughout the lifecycle.

If you are moving to _Service Orientated Architecture_ and _Micro Architecture_ you need to have your infrastructure at the forefront.

 - _How much traffic do you need to handle now?_
 - _How much traffic do you expect in a __X__ period?_
 - _How do you want to scale your infrasctructure?_
 - _How important is latency?_
 - _How important is data integrity?_
 - _Have you used that __database__/__messaging queue__/__etc__ service before?_
 - _How quickly can you prototype/alpha the infrastructure?_
 - _How will you stress test the instrastructure?_

We don't want to over-engineer at this point, but we do want to understand requirements and growth projections.

That three server setup might work for half a year until traffic explodes; can we add extra ones easily? Traffic might spike, can we drop servers when traffic drops?

Throughout all of this the underlying applications need to know what can happen on a infrastructure level. Will data _ALWAYS_ make it through? Can the application flow break halfway, how can my application find out?

Having answers, or agreeing to provide numbers to requirements/questions early on in a project will provide safety nets and clear watches on dangers before they hit.

Stress drive out your infrastructure as you test drive out the applications. Have the experience of these pass onto the future projects. Nothing is set in stone, and errors will occur but identifying the bottleneck/danger zones will enable safer, cleaner programming and infrastructure management.

[Simulate network partitions in DBs](https://github.com/aphyr/jepsen)
[Load test functional behaviour and measure performance](http://jmeter.apache.org/)
