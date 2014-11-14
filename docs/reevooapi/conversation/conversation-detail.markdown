---
id: conversation_detail
layout: docs
title: Platform API v4 / Conversation / Detail
navId: docs
group: reevooapi
---

# Conversation Detail

Returns details for a single conversation.

## URL Format
GET /v4/conversations/{id}

## URL Example
GET /v4/conversations/223049

## Parameters

{: .documentation}
|id         |conversation id|


## Attributes

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

## JSON Example
{% highlight json %}
{
  "id": 223049,
  "first_name": "A shopper",
  "question": "How is this product?",
  "created_at": "2014-10-07T14:17:56Z",
  "helpful": 0,
  "unhelpful": 0,
  "embeddable": false,
  "retailer_locale": "en-GB",
  "answers_count": 1,
  "answers": [{
    "id": 259010,
    "response": "It is great.",
    "created_at": "2014-10-09T20:33:08Z",
    "first_name": "Ann",
    "town": "West London",
    "job_title": null,
    "reviewer_segment": "Family",
    "helpful": 0,
    "unhelpful": 0,
    "review_url": "http://c.mark.reevoo.com/g/TRKREF/ODYwNw==/aHR0cDovL21hcmsucmVldm9vLmNvbS9yZWV2b29tYXJrL2JsYW5rL1QzNQ==/L3JlZXZvb21hcmsvcmV2aWV3LzcwODExNDg=",
    "review_locale": "en-GB",
    "reviewer_facebook_url": null,
    "response_type": "owner",
    "retailer_name": null,
    "retailer_image_url": null
  }]
}
{% endhighlight %}
