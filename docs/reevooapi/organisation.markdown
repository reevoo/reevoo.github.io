---
id: organisation
layout: docs
title: Platform API v4 / Organisation
navId: docs
group: reevooapi
prev: organisations
next: reviewables
---

# Organisation
Allow a user to retrieve information for a specific organisation.Users are only allow to
retrieve information for organisations that their API key is assigned to.

## URL Example(s)
/v4/organisations;trkref=D10

## Parameter(s)

{: .documentation}
|trkref     |        |
|branch_code|optional|

## Attribute(s)

{: .documentation}
|trkref                                                              |identifier for the organisation    |
|locale                                                              |default locale for the organisation|
|name                                                                |                                   |
|reviewables_path                                                    |path to reviewables                |
|customer_experience_reviews_path                                    |path to customer experience reviews|
|customer_experience_scores                                          |                                   |
|<span class="indent-1">percentage_who_would_recommend</span>        |                                   |
|<span class="indent-1">number_of_retailer_rating_reviews</span>     |                                   |
|<span class="indent-1">percentage_happy_with_delivery</span>        |                                   |
|<span class="indent-1">number_of_retailer_delivery_reviews</span>   |                                   |
|<span class="indent-1">percentage_happy_with_customer_service</span>|                                   |
|<span class="indent-1">number_of_retailer_service_reviews</span>    |                                   |

## JSON Example
{% highlight json %}
{
   "trkref":"D10",
   "locale":"en-GB",
   "name":"Demo Organisation",
   "reviewables_path":"/v4/organisations;trkref=D10",
   "customer_experience_reviews_path":"/v4/organisations;trkref=D10/customer_experience_reviews",
   "customer_experience_scores":{
      "percentage_who_would_recommend":97,
      "number_of_retailer_rating_reviews":2020,
      "percentage_happy_with_delivery":96,
      "number_of_retailer_delivery_reviews":2001,
      "percentage_happy_with_customer_service":0,
      "number_of_retailer_service_reviews":0
   }
}
{% endhighlight %}
