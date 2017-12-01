---
id: tracking-and-API
title: API & Tracking Implementation
layout: docs
group: reevooapi
navId: docs
---

API & Tracking Implementation
=============================

One of our products, myReevoo Analytics, allow our customers to gauge what value Reevoo adds to their
business via the visualisation of a number of metrics: publish rate, reviews collected, emails sent, conversion uplift, propensity impact, click through rate and time on site uplift.

These metrics are fed by a number of tracking events that trigger automatically by our badges and embedded reviews widgets as users interact with them.

When customers implement badges and embedded reviews in their websites using our ready-made web-components, nothing else needs to be done in order to have the tracking data flowing to Reevoo, this happens automatically, it is in-built in the web-components themselves.

Customers who prefer not to use our ready-made widgets to display badges and embedded reviews, and instead implement their own by using our API to get the data to display, will not benefit from the in-built tracking functionality offered by our web-components.
So unless they replicate by themselves the tracking functionality as part of their widgets, most of the metrics offered by myReevoo Analytics will not be available to them.

This document is a guideline on what tracking functionality needs to be added by customers who use their own badges and embedded reviews display widgets in order to benefit from all the insight metrics offered by myReevoo Analytics.



Reviews Product Badges
-----------------------

These are the badges associated to specific products which allow the user to access the reviews linked to the product.

The tracking we need for reviews product badges are: **rendered** and **click** events.

The "rendered" event should trigger every time a reviews product badge is rendered in a page, and allow us to keep track of all the pages that have badges available on them.

The "click" event should trigger when the user clicks on the badge.

By sending us these two events we can calculate the "click-through" rate, which is a ratio showing how often people who see your badge end up clicking it.

To make sure these two events are triggered, <a href="../../../reevoomark/javascript-library">first include in your page the Reevoo javascript library</a>, and then put a div around your badge element as in the snippet below.
Just make sure to replace TRKREF by the trkref value assigned to you by Reevoo and SKU by the sku of the product to which the badge is associated. And obviously replace "DISPLAY YOUR BADGE HERE" by your custom badge html.


{% highlight html %}
<div onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'reviewable', reviewableContext: { sku: 'SKU' } });">
  DISPLAY YOUR BADGE HERE
  <script>
    if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
    afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'reviewable', reviewableContext: { sku: 'SKU' }}); });
  </script>
</div>
{%endhighlight %}


Most of our automotive clients use a combination of model and manufacturer attributes to identify products, instead of using a sku. If you are an automotive retailer using manufacturer and model to identify your products, use the following snippet instead of the one shown above.
Just make sure to replace TRKREF and MAKE and MODEL by the appropriate values.


{% highlight html %}
<div onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'reviewable', reviewableContext: {  manufacturer: 'MAKE', model: 'MODEL' } });">
  DISPLAY YOUR BADGE HERE
  <script>
    if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
    afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'reviewable', reviewableContext: { manufacturer: 'MAKE', model: 'MODEL' }}); });
  </script>
</div>
{%endhighlight %}



Conversation Product Badges
-----------------------

Conversation product badges are associated to a specific product and allow the user access to the "ask an owner" feature where they can ask questions about the product, or read previously submitted questions about the product and their answers if available.

The types of tracking events required for this type of badges and the snippets you need to include in order to trigger them are exactly the same as in the section above for Reviews Product Badges with the only different we use **contentType: 'conversations'** instead of **contentType: 'reviewable'**. See the equivalent snippets below.


For sku based products:

{% highlight html %}
<div onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'reviewable', reviewableContext: { sku: 'SKU' } });">
  DISPLAY YOUR BADGE HERE
  <script>
    if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
    afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'conversations', reviewableContext: { sku: 'SKU' }}); });
  </script>
</div>
{%endhighlight %}


For manufacturer and model products:

{% highlight html %}
<div onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'reviewable', reviewableContext: {  manufacturer: 'MAKE', model: 'MODEL' } });">
  DISPLAY YOUR BADGE HERE
  <script>
    if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
    afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'conversations', reviewableContext: { manufacturer: 'MAKE', model: 'MODEL' }}); });
  </script>
</div>
{%endhighlight %}


As detailed in the Reviews Product Badges section, you should replace TRKREF, SKU, MAKE and MODEL by the relevant values for your organisation and product. And also make sure your page <a href="../../../reevoomark/javascript-library">includes the reevoo javascript library</a>.


Customer Experience Badges
----------------------------

Customer experience badges display ratings associated to different aspects of the interaction of the customers with the retailer itself, not of specific products sold by the retailer.

