---
id: review-list
layout: docs
title: Platform API v4 / Reviews
navId: docs
group: reevooapi
prev: reviewable/reviewable-short-format-detail
next: review/review-detail
---

# Reviews

Reviews are aggregated, so the ones that have been collected for other organisations may be included.
<br /> Only published reviews are included.

## **Request**

`GET /v4/organisations/:trkref/reviews?locale=:locale&sku=:sku`

<div class="warning">
  <strong>This URL: </strong>
  /v4/organisations;trkref=D10/reviewables;locale=en-GB;sku=AIPTPDV5700/reviews
  <strong> is deprecated. <br />Please switch to the current URL above.</strong><br/>
</div>

### Parameters for non-automotive reviews

{: .documentation-table}
| Parameter  | Requirement |     Constraints      | Examples |
|------------|-------------|----------------------|----------|
| trkref     | mandatory   |                      |          |
| locale     | mandatory   |                      |          |
| branch_code| optional    |                      |          |
| sku        | optional    |                      |          |
| region     | optional    | see below            |          |
| page       | optional    |                      |          |
| per_page   | optional    | default: 15, max: 30 |          |

### Possible **region** parameter values for non-automotive reviews

{: .documentation-table}
| Value     | Description   |
|-----------|---------------|
| my-locale                                               | Return all reviews having same locale as locale parameter             |
| my-country                                              | Return all reviews having same country code as locale parameter       |
| my-languages                                            | Return all reviews having same language code as locale parameter      |
| english                                                 | |
| worldwide                                               | |

### Parameters for automotive reviews

{: .documentation-table}
|       Parameter       |  Requirement |      Constraints     |                      Examples                          |
|-----------------------|------------- |-------------------------------------------------------------------------------|
| trkref                | mandatory    |                      |                                                        |
| locale                | mandatory    |                      |                                                        |
| manufacturer          | mandatory    |                      |                                                        |
| model                 | mandatory    |                      |                                                        |
| branch_code           | optional     |                      |                                                        |
| sku                   | optional     |                      |                                                        |
| region                | optional     | see below            |                                                        |
| page                  | optional     |                      |                                                        |
| per_page              | optional     | default: 15, max: 30 |                                                        |
| model_variant         | optional     |                      | GT                                                     |
| model_year            | optional     |                      | 2017                                                   |
| image_url             | optional     |                      |                                                        |
| body_type             | optional     |                      | hatchback,fastback                                     |
| doors                 | optional     |                      | 3                                                      |
| used                  | optional     |                      | 0                                                      |
| vehicle_type          | optional     |                      | car                                                    |
| fuel_type             | optional     |                      | diesel,petrol                                          |
| transmission          | optional     |                      | manual                                                 |
| model_display         | optional     |                      | Lexus CT 200h Hatchback                                |
| spec_description      | optional     |                      | Lexus CT Hatchback - 5 doors 2h - E-CVT Executive Line |
| engine_size_in_liters | optional     |                      | 2.0                                                    |

### Possible **region** parameter values for automotive reviews

{: .documentation-table}
|   Value   | Description   |
|-----------|---------------|
| my-locale                                               | Return all reviews having same locale as locale parameter             |
| my-country                                              | Return all reviews having same country code as locale parameter       |
| my-languages                                            | Return all reviews having same language code as locale parameter      |
| multi-country                                           | Return all reviews having locale in same region as locale parameter   |

## **Response**

### Attributes

{: .documentation-table}
| Attribute | Description |
|-----------|-------------|
| summary                                                 |                                                                                         |
| <span class="indent-1">pagination</span>                |                                                                                         |
| <span class="indent-2">total_entries</span>             | total number of reviews                                                                 |
| <span class="indent-2">total_entries_with_content</span>| total number of reviews with good/bad points or general comments                        |
| <span class="indent-2">total_pages</span>               |                                                                                         |
| <span class="indent-2">current_page</span>              |                                                                                         |
| <span class="indent-2">per_page</span>                  |                                                                                         |
| <span class="indent-2">previous_page</span>             |                                                                                         |
| <span class="indent-2">next_page</span>                 |                                                                                         |
| <span class="indent-1">regions</span>                   |                                                                                         |
| <span class="indent-2">default</span>                   | default region selection                                                                |
| <span class="indent-2">current</span>                   | current region selection                                                                |
| <span class="indent-2">available</span>                 | array of regions from which is possible to select.                                      |
| reviews                                                 | array of review objects (attributes described in [review detail doc](../review-detail)) |


