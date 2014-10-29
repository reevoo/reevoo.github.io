---
id: conversations
layout: docs
title: Platform API v4 / Reviewable
navId: docs
group: reevooapi
prev: conversation
---

# Conversations
<div class="warning">
  <strong>Currently this is just an experimental endpoint. If you would like to use it please contact us. </strong> 
</div>
Allow a user to retrieve all the conversations that are associated with a specific product.

## URL Example(s)
v4/organisations/D10/conversations?locale=en-GB&sku=AIPTPDV5700


## Parameter(s)

{: .documentation}
|trkref     |         |
|locale     |         |
|sku        |         |


## Attribute(s)

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
         "vetted_at":"2014-10-07T14:38:57Z",
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