We have three different types of customer experience badges: "Overall Service Rating", "Customer Service Rating", and "Delivery Rating".

As with the product badges, for customer experience badges we are interested on tracking the "rendered" and "click" events.

To make sure these two events are triggered, first include in your page <a href="../../../reevoomark/javascript-library">the Reevoo javascript library</a>, and then put a div around your badge element as in the snippets below.

Just make sure to replace TRKREF by the trkref value assigned to you by Reevoo.


For "Overall Service Rating" badges use the following snippet:

{% highlight html %}
<div onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'customer_experience', badgeType: 'overall' });">
  DISPLAY YOUR OVERALL CUSTOMER EXPERIENCE BADGE HERE
  <script>
    if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
    afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'customer_experience', badgeType: 'overall' }); });
  </script>
</div>
{%endhighlight %}


For "Customer Service Rating" badges use the following snippet:

{% highlight html %}
<div onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'customer_experience', badgeType: 'customer_service' });">
  DISPLAY YOUR CUSTOMER SERVICE BADGE HERE
  <script>
    if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
    afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'customer_experience', badgeType: 'customer_service' }); });
  </script>
</div>
{%endhighlight %}

For "Delivery Rating" badges use the following snippet:

{% highlight html %}
<div onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'customer_experience', badgeType: 'delivery' });">
  DISPLAY YOUR DELIVERY SERVICE BADGE HERE
  <script>
    if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
    afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'customer_experience', badgeType: 'delivery' }); });
  </script>
</div>
{%endhighlight %}



Purchase Event
-----------------------

The purchase events should be implemented by retailers that have an online checkout in their websites. The event is meant to be triggered once a customer has completed a purchase.

This event is important to calculate the conversion uplift, which is a measure of Reevoo's impact in the retailer's bottom line by analyzing how many customers end up buying a product after having first read the product reviews; and how many buy the product without having read the reviews.

To make sure the event is triggered, put the following javascript snippet in your "order confirmation" page, making sure to replace TRKREF by the trkref value assigned to you by Reevoo. Also make sure to replace the basket value and the list of skus by the appropriate values. So if the user has bought three products with skus 1, 2, and 3, you would use  **skus: ['1', '2', '3']** instead of  **skus: ['SKU1', 'SKU2']**

**Note:** Also make sure the page includes the <a href="../../../reevoomark/javascript-library">Reevoo javascript library</a>.


{% highlight html %}
<script>
  if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
  afterReevooMarkLoaded.push(function() { reevooMark('trackPurchase', 'TRKREF', { skus: ['SKU1', 'SKU2'], basketValue: '123 GBP' }); });
</script>
{%endhighlight %}



Propensity to Buy Event
------------------------

Propensity to buy events are used by retailers which don't sell their products online. This might apply to automotive retailers for example, which can feature cars in their website but which require customers to go to a brick and mortar dealership to complete a purchase.

For this type of "non-transactional" websites, we can still get a measure of the impact of Reevoo in the retailer's bottom line by having "propensity to buy" events within "key" pages in your website which indicate the user might be considering buying the product.

For example a retailer could place a propensity to buy event in the "Find a Dealership" page, which indicates the customer is willing to try the product.

Find below some examples on how to place propensity to buy events in your website for different use cases. Make sure the page where you use these snippets contain the <a href="../../../reevoomark/javascript-library">Reevoo javascript library</a>.


**Scenario 1)** Triggering a propensity to buy event when the user visits a specific page, for example the "Find a Dealer" page (although it can be any other type of page that you wish).


{% highlight html %}
<script>
  if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
  afterReevooMarkLoaded.push(function() { reevooMark('trackPropensityToBuy', 'TRKREF', { reviewableContext: { sku: 'SKU' }, cta: 'Find a Dealer' }); });
</script>
{%endhighlight %}


In the snippet above, you should replace TRKREF by the trkref value assigned to you by Reevoo. Also 'SKU' should be replaced by the sku of the product to which you want to attach the event. If the event is generic for all products you can use the value 'Global CTA' instead, like below:


{% highlight html %}
<script>
  if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
  afterReevooMarkLoaded.push(function() { reevooMark('trackPropensityToBuy', 'TRKREF', { reviewableContext: { sku: 'Global CTA' } , cta: 'Find a Dealer' }); });
</script>
{%endhighlight %}


The cta attribute where it says 'Find a Dealer' can be replaced by any other label that clearly identifies the type of propensity to buy event that you want to track, there are not restrictions to what this label can be.


