---
layout: post
title:  Being Lonely - Isolating Widgets on Client Sites
date:   2015-06-15 08:00:00
categories: blog
navId: blog
author: Jonny Arnold
github: jonnyarnold
---

At Reevoo we've been working on a few exciting things that we'll hopefully get to show you very soon. What we can tell you now is that the things we've been building (let's call them widgets for now) will live on *our clients'* websites, not ours. This comes with one big challenge: **how can we deliver an awesome widget without destroying the client's website?**

This article outlines the experiences we've had building such an awesome widget.

## What We Wanted

Our requirements, on the face of it, were quite straightforward. Here were the important ones:

- **Isolated:** Our widget should not affect the site it is displayed on.
- **Quick:** Our widget should load quickly, getting only as much data as necessary to show the initial state of the widget. (If the user interacts with the widget, we can make more time-consuming requests.) This should be true even if there are lots of widgets on the same page.

Isolated and quick. Easy peasy.

## iframes Have a Purpose!

One of the few legitimate uses of an iframe is to isolate a widget from the rest of the page. The iframe acts as a sandbox - nothing goes in, nothing comes out (with one or two exceptions). As a result, it's perfect for when you want two parts of your site to ignore each other.

Unfortunately the performance of iframes is still pretty awful. This violates our 'Quick' requirement, so we couldn't use iframes.

Without iframes, we'll be asynchronously loading our JavaScript, CSS and HTML and injecting it directly into the client's site.

Scared yet?

## Isolating JavaScript

Keeping our code away from the code of others was relatively straightforward: create a `window.reevoo` variable and pop all of our stuff inside it. Happy days.

This isolation works on the assumption that *nobody else will overwrite the reevoo variable,* which is quite reasonable for a company like us.

Libraries are more difficult. *Any* library that we add to our system could be defined by our clients; if their version is different to ours, we could accidentally downgrade (or upgrade) the library and break the client's site. This, inevitably, would make the client unhappy.

Does this mean we need to write our widgets without libraries?

### noConflict

Some JavaScript libraries provide a noConflict mode. The technique is very simple: when the library initially loads, it keeps a copy of the global variable sat where it wants to live. When noConflict is called, the library puts the old global variable back where it was.

Take jQuery, for instance:

{% highlight js %}
// We have included jQuery earlier.
// As you know, this pops a bunch of functionality in the $ variable.
$('.my-element'); // All good!

// Goodbye, cruel world.
$.noConflict();

// Now jQuery has been removed!
$('.my-element'); // undefined is not a function
{% endhighlight %}

noConflict modes allow us to use libraries. The main problem is that **most libraries don't supply a noConflict mode.** This is a massive shame, because its implementation is easy if you have a 'one true global' strategy like we do:

{% highlight js %}
// The first thing you do...
var existingReevoo = window.reevoo;
window.reevoo = {};

// Call me when you're done.
reevoo.noConflict = function() {
  reevoo = existingReevoo;
};

// ...the rest of your library goes here...
{% endhighlight %}

It's quite easy to pop it in though:

{% highlight html %}
<!-- Before you start... -->
<script type='text/javascript'>
  var existingLibX = LibX;
</script>
<script type='text/javascript' src='libx.js'></script>

<!-- When you're done... -->
<script type='text/javascript'>
  LibX = existingLibX;
</script>
{% endhighlight %}

Not pretty, but it works. Now we can use all of the libraries we ever wanted, right?

Sadly not. JavaScript developers like to do naughty things from time to time, like create *other* global variables or alter the prototypes of built-in objects. If your library does these things, noConflict won't correct these mistakes.

There's no easy way to figure out if your library can be forced into a noConflict mode (unless it's built into the library!), so your mileage may vary with the above snippet. If you find your library allows it though, send them a pull request to make our lives easier!

We've found that there's a gap in the market for a framework (or combination of libraries) that is small and has a noConflict mode. Or maybe we're not very good at Googling. Let us know.

## Isolating CSS

Isolating your CSS is a two-way process; your widget's style can be altered by the client's CSS as well as your widget's CSS affecting the client's site. So how do we do both?

Isolating the CSS you write is straightforward: pop it in a class that your widgets will have and your clients won't. Unimaginatively, we went for `reevoo-widget`. As long as your CSS is contained in this over-arching class, your styles shouldn't leak onto the client's site.

### Reset the CSS

A vital tool of the widgeteer (new word) is the CSS Reset. Without this, your CSS is subject to the outside world. Pop a CSS Reset into your isolator class and you achieve consistency wherever your widget ends up.

To test our widget, we embedded it in [the historic Space Jam website from 1996 that is still on the Internet today](http://www.warnerbros.com/archive/spacejam/movie/jam.htm). We were surprised to see that all the text in our widget had shifted to the centre! *"Curse you 1996!"*, we shouted before realising that our CSS Reset simply didn't set the `text-align` attribute for our elements. Lesson learned.

### You're Not Important

If you want to play nice in CSS, don't use `!important`. We don't have any clever techniques to get around this one; we simply tell our clients that any use of `!important` could affect our widget and it's their problem. We'll let you know how that goes.

---

There's a lot to think about when trying to shield yourself from your client's website (and vice versa); hopefully this article has provided you with some pointers to ensure a less bumpy ride than we had!

*This article was written by Jonny Arnold for Reevoo Engineering.*
