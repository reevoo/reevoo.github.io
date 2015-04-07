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
a short format version of reviewables of the specified organisation.
This endpoint can be used by any organisation when a list of comma separated SKUs is provided.

When no SKUs are specified all reviwables of the organisation are returned.
This functionality is however enabled only for some organisations. Response is cached on the
server side and refreshed on a daily basis. The attribute "date_time_created" shows the
date/time when the list was last generated.

Note: The server will return { status: 406 } if the specified organisation is not supported
by this endpoint and no SKUs are specified.

## URL Examples
`/v4/organisations/D10/reviewables?format=short`
`/v4/organisations/D10/reviewables?format=short&skus=AS343,B324234,CG9232`

<div class="warning">
  <strong>This URL: </strong>
  /v4/organisations;trkref=D10/reviewables?format=short
  <strong> is deprecated. Please switch to the current URL above.</strong><br/>
</div>

## Parameter(s)

{: .documentation}
|trkref |                                       |
|format |short                                  |
|skus   |(optional) max 80 comma separated SKUs |

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
