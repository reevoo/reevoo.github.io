---
id: purchase-list-match
layout: docs
title: Platform API v4 / Match Purchases
navId: docs
group: reevooapi
---

# Match Purchases

Returns a list of all purchases done by a purchaser. The purchaser is identified by an email and matching the provided
order references and skus.
For each purchase it returns the status of the associated review along with the review URL.
The list contains also the purchases for which we haven't received an order confirmation
(typically in a purchaser feed). For these we are able to provide an instant review URL that allow your customers
to leave a review straight away.

## **Request**

`POST /v4/organisations/:trkref/purchasers/:email/purchases/match`

### Parameters

{: .documentation-table}
| Parameter | Requirement | Description |
|-----------|-------------|-------------|
|trkref     | true        | organisation trkref |
|email      | true        | email of purchaser |

### JSON body

{: .documentation-table}
| Attribute | Description |
|-----------|-------------|
|purchases                                  |list of purchases (Array)                       |
|<span class="indent-1">order_ref</span>    |order reference                                 |
|<span class="indent-1">sku</span>          |sku of the ordered product                      |


## **Response**

### Attributes

{: .documentation-table}
| Attribute | Description |
|-----------|-------------|
|purchase_date    |date of purchase                                                                              |
|created_at       |date when the purchase record was created                                                     |
|contacted_at     |date when the review invitation was sent                                                      |
|order_ref        |order reference from the purchaser feed                                                       |
|sku              |pruduct sku                                                                                   |
|review_state     |status of the review (see below)                                                              |
|review_url       |the url where the customer can leave or edit the review or see the review if it was published |

### Review state options

- **published** - review published on the client website
- **rejected** - review rejected by vetter and can be edited
- **pending_order** - review submitted and waiting for a matching order
- **pending_moderation** - review submitted and waiting for moderation
- **pending_publication** - review accepted and waiting to be published
- **not_reviewed** - no review submitted yet
- **undefined** - it is not possible to determine the review state


## Example

Request:

`POST /v4/organisations/D10/purchasers/jane@example.com/purchases`

{% highlight json %}
{
  "purchases": [
      {
          "order_ref": "A1104528927",
          "sku": "SKU23432"
      },
      {
          "order_ref": "A1104523114",
          "sku": "SKU4323"
      },
      {
          "order_ref": "B1104234333",
          "sku": "SKU9039"
      }
  ]
}
{% endhighlight %}

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
