---
id: purchaser-detail
layout: docs
title: Platform API v4 / Purchaser
navId: docs
group: reevooapi
---

# Purchaser
The endpoint returns a purchaser resource along with a list of all purchases done by
particular purchaser identified by a customer reference number.
For each purchase it returns the status of the associated review along with the review URL.

## URL
`/v4/organisations/:trkref/purchaser/:purchaser_ref`

Example: `/v4/organisations/D10/purchaser/3287423b423j4b23`

Note: purchaser_ref is the customer_ref from the purchaser feed

## Parameter(s)

{: .documentation}
|trkref         |organisation trkref                            |
|customer_ref   |customer reference provided in purchaser feed  |

## Attribute(s)

{: .documentation}
|sku              |pruduct sku                                                                         |
|purchase_date    |date of purchase                                                                    |
|review_state     |status of the review                                                                |
|review_url       |the url where the customer can leave a review or see the review if it was published |

### Review state options

- published
- rejected
- pending_moderation
- not_reviewed


## JSON Example
{% highlight json %}
{
  "purchaser_ref": "h43423",
  "purchases": [
    {
      "sku": "LOC8798779",
      "purchase_date": "2014-07-10T13:38:22+01:00",
      "review_state": "published",
      "review_url": "http://www.acme.com/QUlQVFBEVjU3MDA=/aHR0cDovL21hcmsucmVldm9"
    }, {
      "sku": "LOC84324",
      "purchase_date": "2014-08-12T16:21:22+01:00",
      "review_state": "pending_moderation",
      "review_url": "http://reevoo.com/edit_review/2342234323423423"
    }, {
      "sku": "LOC84324",
      "purchase_date": "2014-08-12T16:21:22+01:00",
      "review_state": "rejected",
      "review_url": "http://reevoo.com/edit_review/2342234323423423"
    }, {
      "sku": "LOC84324",
      "purchase_date": "2014-08-12T16:21:22+01:00",
      "review_state": "not_reviewed",
      "review_url": "http://reevoo.com/questionnaire/2342234323423423"
    }
    ...
  ]
}
{% endhighlight %}
