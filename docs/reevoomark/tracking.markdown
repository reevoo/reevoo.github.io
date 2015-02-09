---
id: tracking
title: Tracking
layout: docs
navId: docs
group: reevoomark
prev: conversation-badge
---

# Tracking

ReevooMark javascript library tracks automatically four different events related to badges:

* **hit** when badge is displayed
* **miss** when badge is not displayed because of wrong SKU
* **non_impression** when badge is not displayed because of no reviews for particular product
* **click** when badge is clicked

Apart from automatic tracking you can manually track purchases and custom events.


## Purchase tracking

In order to track a purchase follow these steps:

1. [include the Reevoomark Javascript library](../javascript-library)
2. call the `track_purchase` method of the Javascript library on your purchase confirmation page:

{% highlight html %}
<script type="text/javascript">
  afterReevooMarkLoaded = [function(){
    ReevooApi.load('TRKREF', function(retailer) {
      retailer.track_purchase(['SKU1', 'SKU2'], orderValue);
    });
  }];
</script>
{% endhighlight %}

* `TRKREF` should be replaced with your unique account code
* `SKU1, SKU2` must be dynamically replaced with the product SKUs
* `orderValue` is an optional basket value


## Custom event tracking

In order to track a custom event follow these steps:

1. [include the Reevoomark Javascript library](../javascript-library)
2. call the `ga_track_event` method of the Javascript library on your purchase confirmation page:

{% highlight html %}
<script type="text/javascript">
  afterReevooMarkLoaded = [function(){
    ReevooApi.load('TRKREF', function(retailer) {
      retailer.Tracking.ga_track_event('event category', 'event action', 'event label');
      retailer.track_exit();
    });
  }];
</script>
{% endhighlight %}

For `event category, event action, event label` you can use any value according you needs.
More information you can find in [Google Analytics documentation](https://developers.google.com/analytics/devguides/collection/analyticsjs/events).


All events are visible in Google Analytics account provided by Reevoo as well as in
Reevoo Analytics tool except of the custom events.
