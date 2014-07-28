---
id: customer-experience-review
layout: docs
title: Platform API v4 / Customer Experience Review
---

# Customer Experience Review
Details for a single customer experience review.

## URL Example(s)
/v4/organisations;trkref=D10/customer_experience_reviews/2774063

## Parameter(s)

{: .documentation}
|trkref     |                             |
|branch_code|optional                     |
|id         |customer experience review id|

## Attribute(s)

{: .documentation}
|id                                       |identifier for a customer experience review|
|branch_attribution                       |branch name (if applicable)                |
|purchase_date                            |path to customer experience reviews        |
|reviewer                                 |reviewer object                            |
|responses                                |array of responses                         |
|<span class="indent-1">display_key</span>|                                           |
|<span class="indent-1">answer</span>     |                                           |

## JSON Example
{% highlight json %}
{  
   "branch_attribution":null,
   "purchase_date":"2014-03-28",
   "reviewer":{  
      "first_name":"Robert",
      "location":"Catford, London",
      "segment":"Home user",
      "facebook_avatar_url":null
   },
   "responses":[  
      {  
         "display_key":"good_points",
         "answer":null
      },
      {  
         "display_key":"bad_points",
         "answer":null
      },
      {  
         "display_key":"general_comments",
         "answer":"Ordered 3pm arrived 9.20 am next day."
      },
      {  
         "display_key":"would_buy_again",
         "answer":true
      },
      {  
         "display_key":"happy_with_delivery",
         "answer":true
      },
      {  
         "display_key":"happy_with_customer_service",
         "answer":null
      }
   ]
}
{% endhighlight %}
