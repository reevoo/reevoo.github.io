---
id: customer-order-single-submission
layout: docs
title: Platform API v4 / Customer Order Single Submission
navId: docs
group: reevooapi
prev: conversation/conversation-downvote-answer
next: customer-order/customer-order-batch-submission
---

# Customer Order Single Submission
This endpoint enables submission of a customer order details.

The customer order data should be provided as a json in the request body as described below.

If the customer order is accepted a 202 response code will be sent back, along with a UUID that uniquely identifies this request.

**This functionality is enabled only for some organisations. Please contact support if you need to enable it.**

## **Request**

`POST /v4/organisations/:trkref/customer_order`

### Parameters

{: .documentation-table}
| Parameter | Requirement | Description |
|-----------|-------------|-------------|
|trkref     | mandatory   | Tracking reference of the organisation as assigned by Reevoo|

### JSON body

{: .documentation-table}
| Attribute      | Requirement | Description |
|----------------|----------|-------------|
|trkref          | mandatory| Tracking reference of the organisation|
|order_ref       | mandatory| Unique identifier of order|
|order_date      | optional | Optional if fulfilment_date present. Format: dd-mm-yyyy|
|fulfilment_date | optional | Optional if order_date present. Date when the order was fulfilled. Format: dd-mm-yyyy|
|language        | optional | Language of the purchaser: Two letter code as per ISO 639-1|
|locale          | optional | The locale associated to the order.The language codes are two-letter lowercase ISO language codes (such as "en") as defined by ISO 639-1. The country codes are two-letter uppercase ISO country codes (such as "GB") as defined by ISO 3166-1. For example "en-GB"|
|customer                                  | mandatory |
|<span class="indent-1">email</span>       | mandatory | The email address of the ordering customer|
|<span class="indent-1">customer_ref</span>|      | The unique identifier of the customer|
|<span class="indent-1">title</span>       |      | Customer title as in Mr/Ms/Doctor, etc.|
|<span class="indent-1">first_name</span>  |      | Customer first name|
|<span class="indent-1">surname</span>     |      | Customer surname|
|<span class="indent-1">postcode</span>    |      | Customer postcode|
|<span class="indent-1">country</span>     |      | Customer Country. Two letter code of the country as per ISO 3166-1.|
|order_items                               | mandatory | Array of items ordered by the customer|
|<span class="indent-1">sku</span>         | mandatory | The unique identifier of the product|
|<span class="indent-1">price</span>       |      | The price of this order item. A string containing just digits and a comma to separate the decimals.|
|<span class="indent-1">currency</span>    |      | The currency in which the price for this order_item is specified. Use the ISO 4217 code.|
|<span class="indent-1">metadata</span>    |      | List of any other fields that will be linked to the order_item. Field names can contain only [a-z0-9] characters. There is not limit to the number of metadata items that you can have.|
|<span class="indent-2"><i>key_with_underscore</i></span>| | Any value you want to send|

## Example

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
      "price": "55,99",
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

## **Response**

By HTTP status:

* 400 Bad Request
{% highlight json %}
{
  "status": 400,
  "message": "Invalid TRKREF supplied"
}
{% endhighlight %}

* 401 Unauthorized
* You have provided wrong HTTP Basic Auth credentials
{% highlight json %}
{
  "status": 401,
  "message": "Unauthorized"
}
{% endhighlight %}

* 403 Unauthorized
* Please contact support as your API key seems to not have permission to access this API endpoint
{% highlight json %}
{
  "status": 403,
  "error": "Access denied"
}
{% endhighlight %}

* 422 Unprocessable Entity
{% highlight json %}
{
  "status": 422,
  "message": "No data provided",
  "errors": ["locale cannot be blank", "invalid locale"]
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
