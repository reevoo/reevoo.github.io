---
layout: post
title:  "HTTP Shooting Party"
date:   2014-07-28 12:09:17
categories: blog
navId: blog
---
Here at reevoo we have been busy building an API for our data, part of this process
involved a large refactoring of our core front end app reevoomark to use the new API.

Recently I have been looking for simple ways to improve the performance of this application
and a quick look at new relic confirmed that we were spending a large proportion of our time
connecting to our API.

![new relic application trace](/assets/reevoomark-new-relic-trace.png)

Looking at the HTTP client we were using to connect to the API seemed like a great place to start
making some performance improvements.


I decided to build some benchmarks to test the different libraries that are available, you can take
a look at the code on [github](https://github.com/errm/http_shooting_party)

## Methodology

[Net::HTTP](http://ruby-doc.org/stdlib-2.1.1/libdoc/net/http/rdoc/Net/HTTP.html) is the http library
included in the ruby standard library, I have decided to use it as a performance baseline and compare
the performance of the other libraries relative to net http.

The benchmarks involve 
I am running the benchmarks on a 2011 era MacPro running Ubuntu 14.04.
