---
id: product-badges
title: Product badges
layout: docs
navId: docs
group: reevoomark
prev: javascript-library
next: customer-experience-badges
---

# Product Badges

To display the product badge on your website you have to

1. [include the Reevoomark Javascript library](../javascript-library)
2. add the HTML link tag with `class="reevoomark"` and `href="http://mark.reevoo.com/partner/TRKREF/SKU"`
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

![Default badge](/assets/product-badge.png)

{% highlight html %}
<a class="reevoomark" href="http://mark.reevoo.com/partner/TRKREF/SKU">Read reviews</a>
{% endhighlight %}


## Badge variants

You can also specify the badge variant name as another class of the HTML link. It can be useful
for different types of pages like category listing or search result.


### Example

![Badge variant](/assets/product-badge-variant.png)

{% highlight html %}
<a class="reevoomark variant_name" href="http://mark.reevoo.com/partner/TRKREF/SKU">Read reviews</a>
{% endhighlight %}

* `variant_name` needs to be replaced with the badge variant, supplied by Reevoo

