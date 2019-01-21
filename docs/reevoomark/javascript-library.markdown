---
id: javascript-library
title: JavaScript Library
layout: docs
group: reevoomark
navId: docs
prev: getting-started
next: product-badges
---

JavaScript Library
=============================

The code below imports our library, but without any client specific configurations. Please place it to the page header and only __include it once__ per page.

{% highlight html %}
<!-- protocol-relative URL -->
<script defer="defer" src="//mark.reevoo.com/assets/reevoo_mark.js" id="reevoomark-loader" type="text/javascript"></script>
{% endhighlight %}

We implicitly use the protocol set by the page, but if you need to explicitly set the protocol use one of the following depending on if you want HTTP/HTTPS.

HTTP
----

{% highlight html %}
  <script defer="defer" src="http://mark.reevoo.com/assets/reevoo_mark.js" id="reevoomark-loader" type="text/javascript"></script>
{% endhighlight %}

HTTPS
-----

{% highlight html %}
  <script defer="defer" src="https://mark.reevoo.com/assets/reevoo_mark.js" id="reevoomark-loader" type="text/javascript"></script>
{% endhighlight %}

Reevoo JS library callbacks
----

Reevoo JS library allows you to register callbacks that will be executed after the library has been loaded. The following example shows how to register callbacks.

{% highlight html %}
<script type="text/javascript">
  if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
  window.afterReevooMarkLoaded.push( function () { alert('Reevoo JS library loaded'); },
</script>
{% endhighlight %}