If you are an automotive retailer which uses a combination of "Model" and "Manufacturer" to identify products, instead of sku, replace **{ reviewableContext: { sku: 'SKU' }** by **{ reviewableContext: { manufacturer: 'MAKE', model: 'MODEL' }** in the snippets above. Make sure to replace 'MAKE' and 'MODEL' by the actual manufacturer and model values of your product, or use 'Global CTA' if the event is not associated to a specific product. See examples of the equivalent snippets below.

{% highlight html %}
<script>
  if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
  afterReevooMarkLoaded.push(function() { reevooMark('trackPropensityToBuy', 'TRKREF', { reviewableContext: { manufacturer: 'MAKE', model: 'MODEL' }, cta: 'Find a Dealer' }); });
</script>
{%endhighlight %}


{% highlight html %}
<script>
  if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
  afterReevooMarkLoaded.push(function() { reevooMark('trackPropensityToBuy', 'TRKREF', { reviewableContext: { manufacturer: 'Global CTA', model: 'Global CTA' } , cta: 'Find a Dealer' }); });
</script>
{%endhighlight %}


**Scenario 2)** Triggering a propensity to buy event on a user action, for example when the user clicks on a "Download Brochure" button. For that make sure you add an "onclick" event to the button or link, as in the example below. You should replace TRKREF by the trkref value assigned to you by Reevoo, and SKU by the sku of the product, or by 'Global CTA' if the event is not linked to an individual product.



{% highlight html %}
<button type="button" onclick="reevooMark('trackPropensityToBuy', 'TRKREF', { reviewableContext: { sku: 'SKU' }, cta: 'Download Brochure' });">Download Brochure</button>
{%endhighlight %}


Again, if you use manufacturer and model to identify your products instead of sku, you should use the snippet below instead, making sure to replace MAKE and MODEL by the correct manufacturer and model associated to your product or by 'Global CTA' if the event is not linked to a specific product.

{% highlight html %}
<button type="button" onclick="reevooMark('trackPropensityToBuy', 'TRKREF', { reviewableContext: { manufacturer: 'MAKE', model: 'MODEL' }, cta: 'Download Brochure' });">Download Brochure</button>
{%endhighlight %}



Embedded Product Reviews
-------------------------

With embedded reviews, the important thing is that we can track when the user actively takes action to read the reviews.

If the user needs to click on a product review badge to reach the reviews, that's enough as the "click" event triggered by clicking the reviews product badge will give us the information we need.

If the reviews are just embedded in the page and the user can access them without having to click on a badge, then it is more difficult to track this action.

We describe below the different scenarios and how to make sure we can track the user has read the reviews associated to a product.

In all cases make sure you include the <a href="../../../reevoomark/javascript-library">Reevoo javascript library</a> in the page where the embedded reviews are displayed.

**Scenario 1) If the only way to get to the reviews is by clicking on a product reviews badge.**

This case is the most straightforward as the user needs to click the badge to get to the reviews. In this case as long as you've added the relevant "onclick" event to your badge, as explained in the first section of this document, then the required tracking information will be collected.


**Scenario 2) If the reviews are accessible in the page, but they are hidden in a tabbed component and the user needs to click the relevant tab to acccess the reviews.**


In this case, the user can get to the reviews just by clicking the reviews tab, so we need to trigger the event on the tab onclick. You can do this as in the snippet below:


{% highlight html %}
<div onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'reviewable', reviewableContext: { sku: 'SKU' } });">
  PRODUCT REVIEWS TAB
  <script>
    if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
    afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'reviewable', reviewableContext: { sku: 'SKU' }}); });
  </script>
</div>
{%endhighlight %}


Note how on the snippet above we include both the 'trackBadgeDisplay' and 'trackBadgeClick' event. The "tab" in this case takes the place of a badge. So the 'trackBadgeDisplay' event lets us know that reviews are available to read on the page. The 'trackBadgeClick' event lets us know that the user took action to read the reviews.

If your products are identified by model and manufacturer instead of sku, you can use the snippet below instead:


{% highlight html %}
<div onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'reviewable', reviewableContext: { manufacturer: 'MAKE', model: 'MODEL' } });">
  PRODUCT REVIEWS TAB
  <script>
    if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
    afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'reviewable', reviewableContext: { manufacturer: 'MAKE', model: 'MODEL' }}); });
  </script>
</div>
{%endhighlight %}


In all cases, make sure you replace TRKREF, SKU, MAKE and MODEL by the appropriate values associated to your organisation and product.


**Scenario 3) If the reviews are directly accessible and visible in the page, the user just needs to scroll the page to get to the reviews section.**

