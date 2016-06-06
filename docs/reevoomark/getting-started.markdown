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
<!-- This will be transformed into a product badge for the given TRKREF and SKU -->
<reevoo-reviewable-badge trkref="TRKREF" sku="SKU"></reevoo-reviewable-badge>

<script id="reevoomark-loader" type="text/javascript" charset="utf-8">
  (function(w,d,u,i,f,s,l) {
    s=d.createElement('script');s.type='text/javascript';s.src=u;
    l=d.getElementById(i);l.parentNode.insertBefore(s,l);w['ReevooMarkHandlerName']=f;
    w[f]=function(){(w[f].q=w[f].q||[]).push(arguments)}
  })(window, document, '//cdn.mark.reevoo.com/assets/reevoo_mark.js', 'reevoomark-loader', 'reevooMark');
</script>
{% endhighlight %}

In the following sections we will explain how you can implement a number of different badges, add your own actions to your badges clicks and get the best out of our JavaScript library.
