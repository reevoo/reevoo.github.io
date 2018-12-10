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

When no SKUs are specified all reviewables of the organisation are returned.
This functionality is however enabled only for some organisations. Response is cached on the
server side and refreshed on a daily basis. The attribute "date_time_created" shows the
date/time when the list was last generated.

Note: This API endpoint is not available for the Automotive vertical.

Note: The server will return { status: 406 } if the specified organisation is not supported
by this endpoint and no SKUs are specified.

## **Request**

`GET /v4/organisations/:trkref/reviewables?format=:format&skus=:skus`

## Parameter(s)

{: .documentation-table}
| Parameter | Requirement | Description    |
|-----------|-------------|----------------|
|trkref     | mandatory   |                |
|format     | optional    | Allowed values: short       |
|skus       | optional    | max 80 comma separated SKUs |

## **Response**

### Attributes

{: .documentation-table}
| Attribute | Description   |
|-----------|---------------|
|summary                                        |                                                                                         |
|<span class="indent-1">date_time_created</span>|timestamp when the content was last generated (only for cached response, ISO 8601 format)|
|<span class="indent-1">product_count</span>    |total number of reviewables associated to the organisation                               |
|reviewables                                    |array of all the reviewables associated to the organisation                              |
|<span class="indent-1">sku</span>              |the sku of the reviewable                                                                |
|<span class="indent-1">review_count</span>     |number of published reviews associated to the reviewable                                 |
|<span class="indent-1">average_score</span>    |average score associated to this reviewable                                              |

### Example

`/v4/organisations/D10/reviewables?format=short&skus=000016,000025,000033`

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
