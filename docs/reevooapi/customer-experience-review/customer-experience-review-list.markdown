---
id: customer-experience-review-list
layout: docs
title: Platform API v4 / Customer Experience Reviews
navId: docs
group: reevooapi
next: customer-experience-review/customer-experience-review-detail
prev: review/review-detail
---

# Customer Experience Reviews
An organisation will have a number of customer experience reviews associated with it.
Only published customer experience reviews will be included.



## URL Example(s)
/v4/organisations/D10/customer_experience_reviews

<div class="warning">
  <strong>This URL: </strong>
  /v4/organisations;trkref=D10/customer_experience_reviews
  <strong> is deprecated. Please switch to the current URL above.</strong><br/>
</div>

## Parameter(s)

{: .documentation}
|trkref     |        |
|branch_code|optional|

## Attribute(s)

{: .documentation}
|customer_experience_reviews|array of customer experience objects (attributes described in [customer experience review detail doc](../customer-experience-review-detail))|

## JSON Example
{% highlight json %}
{
   "customer_experience_reviews":[
      {
         "branch_attribution":null,
         "confirmed_purchaser_text": "Confirmed purchaser",
         "fast_responses": [],
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
         ],
         "publish_date": "2016-05-23",
         "purchase_date": "2016-05-23",
         "delivery_date": "2016-05-23",
         "nps_score": 7,
         "customer_ref": null,
         "order_ref": "TEST 230516:1536"
      },
      ...
   ]
}
{% endhighlight %}
