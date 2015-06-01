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

### Tracking clicks

We would recommend you use the above method of purchase tracking, however if
this is not possible you can call the tracking code from a click.

#### [addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener) [IE9+](http://www.w3schools.com/jsref/met_document_addeventlistener.asp)

{% highlight html %}
<a class="buy-link" href="/buy_cool_stuff">Buy cool stuff</a>

<script type="text/javascript">
   document.querySelector('.buy-link').addEventListener('click', function() {
     ReevooApi.load('TRKREF', function(retailer) {
       retailer.track_purchase(['SKU1', 'SKU2'], orderValue);
     });
   });
</script>
{% endhighlight %}

* `TRKREF` should be replaced with your unique account code
* `SKU1, SKU2` must be dynamically replaced with the product SKUs
* `orderValue` is an optional basket value

#### [jQuery](https://jquery.com/) - [cross browser](https://jquery.com/browser-support/)

{% highlight html %}
<a class="buy-link" href="/buy_cool_stuff">Buy cool stuff</a>

<script type="text/javascript">
   $('.buy-link').first().on('click', function() {
     ReevooApi.load('TRKREF', function(retailer) {
       retailer.track_purchase(['SKU1', 'SKU2'], orderValue);
     });
   });
</script>
{% endhighlight %}

* `TRKREF` should be replaced with your unique account code
* `SKU1, SKU2` must be dynamically replaced with the product SKUs
* `orderValue` is an optional basket value

#### [onclick](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Attribute/onclick) - [older browsers](https://www.microsoft.com/en-gb/download/internet-explorer-8-details.aspx)

{% highlight html %}
<a class="buy-link" href="/buy_cool_stuff">Buy cool stuff</a>

<script type="text/javascript">
   document.querySelector('.buy-link').onclick = function() {
     ReevooApi.load('TRKREF', function(retailer) {
       retailer.track_purchase(['SKU1', 'SKU2'], orderValue);
     });
   });
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

### Tracking clicks

We would recommend you use the above method of custom event tracking, however if
this is not possible you can call the tracking code from a click.

#### [addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener) [IE9+](http://www.w3schools.com/jsref/met_document_addeventlistener.asp)

{% highlight html %}
<a class="book-link" href="/book_test_drive">Book a test drive</a>

<script type="text/javascript">
   document.querySelector('.book-link').addEventListener('click', function() {
     ReevooApi.load('TRKREF', function(retailer) {
       retailer.Tracking.ga_track_event('event category', 'event action', 'event label');
       retailer.track_exit();
     });
   });
</script>
{% endhighlight %}

#### [jQuery](https://jquery.com/) - [cross browser](https://jquery.com/browser-support/)

{% highlight html %}
<a class="book-link" href="/book_test_drive">Book a test drive</a>

<script type="text/javascript">
   $('.book-link').first().on('click', function() {
     ReevooApi.load('TRKREF', function(retailer) {
       retailer.Tracking.ga_track_event('event category', 'event action', 'event label');
       retailer.track_exit();
     });
   });
</script>
{% endhighlight %}

#### [onclick](https://developer.mozilla.org/en-US/docs/Mozilla/Tech/XUL/Attribute/onclick) - [older browsers](https://www.microsoft.com/en-gb/download/internet-explorer-8-details.aspx)

{% highlight html %}
<a class="book-link" href="/book_test_drive">Book a test drive</a>

<script type="text/javascript">
   document.querySelector('.book-link').onclick = function() {
     ReevooApi.load('TRKREF', function(retailer) {
       retailer.Tracking.ga_track_event('event category', 'event action', 'event label');
       retailer.track_exit();
     });
   });
</script>
{% endhighlight %}
