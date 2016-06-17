---
id: embedded-product-reviews
title: Embedded Product Reviews
layout: docs
navId: docs
group: reevoomark
prev: conversation-badges
next: embedded-customer-experience-reviews
---


# Embedded Product Reviews

To display embedded product reviews in your website you have to

1. [include the Reevoomark Javascript library](../javascript-library)
2. add the `reevoo-embedded-product-reviews` tag with `trkref="TRKREF"` and `sku="SKU"` and `per_page="PER_PAGE"` and optionally, `locale="LOCALE"` attributes

* `TRKREF` should be replaced with your unique account code
* `SKU` needs to be dynamically replaced with the corresponding product SKU
* `PER_PAGE` needs to be replaced by the number of reviews to display per page, as the reviews will be paginated.
* `LOCALE` needs to be replaced by the locale of the desired reviews (for example en-GB or it-IT)

### Examples

{% highlight html %}
<reevoo-embedded-product-reviews  trkref="TRKREF" sku="SKU" per-page="10"></reevoo-embedded-product-reviews>
{% endhighlight %}


{% highlight html %}
<reevoo-embedded-product-reviews  trkref="TRKREF" sku="SKU" per-page="10" locale="en-GB"></reevoo-embedded-product-reviews>
{% endhighlight %}
