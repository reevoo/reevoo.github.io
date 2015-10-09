---
id: purchaser-create
layout: docs
title: Platform API v4 / Purchaser & Purchases
navId: docs
group: reevooapi
---

# Purchaser & Purchases
The endpoint excepts data for purchaser together with list of purchases. It creates/updates purchaser record and
returns a purchaser data along with a list of all passed purchases enhanced by review status and url to either
published review or questionnaire.

## Request
`POST /v4/organisations/:trkref/purchasers`

### JSON body

{: .documentation}
|email                                      |customer email (mandatory)                      |
|title                                      |customer title                                  |
|first_name                                 |customer first name                             |
|surname                                    |customer surname                                |
|country                                    |customer country by ISO3166 alpha2 code         |
|postcode                                   |customer postcode                               |
|purchases                                  |list of purchases (Array)                       |
|<span class="indent-1">order_ref</span>    |order reference                                 |
|<span class="indent-1">sku</span>          |sku of the ordered product                      |


## Response

{: .documentation}
|email                                      |customer email (mandatory)                                             |
|title                                      |customer title                                                         |
|first_name                                 |customer first name                                                    |
|surname                                    |customer surname                                                       |
|country                                    |customer country by ISO3166 alpha2 code                                |
|postcode                                   |customer postcode                                                      |
|purchases                                  |list of purchases (Array)                                              |
|<span class="indent-1">order_ref</span>    |order reference                                                        |
|<span class="indent-1">sku</span>          |sku of the ordered product                                             |
|<span class="indent-1">review_state</span> |state of the reviews (options described bellow)                        |
|<span class="indent-1">review_url</span>   |url to published review or questionnaire                               |
|<span class="indent-1">purchase_date</span>|date of purchase (only if available)                                   |
|<span class="indent-1">contacted_at</span> |date when was purchases asked to leave a review (only if available)    |


### Review state options

- **published** - review published on the client website
- **rejected** - review rejected by vetter and can be edited
- **pending_moderation** - review submitted and waiting for moderation
- **pending_publication** - review accepted and waiting to be published
- **not_reviewed** - no review submitted yet
- **undefined** - is not possible to determine the review state


## Example

Request:

`POST /v4/organisations/ACME/purchasers`

{% highlight json %}
{
    "email": "jane@example.com",
    "title": "Ms",
    "first_name": "Jane",
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
{
  "title": "Ms",
  "first_name": "Jane",
  "surname": null,
  "country": "UK",
  "postcode": "10800",
  "created_at": "2014-10-15T13:27:25Z",
  "purchases": [
    {
      "purchase_date": "2011-12-14",
      "contacted_at": "2011-12-23T20:02:18Z",
      "order_ref": "A1104528927",
      "sku": "SKU23432",
      "review_state": "published",
      "review_url": "http://reviews.reevoo.com/g/ACME/MDk5MzM2MjU=/aHR0cDovL21hcmsucmVldm9vLmNvbS9yZWV2b29tYXJrL3Jldmlldy8zMjQzMjQzNDI=/L3JlZXZvb21hcmsvcmV2aWV3LzMyNDMyNDM0Mg=="
    },
    {
      "purchase_date": "2011-12-26",
      "contacted_at": "2012-01-12T20:02:18Z",
      "order_ref": "A1104523114",
      "sku": "SKU4323",
      "review_state": "not_reviewed",
      "review_url": "http://reviews.reevoo.com/review/fill_review?hashcode=5211ed3eacbfb9b09014e149495552e239931347&source=purchasers_api"
    },
    {
      "order_ref": "B1104234333",
      "sku": "SKU9039",
      "review_state": "not_reviewed",
      "review_url": "http://reviews.reevoo.com/review/fill_review?order_ref=B1104234333&purchaser=bf0ab833d1b642801d9493215c14d6ae&sku=SKU9039&source=purchasers_api&trkref=ACME"
    }
  ]
}
{% endhighlight %}
