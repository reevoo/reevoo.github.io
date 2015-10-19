---
soapboxContentId: f2212896-aebd-4636-a902-572577f5cc71
layout: post
title:  EuRuKo 2015 Impressions
date:   2015-10-19 17:00
categories: blog
navId: blog
author: David Sevcik
github: davidsevcik
---

Flying back from rainy Salzburg I've decided to spend some time to summarize my impressions from just finished
[EuRuKo](http://www.euruko2015.org/) conference.

I was nicely surprised by the wide range of topics from the ruby internals to physics and art. The most interesting
from the technical point of view were for me talks from the two main people behind Ruby: Yukihiro "Matz"
Matsumoto and Koichi Sasada.

Matz shown appart of the basics of Japanese plans for the new concurrency model in Ruby 2.3.
He explained the different approaches: actor model, software transaction memory (STM), memory ownership, immutability
and a stream model. The last one is the current favourite for the next Ruby version. It's based on the idea of UNIX
data flow pipelines and seems similar to what I've seen in Elixir using even the same symbol `|>` for chaining the
stream producer and consumer. The blocks of code using this feature should be executed in new separate Ruby
virtual machine featuring data immutability and thread safety. It's still work in progress and subject to change
but Matz promised the new version to be release for the next Christmas and be fully backward compatible.

Koichi Sasada spoke about current method dispatch process in Ruby and the planned optimisations. It was interesting to
see how the method search, passing of arguments and caching for repeated calls works from the inside.
The main idea for optimisation is to speed up the dispatch of simple methods with zero or one argument. I wish the video
of this first Sunday talk is available soon as my concentration was down thanks to the late night
afterparty the day before and having just one coffee in the morning :)

Simplify Challenging Software Problems with Rocket Science by a former rocket scientist Bradley Grzesiak shown how to use Ruby
for solving physics equations. I wasn't really aware of Matrix class existence in the stdlibs. He also explained
concept of a feedback loop controller used in rocket flight control systems. It lays in monitoring the changes caused by
a controller in environment and routing the data back to the controller to adjust the running procedure.

Follows a list of interesting (and not known to me) gems mentioned in different talks:

- [Synvert](https://github.com/xinminlabs/synvert) can be used for writing macros (code that produce/mofify code).
The gem comes with recipes for automatic migration between different versions of Rails or rspec. The demo looked
very promising, I need to try on some real projects.
- [Inch](https://github.com/rrrene/inch) is a tool for an inline documentation quality check. It was interesting to hear how the author René Föhring
created the tool with a friendliness and helpfulness in mind. I'm thinking about applying mentioned
principles to other code quality tools like rubocop.
- [Semian](https://github.com/Shopify/semian) and [toxiproxy](https://github.com/Shopify/toxiproxy) to improve and test
system resiliency
- [Shoes](https://github.com/shoes/shoes4) for geometry computation
- [Sonic-pi](http://sonic-pi.net/) for music composition
- [RbNaCl](https://github.com/cryptosphere/rbnacl) for cryptography

![Be nice](/assets/photo-with-matz.jpg)
