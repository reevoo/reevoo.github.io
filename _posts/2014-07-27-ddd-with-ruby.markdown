---
layout: post
title:  "Domain-driven design on Rails - Part 1"
date:   2014-07-28 10:58:44
categories: "domain-driven design"
---


Welcome to the first part from the series of articles about practical use of Domain-driven in Ruby on Rails applications. I would like to tackle the challenges that we experience in Reevoo with design and development of software solving complex business requirements. I believe that combination of tools like Domain-driven design and Ruby on Rails can give you both a robust architecture built on domain knowledge and a flexibility supporting further changes of business rules and refactoring.

But first a little introduction to the topic.


# What is Domain-driven design

Domain-driven design (DDD) is a set of techniques that can help us to analyse complex business domain and design the software that is good representation of such domain. This approach was popularised by Eric Evans in his book [Domain-driven Design: Tackling Complexity in the Heart of Software](http://www.amazon.co.uk/Domain-driven-Design-Tackling-Complexity-Software/dp/0321125215/ref=pd_bxgy_b_img_y). Concepts like design pattern have origin in previous books and articles, but DDD tries to apply them not only on a code level but also as a communication tool and for high level design.

I don't plan to go deeper to explanation of all concepts of DDD as there are several articled and books dedicated to this topic. For a good thorough overview I recommend ebook [Domain-driven Design Quickly](http://www.infoq.com/minibooks/domain-driven-design-quickly). 


# DDD and Ruby on Rails

To be able to apply DDD you also need a programming framework that supports such approach i.e. that allows you to represent  a business domain logic in code freely. Most of the books about DDD explaining this process on examples written in Java or C# language. DDD is less known in Ruby on Rails community mainly because Ruby on Rails aimed in the beginning on simple problem domains and rapid prototyping.  Problems appeared when Ruby on Rails became used for complex business domains. The main question is how to develop applications that are easy to prototype at the beginning but also sustainable in a long run. I believe that DDD can help solve this problem.

There are couple of blog post on this topic. Victor Savkin in his [series of articles](http://victorsavkin.com/ddd) identified problematic parts of Ruby on Rails framework that violate DDD guidelines. Those are:

1. no clear separation between application, domain and infrastructure layers
2. no explicit way of implementing Value objects
3. missing support for Aggregates


# Proof of concept application

Paul Rayder published a year ago [sample application](https://github.com/paulrayner/ddd_sample_app_ruby) showing the implementation of DDD with Rails. It is a port of a cargo shipping application written in [Java](https://github.com/patrikfr/dddsample) and later in [C#](https://github.com/SzymonPobiega/DDDSample.Net) as a companion to the original book from Eric Evans. Although the sample application is pretty complex and shows the power of DDD, it is written with a C# mindset. Paul himself mentioned in [the presentation](http://skillsmatter.com/podcast/design-architecture/paul-rayner/mh-7679) that he had just short experience with Rails in time of writing the sample app.

Because of that I have decided to build a new proof of concept application. It should address the three  described issues and use all advantages of Ruby language over Java or C#. I have picked up an example of a food delivery domain for this purpose. I've started just with a minimal amount of domain objects that cover all the important concepts of DDD as visible on the diagram:

![Delivery service domain](/images/delivery_service_ddd.png)

The initial source code is available on [https://github.com/davidsevcik/dddelivery-domain](https://github.com/davidsevcik/dddelivery-domain) and is going to be enhanced over the time together with next articles focused on concrete challenges with writing the application.



# Other resources

* [DDD and Hexagonal architecture with Rails presentation slides](http://www.slideshare.net/dwhelan/domain-driven-design-and-hexagonal-srchitecture-with-rails)
* [Hexagonal architecture with Rail talk](https://skillsmatter.com/skillscasts/3409-hexagonal-rails)
* [Architecture of the lost years talk by Uncle Bob](http://confreaks.com/videos/759-rubymidwest2011-keynote-architecture-the-lost-years)
* [Implementing Domain-Driven Design book](http://www.amazon.co.uk/Implementing-Domain-Driven-Design-Vaughn-Vernon/dp/0321834577/ref=pd_sim_b_1?ie=UTF8&refRID=19GPGRHEXPFM92A015P8)
