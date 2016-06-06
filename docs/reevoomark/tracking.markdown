---
id: tracking
title: Tracking
layout: docs
navId: docs
group: reevoomark
prev: conversation-badges
---

# Tracking

ReevooMark javascript library tracks automatically four different events related to badges:

* **impression** when badge is displayed
* **miss** when badge is not displayed because of wrong SKU
* **non_impression** when badge is not displayed because of no reviews for particular product
* **click** when badge is clicked

Apart from automatic tracking you can manually track purchases and events on custom badges and general custom events.
Before implementing the custom tracing call please check that you use the latest version of [reevoomark-loader JS
snippet](../javascript-library).


## Purchase tracking

In order to track a purchase follow these steps:

1. [Insert the ReevooMark loader JS code](../javascript-library) (should be inserted just once on a page)
2. Call the `reevooMark` method with purchase tracking arguments on your purchase confirmation page
(insert after the ReevooMark loader JS code):

{% highlight html %}
<script type="text/javascript">
  reevooMark('trackPurchase', 'TRKREF', { skus: ['SKU1', 'SKU2'], basketValue: '123 GBP' });
</script>
{% endhighlight %}

* `TRKREF` should be replaced with your unique account code
* `SKU1, SKU2` should be dynamically replaced with the product SKUs
* `basketValue` is an optional order value

### Track purchase action on click

We would recommend you use the above method of purchase tracking, however if
this is not possible you can call the tracking code from a click.

#### [addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener) [IE9+](http://www.w3schools.com/jsref/met_document_addeventlistener.asp)

{% highlight html %}
<a class="buy-link" href="/buy_cool_stuff">Buy cool stuff</a>

<script type="text/javascript">
  document.querySelector('.buy-link').addEventListener('click', function() {
    reevooMark('trackPurchase', 'TRKREF', { skus: ['SKU1', 'SKU2'], basketValue: '123 GBP' });
  });
</script>
{% endhighlight %}

#### [jQuery](https://jquery.com/) - [cross browser](https://jquery.com/browser-support/)

{% highlight html %}
<a class="buy-link" href="/buy_cool_stuff">Buy cool stuff</a>

<script type="text/javascript">
  $('.buy-link').first().on('click', function() {
    reevooMark('trackPurchase', 'TRKREF', { skus: ['SKU1', 'SKU2'], basketValue: '123 GBP' });
  });
</script>
{% endhighlight %}

#### [onclick](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Attribute/onclick) - [older browsers](https://www.microsoft.com/en-gb/download/internet-explorer-8-details.aspx)

{% highlight html %}
<a class="buy-link" href="/buy_cool_stuff">Buy cool stuff</a>

<script type="text/javascript">
  document.querySelector('.buy-link').onclick = function() {
    reevooMark('trackPurchase', 'TRKREF', { skus: ['SKU1', 'SKU2'], basketValue: '123 GBP' });
  });
</script>
{% endhighlight %}

* `TRKREF` should be replaced with your unique account code
* `SKU1, SKU2` should be dynamically replaced with the product SKUs
* `basketValue` is an optional order value



## Propensity to buy tracking

In order to track propensity to buy follow these steps:

1. [Insert the ReevooMark loader JS code](../javascript-library) (should be inserted just once on a page)
2. Call the `reevooMark` method with propensity to buy tracking arguments on your customer action page
(insert after the ReevooMark loader JS code):

{% highlight html %}
<script type="text/javascript">
  reevooMark('trackPropensityToBuy', 'TRKREF', { reviewableContext: { manufacturer: 'Ford', model: 'Focus' } });
</script>
{% endhighlight %}

* `TRKREF` should be replaced with your unique account code
* `reviewableContext` should be dynamically replaced with context of your product

You can use `sku` instead of `reviewableContext` if your product is identified by SKU.



## Custom badge tracking

Please use our manual custom badge tracking if you display your own custom badges.

### Custom badge display

In order to track a custom badge display follow these steps:

1. [Insert the ReevooMark loader JS code](../javascript-library) (should be inserted just once on a page)
2. Call the `reevooMark` method with trackBadgeDisplay arguments for each displayed badge (insert after the ReevooMark loader JS code):

{% highlight html %}
<script type="text/javascript">
  // for badge of reviewable identified by SKU:
  reevooMark('trackBadgeDisplay', 'TRKREF', { sku: 'SKU' });

  // for badge of reviewable identified by context (e.g. cars):
  reevooMark('trackBadgeDisplay', 'TRKREF', { reviewableContext: { manufacturer: 'Ford', model: 'Focus' } });

  // for customer experience badge:
  reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'customer_experience' });

  // for conversations badge:
  reevooMark('trackBadgeDisplay', 'TRKREF', { sku: 'SKU', contentType: 'conversations' });
</script>
{% endhighlight %}

#### Attributes

* `TRKREF` (required)
* `sku` or `reviewableContext` to identify reviewable (required unless it's customer experience badge)
* `contentType` with values: reviewable (default), customer_experience or conversations
* `hitType` with values: impression (badge is visible, default), non_impression (badge is not visible as there are not
  enough reviews), miss (reviewable not found)
* `ctaPageUse` identifies type of page where the badge is displayed, possible values: product_primary (default),
  product_secondary, category, search, homepage, basket, checkout, confirmation, reevoo
* `ctaStyle` for optional further identification of badge


### Custom badge click

In order to track clicks on custom badge follow these steps:

1. [Insert the ReevooMark loader JS code](../javascript-library) (should be inserted just once on a page)
2. Call the `reevooMark` method with trackBadgeClick arguments when the badge is clicked (insert after the ReevooMark loader JS code):

{% highlight html %}
<a class="custom-reviewable-sku-badge" href="#reviews">Read product reviews</a>
<a class="custom-reviewable-context-badge" href="#reviews">Read product reviews</a>
<a class="custom-cx-badge" href="#cx-reviews">Read customer experience reviews</a>
<a class="custom-conversations-badge" href="#conversations">Read product conversations</a>

<script type="text/javascript">
  // for badge of reviewable identified by SKU:
  document.querySelector('.custom-reviewable-sku-badge').addEventListener('click', function() {
    reevooMark('trackBadgeClick', 'TRKREF', { sku: 'SKU' });
  });

  // for badge of reviewable identified by context (e.g. cars):
  document.querySelector('.custom-reviewable-context-badge').addEventListener('click', function() {
    reevooMark('trackBadgeClick', 'TRKREF', { reviewableContext: { manufacturer: 'Ford', model: 'Focus' } });
  });

  // for customer experience badge:
  document.querySelector('.custom-cx-badge').addEventListener('click', function() {
    reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'customer_experience' });
  });

  // for conversations badge:
  document.querySelector('.custom-conversations-badge').addEventListener('click', function() {
    reevooMark('trackBadgeClick', 'TRKREF', { sku: 'SKU', contentType: 'conversations' });
  });
</script>
{% endhighlight %}

#### Attributes

* `TRKREF` (required)
* `sku` or `reviewableContext` to identify reviewable (required unless it's customer experience badge)
* `contentType` with values: reviewable (default), customer_experience or conversations
* `ctaPageUse` identifies type of page where the badge is displayed, possible values: product_primary (default),
  product_secondary, category, search, homepage, basket, checkout, confirmation, reevoo
* `ctaStyle` for optional further identification of badge
