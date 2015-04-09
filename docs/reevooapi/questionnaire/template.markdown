---
id: questionnaire-template-list
layout: docs
title: Platform API v4 / Customer Experience Reviews
navId: docs
group: reevooapi
---

# Questionnaire Template
This endpoint receives an organisation tracking reference (trkref) and a product SKU/SKUs and returns the questionnaire template for the specific SKU/SKUs and organisation.
The questionnaire template consists of a number of sections and each section containins a number of questions.

## URL Example(s)
/v4/organisations/D10/questionnaire_template?sku[]=SKU1&sku[]=SKU2

## Parameter(s)

{: .documentation}
|trkref     |required|
|sku        |required|

## Attribute(s)

{: .documentation}
|sections                                           |array of questionnaire sections|
|<span class="indent-1">section_type</span>         |type of the section|
|<span class="indent-1">sku</span>                  |the sku of the product that the section belongs to|
|<span class="indent-1">header</span>               |header text for the section|
|<span class="indent-1">intro</span>                |intro text for the section|
|<span class="indent-1">footer</span>               |footer text for the section|
|<span class="indent-1">image_url</span>            |image for the section|
|<span class="indent-1">questions</span>            |array of questions|
|<span class="indent-2">id</span>                   |id of the question|
|<span class="indent-2">text</span>                 |question text|
|<span class="indent-2">answer_max_length</span>    ||
|<span class="indent-2">required</span>             ||


## JSON Example
{% highlight json %}
{
  "sections": [
    {
      "section_type": "product_section",
      "sku": "test4b",
      "header": "Rate 4 product test4b",
      "intro": "The worst score is 1, and the best score is 10",
      "footer": "",
      "image_url": "http://images.reevoo.com/product2.jpg",
      "questions": [
        {
          "id": 8,
          "text": "Overall rating:",
          "valid_answers": [1,2,3,4,5,6,7,8,9,10],
          "answer_max_length": null,
          "required": true
        },
        {
          "id": 1144,
          "text": "Cleanliness:",
          "valid_answers": [1,2,3,4,5,6,7,8,9,10],
          "answer_max_length": null,
          "required": false
        },
        {
          "id": 2104,
          "text": "Your accommodation review:",
          "valid_answers": null,
          "answer_max_length": 500,
          "required": false
        }
      ]
    },
    {
      "section_type": "product_section",
      "sku": "testpark34",
      "header": "Rate test34",
      "intro": "The worst score is 1, and the best score is 10",
      "footer": "",
      "image_url": "http://images.reevoo.com/product4.jpg",
      "questions": [
        {
          "id": 8,
          "text": "Overall rating:",
          "valid_answers": [1,2,3,4,5,6,7,8,9,10],
          "answer_max_length": null,
          "required": true
        },
        {
          "id": 2099,
          "text": "Employees rating:",
          "valid_answers": [1,2,3,4,5,6,7,8,9,10],
          "answer_max_length": null,
          "required": false
        },
        {
          "id": 1355,
          "text": "Location & surroundings:",
          "valid_answers": [1,2,3,4,5,6,7,8,9,10],
          "answer_max_length": null,
          "required": false
        },
        {
          "id": 7,
          "text": "Value for money:",
          "valid_answers": [1,2,3,4,5,6,7,8,9,10],
          "answer_max_length": null,
          "required": false
        },
        {
          "id": 1501,
          "text": "Your Holiday Review:",
          "valid_answers": null,
          "answer_max_length": 500,
          "required": false
        }
      ]
    },
    {
      "section_type": "retailer_section",
      "header": "Rate Retailer5",
      "intro": "You booked with Retailer5 on .",
      "footer": "",
      "image_url": "http://images.reevoo.com/product4.jpg",
      "questions": [
        {
          "id": 1159,
          "text": "Would you book again with Retailer5?",
          "valid_answers": [
            {
              "display_text": "Yes",
              "value": "yes"
            },
            {
              "display_text": "No",
              "value": "no"
            }
          ],
          "answer_max_length": null,
          "required": false
        },
        {
          "id": 1185,
          "text": "Where 0 is not at all and 10 is extremely how likely is it that you would recommend Retailer5 to a friend?",
          "valid_answers": [1,2,3,4,5,6,7,8,9,10],
          "answer_max_length": null,
          "required": false
        },
        {
          "id": 1228,
          "text": "Tell us about your experience with Retailer5:",
          "valid_answers": null,
          "answer_max_length": 500,
          "required": false
        }
      ]
    },
    {
      "section_type": "reviewer_section",
      "header": "Your details",
      "intro": null,
      "footer": "",
      "image": null,
      "questions": [
        {
          "id": "reviewer_first_name",
          "text": "First name",
          "valid_answers": null,
          "answer_max_length": 500,
          "required": false
        },
        {
          "id": "reviewer_town",
          "text": "My location (city/town)",
          "valid_answers": null,
          "answer_max_length": 500,
          "required": false
        },
        {
          "id": 1876,
          "text": "Which of the following best describes your party type?",
          "valid_answers": [
            {
              "display_text": "Couple",
              "value": "couple"
            },
            {
              "display_text": "Family (the eldest child is at school)",
              "value": "family_the_eldest_child_is_at_school"
            },
            {
              "display_text": "Family (with only pre-school children)",
              "value": "family_with_only_pre-school_children"
            },
            {
              "display_text": "Friends",
              "value": "friends"
            },
            {
              "display_text": "Group",
              "value": "group"
            }
          ],
          "answer_max_length": null,
          "required": false
        }
      ]
    }
  ]
}
{% endhighlight %}


## Possible responses

By HTTP status:

 * 400 Bad Request - Invalid TRKREF supplied {"status": 400, "errors": "Invalid TRKREF supplied"}
 * 401 Unauthorized - Unauthorized {"status": 401, "errors": "Unauthorized"}
 * 404 Not Found - SKU not found {"status": 404, "errors": "SKU not found"}
