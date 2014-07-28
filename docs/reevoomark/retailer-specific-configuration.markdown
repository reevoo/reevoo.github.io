---
id: reevoomark-rating-and-reviews
title: Retailer specific configuration
layout: docs
navId: docs
group: reevoomark
prev: javascript-library
---

Retailer specific configuration
===============================

We assign an unique TRKREF account code that must be used to load a retailer specific configuration settings.
This is used to load configuration and provides a callback to perform all available actions on that retailer.

The JavaScript to use to load your configuration is as follows:

{% highlight javascript %}
afterReevooMarkLoaded = [function() {
  ReevooApi.load('TRKREF', function(retailer) {
    // retailer.command();
    retailer.init_badges();
  });
}];
{% endhighlight %}

This section and further sections will continue to be given attention and updates. Please come back later for updated content.
