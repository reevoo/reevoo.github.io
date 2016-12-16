---
id: conversation-badges
title: Conversation badges
layout: docs
navId: docs
group: reevoomark
prev: customer-experience-badges
next: embedded-product-reviews
---

# Conversation Badges

To display the conversation badge on your website you have to

1. [Include the Reevoomark Javascript library](../javascript-library)
2. `reevoo-conversations-badge` tag with `trkref="TRKREF"` and `sku="SKU"`

* `TRKREF` should be replaced with your unique account code
* `SKU` needs to be dynamically replaced with the corresponding product SKU

### Example

![Conversation badge](/assets/conversation-badge.png)

{% highlight html %}
<reevoo-conversations-badge trkref="TRKREF" sku="SKU"></reevoo-conversations-badge>
{% endhighlight %}


## Conversation Badges for Automotive Partners

Our automotive partners which have been enabled to use Automotive Aggregation, can display the conversation badges based on automotive metadata instead of a "sku".

The automotive metadata includes attributes like `manufacturer`, `model`, `model-year`, and many other ones. Contact us if you need to get the full list of attributes available.
 
To display conversation badges based on automotive metadata, add the `reevoo-conversations-badge` tag with attributes `trkref="TRKREF`, and then any combination of automotive metadata attributes. See some examples below.

### Examples

{% highlight html %}
<reevoo-conversations-badge trkref="TRKREF" manufacturer="ford"></reevoo-conversations-badge>
{% endhighlight %}


{% highlight html %}
<reevoo-conversations-badge trkref="TRKREF" manufacturer="ford" model="fiesta"></reevoo-conversations-badge>
{% endhighlight %}


{% highlight html %}
<reevoo-conversations-badge trkref="TRKREF" manufacturer="ford" model="fiesta" model-year="2016"></reevoo-conversations-badge>
{% endhighlight %}
