---
layout: post
title:  "Domain-driven design on Rails"
date:   2014-07-28 10:58:44
categories: "domain-driven design"
---


Welcome to the first part from series of articles about practical use of Domain-driven design when developing Ruby on Rails applications. I would like to tackle challenges that we experience in Reevoo with design and development of software solving complex business requirements. I believe that combination of tools like Domain-driven design and Ruby on Rails you can give you both a robust architecture build on domain knowledge and a flexibility supporting further changes of business rules and refactoring.

But first a little introduction to the topic.


# What is Domain-driven design

Domain-driven design (DDD) is set of techniques that can help us to analyse complex business domain and design the software that is good representation of such domain. This approach was popularised by Eric Evans in his book [Domain-driven Design: Tackling Complexity in the Heart of Software](Domain-driven Design: Tackling Complexity in the Heart of Software). Concepts like design pattern have origin in previous works, but DDD tries to apply them not only on technical level but also as a tool for communication across the team and high level design.

I don't plan to go too deep to explanation of all concepts of DDD as there are several articled and books dedicated to this topic. For a good thorough overview I recommend ebook [Domain-driven Design Quickly](http://www.infoq.com/minibooks/domain-driven-design-quickly). 


# DDD and Ruby on Rails

As one of the conditions to be able to apply DDD you need a programming framework that enables you to translate modelled business domain to code. Most of the books about about DDD explaining this process on examples written in Java or C# language. DDD is less known in Ruby on Rails community mainly because Ruby on Rails aimed in the beginning on simple problem domains and rapid prototyping. Nowadays Ruby is used also for complex business problems and with this came the issues how to develop systems that are easy to prototype but also sustainable in long run. I believe that DDD can help solve this problem.

There are couple of blog post on this topic. Victor Savkin in his [series of article](http://victorsavkin.com/ddd) identified problematic parts of Ruby on Rails framework that violate DDD guidelines. Those are:

1. no clear separation between application, domain and infrastructure layers
2. no explicit way of implementing Value objects
3. missing support for Aggregates


# Proof of concept application

Paul Rayder published a year ago [sample application](https://github.com/paulrayner/ddd_sample_app_ruby) showing the implementation of DDD with Rails. It is port of a cargo shipping application written in [Java](https://github.com/patrikfr/dddsample) and later in [C#](https://github.com/SzymonPobiega/DDDSample.Net) as a companion to the original book from Eric Evans. Although the sample application is pretty complex and shows the power of DDD it is written with a C# mindset as Paul himself mentioned in [presentation](http://skillsmatter.com/podcast/design-architecture/paul-rayner/mh-7679) he had just short experience with Rails in time of writing the sample app.

Because of that I have decided to build a new proof of concept application that address the three main described issues and use all advantages of Ruby language over Java or C#. The application solves the problem domain of food delivery. I start just with couple of domain objects but assure that all the concepts of DDD are applied as visible on the diagram:

![Delivery service domain](delivery_service_ddd.png)

The whole source code is available on https://github.com/davidsevcik/dddelivery-domain and will be enhanced over time together with another articles focused on concrete challenges with writing the application.


## Part 1: Separation of a domain and application layer




# Other resources

* http://www.slideshare.net/dwhelan/domain-driven-design-and-hexagonal-srchitecture-with-rails
* https://skillsmatter.com/skillscasts/3409-hexagonal-rails
* http://confreaks.com/videos/759-rubymidwest2011-keynote-architecture-the-lost-years
* http://www.amazon.co.uk/Implementing-Domain-Driven-Design-Vaughn-Vernon/dp/0321834577/ref=pd_sim_b_1?ie=UTF8&refRID=19GPGRHEXPFM92A015P8
