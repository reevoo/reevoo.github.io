---
id: customer-order-batch-submission
layout: docs
title: Platform API v4 / Customer Order Batch Submission
navId: docs
group: reevooapi
prev: customer-order/customer-order-single-submission
---

# Customer Order Batch Submission
This endpoint enables the submission of a batch of customer orders data. Not all customer orders in the batch need to be associated to the same organisation TRKREF.
The batch of customer orders data should be provided as a json in the request body as described below.
If the batch is accepted a 202 response code will be sent back, along with an UUID that uniquely identifies this request.

## URL Example(s)
/v4/customer_orders

## Parameter(s)

{: .documentation}
Json array with the list of customer orders data being submitted, as below. Each element in the array should follow the same json model as for [Single submission](/docs/reevooapi/customer-order/customer-order-single-submission/#attributes)
{% highlight json %}
[
  {...},
  {...},
  {...},
]
{% endhighlight %}

## JSON Example
{% highlight json %}
[
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
        "price": "25",
        "currency": "GBP",
        "metadata": {
          "field_1": "Value 1",
          "field_2": "Value 2"
        }
      },
      {
        "sku": "PROD2",
        "price": "33",
        "currency": "GBP",
        "metadata": {
          "field_1": "Value 1",
          "field_2": "Value 2"
        }
      }
    ]
  },
  {...}
]
{% endhighlight %}

## Possible responses

By HTTP status:

* 401 Unauthorized
{% highlight json %}
{
  "status": 401, 
  "errors": "Unauthorized"
}
{% endhighlight %}

* 422 Unprocessable Entity
{% highlight json %}
{
  "status": 422,
  "id": "UUID",
  "message": "Batch is invalid",
  "summary": 
    { 
      "accepted": "number of accepted customer orders",
      "rejected": "number of rejected customer orders"
    }, 
  "errors": []
}
{% endhighlight %}

* 206 Partial Content
{% highlight json %}
{
  "status": 206,
  "id": "UUID",
  "message": "Batch partially accepted",
  "summary": 
    { 
      "accepted": "number of accepted customer orders",
      "rejected": "number of rejected customer orders"
    },
  "errors": []
}
{% endhighlight %}

* 202 Accepted
{% highlight json %}
{
  "status": 202,
  "id": "UUID",
  "message": "Batch Accepted",
  "summary": 
    { 
      "accepted": "number of accepted customer orders",
      "rejected": "number of rejected customer orders"
    }
}
{% endhighlight %}
