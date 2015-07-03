---
id: ie8
title: Internet Explorer 8 Support
layout: docs
group: reevoomark
navId: docs
prev: javascript-library
next: product-badges
---

Internet Explorer 8 Support
=============================

In order to enable support for IE8 you need to include an additional file in
the head of your pages.

{% highlight html %}
<head>
  ...
  <!--[if lte IE 8]><script src="//cdn.mark.reevoo.com/assets/ie8.js"></script><![endif]-->
</head>
{% endhighlight %}

It is important that this script is loaded into the page synchronously before
rendering begins in IE8 or we will not be able to display badges.
