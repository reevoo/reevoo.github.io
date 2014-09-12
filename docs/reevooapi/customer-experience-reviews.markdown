---
id: customer-experience-reviews
layout: docs
title: Platform API v4 / Customer Experience Reviews
navId: docs
group: reevooapi
next: customer-experience-review
prev: review
---

# Customer Experience Reviews
An organisation will have a number of customer experience reviews associated with it.
Only published customer experience reviews will be included.



## URL Example(s)
/v4/customer_experience_reviews?trkref=D10

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
|customer_experience_reviews|array of customer experience objects|

## JSON Example
{% highlight json %}
{
   "customer_experience_reviews":[
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
      },
      ...
   ]
}
{% endhighlight %}
