---
id: conversation-list
layout: docs
title: Platform API v4 / Conversation / List
navId: docs
group: reevooapi
prev: customer-experience-review/customer-experience-review-detail
next: conversation/conversation-detail
---

# Conversations

Returns all the conversations that are associated with a specific product.

## **Request**

`GET v4/organisations/:trkref/conversations?locale=:locale&sku=:sku`

### Parameters

{: .documentation-table}
| Parameter | Requirement |
|-----------|-------------|
|trkref     |  mandatory  |
|locale     |  optional   |
|sku        |  optional   |

### Example

`GET v4/organisations/D10/conversations?locale=en-GB&sku=AIPTPDV5700`

## **Response**

### Attributes

{: .documentation-table}
| Attribute | Description |
|-----------|-------------|
|summary                                                 |                                                                |
|<span class="indent-1">question_count</span>            |total number of questions with at least one vetted answer       |
|conversations                                           |array of conversations objects                                  |

### Example

{% highlight json %}
{
  "summary": {
    "question_count": 1,
    "answers_count": 1
  },
  "conversations": [
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
  }]
}
{% endhighlight %}
