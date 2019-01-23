---
id: getting-started
title: Getting Started
layout: docs
navId: docs
group: reevoomark
next: javascript-library
---

Getting Started
===============

Reevoo uses JavaScript to provide access to our ratings and reviews solution directly to browsers. We have strived to keep this as clean and simple as possible to implement and use.

Please note that all of these examples use capitalized words such as ```TRKREF``` or ```SKU``` to indicate values you should provide.


Simple example
--------------

The most common use case for our library is to display _rating & reviews_ for a given product.

For this example you need to replace ```TRKREF``` with the account code provided to you, and ```SKU``` with a product unique identifer.

{% highlight html %}
<script defer="defer" src="//mark.reevoo.com/assets/reevoo_mark.js" id="reevoomark-loader" type="text/javascript"></script>

<!-- This will be transformed into a product badge for the given TRKREF and SKU -->
<reevoo-reviewable-badge trkref="TRKREF" sku="SKU"></reevoo-reviewable-badge>
{% endhighlight %}

In the following sections we will explain how you can implement a number of different badges, add your own actions to your badges clicks and get the best out of our JavaScript library.
