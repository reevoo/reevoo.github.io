---
id: customer-experience-review-detail
layout: docs
title: Platform API v4 / Customer Experience Review
navId: docs
group: reevooapi
prev: customer-experience-review/customer-experience-review-list
next: conversation/conversation-list
---

# Customer Experience Review
Details for a single customer experience review.

## URL Example(s)
/v4/customer_experience_reviews/2774063?trkref=D10

<div class="warning">
  <strong>This URL: </strong> 
  /v4/organisations;trkref=D10/customer_experience_reviews/2774063 
  <strong> is deprecated. Please switch to the current URL above.</strong><br/>
</div>

## Parameter(s)

{: .documentation}
|trkref     |                             |
|branch_code|optional                     |
|id         |customer experience review id|

## Attribute(s)

{: .documentation}
|id                                       |identifier for a customer experience review|
|branch_attribution                       |branch name (if applicable)                |
|publish_date                             |publish date (YYYY-MM-DD)                  |
|purchase_date                            |purchase date (YYYY-MM-DD)                 |
|delivery_date                            |delivery date (YYYY-MM-DD)                 |
|reviewer                                 |reviewer object                            |
|responses                                |array of responses                         |
|<span class="indent-1">display_key</span>|                                           |
|<span class="indent-1">answer</span>     |                                           |
|customer_ref                             |retailer's customer reference  (enabled only for some organisations)            |
|order_ref                                |retailer's order reference     (enabled only for some organisations)            |
|confirmed_purchaser_text |product-specific purchaser type, e.g. "Confirmed holidaymaker"|
|fast_responses                           |array of responses                         |
|<span class="indent-1">response</span>   |                                           |
|<span class="indent-1">respondent</span> |respondent details                         |
|<span class="indent-2">custom_name</span>| If the retailer is using our old fast response tool, the custom name is the respondent's name, and is guaranteed to be populated. Otherwise, if the retailer is using our new fast response tool, then this property is only populated if the respondent provided a "custom title" when sending the response, otherwise the value of this field will be null. |
|<span class="indent-2">first_name</span> | If the retailer is using our old fast response tool, then this property will always be null. Otherwise, if the retailer is using our new fast response tool, then this property is only populated if the respondent provided a "first name" when sending the response, otherwise the value of this field will be null. |
|<span class="indent-2">surname</span>    | If the retailer is using our old fast response tool, then this property will always be null. Otherwise, if the retailer is using our new fast response tool, then this property is only populated if the respondent provided a "surname" when sending the response, otherwise the value of this field will be null. |
|<span class="indent-2">job_title</span>  | This property will only be populated if the respondent provided a "job title" when sending the response, otherwise it will be null. |
|<span class="indent-2">display_name</span>| If the retailer is using our old fast response tool, the display name is the concatenation of the respondent's name and respondent's job title separated by a comma (or only the name if there is no job title available). Otherwise, if the retailer is using our new fast response tool, the display name will have the same value as the "You are responding as:" field that we use in the response form (which can be a combination of first_name or first_name + job_title or first_name + surname + job_title, or the custom title).
|<span class="indent-1">organisation</span>|organisation details                      |
|<span class="indent-2">trkref</span>     |                                           |
|<span class="indent-2">name</span>       |                                           |
|<span class="indent-2">logo</span>       |                                           |

## JSON Example
{% highlight json %}
{
   "branch_attribution":null,
   "publish_date":"2015-01-20",
   "purchase_date":"2014-11-04",
   "delivery_date":"2014-11-08",
   "customer_ref": "12345678",
   "order_ref": "87654321",
   "confirmed_purchaser_text": "Confirmed purchaser",
   "fast_responses": [
      {
         "response": "Example response",
         "respondent": {
            "custom_name": "Custommer service",
            "first_name": "John",
            "surname": "Brown",
            "job_title": "job title",
            "display_name": "Customer service"
         },
         "organisation": {
            "trkref": "TRKREF",
            "name": "Organisation Name",
            "logo": "http://images.reevoo.com/retailers/image2.png"
         }
      }
   ],
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
