---
id: purchaser-update
layout: docs
title: Platform API v4 / Update Purchaser
navId: docs
group: reevooapi
---

# Update Purchaser

Updates a purchaser resource identified by a customer email.


## Request
`PUT /v4/organisations/:trkref/purchasers/:email`

### JSON body

{: .documentation}
|email                                      |customer email (mandatory)                      |
|title                                      |customer title                                  |
|first_name                                 |customer first name                             |
|surname                                    |customer surname                                |
|country                                    |customer country by ISO3166 alpha2 code         |
|postcode                                   |customer postcode                               |


## Response

{: .documentation}
|title                                      |customer title                                                         |
|first_name                                 |customer first name                                                    |
|surname                                    |customer surname                                                       |
|country                                    |customer country by ISO3166 alpha2 code                                |
|postcode                                   |customer postcode                                                      |
|created_at                                 |date and time when of record creation                                  |


## Example

Request:

`PUT /v4/organisations/ACME/purchasers/jane@example.com`

{% highlight json %}
{
    "email": "jane@example.com",
    "title": "Ms",
    "first_name": "Jane",
    "country": "UK"
}
{% endhighlight %}

Response:

{% highlight json %}
{
  "title": "Ms",
  "first_name": "Jane",
  "surname": null,
  "country": "UK",
  "postcode": nil,
  "created_at": "2014-10-15T13:27:25Z"
}
{% endhighlight %}
