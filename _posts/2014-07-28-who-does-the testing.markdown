---
layout: post
title:  "Who does the Testing?"
date:   2014-07-28 14:50:00
categories: blog
navId: blog
author: Cian Leahy
github: leahyc
---

One of the provocative arguments regularly undertaken when staffing R&D teams is the dreaded Development to QA ratio.

It's always entertaining to hear project management entrenching themselves with a pre-ordained view that it should be 3:1 or 5:1 or 1:1 or 1:2 or whatever!

It's a balance that's difficult to get right and carving off designated roles inevitably creates a bottleneck of some sort. You either can't get the software out because there aren't enough testers to verify it all. More rarely, it's the development group that are understaffed and the roadmap is getting serviced too slowly to the QA pipeline for a timely delivery. 

Maybe it would be a more pragmatic approach to think of QA as a distributed role, which is undertaken by Business Analysts / Product Management, Developers and indeed even software testers! 

At Reevoo, the success and stability of the product has been built on a few key principles. Using Continuous Delivery to provide fast, incremental change is one of the key factors. To achieve this, there is a real onus on the development team to focus strong attention on levering the practices of test driven development, pair programming, peer code review and continued investment in multi-level automated testing infrastructure.

As a QA bod, it's a real source of security to have this strong base in place.
The traditional graphs of cost of bug fix vs phase of discovery of course apply. We're all bored to death of hearing about finding something earlier is much cheaper to fix but not all organisations pay heed to this in time and hence the debates about how many testers do we need to throw at this continue to rage. Plus you end up trying to close the stable door after the horse has bolted by supplimenting a weak development test and delivery regime with high volumes of manual user level testing.

In fact, a more sensible discussion might be to focus on which types of testing should be done by whom. It's generally accepted that unit testing is most effectively implemented by developers and user level testing by BAs / QA folk. Some enlightened (and indeed famed) organisations are now using Developer in Test models which is desirable in theory as you marry the rigour of a dedicated QA mind to technical ability of a developer to implement effective test coverage.

However you approach it though, there is still clearly a place for the concept of user testing that involves someone understanding a feature set at a broader level and how the end product will be consumed. So software testers of the world, fear not, your time is still at hand...