This is the most complicated use case to get right. The reviews are available and visible in your page from the moment the page loads. The user does not need to take any action to read the reviews, in most cases they just need to scroll down to the section of the page where the reviews are visible.


In this case we recommend the following:

1) You should include the following snippet somewhere in your page. This snippet will trigger the "rendered" event, which lets Reevoo know there are reviews available in the page.


{% highlight html %}
<script>
  if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
  afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'reviewable', reviewableContext: { sku: 'SKU' }}); });
</script>
{%endhighlight %}

In case your products are identified by "Manufacturer" and "Model", use the following snippet instead.


{% highlight html %}
<script>
  if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
  afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'reviewable', reviewableContext: { manufacturer: 'MAKE', model: 'MODEL' }}); });
</script>
{%endhighlight %}


Make sure you replace TRKREF, SKU, MAKE and MODEL in the snippets above by the appropriate values associated to your organisation and product.


2) Then, you also need to let us know when the user has read reviews. For that you need to trigger a "click" event in that scenario.
   To trigger a click event you will need to implement more complex logic where you track when the user scrolls to the area of the page where the reviews are visible. Then you need to track the time the user spends in that area of the page. When the user has been in the reviews section for more than ten seconds you should trigger the "click" event using the following javascript call:

{% highlight html %}
reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'reviewable', reviewableContext: { sku: 'SKU' } });
{%endhighlight %}

In case your products are identified by "Manufacturer" and "Model", use the following snippet instead.


{% highlight html %}
onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'reviewable', reviewableContext: {  manufacturer: 'MAKE', model: 'MODEL' } });
{%endhighlight %}

Again make sure you replace TRKREF, SKU, MAKE and MODEL in the snippets above by the appropriate values associated to your organisation and product.



Embedded Customer Experience Reviews
-------------------------------------

Embedded Customer Experience reviews have the same requirements and challenges as Embedded Product Reviews described in the section above. The only difference is the snippets to trigger the "rendered" and "click" events are slightly different. You can see this snippets below:

**Scenario 1) If the only way to get to the customer experience reviews is by clicking on a customer experience reviews badge.**

This case is the most straightforward as the user needs to click the badge to get to the reviews. In this case as long as you've added the relevant "onclick" event to your badge, as explained in the "Customer Experience Badges" section of this document, then the required tracking information will be collected.


**Scenario 2) If the reviews are accessible in the page, but they are hidden in a tabbed component and the user needs to click the relevant tab to acccess the reviews.**


In this case, the user can get to the reviews just by clicking the reviews tab, so we need to trigger the event on the tab onclick. You can do this as in the snippet below:


{% highlight html %}
<div onclick="reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'customer_experience', badgeType: 'overall' });">
  CUSTOMER EXPERIENCE REVIEWS TAB
  <script>
    if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
    afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'customer_experience', badgeType: 'overall' }); });
  </script>
</div>
{%endhighlight %}


Make sure to replace TRKREF in the snippet above by the appropriate values assigned to your organisation by Reevoo.


**Scenario 3) If the reviews are directly accessible and visible in the page, the user just needs to scroll the page to get to the reviews section.**

This is the most complicated use case to get right. The reviews are available and visible in your page from the moment the page loads. The user does not need to take any action to read the reviews, in most cases they just need to scroll down to the section of the page where the reviews are visible.


In this case we recommend the following:

1) You should include the following snippet somewhere in your page. This snippet will trigger the "rendered" event, which lets Reevoo know there are customer experience reviews available in the page.


{% highlight html %}
<script>
  if (typeof window.afterReevooMarkLoaded === 'undefined') { window.afterReevooMarkLoaded = []; }
  afterReevooMarkLoaded.push(function() { reevooMark('trackBadgeDisplay', 'TRKREF', { contentType: 'customer_experience', badgeType: 'overall' }); });
</script>
{%endhighlight %}

Make sure to replace TRKREF in the snippet above by the appropriate values assigned to your organisation by Reevoo.


2) Then, you also need to let us know when the user has read reviews. For that you need to trigger a "click" event in that scenario.
   To trigger a click event you will need to implement more complex logic where you track when the user scrolls to the area of the page where the reviews are visible. Then you need to track the time the user spends in that area of the page. When the user has been in the reviews section for more than ten seconds you should trigger the "click" event using the following javascript call:

{% highlight html %}
reevooMark('trackBadgeClick', 'TRKREF', { contentType: 'customer_experience', badgeType: 'overall' });
{%endhighlight %}

Again make sure to replace TRKREF in the snippet above by the appropriate values assigned to your organisation by Reevoo.
