---
id: review
layout: docs
title: Platform API v4 / Review
---

# Review
Details for a single review.

## URL Example(s)
/v4/organisations;trkref=D10/reviews/5996122

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
