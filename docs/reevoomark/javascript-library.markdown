---
id: reevoomark-javascript-library
title: JavaScript Library
layout: docs
group: reevoomark
navId: docs
prev: getting-started
next: retailer-specific-configuration
---

JavaScript Library
=============================

The code below imports our library, but without any client specific configurations. Please place it at the bottom of your page, just before the closing ```</body>``` tag, and only __include it once__ per page.

{% highlight html %}
<!-- protocol-relative URL -->
<script id="reevoomark-loader" type="text/javascript" charset="utf-8">
  (function() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = '//cdn.mark.reevoo.com/assets/reevoo_mark.js';
    var s = document.getElementById('reevoomark-loader');
    s.parentNode.insertBefore(script, s);
  })();
</script>
{% endhighlight %}

We implicitly use the protocol set by the page, but if you need to explicitly set the protocol use one of the following depending on if you want HTTP/HTTPS.

HTTP
----

{% highlight javascript %}
    script.src = 'http://cdn.mark.reevoo.com/assets/reevoo_mark.js';
{% endhighlight %}

HTTPS
-----

{% highlight javascript %}
    script.src = 'https://cdn.mark.reevoo.com/assets/reevoo_mark.js';
{% endhighlight %}

The reason why we ask you to load our JavaScript library this way is that it avoids blocking your page on first load. It also ensures if we are experiencing any issues regarding our services, your pages will not be blocked. It does, however, add some complexity to using the library as you cannot guarantee that our library will be loaded, or when. Thus we provide callbacks (shown on the next page) to allow you to ensure commands are called once our library is loaded onto the page.
