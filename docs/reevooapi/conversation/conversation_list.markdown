---
id: conversation_list
layout: docs
title: Platform API v4 / Conversation / List
navId: docs
group: reevooapi
---

# Conversation List

<div class="warning">
  <strong>Currently this is just an experimental endpoint. If you would like to use it please contact us. </strong>
</div>
Returns all the conversations that are associated with a specific product.

## URL Format 
GET v4/organisations/{trkref}/conversations?locale={locale}&sku={sku}

## URL Example
GET v4/organisations/D10/conversations?locale=en-GB&sku=AIPTPDV5700


## Parameters

{: .documentation}
|trkref     |         |
|locale     |optional |
|sku        |         |


## Attributes

{: .documentation}
|summary                                                 |                                                                |
|<span class="indent-1">question_count</span>            |total number of questions with at least one vetted answer       |
|conversations                                           |array of conversations objects                                  |

## JSON Example
{% highlight json %}
{
   "summary":{
      "question_count":1,
   },
   "conversations":[
      {
         "id":223049,
         "first_name":"A shopper",
         "question":"How is this product?",
         "created_at":"2014-10-07T14:17:56Z",
         "helpful":0,
         "unhelpful":0,
         "embeddable":false,
         "retailer_locale":"en-GB",
         "answers":[
            {
               "id":259010,
               "response":"It is great.",
               "created_at":"2014-10-09T20:33:08Z",
               "first_name":"Ann",
               "job_title":null,
               "reviewer_segment":"Family",
               "helpful":0,
               "unhelpful":0,
               "review_locale":"en-GB",
               "reviewer_facebook_url":null,
               "response_type":"owner",
               "retailer_name":null,
               "retailer_image_url":null
            }
         ]
      }
   ]
}
{% endhighlight %}
