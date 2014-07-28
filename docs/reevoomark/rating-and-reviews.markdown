---
id: reevoomark-rating-and-reviews
title: Rating & Reviews
layout: docs
navId: docs
group: reevoomark
prev: javascript-library
next: conversation
---

EXPLANATION OF THE FINER POINTS OF THE REEVOO MARK RETAILER SPECIFIC CONFIGURATION SETTINGS (LINK TO?)

Retailer specific configuration
===============================

We assign an unique TRKREF account code that must be used to load a retailer specific configuration settings.
This is used to load configuration and provides a callback to perform all available actions on that retailer.

The JavaScript to use to load your configuration is as follows:

{% highlight javascript %}
afterReevooMarkLoaded = [function() {
  ReevooApi.load('TRKREF', function(retailer) {
    // retailer.COMMAND
    retailer.init_badges();
  });
}];
{% endhighlight %}
