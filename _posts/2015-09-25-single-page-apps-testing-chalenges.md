---
soapboxContentId: 149da903-d919-42f6-b00e-52b4cf78ae57
layout: post
title:  Single page apps testing challenges
date:   2015-09-25 08:00:00
categories: blog
navId: blog
author: David Sevcik
github: davidsevcik
---

## Background

- start of the my.reevoo.com development
- heavy usage of angular
- move towards React

## What to test

- controllers, services and filters are easy most of the time
- directives and templates are difficult
- integration tests are difficult

## Async callbacks and DOM manipulation

- waiting for DOM changes to happen

## Dependency on backend

- difficult and slow to run system tests using real backend
- increase the problem with async callbacks
- when mocking the backend there is problem with keeping mocks in sync with the real api

## Dependency on other parts of frontend

- integrated tests
- http://blog.thecodewhisperer.com/2010/10/16/integrated-tests-are-a-scam/

*This article was written by David Sevcik for Reevoo Engineering.*
