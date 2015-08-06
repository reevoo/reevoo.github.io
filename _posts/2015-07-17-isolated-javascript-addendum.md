---
soapboxContentId: 149da903-d919-42f6-b00e-52b4cf78ae57
layout: post
title:  Being Lonely (Reprise)
date:   2015-07-17 08:00:00
categories: blog
navId: blog
author: Jonny Arnold
github: jonnyarnold
---

Last month [I wrote an article]({% post_url 2015-06-15-isolated-javascript %}) explaining how you can isolate your JavaScript. In this article I want to explain why you should ignore that article completely and how we used ES6 modules to provide the isolation we needed.

## What I Said Before Was Wrong

In the last article I spent a lot of time showing how to isolate your JavaScript from a client site using a single global variable and some well-prepared external libraries. 

This imposed some limitations on the libraries you could use, such as the need for a `.noConflict()` mode to avoid overwriting existing libraries on the page. It became apparent that this restriction was very limiting.

As well as this, I spent some time criticising library-makers for using a single global variable *and then recommended that you should use one!* This kind of hipocrisy cannot go uncorrected.

Finally, I neglected to mention in the other article that our 'dependency management' was a correctly ordered [`concat`](https://github.com/gruntjs/grunt-contrib-concat) [Grunt](http://gruntjs.com/) build task:

![Concat should not be used for dependency management.](/assets/concat-fail.png)

`concat` doesn't deserve this. It doesn't know better; it just sticks things together. *I* should know better.

I missed out *the correct way* of isolating your JavaScript from others: modules.

## Modules

I wan't the first person who wanted to isolate my JavaScript, and one of the more common ways of doing that (which I completely ignored) is to use a module system.

[There are lots of module systems out there](https://www.google.co.uk/webhp?sourceid=chrome-instant&ion=1&espv=2&es_th=1&ie=UTF-8#safe=off&q=javascript+module+system) implementing a few different syntaxes. Luckily [ES6 defines a module syntax](http://www.2ality.com/2014/09/es6-modules-final.html) that will be used in the new world of JavaScript. For forwards compatibility I'd recommend using this.

## 6 -= 1;

Currently browsers don't support ES6, but there are a number of tools out there - [some good, some not](https://kangax.github.io/compat-table/es6/) - that will translate your ES6 to ES5. [Babel](https://babeljs.io/) is the go-to choice in this area at the moment.

Babel is a wonderful translator, but I want something that will do my translation for me transparently. Bonus points if it can bundle all of the imports I give it into a single file. Oh, but I want source maps too, so my error messages make sense.

Is that too much to ask?

## JSPM: My Hero

I've always avoided ES6 up to now - I've struggled to get any tool to work. I feel my requirements are pretty standard: in addition to the wishlist above, I need to be able to run my [Jasmine](http://jasmine.github.io/) tests against my code. Also, my app code has already been written, so I'm not putting it into an opinionated directory structure. That's about it.

I've tried Babel with clever build scripts and failed. I've tried [Browserify](http://browserify.org/) and struggled to get anything working. I've researched lots and lots of other tools, but nothing has really worked.

Then I met [JSPM](http://jspm.io/).

JSPM takes [Bower](http://bower.io/) and blows it out of the water. It is easy to set up. It translates ES6 to ES5 (using [SystemJS](https://github.com/systemjs/systemjs) for modules) transparently, but with source maps for debugging. It allows you to bundle a file and its imports into a single ES5 file. It works with Karma (using [`karma-jspm`](https://github.com/Workiva/karma-jspm)). It's wonderful. I won't be using Bower again.

It's not perfect, though:

- JSPM stores its configuration in a file called `config.js`. Seriously, does JSPM think it's the only thing you need to configure?
- For React, [you have to add `blacklist: []` to your `config.js` file](https://github.com/jspm/jspm-cli/issues/566), which only makes sense when you know the reason. (React is disabled from Babel's list of plugins by default.)
- Any comments you might want to add to the `config.js` file (for instance, telling people that the file is for JSPM, or what `blacklist: []` means) are removed when your next JSPM package is installed.
- [`karma-jasmine`](https://github.com/karma-runner/karma-jasmine) and [`karma-jspm`](https://github.com/Workiva/karma-jspm) *kind of* work together. You can get some very cluttered error messages in some cases, and the configuration is not obvious. [I've put our config in a Gist](https://gist.github.com/jonnyarnold/a3078b472a8cb6024604) in case it helps.

## The New World

We moved to ES6 for modules, but ES6 provides us with a few more nice features. My favourite so far is the `() => { ... }` syntax for functions, making `this` refer to the function definition scope like in other languages.

The ability to include any external library provides us with greater flexibility. We now use React for our views, which we wouldn't have been able to do in the old world.

It's a nice place.

*This article was written by Jonny Arnold for Reevoo Engineering. Special thanks to Louis Pilfold for repeatedly suggesting we should use ES6 and for the JSPM recommendation.*
