---
id: conversation_increment_helpful
layout: docs
title: Platform API v4 / Conversation / increment / helpful
navId: docs
group: reevooapi
---

# Conversation Increment Helpful

Increments by 1 the helpful attribute of the question.

## URL Format
PUT /v4/conversations/{id}/increment_helpful

### Example
PUT /v4/conversations/38373/increment_helpful

### Parameters

{: .documentation}
|id     |id of the conversation         |

## Response Body

### JSON Attributes

{: .documentation}
|id              |identifier for the conversation                              |
|first_name      |name of the person that asked the question                   |
|question        |the question asked in this conversation                      |
|created_at      |the time at which the question was asked                     |
|helpful         |count of users who have flagged this question helpful        |
|unhelpful       |count of users who have flagged this question not helpful    |
|embeddable      |if this conversation is embeddable for SEO usage|
|retailer_locale |the locale of the retailer                                   |
|answers         |an array of answers to the question|

### Example
{% highlight json %}
{
   "id":223049,
   "first_name":"A shopper",
   "question":"How is this product?",
   "created_at":"2014-10-07T14:17:56Z",
   "helpful":1,
   "unhelpful":0,
   "embeddable":false,
   "retailer_locale":"en-GB",
   "answers":[]
}
{% endhighlight %}