### Example for non-automotive

`GET /v4/organisations/D10/reviews?locale=en-GB&sku=AIPTPDV5700`

{% highlight json %}
{
   "summary": {
      "facets": [
         {
            "question_id": 30,
            "translation_key": "questionnaire.question_texts.performance.question_text",
            "display_text": "Performance",
            "is_active": true,
            "is_public": true,
            "tag": null,
            "statistics": {
               "summation": 786,
               "respondents": 88
            }
         },
         {
            "question_id": 37,
            "translation_key": "questionnaire.question_texts.reliability.question_text",
            "display_text": "Reliability",
            "is_active": true,
            "is_public": true,
            "tag": null,
            "statistics": {
               "summation": 742,
               "respondents": 84
            }
         },
         {
            "question_id": 38,
            "translation_key": "questionnaire.question_texts.capacity.question_text",
            "display_text": "Capacity",
            "is_active": true,
            "is_public": true,
            "tag": null,
            "statistics": {
               "summation": 804,
               "respondents": 88
            }
         },
         {
            "question_id": 7,
            "translation_key": "questionnaire.question_texts.value_for_money.question_text",
            "display_text": "Value for money",
            "is_active": true,
            "is_public": true,
            "tag": "value-for-money",
            "statistics": {
               "summation": 961,
               "respondents": 105
            }
         },
         {
            "question_id": 8,
            "translation_key": "questionnaire.question_texts.overall_rating.question_text",
            "display_text": "Overall rating",
            "is_active": true,
            "is_public": true,
            "tag": "overall",
            "statistics": {
               "summation": 960,
               "respondents": 106
            }
         }
      ],
      "pagination": {
         "total_entries": 106,
         "total_entries_with_content": 73,
         "total_pages": 8,
         "current_page": 1,
         "per_page": 15,
         "previous_page": null,
         "next_page": 2
      },
      "moving_window_size": null,
      "regions": {
         "default": "my-country",
         "current": "my-country",
         "available": [
            {
               "key": "my-country",
               "translation_key": "reviews_tab.automotive_regions.my-country",
               "number_of_reviews": 6633,
               "in_native_language": true
            },
            {
               "key": "multi-country",
               "translation_key": "reviews_tab.automotive_regions.multi-country",
               "number_of_reviews": 6906,
               "in_native_language": false
            }
         ]
      }
   },
   "reviews": [
      {
         "id": 5996122,
         "sort_and_display_date": "2017-08-25",
         "overall_score": 9,
         "helpful": 0,
         "not_helpful": 0,
         "good_points": "For the money excellent value.",
         "bad_points": "Still too early for a proper evaluation\r\nNone as yet",
         "general_comments": null,
         "verified": true,
         "confirmed_purchaser_text": "Confirmed purchaser",
         "product": {
            "id": 1462,
            "name": "PlayStation 4",
            "image_url": "https://images.reevoo.com/retailer_products/1462/10207581/37x37.jpg?timestamp=1439805440"
         },
         "retailer_product": {
            "name": "Retailer product example",
            "sku": "SKU example"
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
         "embeddable": false,
         "publish_date": "2017-09-22",
         "purchase_date": "2017-08-25",
         "delivery_date": null,
         "reviewer":{
            "first_name": "Robert",
            "location": "Catford, London",
            "segment": "Home user",
            "id": 28201105,
            "facebook_avatar_url": null
         },
         "facets": [
            {
               "question_id": 30,
               "translation_key": "questionnaire.question_texts.performance.question_text",
               "display_text": "Performance",
               "is_active": true,
               "is_public": true,
               "tag": null,
               "statistics": {
                  "summation": 9,
                  "respondents": 1
               }
            },
            {
               "question_id": 37,
               "translation_key": "questionnaire.question_texts.reliability.question_text",
               "display_text": "Reliability",
               "is_active": true,
               "is_public": true,
               "tag": null,
               "statistics": {
                  "summation": 9,
                  "respondents": 1
               }
            },
            ...
         ]
      },
      ...
   ]
}
{% endhighlight %}


### Example for automotive

`GET /v4/organisations/ATO/reviews?locale=en-CA&manufacturer=auto&model=cx-99`

{% highlight json %}
{
   "summary": {
      "facets": [
         {
            "question_id": 30,
            "translation_key": "questionnaire.question_texts.performance.question_text",
            "display_text": "Performance",
            "is_active": true,
            "is_public": true,
            "tag": "overall",
            "statistics": {
               "summation": 786,
               "respondents": 88
            }
         },
         {
            "question_id": 37,
            "translation_key": "questionnaire.question_texts.reliability.question_text",
            "display_text": "Reliability",
            "is_active": true,
            "is_public": true,
            "tag": null,
            "statistics": {
               "summation": 742,
               "respondents": 84
            }
         },
         {
            "question_id": 38,
            "translation_key": "questionnaire.question_texts.capacity.question_text",
            "display_text": "Capacity",
            "is_active": true,
            "is_public": true,
            "tag": null,
            "statistics": {
               "summation": 804,
               "respondents": 88
            }
         },
         {
            "question_id": 7,
            "translation_key": "questionnaire.question_texts.value_for_money.question_text",
            "display_text": "Value for money",
            "is_active": true,
            "is_public": true,
            "tag": "value-for-money",
            "statistics": {
               "summation": 961,
               "respondents": 105
            }
         },
         {
            "question_id": 8,
            "translation_key": "questionnaire.question_texts.overall_rating.question_text",
            "display_text": "Overall rating",
            "is_active": true,
            "is_public": true,
            "tag": "overall",
            "statistics": {
               "summation": 960,
               "respondents": 106
            }
         }
      ],
      "pagination": {
         "total_entries": 106,
         "total_entries_with_content": 73,
         "total_pages": 8,
         "current_page": 1,
         "per_page": 15,
         "previous_page": null,
         "next_page": 2
      },
      "moving_window_size": null,
      "regions": {
         "default": "my-country",
         "current": "my-country",
         "available": [
            {
               "key": "my-country",
               "translation_key": "reviews_tab.automotive_regions.my-country",
               "number_of_reviews": 6633,
               "in_native_language": true
            },
            {
               "key": "multi-country",
               "translation_key": "reviews_tab.automotive_regions.multi-country",
               "number_of_reviews": 6906,
               "in_native_language": false
            }
         ]
      }
   },
   "reviews": [
      {
         "id": 5996122,
         "sort_and_display_date": "2017-08-25",
         "overall_score": 9,
         "helpful": 0,
         "not_helpful": 0,
         "good_points": "For the money excellent value.",
         "bad_points": "Still too early for a proper evaluation\r\nNone as yet",
         "general_comments": null,
         "verified": true,
         "confirmed_purchaser_text": {
            "automotive_service": null,
            "car": null,
            "cottage": null,
            "cruise": null,
            "destination": null,
            "generic_product": null,
            "hotel": null,
            "park": null,
            "property": null,
            "service_only_insurance": null,
            "tour": null,
            "travel": null
         },
         "product": {
            "id": 1462,
            "name": "PlayStation 4",
            "image_url": "https://images.reevoo.com/retailer_products/1462/10207581/37x37.jpg?timestamp=1439805440"
         },
         "retailer_product": {
            "name": "Retailer product example",
            "sku": "SKU example"
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
         "embeddable": false,
         "publish_date": "2017-09-22",
         "purchase_date": "2017-08-25",
         "delivery_date": null,
         "reviewer":{
            "first_name": "Robert",
            "location": "Catford, London",
            "segment": "Home user",
            "id": 28201105,
            "facebook_avatar_url": null
         },
         "facets": [
            {
               "question_id": 30,
               "translation_key": "questionnaire.question_texts.performance.question_text",
               "display_text": "Performance",
               "is_active": true,
               "is_public": true,
               "tag": "overall",
               "statistics": {
                  "summation": 9,
                  "respondents": 1
               }
            },
            {
               "question_id": 37,
               "translation_key": "questionnaire.question_texts.reliability.question_text",
               "display_text": "Reliability",
               "is_active": true,
               "is_public": true,
               "tag": null,
               "statistics": {
                  "summation": 9,
                  "respondents": 1
               }
            },
            ...
         ]
      },
      ...
   ]
}
{% endhighlight %}
