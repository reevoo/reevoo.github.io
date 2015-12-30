---
id: customer-experience-badges
title: Product badges
layout: docs
navId: docs
group: reevoomark
prev: product-badges
next: conversation-badges
---

# Customer Experience Badges

To display the customer experience badge on your website you have to

1. [include the Reevoomark Javascript library](../javascript-library)
2. add the HTML link tag with `class="reevoo_reputation"` and `href="http://mark.reevoo.com/retailer/TRKREF"`
3. call the `init_reevoo_reputation_badges` method of the Javascript library:

{% highlight html %}
<script type="text/javascript">
  afterReevooMarkLoaded = [function() {
    ReevooApi.load('TRKREF', function(retailer) {
      retailer.init_reevoo_reputation_badges();
    });
  }];
</script>
{% endhighlight %}

* `TRKREF` should be replaced with your unique account code

Described steps allows you to display badge with Overall Service rating. To display Customer Service rating
add to the HTML link CSS class `customer_service`. To display Delivery rating add to the HTML link
CSS class `delivery`.

### Examples

*Overall Service rating:*

![Overall Service rating badge](/assets/customer-exp-badge.png)

{% highlight html %}
<a class="reevoo_reputation" href="http://mark.reevoo.com/retailer/TRKREF">Service rating of [client name]</a>
{% endhighlight %}


*Customer Service rating:*

![Customer Service rating badge](/assets/customer-exp-service-badge.png)

{% highlight html %}
<a class="reevoo_reputation customer_service" href="http://mark.reevoo.com/retailer/TRKREF">Customer service rating of [client name]</a>
{% endhighlight %}


*Delivery rating:*

![Delivery rating badge](/assets/customer-exp-delivery-badge.png)

{% highlight html %}
<a class="reevoo_reputation delivery" href="http://mark.reevoo.com/retailer/TRKREF">Delivery rating of [client name]</a>
{% endhighlight %}
