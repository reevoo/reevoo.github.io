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
2. add the `reevoo-customer-experience-badge` tag with `trkref="TRKREF"`

* `TRKREF` should be replaced with your unique account code

Described steps allows you to display badge with Overall Service rating. To display Customer Service rating
set the score attribute to `customer_service`. To display Delivery rating set the score attribute to `delivery`.

### Examples

*Overall Service rating:*

![Overall Service rating badge](/assets/customer-exp-badge.png)

{% highlight html %}
<reevoo-customer-experience-badge trkref="TRKREF"></reevoo-customer-experience-badge>
{% endhighlight %}


*Customer Service rating:*

![Customer Service rating badge](/assets/customer-exp-service-badge.png)

{% highlight html %}
<reevoo-customer-experience-badge score="customer_service" trkref="TRKREF"></reevoo-customer-experience-badge>
{% endhighlight %}


*Delivery rating:*

![Delivery rating badge](/assets/customer-exp-delivery-badge.png)

{% highlight html %}
<reevoo-customer-experience-badge score="delivery" trkref="TRKREF"></reevoo-customer-experience-badge>
{% endhighlight %}

*Branch Specific:*

To limit the score to a particular branch set the `branch-code` attribute.

{% highlight html %}
<reevoo-customer-experience-badge branch-code="BRANCH_CODE" trkref="TRKREF"></reevoo-customer-experience-badge>
{% endhighlight %}
