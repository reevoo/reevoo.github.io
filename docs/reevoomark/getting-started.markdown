---
id: reevoomark-getting-started
title: Getting Started
layout: docs
navId: docs
group: reevoomark
next: javascript-library
---

Getting Started
===============

Reevoo uses a JavaScript to provide access to our ratings and reviews solution directly to browsers. We have strived to keep this as clean and simple as possible to implement and use.

Please note that all of these examples use capitalized words such as ```TRKREF``` or ```SKU``` to indicate values you should provide.


Simple example
--------------

The most common use case for our library is to display _rating & reviews_ for a given product.

For this example you need to replace ```TRKREF``` with the account code provided to you, and ```SKU``` with a product unique identifer.

{% highlight html %}
<!-- This will be transformed into a product badge for the given TRKREF and SKU -->
<a class="reevoomark" href="http://mark.reevoo.com/partner/TRKREF/SKU">Read reviews</a>

<script id="reevoomark-loader" type="text/javascript" charset="utf-8">
  (function() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = '//cdn.mark.reevoo.com/assets/reevoo_mark.js';
    var s = document.getElementById('reevoomark-loader');
    s.parentNode.insertBefore(script, s);
  })();

  afterReevooMarkLoaded = [function() {
    ReevooApi.load('TRKREF', function(retailer) {
      retailer.init_badges
    });
  }];
</script>
{% endhighlight %}

In the following sections we will explain how you can implement a number of different badges, add your own actions to your badges clicks and get the best out of our JavaScript library.
