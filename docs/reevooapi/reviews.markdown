---
id: reviews
layout: docs
title: Platform API v4 / Reviews
navId: docs
group: reevooapi
prev: reviewable-short-format
next: review
---

# Reviews
A reviewable will have a number of reviews associated with it.We aggregate reviews so reviews
that have been collected for other organisations may be included.Only published reviews will
be included.

## URL Example(s)
/v4/organisations/D10/reviews?locale=en-GB&sku=AIPTPDV5700

<div class="warning">
  <strong>This URL: </strong> 
  /v4/organisations;trkref=D10/reviewables;locale=en-GB;sku=393828/reviews
  <strong> is deprecated. Please switch to the current URL above.</strong><br/>
</div>

## Parameter(s)

{: .documentation}
|trkref     |        |
|branch_code|optional|
|locale     |        |
|sku        |        |

## Attribute(s)

{: .documentation}
|summary                                                 |                                                                |
|<span class="indent-1">pagination</span>                |                                                                |
|<span class="indent-2">total_entries</span>             |total number of reviews                                     |
|<span class="indent-2">total_entries_with_content</span>|total number of reviews with good/bad points or general comments|
|<span class="indent-2">total_pages</span>               |                                                                |
|<span class="indent-2">current_page</span>              |                                                                |
|<span class="indent-2">per_page</span>                  |                                                                |
|<span class="indent-2">previous_page</span>             |                                                                |
|<span class="indent-2">next_page</span>                 |                                                                |
|reviews                                                 |array of review objects                                         |

## JSON Example
{% highlight json %}
{
   "summary":{
      "facets":[
         {
            "question_id":30,
            "translation_key":"questionnaire.question_texts.performance.question_text",
            "display_text":"Performance",
            "is_active":true,
            "is_public":true,
            "tag":null,
            "statistics":{
               "summation":786.0,
               "respondents":88
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
               "summation":742.0,
               "respondents":84
            }
         },
         {
            "question_id":38,
            "translation_key":"questionnaire.question_texts.capacity.question_text",
            "display_text":"Capacity",
            "is_active":true,
            "is_public":true,
            "tag":null,
            "statistics":{
               "summation":804.0,
               "respondents":88
            }
         },
         {
            "question_id":7,
            "translation_key":"questionnaire.question_texts.value_for_money.question_text",
            "display_text":"Value for money",
            "is_active":true,
            "is_public":true,
            "tag":"value-for-money",
            "statistics":{
               "summation":961.0,
               "respondents":105
            }
         },
         {
            "question_id":8,
            "translation_key":"questionnaire.question_texts.overall_rating.question_text",
            "display_text":"Overall rating",
            "is_active":true,
            "is_public":true,
            "tag":"overall",
            "statistics":{
               "summation":960.0,
               "respondents":106
            }
         }
      ],
      "pagination":{
         "total_entries":106,
         "total_entries_with_content":73,
         "total_pages":8,
         "current_page":1,
         "per_page":15,
         "previous_page":null,
         "next_page":2
      }
   },
   "reviews":[
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
         "embeddable": false,
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
      },
      ...
   ]
}
{% endhighlight %}
