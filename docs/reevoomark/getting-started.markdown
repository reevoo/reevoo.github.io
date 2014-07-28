---
id: reevoomark-getting-started
title: Getting Started
layout: docs
navId: docs
group: reevoomark
next: javascript-library
---

All pages that you wish to display ratings and reviews, or make use of our library, requires you to include our library.

EXAMPLE OF THE STANDARD WAY and how we provide many different possibilites of how to use

Getting Started
===============

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

  afterReevooMarkLoaded = [function() {
    ReevooApi.load('TRKREF', function(retailer) {
      // retailer.COMMAND
    });
  }];
</script>
{% endhighlight %}
