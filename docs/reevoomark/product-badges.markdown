---
id: product-badges
title: Product badges
layout: docs
navId: docs
group: reevoomark
prev: ie8
next: customer-experience-badges
---

# Product Badges

To display the product badge on your website you have to

1. [include the Reevoomark Javascript library](../javascript-library)
2. add the `reevoo-reviewable-badge` tag with `trkref="TRKREF"` and `SKU="SKU"`

* `TRKREF` should be replaced with your unique account code
* `SKU` needs to be dynamically replaced with the corresponding product SKU

### Example

![Default badge](/assets/product-badge.png)

{% highlight html %}
<reevoo-reviewable-badge trkref="TRKREF" sku="SKU"></reevoo-reviewable-badge>
{% endhighlight %}


## Badge variants

You can also specify the badge variant name. It can be useful
for different types of pages like category listing or search result.


### Example

![Badge variant](/assets/product-badge-variant.png)

{% highlight html %}
<reevoo-reviewable-badge trkref="TRKREF" sku="SKU" variant="variant_name"></reevoo-reviewable-badge>
{% endhighlight %}

* `variant_name` needs to be replaced with the badge variant, supplied by Reevoo

## Product Badges for Branches

When rendering a product badge you can specify the branch-code that the customer experience tab should be limited to.
This is useful when you do not want to show all CEX reviews.

Note: If you try to render a badge with a code we do not have, the badge will not render. You will need to provide
use with new branch codes if this is the case.

### Example

{% highlight html %}
<reevoo-reviewable-badge trkref="TRKREF" sku="SKU" branch-code="branch_code"></reevoo-reviewable-badge>
{% endhighlight %}

* `branch_code` needs to be replaced with the branch code you supplied to Reevoo

## Product Badges for product groups

Instead of using SKU of a particular product you can use product group identifier

{% highlight html %}
<reevoo-reviewable-badge trkref="TRKREF" sku="series:group_identifier"></reevoo-reviewable-badge>
{% endhighlight %}

* `group_identifier` needs to be replaced with the product group identifier


## Product Badges for Automotive Partners

Our automotive partners which have been enabled to use Automotive Aggregation, can display the product badges based on automotive metadata instead of a "sku".

The automotive metadata includes attributes like `manufacturer`, `model`, `model-year`, and many others. The full list of available attributes correspond to the values in [our automotive product feed specification](../../feeds/feeds-automotive-product-fields).

To display product badges based on automotive metadata, add the `reevoo-reviewable-badge` tag with attributes `trkref="TRKREF`, and then any combination of automotive metadata attributes. See some examples below.

**NOTE**: Please use hyphen ('-') separator for each HTML attribute to stick with HTML conventions, for example `model-year`. This can be seen in the examples below.

### Examples

Minimal required attributes are `trkref`, `manufacturer` and `model`:

{% highlight html %}
<reevoo-reviewable-badge trkref="TRKREF" manufacturer="ford" model="fiesta"></reevoo-reviewable-badge>
{% endhighlight %}

We strongly recommend using more specific parameters such as `model-year`, `body-type`, etc to get more relevant scores. Speak with your account manager for more info on this. A more complex example could be:

{% highlight html %}
<reevoo-reviewable-badge
    trkref="TRKREF"
    manufacturer="ford"
    model="fiesta"
    model-variant="SE"
    model-year="2016"
    body-type="hatchback"
    used="0"
    engine-type="diesel"
  ></reevoo-reviewable-badge>
{% endhighlight %}
