---
id: conversation_create
layout: docs
title: Platform API v4 / Conversation / Create
navId: docs
group: reevooapi
---

# Conversation Create

<div class="warning">
  <strong>Currently this is just an experimental endpoint. If you would like to use it please contact us. </strong>
</div>
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
   "unhelpful":0,
   "embeddable":false,
   "retailer_locale":"en-GB",
   "answers":[]
}
{% endhighlight %}

