---
layout: post
title:  From Node module to CLI
date:   2016-04-12 09:00
categories: blog
navId: blog
author: Victor Vila
github: irikuo
---

Today I have a quick tip. Did you ever found an awesome Node module that you want or need to use from the command line but the author forgot (or didn't have time) to create a CLI interface? That's not a problem if you use [commander](https://www.npmjs.com/package/commander).

After you install commander with `npm install commander`, you just need to create a script like this:

{% highlight js %}
// my-awesome-script.js

var program = require('commander'); // This is the commander module
var awesomeSWScript = require('awesome-sw-script'); // This is the awesome script that doesn't have a CLI interface

program
  .version('1.0.0')
  .option('-s, --skywalker', 'Use Skywalker')
  .parse(process.argv);

// Call the method that you need from the module and the whatever you need with it
var character = awesomeSWScript.findSWCharacter(program.skywalker);
console.log(character);
{% endhighlight %}

Now you can run it from the terminal with `node my-aweseome-script.js -s` or even better, create an npm module, publish it and allow the rest of the world to enjoy it.

Go and check the [commander documentation](https://www.npmjs.com/package/commander) and see all that you can do with it!

P.S. If you want to add colours to your terminal output, have a look at [Chalk](https://github.com/chalk/chalk).
