---
soapboxContentId: 658baa2e-e92e-4c56-ba31-61915cfa8334
layout: post
title:  "HTTP Shooting Party"
date:   2014-09-12 12:09:17
categories: blog
navId: blog
excerpt: Here at reevoo we have been busy building an API for our data, part of this process involved a large refactoring of our core front end app reevoomark to use the new API.
---

![HTTP Shooting Party](/assets/http-shooting-party.jpg)

Here at reevoo we have been busy building an API for our data, part of this process
involved a large refactoring of our core front end app reevoomark to use the new API.

Recently I have been looking for simple ways to improve the performance of this application
and a quick look at new relic confirmed that we were spending a large proportion of our wallclock
time connecting to our API over HTTP.

![new relic application trace](/assets/reevoomark-new-relic-trace.png)

Looking at the HTTP client we were using to connect to the API seemed like a great place to start
making some performance improvements.

I decided to build some benchmarks to test the different libraries that are available, you can take
a look at the code on [github](https://github.com/errm/http_shooting_party)

The lists of clients I tested was by no means exhaustive but I think covers most of the currently popular options.

* [Curb](https://github.com/taf2/curb)
* [Excon](https://github.com/excon/excon)
* [HTTParty](https://github.com/jnunemaker/httparty)
* [httpclient](https://github.com/nahi/httpclient)
* [Net::HTTP](http://ruby-doc.org/stdlib-2.1.1/libdoc/net/http/rdoc/Net/HTTP.html)
* [Patron](http://toland.github.io/patron/)
* [Typhoeus](https://github.com/typhoeus/typhoeus)

## Methodology

[Net::HTTP](http://ruby-doc.org/stdlib-2.1.1/libdoc/net/http/rdoc/Net/HTTP.html) is the http library
included in the ruby standard library, I have decided to use it as a performance baseline and compare
the performance of the other libraries relative to net http.

The benchmarks involve downloading a static json file from an NGINX server, parsing the file to ensure
the response is correct. We are repeating this process 1000 times in order to average out any minor jitters.

~~~ json
{ "foo" : "bar" }
~~~

In order to detect any transient issues each benchmark will be repeated 100 times and any outlying results will be
investigated and / or disregarded.

We are running the benchmarks on a 2011 era MacPro with 8GB of ram and four cores, the OS is Ubuntu 14.04 and we are using the current stable version
of ruby (2.1.2).

Some of the clients have support for persisent connections when the server supports http 1.1 keepalive, so we will repeat the benchmarks with and without this enabled.

## Results

![Results With No Keepalive](/assets/http-shooting-party-nokeepalive-results.png)

Curb and patron deliver some impressive results here, both are significantly faster in these tests than Net:HTTP.
The result for HTTParty is to be expected as it is an API wrapping the Net::HTTP library. The result for excon is particularly
disappointing, as several releases ago benchmarks were reporting numbers broadly comparable with curb and patron, without the
dependency on libcurl.


![Results With Keepalive](/assets/http-shooting-party-keepalive-results.png)

Enabling keepalives in NGINX saw some quite significant performance increases for Curb, Patron and Typhoeus.
Net::HTTP and HTTParty have no support for persistent connections so don't make any gains here.
With keepalive enabled httpclient is almost as fast as Net:HTTP on these benchmarks.


## Conclusions

If raw performance is important use [curb](https://github.com/taf2/curb) or if you want to use [faraday](https://github.com/lostisland/faraday) then go for [patron](https://github.com/toland/patron)
Both of these libraries depend on libcurl so might be slightly harder to install on some systems.

Enabling Keepalive on your server makes a big differnce when using a client that supports it, especialy in situations close to this benchmarking scenario, a client making many requests of a backend server.

On Ubuntu these dependencies can be installed with `sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev`


## Further Reading

* [ruby HTTP client performance shootout redux](http://bibwild.wordpress.com/2012/04/30/ruby-http-performance-shootout-redux/)
* [Ruby HTTP clients comparison](http://bit.ly/RubyHTTPClients)

### Image attribution

1. [Ved skytebanen / At the shooting range](https://flic.kr/p/69NK66) from [Municipal Archives of Trondheim](https://www.flickr.com/photos/trondheim_byarkiv/)
