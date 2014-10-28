---
id: conversation
layout: docs
title: Platform API v4 / Reviewable
navId: docs
group: reevooapi
prev: customer-experience-review
next: conversations
---


# Review
Details for a single conversation.

## URL Example(s)
/v4/conversations/223049?trkref=T35


## Parameter(s)

{: .documentation}
|trkref     |         |
|locale     |         |
|id         |conversation id|


## Attribute(s)

{: .documentation}
|id              |identifier for the conversation                              |
|first_name      |name of the person that asked the question                   |
|question        |the question asked in this conversation                      |
|vetted_at       |the time at which the question was vetted                    |
|created_at      |the time at which the question was asked                     |
|helpful         |count of users who have flagged this question helpful        |
|unhelpful       |count of users who have flagged this question not helpful    |
|embeddable      |if this conversation is embeddable for SEO usage|                          
|retailer_locale |the locale of the retailer                                   |
|answers         |an array of answers to the question|

## JSON Example
{% highlight json %}
{
   "id":223049,
   "first_name":"A shopper",
   "question":"",
   "vetted_at":"2014-10-07T14:38:57Z",
   "created_at":"2014-10-07T14:17:56Z",
   "helpful":0,
   "unhelpful":0,
   "embeddable":false,
   "retailer_locale":"en-GB",
   "product_group_id":610606,
   "answers":[
      {
         "id":259010,
         "response":"There are screw holes drilled underneath ready to attach the chromed base. We think the black gloss section could work well on its own. The two pieces are sold together for the customer to assemble.\n ",
         "created_at":"2014-10-09T20:33:08Z",
         "first_name":"Ann",
         "job_title":null,
         "helpful":0,
         "unhelpful":0,
         "review_locale":"en-GB",
         "reviewer_facebook_url":null,
         "response_type":"owner",
         "retailer_name":null,
         "retailer_image_url":null
      }
   ]
}
{% endhighlight %}