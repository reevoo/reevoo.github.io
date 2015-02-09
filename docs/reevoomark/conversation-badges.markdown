---
id: conversation-badges
title: Conversation badges
layout: docs
navId: docs
group: reevoomark
prev: customer-experience-badges
next: tracking
---

# Conversation Badges

To display the conversation badge on your website you have to

1. [include the Reevoomark Javascript library](../javascript-library)
2. add the HTML link tag with `class="reevoomark reevoo-conversations"` and `href="http://mark.reevoo.com/partner/TRKREF/SKU"`
3. call the `init_badges` method of the Javascript library:

{% highlight html %}
<script type="text/javascript">
  afterReevooMarkLoaded = [function() {
    ReevooApi.load('TRKREF', function(retailer) {
      retailer.init_badges();
    });
  }];
</script>
{% endhighlight %}

* `TRKREF` should be replaced with your unique account code
* `SKU` needs to be dynamically replaced with the corresponding product SKU

### Example

![Conversation badge](/assets/conversation-badge.png)

{% highlight html %}
<a class="reevoomark reevoo-conversations" href="http://mark.reevoo.com/partner/TRKREF/SKU">Ask an owner</a>
{% endhighlight %}
