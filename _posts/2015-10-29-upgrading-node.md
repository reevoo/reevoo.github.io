---
soapboxContentId: 8a947ea5-8f7b-4d92-ae04-f6e3d402d83b
layout: post
title:  Upgrading Node.js
date:   2015-10-29 11:00
categories: blog
navId: blog
author: Victor Vila
github: irikuo
---

# Upgrading to Node.js 4

Nowadays there are lots of projects using tools like npm, grunt, gulp, webpack, jspm, karma, mocha, jasmine... All of these tools run by using Node.js (Node). At the beginning of September, [Node was upgraded to version 4](https://nodejs.org/en/blog/release/v4.0.0/) from version 0.12, including tons of useful features and fixing a big community fracture.

## A short Node history lesson.

You might be asking now where are versions 1, 2 and 3. Node has a large community of people willing to develop stuff for it, but it was also owned by a company called Joyent. The problem was that Node wasn't updating at the same pace as people wanted it to be, using an outdated version of the V8 engine and not adding new cool (and useful) language capabilities, like ES6 support.

So we have Node, an open source library with a large community who wants it to move faster and a company that is not capable of keeping-up with the pace. What can possibly happen? [A fork happened](https://developer.atlassian.com/blog/2015/01/getting-to-know-iojs/). It was called io.js and included a new version of V8 and initial support for ES6.

Node always followed a versioning system where they had a 0.x version. Odd numbers were used for development versions and even numbers for production versions. The developers of io.js decided to follow [semantic versioning](http://semver.org/). As they introduced breaking changes on the API they kept upgrading the major version, getting to 3.0.

At this point there was a big problem: the Node community was fractured between developers using Node and developers using io.js.

Luckily the world is still not crazy enough as to keep with the madness of maintaining basically two versions of the same thing, and the two projects decided to merge under a new umbrella: the [Node.js Foundation](https://nodejs.org/en/foundation/). This new entity decided to use io.js as the base code for the official Node version, and when the merge was ready they released it as Node.js version 4, because io.js was already in version 3.

## Ok, enough history. How do I upgrade?

At last we get to the interesting part.

To update Node on a Mac you usually run something like `brew upgrade` (updates all of your `brew` packages) or `brew upgrade node`.

If you update accidentally (or not) Node in your machine, you may find that some of your projects are not working anymore. Don't panic, everything will be ok. You just need to go to your project, remove the `node_modules` folder and reinstall again all the dependencies in your `package.json` file.

So, if you have something like this:

{% highlight js %}
{
  "name": "MY_REPO",
  "version": "0.0.1",
  "description": "",
  "main": "index.js",
  "scripts": {
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/YOUR_USER/YOUR_REPO.git"
  },
  "keywords": [
    "reevoo"
  ],
  "author": "Reevoo Development Team <developers@reevoo.com> (http://reevoo.github.io/blog/)",
  "license": "MIT",
  "homepage": "https://github.com/reevoo/narnia#readme",
  "devDependencies": {
    "autoprefixer": "^6.0.3",
    "grunt": "^0.4.5",
    "jscs": "^2.3.2",
    "karma": "^0.13.10"
  },
  "dependencies": {
    "bluebird": "^2.10.2",
    "react": "^0.14.0",
    "react-dom": "^0.14.0"
  }
}
{% endhighlight %}

You will need to remove the `devDependencies` and `dependencies` keys from the `package.json` file and run this:

{% highlight bash %}
npm i -D autoprefixer grunt jscs karma (same as npm install --save-dev autoprefixer grunt jscs karma)
npm i -S bluebird react react-dom (same as npm install --save bluebird react react-dom)
{% endhighlight %}

Why are we removing all the dependencies? The problem is that some packages depend on some others, and it is really difficult to get what is going on when some of the dependencies are not working properly. So this is a quick fix. The caveat is that if you have a lot of dependencies the command might be a little long, but it is something that your are only going to do once. Just do it now and start enjoying the blessings of Node 4.
