---
id: reviewable-detail
layout: docs
title: Platform API v4 / Reviewable
navId: docs
group: reevooapi
prev: reviewable/reviewable-short-format-list
next: reviewable/reviewable-short-format-detail
---

# Reviewable
A reviewable is anything that reviews can be requested for, it is often a product or service
that an organisation provides but could be a group or series of products. Reviews are aggregated
for a group of reviewables and a number of organisations. If the organisation making the request
has international aggregation turned on, reviews will be returned for all locales, otherwise
reviews will only be returned for the organisation's locale.

## URL Example(s)
`/v4/organisations/D10/reviewable?locale=en-GB&sku=AIPTPDV5700`

<div class="warning">
  <strong>This URL: </strong>
  /v4/organisations;trkref=D10/reviewables;locale=en-GB;sku=AIPTPDV5700
  <strong> is deprecated. Please switch to the current URL above.</strong><br/>
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
|name                          |identifier for the organisation                               |
|has_reviews                   |flag for presence of reviews for organisation and reviewable  |
|has_image                     |flag for presence of image url for organisation and reviewable|
|image_url                     |                                                              |
|finder_options                |parameters used to find the reviewable object                 |
|reviews_path                  |path to reviews                                               |
|organisation_url              |link to this reviewable on the organisation's website         |
|organisation_url_with_reviews |link to open reviews in a lightbox on the organisation’s website|

## JSON Example
{% highlight json %}
{
   "name":"Toshiba DT01ACA0100 1TB",
   "has_reviews":true,
   "has_image":true,
   "image_url":"//images.reevoo.com/retailer_products/1006883/1006883996/90x90.jpg?timestamp=1367698589",
   "finder_options":{
      "sku":"AIPTPDV5700",
      "locale":"en-GB"
   },
   "reviews_path":"/v4/organisations/D10/reviews?locale=en-GB&sku=AIPTPDV5700",
   "organisation_url": "http://www.reevoo.com/p/toshiba-dt01aca0100-1tb",
   "organisation_url_with_reviews": "http://c.mark.reevoo.com/g/D10/QUlQVFBEVjU3MDA=/aHR0cDovL21hcmsucmVldm9vLmNvbS9wYXJ0bmVyL0QxMC9BSVBUUERWNTcwMA==/L3JlZXZvb21hcmsvZW4tR0IvcHJvZHVjdD90cmtyZWY9RDEwJnNrdT1BSVBUUERWNTcwMA=="
}
{% endhighlight %}
