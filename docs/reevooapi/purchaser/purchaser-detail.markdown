---
id: purchaser-detail
layout: docs
title: Platform API v4 / Purchaser
navId: docs
group: reevooapi
---

# Purchaser

Returns a purchaser resource identified by a customer email.

## **Request**
`GET /v4/organisations/:trkref/purchasers/:email`

### Parameters

{: .documentation-table}
| Parameter | Requirement | Description |
|-----------|-------------|-------------|
|trkref     | mandatory   |organisation trkref |
|email      | mandatory   |email of purchaser |


## **Response**

### Attributes

{: .documentation-table}
| Attribute | Description |
|-----------|-------------|
|title      |customer title                          |
|first_name |customer first name                     |
|surname    |customer surname                        |
|country    |customer country by ISO3166 alpha2 code |
|postcode   |customer postcode                       |
|created_at |date and time when of record creation   |

## Example

Request:

`GET /v4/organisations/D10/purchasers/jane@example.com`

Response:

{% highlight json %}
{
  "title": "Ms",
  "first_name": "Jane",
  "surname": null,
  "country": "UK",
  "postcode": "10800",
  "created_at": "2014-10-15T13:27:25Z"
}
{% endhighlight %}
