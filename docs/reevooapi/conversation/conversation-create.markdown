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
|sku             |product sku                                                  |
|first_name      |first name of the person that asked the question (optional)  |
|email           |email of the person that asked the question                  |
|question        |the question asked in this conversation                      |
|locale          |locale of question text (optional)                           |


### Example
{% highlight json %}
{
   "sku": "AIPTPDV5700",
   "first_name": "Joe",
   "email": "joe@example.com",
   "question": "How is this product?",
   "locale": "en-GB"
}
{% endhighlight %}

## Possible responses

By HTTP status:

 * 202 Accepted - action was successful and question will be processed asynchronously
 * 404 Not Found - TRKREF or SKU does no exist or you are not authorised to access it
 * 422 Unprocessable Entity - there are some missing mandatory attributes (specified in response JSON)
