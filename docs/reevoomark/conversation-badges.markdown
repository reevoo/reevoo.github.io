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


## Custom click action

Normally are click actions on badges defined by Reevoo administrators. As a default we open a lightbox when user clicks on the badge.

* `reevoo-click-action` attribute gives you posibility to control the behaviour and overwrite default setting.

Available options are `open_lightbox`, `open_window`, `no_action`.

{% highlight html %}
<reevoo-conversations-badge trkref="TRKREF" sku="SKU" reevoo-click-action="open_lightbox"></reevoo-conversations-badge>
{% endhighlight %}

## Custom click callback

In cases when you need to implement your own logic around click action, we give you ability to define your custom javascript function. This function will be evaluated when user click on the badge, but **after** standard click action is executed. That means after lightbox is opened. You can use `on-click` callback together with `reevoo-click-action` setting.

* `on-click` attribute accept javascript function definition

{% highlight html %}
<reevoo-conversations-badge
    trkref="TRKREF"
    sku="SKU"
    on-click="function(){ alert('badge clicked') }"
    reevoo-click-action="no_action"
  ></reevoo-conversations-badge>
{% endhighlight %}
