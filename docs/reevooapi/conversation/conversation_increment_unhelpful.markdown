---
id: conversation_increment_unhelpful
layout: docs
title: Platform API v4 / Conversation / increment / unhelpful
navId: docs
group: reevooapi
---

# Conversation Increment Unhelpful

<div class="warning">
  <strong>Currently this is just an experimental endpoint. If you would like to use it please contact us. </strong>
</div>
Increments by 1 the unhelpful attribute of the question.

## URL Format
PUT /v4/conversations/{id}/increment_unhelpful

### Example
PUT /v4/conversations/38373/increment_unhelpful

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
   "helpful":0,
   "unhelpful":1,
   "embeddable":false,
   "retailer_locale":"en-GB",
   "answers":[]
}
{% endhighlight %}
