---
id: review-detail
layout: docs
title: Platform API v4 / Review
navId: docs
group: reevooapi
prev: review/review-list
next: customer-experience-review/customer-experience-review-list
---

# Review
Details for a single review.

## URL Example(s)
/v4/reviews/310946?trkref=D10

<div class="warning">
  <strong>This URL: </strong> 
  /v4/organisations;trkref=D10/reviews/5996122
  <strong> is deprecated. Please switch to the current URL above.</strong><br/>
</div>

## Parameter(s)

{: .documentation}
|trkref     |         |
|branch_code|optional |
|locale     |         |
|id         |review id|

## Attribute(s)

{: .documentation}
|id                       |identifier for the review                              |
|overall_score            |the score (out of 10) given by the reviewer for the product|
|helpful                  |count of users who have flagged this review helpful    |
|not_helpful              |count of users who have flagged this review not helpful|
|good_points              |good points text                                       |
|bad_points               |bad points text                                        |
|general_comments         |general comments text                                  |
|fast_responses                           |array of responses                     |
|<span class="indent-1">response</span>   |                                       |
|<span class="indent-1">respondent</span> |respondent details                     |
|<span class="indent-2">custom_name</span>|                                       |
|<span class="indent-2">first_name</span> |                                       |
|<span class="indent-2">surname</span>    |                                       |
|<span class="indent-2">job_title</span>  |                                       |
|<span class="indent-1">organisation</span>|organisation details                  |
|<span class="indent-2">trkref</span>     |                                       |
|<span class="indent-2">name</span>       |                                       |
|<span class="indent-2">logo</span>       |                                       |
|reviewer                 |reviewer object                                        |
|facets                   |facets object                                          |
|customer_ref             |retailer's customer reference   (enabled only for some organisations) |
|order_ref                |retailer's order reference      (enabled only for some organisations) |
|embeddable               |if this review is embeddable for SEO usage|
|confirmed_purchaser_text |product-specific purchaser type, e.g. "Confirmed holidaymaker" |
|publish_date    |publish date (YYYY-MM-DD)|
|purchase_date   |purchase date (YYYY-MM-DD)|
|delivery_date   |delivery date (YYYY-MM-DD)|

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
   "fast_responses": [
      {
         "response": "Example response",
         "respondent": {
            "custom_name": "Custommer service",
            "first_name": "John",
            "surname": "Brown",
            "job_title": "job title"
         },
         "organisation": {
            "trkref": "TRKREF",
            "name": "Organisation Name",
            "logo": "http://images.reevoo.com/retailers/image2.png"
         }
      }
   ],
   "customer_ref": "12345678",
   "order_ref": "87654321",
   "embeddable": true,
   "confirmed_purchaser_text": "Confirmed purchaser",
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
   ],
   "publish_date":"2015-01-20",
   "purchase_date":"2014-11-04",
   "delivery_date":"2014-11-08"
}
{% endhighlight %}
