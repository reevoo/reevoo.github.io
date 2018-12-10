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

1\. [include the Reevoomark Javascript library](../javascript-library)


2\. Include our embedded reviews CSS in your HTML header, using the HTML link below:
{% highlight html %}
  <link rel="stylesheet" href="//mark.reevoo.com/assets/embedded_reviews.css" type="text/css" />
{% endhighlight %}

3\. add the `reevoo-embedded-product-reviews` tag with `trkref="TRKREF"` and `sku="SKU"` and `per_page="PER_PAGE"` and optionally, `locale="LOCALE"` attributes

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



Embedded Product Reviews for Automotive Partners
------------------------------------------------

Our automotive partners which have been enabled to use Automotive Aggregation, can display the embedded product reviews based on automotive metadata instead of a "sku".

The automotive metadata includes attributes like `manufacturer`, `model`, `model-year`, and many others. The full list of available attributes correspond to the values in [our automotive product feed specification](../../feeds/feeds-automotive-product-fields).

To display embedded product reviews based on automotive metadata, add the `reevoo-embedded-product-reviews` tag with attributes `trkref="TRKREF"`, `per-page="PER_PAGE"`, optionally `locale="LOCALE"`, and then any combination of automotive metadata attributes. See some examples below.

**NOTE**: Please use hyphen ('-') separator for each HTML attribute to stick with HTML conventions, for example `model-year`. This can be seen in the examples below.

### Examples

Minimal required attributes are `trkref`, `per-page`, `manufacturer` and `model`:

{% highlight html %}
<reevoo-embedded-product-reviews  trkref="TRKREF" per-page="10" manufacturer="ford" model="fiesta"></reevoo-embedded-product-reviews>
{% endhighlight %}

We strongly recommend using more specific parameters such as `model-year`, `body-type`, etc to get more relevant scores. Speak with your account manager for more info on this. A more complex example could be:

{% highlight html %}
<reevoo-embedded-product-reviews
    trkref="TRKREF"
    per-page="10"
    locale="en-GB"
    manufacturer="ford"
    model="fiesta"
    model-variant="SE"
    model-year="2016"
    body-type="hatchback"
    used="0"
    engine-type="diesel"
 ></reevoo-embedded-product-reviews>
{% endhighlight %}
