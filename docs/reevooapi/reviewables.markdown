---
id: reviewables
layout: docs
title: Platform API v4 / Reviewables
navId: docs
---

# Reviewables
An organisation will have a number of reviewables associated with it. Reviewables returned
from this end point will all relate directly to products and services supplied by the
organisation.

## URL Example(s)
/v4/organisations;trkref=D10/reviewables

## Parameter(s)

{: .documentation}
|trkref     |        |
|branch_code|optional|
|format     |optional|

## Attribute(s)

{: .documentation}
|summary                                    |                           |
|<span class="indent-1">pagination</span>   |                           |
|<span class="indent-2">total_entries</span>|total number of reviewables|
|<span class="indent-2">total_pages</span>  |                           |
|<span class="indent-2">current_page</span> |                           |
|<span class="indent-2">per_page</span>     |                           |
|<span class="indent-2">previous_page</span>|                           |
|<span class="indent-2">next_page</span>    |                           |
|organisations                              |array of reviewable objects|

## JSON Example
{% highlight json %}
{  
   "summary":{  
      "pagination":{  
         "total_entries":177920,
         "total_pages":5931,
         "current_page":1,
         "per_page":30,
         "previous_page":null,
         "next_page":2
      }
   },
   "reviewables":[  
      {  
         "name":"Hp 342 Tricolou Hp 342 Tri Colour 5ml Ink",
         "has_reviews":true,
         "has_image":true,
         "image_url":"//images.reevoo.com/retailer_products/1016283/1016283672/90x90.jpg?timestamp=1379547582",
         "finder_options":{  
            "sku":"100000",
            "locale":"en-GB"
         },
         "reviews_path":"/v4/organisations;trkref=D10/reviewables;locale=en-GB;sku=100000/reviews"
      },
      {  
         "name":"Hauppauge Win TV Nova-S Plus Digital Satellite Card TV And Radio Card PCI",
         "has_reviews":false,
         "has_image":true,
         "image_url":"//images.reevoo.com/retailer_products/1006735/1006735219/90x90.jpg?timestamp=1379287067",
         "finder_options":{  
            "sku":"100017",
            "locale":"en-GB"
         },
         "reviews_path":"/v4/organisations;trkref=D10/reviewables;locale=en-GB;sku=100017/reviews"
      },
      ...
   ]
}
{% endhighlight %}
