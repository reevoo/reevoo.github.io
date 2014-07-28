---
id: reevoomark-javascript-library
title: JavaScript Library
layout: docs
group: reevoomark
navId: docs
prev: getting-started
next: rating-and-reviews
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

{% highlight html %}
<!-- HTTP protocol URL -->
<script id="reevoomark-loader" type="text/javascript" charset="utf-8">
  (function() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'http://cdn.mark.reevoo.com/assets/reevoo_mark.js';
    var s = document.getElementById('reevoomark-loader');
    s.parentNode.insertBefore(script, s);
  })();
</script>
{% endhighlight %}

{% highlight html %}
<!-- HTTPS protocol URL -->
<script id="reevoomark-loader" type="text/javascript" charset="utf-8">
  (function() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://cdn.mark.reevoo.com/assets/reevoo_mark.js';
    var s = document.getElementById('reevoomark-loader');
    s.parentNode.insertBefore(script, s);
  })();
</script>
{% endhighlight %}

