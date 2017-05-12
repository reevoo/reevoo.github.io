---
id: review-detail
layout: docs
title: Platform API v4 / Review
navId: docs
group: reevooapi
prev: review/review-list
next: review/upvote-review
---

# Review
Details for a single review.

## **Request**

`GET /v4/reviews/:id?trkref=:trkref`

<div class="warning">
  <strong>This URL: </strong>
  /v4/organisations;trkref=D10/reviews/5996122
  <strong> is deprecated. Please switch to the current URL above.</strong><br/>
</div>

### Parameters

{: .documentation-table}
| Parameter | Requirement | Description |
|-----------|-------------|-------------|
|trkref     | mandatory   |             |
|id         | mandatory   | id of a review |
|branch_code| optional    |             |
|locale     | optional    |             |


## **Response**

### Attributes

{: .documentation-table}
| Attribute | Description   |
|-----------|---------------|
|id                       |identifier for the review                              |
|overall_score            |the score (out of 10) given by the reviewer for the product|
|helpful                  |count of users who have flagged this review helpful    |
|not_helpful              |count of users who have flagged this review not helpful|
|good_points              |good points text                                       |
|bad_points               |bad points text                                        |
|general_comments         |general comments text                                  |
|product                  |product informations                                   |
|<span class="indent-1">id</span>         |                                       |
|<span class="indent-1">name</span>       |                                       |
|<span class="indent-1">image_url</span>  |                                       |
|retailer_product         |retailer product informations                          |
|<span class="indent-1">sku</span>        |The SKU of the product as provided by retailer |
|<span class="indent-1">name</span>       |The name of the product as provided by retailer|
|fast_responses                           |array of responses                     |
|<span class="indent-1">response</span>   |                                       |
|<span class="indent-1">respondent</span> |respondent details                     |
|<span class="indent-2">custom_name</span>| If the retailer is using our old fast response tool, the custom name is the respondent's name, and is guaranteed to be populated. Otherwise, if the retailer is using our new fast response tool, then this property is only populated if the respondent provided a "custom title" when sending the response, otherwise the value of this field will be null. |
|<span class="indent-2">first_name</span> | If the retailer is using our old fast response tool, then this property will always be null. Otherwise, if the retailer is using our new fast response tool, then this property is only populated if the respondent provided a "first name" when sending the response, otherwise the value of this field will be null. |
|<span class="indent-2">surname</span>    | If the retailer is using our old fast response tool, then this property will always be null. Otherwise, if the retailer is using our new fast response tool, then this property is only populated if the respondent provided a "surname" when sending the response, otherwise the value of this field will be null. |
|<span class="indent-2">job_title</span>  | This property will only be populated if the respondent provided a "job title" when sending the response, otherwise it will be null. |
|<span class="indent-2">display_name</span>| If the retailer is using our old fast response tool, the display name is the concatenation of the respondent's name and respondent's job title separated by a comma (or only the name if there is no job title available). Otherwise, if the retailer is using our new fast response tool, the display name will have the same value as the "You are responding as:" field that we use in the response form (which can be a combination of first_name or first_name + job_title or first_name + surname + job_title, or the custom title).
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

## Example

`GET /v4/reviews/5996122?trkref=D10`

{% highlight json %}
{
   "id":5996122,
   "overall_score":9,
   "helpful":0,
   "not_helpful":0,
   "good_points":"For the money excellent value.",
   "bad_points":"Still too early for a proper evaluation\r\nNone as yet",
   "general_comments":null,
   "product": {
      "id": 1462,
      "name": "PlayStation 4",
      "image_url": "//images.reevoo.com/retailer_products/1462/10207581/37x37.jpg?timestamp=1439805440"
   },
   "retailer_product": {
      "name": "Example retailer product",
      "sku": "EXAMPLE_SKU"
   },
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
