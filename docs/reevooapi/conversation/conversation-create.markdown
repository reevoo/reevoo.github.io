---
id: conversation-create
layout: docs
title: Platform API v4 / Conversation / Create
navId: docs
group: reevooapi
prev: conversation/conversation-detail
next: conversation/conversation-upvote-question
---

# Conversation Create

Creates new conversation question.

## **Request**

`POST /v4/organisations/:trkref/conversations`

### Parameters

{: .documentation-table}
| Parameter | Requirement | Description |
|-----------|-------------|-------------|
|trkref     | mandatory   |retailer identifier|

### JSON Body

Conversation question can be created using product sku or automotive attributes.

{: .documentation-table}
| Attribute | Description |
|-----------|-------------|
|sku        |product sku                                                                     |
|first_name |first name of the person that asked the question (optional, default: A shopper) |
|email      |email of the person that asked the question                                     |
|question   |the question asked in this conversation                                         |

#### Automotive attributes

If not using sku for creating a question, manufacturer and model are mandatory attributes.

{: .documentation-table}
| Attribute            | Requirement |
|----------------------|-------------|
|manufacturer          | mandatory   |
|model                 | mandatory   |
|axle                  | optional    |
|body_type             | optional    |
|doors                 | optional    |
|engine_size           | optional    |
|engine_size_in_liters | optional    |
|fuel_type             | optional    |
|model_display         | optional    |
|model_variant         | optional    |
|model_from_month      | optional    |
|model_from_year       | optional    |
|model_to_month        | optional    |
|model_to_year         | optional    |
|model_year            | optional    |
|transmission          | optional    |
|used                  | optional    |
|vehicle_type          | optional    |

### Example

`POST /v4/organisations/D10/conversations`

{% highlight json %}
{
   "sku": "AIPTPDV5700",
   "first_name": "Joe",
   "email": "joe@example.com",
   "question": "How is this product?"
}
{% endhighlight %}

## **Response**

By HTTP status:

 * 202 Accepted - action was successful and question will be processed asynchronously
 * 404 Not Found - TRKREF or SKU does no exist or you are not authorised to access it
 * 422 Unprocessable Entity - there are some missing mandatory attributes (specified in response JSON)
