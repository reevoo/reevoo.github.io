---
id: embedded-customer-experience-reviews
title: Embedded Customer Experience Reviews
layout: docs
navId: docs
group: reevoomark
prev: embedded-product-reviews
next: embedded-conversations
---

# Embedded Customer Experience Reviews

To display embedded customer experience reviews in your website you have to

1. [include the Reevoomark Javascript library](../javascript-library)
2. add the `reevoo-embedded-customer-experience-reviews` tag with `trkref="TRKREF"` and `per_page="PER_PAGE"` and optionally, `locale="LOCALE"` attributes

* `TRKREF` should be replaced with your unique account code
* `PER_PAGE` needs to be replaced by the number of reviews to display per page, as the reviews will be paginated.
* `LOCALE` needs to be replaced by the locale of the desired reviews (for example en-GB or it-IT)

### Examples

{% highlight html %}
<reevoo-embedded-customer-experience-reviews  trkref="TRKREF" per-page="10"></reevoo-embedded-customer-experience-reviews>
{% endhighlight %}


{% highlight html %}
<reevoo-embedded-customer-experience-reviews  trkref="TRKREF" per-page="10" locale="en-GB"></reevoo-embedded-customer-experience-reviews>
{% endhighlight %}
