---
id: embedded-tabbed
title: Embedded Tabbed Reviews
layout: docs
navId: docs
group: reevoomark
prev: embedded-conversations
next: tracking
---


# Embedded Tabbed Reviews

Emebedded Tabbed Reviews is a composite tabbed interface containing tabs for the Product Reviews, Ask an Owner and Customer Experiences Reviews (or the subset of those items that you are using). Embedded Tabbed Reviews is only available in the updated display release and not in the older styling.

<img alt="embedded tabbed reviews" src="/images/embedded-tabbed-reviews.png" width="100%" />



To display embedded tabbed reviews in your website you have to

1\. [include the Reevoomark Javascript library](../javascript-library)


2\. Include our embedded reviews CSS in your HTML header, using the HTML link below:
{% highlight html %}
  <link rel="stylesheet" href="//cdn.mark.reevoo.com/stylesheets/reevoomark/embedded_reviews.css" type="text/css" />
{% endhighlight %}

3\. Add the `reevoo-embedded-tabbed` tag with attributes. The attributes should be the same as for [Embedded Product Reviews](../embedded-product-reviews) including the optional attributes for Automotive Partners.

Additionally the following optional attributes may be used:

* <span class="na">`tab`</span> - this will open the required tab intitially. This attribute will take the follow values:
  * <span class="s">`ask_an_owner`</span> - will show the Ask an Owner tab.
  * <span class="s">`retailer_reviews`</span> - will show the Customer Experience tab.
  * null or blank i.e. <span class="s">`""`</span> or any other value will show the Product Reviews tab

If the <span class="na">`tab`</span> attribute is changed by JavaScript after the content has loaded this will refresh the embedded content with that tab open. This allows you to have buttons on the page that open a different tab.

### Examples

{% highlight html %}
<reevoo-embedded-tabbed trkref="TRKREF" sku="SKU" per-page="10" tab="ask_an_owner"></reevoo-embedded-tabbed>
{% endhighlight %}


{% highlight html %}
<reevoo-embedded-tabbed trkref="TRKREF" sku="SKU" per-page="10" locale="en-GB"></reevoo-embedded-tabbed>
{% endhighlight %}

### Examples for Automotive Partners

Minimal required attributes are `trkref`, `per-page`, `manufacturer` and `model`:

{% highlight html %}
<reevoo-embedded-tabbed trkref="TRKREF" per-page="10" manufacturer="ford" model="fiesta"></reevoo-embedded-tabbed>
{% endhighlight %}

{% highlight html %}
<reevoo-embedded-tabbed
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
 ></reevoo-embedded-tabbed>
{% endhighlight %}
