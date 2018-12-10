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

The code below imports our library, but without any client specific configurations. Please place it at the bottom of your page, just before the closing ```</body>``` tag, and only __include it once__ per page.

{% highlight html %}
<!-- protocol-relative URL -->
<script id="reevoomark-loader" type="text/javascript" charset="utf-8">
  (function(w,d,u,i,f,s,l) {
    s=d.createElement('script');s.type='text/javascript';s.src=u;
    l=d.getElementById(i);l.parentNode.insertBefore(s,l);w['ReevooMarkHandlerName']=f;
    w[f]=function(){(w[f].q=w[f].q||[]).push(arguments)}
  })(window, document, '//mark.reevoo.com/assets/reevoo_mark.js', 'reevoomark-loader', 'reevooMark');
</script>
{% endhighlight %}

We implicitly use the protocol set by the page, but if you need to explicitly set the protocol use one of the following depending on if you want HTTP/HTTPS.

HTTP
----

{% highlight javascript %}
  ...
  })(window, document, 'http://mark.reevoo.com/assets/reevoo_mark.js', 'reevoomark-loader', 'reevooMark');
{% endhighlight %}

HTTPS
-----

{% highlight javascript %}
  ...
  })(window, document, 'https://mark.reevoo.com/assets/reevoo_mark.js', 'reevoomark-loader', 'reevooMark');
{% endhighlight %}

The reason why we ask you to load our JavaScript library this way is that it avoids blocking your page on first load. It also ensures if we are experiencing any issues regarding our services, your pages will not be blocked. It does, however, add some complexity to using the library as you cannot guarantee that our library will be loaded, or when. Thus we provide callbacks (shown in the next section) to allow you to ensure commands are called once our library is loaded onto the page.

Reevoo JS library callbacks
----

Reevoo JS library allows you to register callbacks that will be executed after the library has been loaded. The following example shows how to register callbacks.

{% highlight html %}
<script type="text/javascript">
  if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
  window.afterReevooMarkLoaded.push( function () { alert('Reevoo JS library loaded'); },
</script>
{% endhighlight %}

