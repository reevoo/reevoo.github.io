---
id: purchaser-update
layout: docs
title: Platform API v4 / Update Purchaser
navId: docs
group: reevooapi
---

# Update Purchaser

Updates a purchaser resource identified by a customer email.


## **Request**
`PUT /v4/organisations/:trkref/purchasers/:email`

### Parameters

{: .documentation-table}
| Parameter | Requirement | Description |
|-----------|-------------|-------------|
|trkref     | mandatory   | organisation trkref |
|email      | mandatory   | email of purchaser |

### JSON body

{: .documentation-table}
| Parameter | Requirement | Description |
|-----------|-------------|-------------|
|email      | mandatory   |customer email (mandatory)                      |
|title      | optional    |customer title                                  |
|first_name | optional    |customer first name                             |
|country    | optional    |customer country by ISO3166 alpha2 code         |


## **Response**

### Attributes

{: .documentation-table}
| Attribute | Description |
|-----------|-------------|
|title      |customer title                          |
|first_name |customer first name                     |
|country    |customer country by ISO3166 alpha2 code |
|created_at |date and time when of record creation   |


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
  "country": "UK",
  "created_at": "2014-10-15T13:27:25Z"
}
{% endhighlight %}
