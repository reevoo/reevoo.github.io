---
id: purchase-list
layout: docs
title: Platform API v4 / Purchases
navId: docs
group: reevooapi
---

# Purchases

Returns a list of all purchases done by purchaser identified by an email.
For each purchase it returns the status of the associated review along with the review URL.

## Request

`GET /v4/organisations/:trkref/purchasers/:email/purchases`


## Parameter(s)

{: .documentation}
|trkref     |organisation trkref        |
|email      |email of purchaser         |

## Purchases Attributes

{: .documentation}
|purchase_date    |date of purchase                                                                              |
|created_at       |date when the purchase record was created                                                     |
|contacted_at     |date when the review invotation was send                                                      |
|order_ref        |order reference from the purchaser feed                                                       |
|sku              |pruduct sku                                                                                   |
|review_state     |status of the review                                                                          |
|review_url       |the url where the customer can leave or edit the review or see the review if it was published |

### Review state options

- **published** - review published on the client website
- **rejected** - review rejected by vetter and can be edited
- **pending_order** - review submitted and waiting for a matching order
- **pending_moderation** - review submitted and waiting for moderation
- **pending_publication** - review accepted and waiting to be published
- **not_reviewed** - no review submitted yet
- **undefined** - is not possible to determine the review state


## Example

Request:

`GET /v4/organisations/D10/purchasers/jane@example.com/purchases`

Response:

{% highlight json %}
[
  {
    "purchase_date": "2015-01-08",
    "created_at": "2015-01-13T21:08:33Z",
    "contacted_at": "2015-01-22T02:32:53Z",
    "order_ref": "20222783",
    "sku": "LOC8798779",
    "review_state": "not_reviewed",
    "review_url": "http://reviews.reevoo.com/review/fill_review?hashcode=1aozsg-69r0yqm2mzzdep5naihtrfi9o20xp04&"
  }, {
    "purchase_date": "2015-01-08",
    "created_at": "2015-01-13T21:08:33Z",
    "contacted_at": "2015-01-22T02:32:53Z",
    "order_ref": "20222783",
    "sku": "LOC84324",
    "review_state": "pending_moderation",
    "review_url": nil
  }, {
    "purchase_date": "2015-01-01",
    "created_at": "2015-01-02T21:08:33Z",
    "contacted_at": "2015-01-03T02:32:53Z",
    "order_ref": "87783",
    "sku": "LOC2312",
    "review_state": "reviewed",
    "review_url": "http://carmen.staging/g/PND/NzkwNTEy/aHR0cD9tYXJrL3Jldmlldy84MjQxNDkw/L3JlZXZvb2gyNDE0OTA="
  }
  ...
]
{% endhighlight %}
