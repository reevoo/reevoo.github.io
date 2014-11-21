---
id: conversation_create
layout: docs
title: Platform API v4 / Conversation / Create
navId: docs
group: reevooapi
---

# Conversation Create

Creates new conversation question.


## URL Format
POST /v4/organisations/{trkref}/conversations

### Example
POST /v4/organisations/D10/conversations

### Parameters

{: .documentation}
|trkref     |retailer identifier         |

## Request Body

### JSON Attributes

{: .documentation}
|first_name      |name of the person that asked the question                   |
|question        |the question asked in this conversation                      |
|locale          |locale of question text (optional)                           |
|sku             |product sku                                                  |

### Example
{% highlight json %}
{
   "first_name":"A shopper",
   "question":"How is this product?",
   "locale":"en-GB",
   "sku":"AIPTPDV5700"
}
{% endhighlight %}

## Possible responses

By HTTP status:

 * 202 Accepted - action was successful and question will be processes asynchronously
 * 404 Not Found - TRKREF or SKU does no exist or you are not authorised to access it
 * 422 Unprocessable Entity - there are some missing mandatory attributes (specified in response JSON)
