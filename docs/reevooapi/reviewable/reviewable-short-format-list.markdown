---
id: reviewable-short-format-list
layout: docs
title: Platform API v4 / Reviewables Short Format
navId: docs
group: reevooapi
prev: reviewable/reviewable-list
next: reviewable/reviewable-detail
---

# Reviewables - Short Format
If you pass the parameter format=short to the reviewables endpoint you will be provided with
a short format version of all the reviewables associated to the specified organisation.

This functionality is enabled only for some organisations and can be quite large, so is cached
server side and refreshed on a daily basis. The attribute "date_time_created" shows the
date/time when the list was last generated.

Note: The server will return { status: 406 } if the specified organisation is not supported
by this endpoint.

## URL Example(s)
/v4/organisations/D10/reviewables?format=short

<div class="warning">
  <strong>This URL: </strong> 
  /v4/organisations;trkref=D10/reviewables?format=short
  <strong> is deprecated. Please switch to the current URL above.</strong><br/>
</div>

## Parameter(s)

{: .documentation}
|trkref|     |
|format|short|

## Attribute(s)

{: .documentation}
|summary                                        |                                                              |
|<span class="indent-1">date_time_created</span>|timestamp when the content was last generated. ISO 8601 format|
|<span class="indent-1">product_count</span>    |total number of reviewables associated to the organisation    |
|reviewables                                    |array of all the reviewables associated to the organisation   |
|<span class="indent-1">sku</span>              |the sku of the reviewable                                     |
|<span class="indent-1">review_count</span>     |number of published reviews associated to the reviewable      |
|<span class="indent-1">average_score</span>    |average score associated to this reviewable                   |



## JSON Example
{% highlight json %}
{
   "summary":{
      "date_time_created":"2014-07-10T13:38:22+01:00",
      "product_count":3
   },
   "reviewables":[
      {
         "sku":"000016",
         "review_count":1,
         "average_score":10.0
      },
      {
         "sku":"000025",
         "review_count":0,
         "average_score":0.0
      },
      {
         "sku":"000033",
         "review_count":0,
         "average_score":0.0
      }
   ]
}
{% endhighlight %}
