---
id: embedded-conversations
title: Embedded Conversations
layout: docs
navId: docs
group: reevoomark
prev: embedded-customer-experience-reviews
next: tracking
---

# Embedded Conversations

To display embedded conversations in your website you have to

1\. [include the Reevoomark Javascript library](../javascript-library)


2\. Include our embedded reviews CSS in your HTML header, using the HTML link below:
{% highlight html %}
  <link rel="stylesheet" href="//mark.reevoo.com/stylesheets/reevoomark/embedded_reviews.css" type="text/css" />
{% endhighlight %}


3\. add the `reevoo-embedded-conversations` tag with `trkref="TRKREF"` and `sku="SKU"` and `per_page="PER_PAGE"` and optionally, `locale="LOCALE"` attributes

* `TRKREF` should be replaced with your unique account code
* `SKU` needs to be dynamically replaced with the corresponding product SKU
* `PER_PAGE` needs to be replaced by the number of conversations to display per page, as the conversations will be paginated.
* `LOCALE` needs to be replaced by the locale of the desired conversations (for example en-GB or it-IT)

### Examples

{% highlight html %}
<reevoo-embedded-conversations  trkref="TRKREF" sku="SKU" per-page="5"></reevoo-embedded-conversations>
{% endhighlight %}


{% highlight html %}
<reevoo-embedded-conversations  trkref="TRKREF" sku="SKU" per-page="5" locale="en-GB"></reevoo-embedded-conversations>
{% endhighlight %}
