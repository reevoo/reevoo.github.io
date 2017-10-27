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


## Custom click action

Normally are click actions on badges defined by Reevoo administrators. As a default we open a lightbox when user clicks on the badge.

* `reevoo-click-action` attribute gives you posibility to control the behaviour and overwrite default setting.

Available options are `open_lightbox`, `open_window`, `no_action`.

{% highlight html %}
<reevoo-customer-experience-badge trkref="TRKREF" reevoo-click-action="open_lightbox"></reevoo-customer-experience-badge>
{% endhighlight %}

## Custom click callback

In cases when you need to implement your own logic around click action, we give you ability to define your custom javascript function. This function will be evaluated when user click on the badge, but **after** standard click action is executed. That means after lightbox is opened. You can use `on-click` callback together with `reevoo-click-action` setting.

* `on-click` attribute accept javascript function definition

{% highlight html %}
<reevoo-customer-experience-badge
    trkref="TRKREF"
    on-click="function(){ alert('badge clicked') }"
    reevoo-click-action="no_action"
  ></reevoo-customer-experience-badge>
{% endhighlight %}
