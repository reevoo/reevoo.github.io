---
id: review
layout: docs
title: Platform API v4 / Review
navId: docs
group: reevooapi
prev: reviews
next: customer-experience-reviews
---

# Review
Details for a single review.

## URL Example(s)
/v4/reviews/5996122?trkref=D10

<div class="warning">
  <strong>This URL: </strong> 
  /v4/organisations;trkref=D10/reviews/5996122
  <strong> will soon no longer be supported. Please switch to the current URL above.</strong><br/>
</div>

## Parameter(s)

{: .documentation}
|trkref     |         |
|branch_code|optional |
|locale     |         |
|id         |review id|

## Attribute(s)

{: .documentation}
|id              |identifier for the review                              |
|overall_score   |default locale for the organisation                    |
|helpful         |count of users who have flagged this review helpful    |
|not_helpful     |count of users who have flagged this review not helpful|
|good_points     |good points text                                       |
|bad_points      |bad points text                                        |
|general_comments|general comments text                                  |
|reviewer        |reviewer object                                        |
|facets          |facets object                                          |
|customer_ref    |retailer's customer reference   (enabled only for some organisations) |
|order_ref       |retailer's order reference      (enabled only for some organisations) |
|embeddable      |if this review is embeddable for SEO usage|

## JSON Example
{% highlight json %}
{
   "id":5996122,
   "overall_score":9,
   "helpful":0,
   "not_helpful":0,
   "good_points":"For the money excellent value.",
   "bad_points":"Still too early for a proper evaluation\r\nNone as yet",
   "general_comments":null,
   "customer_ref": "12345678",
   "order_ref": "87654321",
   "embeddable": true,
   "reviewer":{
      "first_name":"Robert",
      "location":"Catford, London",
      "segment":"Home user",
      "facebook_avatar_url":null
   },
   "facets":[
      {
         "question_id":30,
         "translation_key":"questionnaire.question_texts.performance.question_text",
         "display_text":"Performance",
         "is_active":true,
         "is_public":true,
         "tag":null,
         "statistics":{
            "summation":9.0,
            "respondents":1
         }
      },
      {
         "question_id":37,
         "translation_key":"questionnaire.question_texts.reliability.question_text",
         "display_text":"Reliability",
         "is_active":true,
         "is_public":true,
         "tag":null,
         "statistics":{
            "summation":9.0,
            "respondents":1
         }
      },
      ...
   ]
}
{% endhighlight %}
