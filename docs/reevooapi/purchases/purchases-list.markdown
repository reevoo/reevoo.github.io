---
id: purchases-list
layout: docs
title: Platform API v4 / Purchases
navId: docs
group: reevooapi
---

# Purchases
The endpoint returns a list of all purchases done by particular customer identified by customer a reference number.
For each purchase it returns the status of the associated review along with the review URL.

## URL Example(s)
/v4/organisations/D10/pruchases?customer_ref=ASC565

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
[
  {
    "sku": "LOC8798779",
    "purchase_date": "2014-07-10T13:38:22+01:00"
    "review_state": "published",
    "review_url": "http://www.acme.com/QUlQVFBEVjU3MDA=/aHR0cDovL21hcmsucmVldm9"
  }, {
    "sku": "LOC8*(779",
    "purchase_date": "2014-08-12T16:21:22+01:00"
    "review_state": "pending_moderation"
  }
  ...
]
{% endhighlight %}
