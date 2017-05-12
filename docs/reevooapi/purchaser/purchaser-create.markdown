---
id: purchaser-create
layout: docs
title: Platform API v4 / Create Purchaser
navId: docs
group: reevooapi
---

# Create Purchaser

Creates a purchaser record.

## **Request**
`POST /v4/organisations/:trkref/purchasers`

### Parameters

{: .documentation-table}
| Parameter | Requirement | Description |
|-----------|-------------|-------------|
|trkref     | mandatory   | organisation trkref |

### JSON body

{: .documentation-table}
| Parameter | Requirement | Description |
|-----------|-------------|-------------|
|email      | mandatory   |customer email|
|title      | optional    |customer title|
|first_name | optional    |customer first name|
|surname    | optional    |customer surname|
|country    | optional    |customer country by ISO3166 alpha2 code|
|postcode   | optional    |customer postcode|


## **Response**

### Attributes

{: .documentation-table}
| Attribute | Description |
|-----------|-------------|
|title                                      |customer title                                                         |
|first_name                                 |customer first name                                                    |
|surname                                    |customer surname                                                       |
|country                                    |customer country by ISO3166 alpha2 code                                |
|postcode                                   |customer postcode                                                      |
|created_at                                 |date and time when of record creation                                  |


## Example

Request:

`POST /v4/organisations/ACME/purchasers`

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
