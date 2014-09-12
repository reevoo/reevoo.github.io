---
id: reviewable
layout: docs
title: Platform API v4 / Reviewable
navId: docs
group: reevooapi
prev: reviewables-short-format
next: reviewable-short-format
---

# Reviewable
A reviewable is anything that reviews can be requested for, it is often a product or service
that an organisation provides but could be a group or series of products. Reviews are aggregated
for a group of reviewables and a number of organisations. If the organisation making the request
has international aggregation turned on, reviews will be returned for all locales, otherwise
reviews will only be returned for the organisation's locale.

## URL Example(s)
/v4/reviewables/search?trkref=D10&locale=en-GB&sku=393828

<div class="warning">
  <strong>This URL: </strong> 
  /v4/organisations;trkref=D10/reviewables;locale=en-GB;sku=393828 
  <strong> will soon no longer be supported. Please switch to the current URL above.</strong><br/>
</div>

## Parameter(s)

{: .documentation}
|trkref     |        |
|branch_code|optional|
|locale     |        |
|sku        |        |
|format     |optional|


## Attribute(s)

{: .documentation}
|name          |identifier for the organisation                               |
|has_reviews   |flag for presence of reviews for organisation and reviewable  |
|has_image     |flag for presence of image url for organisation and reviewable|
|image_url     |                                                              |
|finder_options|parameters used to find the reviewable object                 |
|reviews_path  |path to reviews                                               |

## JSON Example
{% highlight json %}
{
   "name":"Toshiba DT01ACA0100 1TB",
   "has_reviews":true,
   "has_image":true,
   "image_url":"//images.reevoo.com/retailer_products/1006883/1006883996/90x90.jpg?timestamp=1367698589",
   "finder_options":{
      "sku":"393828",
      "locale":"en-GB"
   },
   "reviews_path":"/v4/organisations;trkref=D10/reviewables;locale=en-GB;sku=393828/reviews"
}
{% endhighlight %}
