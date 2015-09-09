---
id: customer-order-single-submission
layout: docs
title: Platform API v4 / Customer Order Single Submission
navId: docs
group: reevooapi
prev: conversation/conversation-downvote-answer
next: customer-order/customer-order-single-submission
---

# Customer Order Single Submission
This endpoint enables the submission of a customer order details.

The customer order data should be provided as a json in the request body as described below.

If the customer order is accepted a 202 response code will be sent back, along with an UUID that uniquely identifies this request.

## URL Example(s)
/v4/organisations/TRKREF/customer_order

## Parameter(s)

{: .documentation}
|trkref     |Tracking reference of the organisation as assigned by Reevoo|

## Attribute(s)

{: .documentation}
|trkref                                           |Tracking reference of the organisation (*mandatory)|
|order_ref                                        |Unique identifier of order (*mandatory)|
|order_date                                       |Optional Order date. Format: dd-mm-yyyy|
|fulfilment_date                                  |Date when the order was fulfilled. Format: dd-mm-yyyy|
|language                                         |Language of the purchaser: Two letter code as per ISO 639-1|
|locale                                           |The locale associated to the order.The language codes are two-letter lowercase ISO language codes (such as "en") as defined by ISO 639-1. The country codes are two-letter uppercase ISO country codes (such as "GB") as defined by ISO 3166-1. For example "en-GB"|
|customer                                         ||
|<span class="indent-1">email</span>              |The email address of the ordering customer (*mandatory)|
|<span class="indent-1">cutomer_ref</span>        |The unique identifier of the customer|
|<span class="indent-1">title</span>              |Customer title as in Mr/Ms/Doctor, etc.|
|<span class="indent-1">first_name</span>         |Customer first name|
|<span class="indent-1">surname</span>            |Customer surname|
|<span class="indent-1">postcode</span>           |Customer postcode|
|<span class="indent-1">country</span>            |Customer Country. Two letter code of the country as per ISO 3166-1.|
|order_items                                      |Array of items ordered by the customer (*mandatory)|
|<span class="indent-1">sku</span>                |The unique identifier of the product|
|<span class="indent-1">price</span>              |The price of this order_item. Includes just numbers and a comma to separate the the decimals as in: 1234,99|
|<span class="indent-1">currency</span>           |The currency in which the price for this order_item is specified. Use the ISO 4217 code.|
|<span class="indent-1">metadata</span>           |List of any other fields that will be linked to the order_item. Field names can contain only [a-z0-9] characters. There is not limit to the number of metadata items that you can have.|
|<span class="indent-2">key_with_underscore</span>|Any value you want to send|

## JSON Example
{% highlight json %}
{
  "trkref":"TRKREF123",
  "order_ref": "ABC123",
  "order_date": "10-12-2014",
  "fulfilment_date": "24-12-2014",
  "language": "en",
  "locale": "en-GB",
  "customer": {
    "email": "hello@example.com",
    "cutomer_ref": "1122",
    "title": "MR",
    "first_name": "John",
    "surname": "Brown",
    "postcode": "1122",
    "country": "GB"
  },
  "order_items": [
    {
      "sku": "PROD1",
      "price": 25,
      "currency": "GBP",
      "metadata": {
        "field_1": "Value 1",
        "field_2": "Value 2"
      }
    },
    {
      "sku": "PROD2",
      "price": 10,
      "currency": "GBP",
      "metadata": {
        "field_1": "Value 1",
        "field_2": "Value 2"
      }
    }
  ]
}
{% endhighlight %}

## Possible responses

By HTTP status:

* 400 Bad Request
{% highlight json %}
{
  "status": 400,
  "message": "Invalid TRKREF supplied"
}
{% endhighlight %}

* 401 Unauthorized
{% highlight json %}
{
  "status": 401,
  "message": "Unauthorized"
}
{% endhighlight %}

* 422 Unprocessable Entity
{% highlight json %}
{
  "status": 422,
  "message": "No data provided",
  "errors": []
}
{% endhighlight %}

* 202 Accepted
{% highlight json %}
{
  "status": 202,
  "id": "UUID",
  "message": "Customer order accepted"
}
{% endhighlight %}
