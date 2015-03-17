---
layout: post
title:  Enjoying JavaScript
date:   2015-03-17 10:00:00
categories: blog
navId: blog
---

At Reevoo we have started working on some large applications based on [AngularJS](https://angularjs.org/). Over the last few weeks we have had a raising tension with JavaScript as we try to come to terms with its unusual quirks.

JavaScript has some big quirks, but underneath its imperfections is a useful programming language. Its prevalence means it won't be going away for a while, so you might as well learn how to use it well. 

In this article I aim to give my opinions on why JavaScript is scorned by many developers. I will also aim to provide you with tips on how to *enjoy* using JavaScript. Later on, I will show how AngularJS is a good example of what good JavaScript can look like.

## Learn JavaScript's Phrases and Sayings

I approached JavaScript as foreign language; my first use of JavaScript was back in my PHP days, but by the time I got to use it professionally I was using C# and Python. 

[I'm trying to learn Japanese now](http://ankisrs.net/), and I have noticed similar analogues to my initial run-in with JavaScript. Initially, you try and recall words and phrases, and you sound like a 4-year-old. Eventually you build up a vocabulary and learn the grammar, but find that the phrases and sayings are completely different. Eventually I hope to get round to learning these idioms - then maybe the average Japanese guy will be able to understand me when I strike up a conversation with him.

One thing I have noticed in retrospect is that I wrote my JavaScript like I was writing a C# application. I had nightmares of people looking at it and shouting down the corridor, *"Hey Tim, come and check this out! Jonny's written an AbstractSingletonFactory!"*

When you [start looking at other people's JavaScript](https://github.com/trending?l=javascript), you start to get an idea of the *language's* way of doing things. You start to use the foreign concepts for their original use - to improve programmer productivity.

So what's foreign about JavaScript?

- We use [prototypical inheritance](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain). This is unusual coming from programming languages with classes, like C# or Python.
- The `this` keyword is confusing to developers from OOP because it doesn't refer to the object that *defines* the function (block scope); it refers to the object that *calls* the function (function scope). This has its own advantage and disadvantages, but overall it's just different.
- It's *really* simple. It's just objects and functions, really. Developers from C# or Java backgrounds feel an initial state of unease when approaching JavaScript due to a lack of constructs.

As developers, we should be embracing these quirky concepts and using them to our advantage.

## JavaScript is a Functional Programming Language

> "JavaScript is the world's most popular functional programming language." 
> 
> -- Douglas Crockford, *[JavaScript: The World's Most Misunderstood Programming Language](http://javascript.crockford.com/javascript.html)*

If you've got another functional programming language under your belt, JavaScript makes a lot more sense. [I'd recommend learning a functional programming language](https://www.coursera.org/course/progfun) if you haven't already, just to see that not everything needs to be object-oriented and the power of declarative programming. 

JavaScript is a general-purpose language and admits a number of programming paradigms, one of which is functional; it is up to the programmer to pick the best bits from their chosen paradigm (more on that later). Personally, I find that functional programming makes applications easier to comprehend by using a declarative syntax and by minimising scope wherever possible.

Here's a list of functional principles that I have found useful when writing good JavaScript:

- **Write functions without side-effects** when possible to limit your problem space. (Limiting variables to as small a scope as possible isn't exclusively functional programming, but it's heavily reinforced in functional programming.)
- **Stop writing loops**: use [declarative array methods](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/prototype) (`forEach`, `filter`, `map`, `reduce`, `every`/`some`) to improve readability.
- When writing declarative methods, it can be useful to return a mutated version of `this` to **create chainable methods**. For example, `[1,2,3].filter(...).map(...)` is a useful method chain that is permitted through returning a mutated `this`.
- **Write functions that accept functions as arguments**; this is the joy that makes `forEach` and the rest so wonderful. For fans of Design Patterns, this is used for JavaScript implementations of the [Command](http://en.wikipedia.org/wiki/Command_pattern) and [Strategy](http://en.wikipedia.org/wiki/Strategy_pattern) patterns.
- **Write functions that return functions**; this is a useful [Factory](http://en.wikipedia.org/wiki/Factory_method_pattern) pattern.

A tutorial from [Node School](http://nodeschool.io/) introduces you to these functional tools and a whole lot more: https://github.com/timoxley/functional-javascript-workshop

## JavaScript Promises are used for Asynchronous Programming

Promises are one of several ways to introduce asynchronous programming to JavaScript. I found promises hard to get my head around at first, but once I had understood the concept have had good experiences with them.

I found the easiest way to get my head around promises was to implement them myself. When I realised that promises are essentially an array of functions that are called when an asynchronous request finishes, a lightbulb went off in my head!

There are a few good reasons to like promises. For starters, they're part of the proposed [ES6 specification](http://people.mozilla.org/~jorendorff/es6-draft.html#sec-promise-constructor). They also avoid having to specify [callbacks-within-callbacks-within-callbacks](http://callbackhell.com/), a major problem with callback-based asynchronous JavaScript.

There is a good tutorial from [Node School](http://nodeschool.io/) around promises if you need a primer. It goes into more detail than is useful sometimes, but you can certainly say you know how to use promises if you have got through this: https://github.com/stevekane/promise-it-wont-hurt

## JavaScript can be used Professionally

When I first started writing JavaScript, a wave of fear would flow through me whenever my code started working. I was scared of changing the code and breaking it. 

As a result, I didn't bother with basic software engineering practices, and started using 'JavaScript is bad' as an excuse. I used a lack of classes as an excuse to add everything to the global variable scope. I used the lack of an import statement as an excuse to put everything in the same file. It was a mess.

By [reading other people's JavaScript](https://github.com/trending?l=javascript), as well as [writing your own](https://github.com/AsgardEnterprises/ChronoCommit), you build up a confidence to experiment and explore. [Testing](http://jasmine.github.io/) helped as well, as it gives you the confidence to change the code and know it is still working at the end of the change.

For its simplicity, JavaScript packs a number of features other programming languages have avoided:

- Want a *module* for mixing in functionality? How about a *decorator*? Both are simple: define a function that takes in an object and augments it with your extra properties and methods. At the end, spit your augmented object back out!
- *Metaprogramming* is incredibly easy, due to the 'always open' nature of JavaScript objects.
- *Reflection* is built in, using a suite of methods like `typeof`, `bind`/`apply` and JavaScripts permissive square bracket syntax to allow dynamic variable retrieval and dynamic method invocation.
- You can avoid globals by encapsulating your script in a function (this has the catchy title of an [Immediately Invoked Function Expression](http://benalman.com/news/2010/11/immediately-invoked-function-expression/)). This has the added benefit of isolating you from any globals that may have been defined elsewhere.

Good software engineering practices are there, you just have to look a little harder for them.

## Use the Good Parts of JavaScript

Anyone who has read *[JavaScript: The Good Parts](http://www.amazon.co.uk/JavaScript-Good-Parts-Douglas-Crockford/dp/0596517742)* (or used JavaScript) will tell you that the language as a whole has some pretty hideous blemishes ([I'll leave someone else to list the individual WTFs.](https://wiki.theory.org/YourLanguageSucks#JavaScript_sucks_because)). In the book, Douglas Crockford presents a useful subset of the language for use.

As Crockford highlights, it is up to you, the developer, to find out where the bad parts of JavaScript are (Hint: read *JavaScript: The Good Parts*) and avoid them where possible. Some are difficult to avoid, and compile-to-JavaScript languages like [CoffeeScript](http://coffeescript.org/) aim to rid us of them; it's a question of whether you feel you can avoid them. 

## AngularJS helps you write Quality JavaScript

Tying back to our current development cycle, I was happy to see that [AngularJS](https://angularjs.org/) has been protecting us from some of JavaScript's grizzly bits through its own design. It's a good case study as it highlights some of the good bits of JavaScript I've talked about earlier:

- [You *declare* Angular elements on your modules as functions](https://docs.angularjs.org/guide/di). These declarations can be *chained*.
- *[Promises](https://docs.angularjs.org/api/ng/service/$q)* are used for asynchronous calls.
- Angular doesn't try to introduce concepts like classes or inheritance.
- Angular's [Dependency Injection](https://docs.angularjs.org/guide/di) provides the dependencies it needs to *avoid side-effects* from global objects.
- [Scope variables](https://docs.angularjs.org/guide/scope) are used to *isolate state*.

It's not infallible - [why the use of dollar signs everywhere, seriously?!](http://stackoverflow.com/questions/12648543/angularjs-and-its-use-of-dollar-variables) - but it does show off a lot of JavaScript's good parts.

## Conclusion

JavaScript isn't all bad. It allows you to go very fast very quickly. However, I feel it is important to take a step back and look at what you've written from time to time and ask yourself, *"Can this code be better?"*. I tended to answer this question with "No, it's JavaScript's fault!", but I think I've found enough good bits of JavaScript to say that it isn't JavaScript's fault. 

My excuse is no longer valid. And now you've read this, neither is yours!

*This article was written by Jonny Arnold for Reevoo Engineering. Thanks to Cian Leahy for proof-reading and the entire Engineering Team for tolerating my going-too-fast lightning talk on this subject.*
