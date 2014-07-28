---
id: organisations
layout: docs
title: Platform API v4 / Organisations
---

# Organisations
Allow a user to retrieve information for all organisations associated with their API key.

## URL Example(s)
/v4/organisations

## Parameter(s)
N / A

## Attribute(s)

{: .documentation}
|summary                                    |                             |
|<span class="indent-1">pagination</span>   |                             |
|<span class="indent-2">total_entries</span>|total number of organisations|
|<span class="indent-2">total_pages</span>  |                             |
|<span class="indent-2">current_page</span> |                             |
|<span class="indent-2">per_page</span>     |                             |
|<span class="indent-2">previous_page</span>|                             |
|<span class="indent-2">next_page</span>    |                             |
|organisations                              |array of organisation objects|

## JSON Example
{% highlight json %}
{  
   "summary":{  
      "pagination":{  
         "total_entries":1,
         "total_pages":1,
         "current_page":1,
         "per_page":30,
         "previous_page":null,
         "next_page":null
      }
   },
   "organisations":[  
      {  
         "trkref":"D10",
         "locale":"en-GB",
         "name":"Demo Organisation",
         "reviewables_path":"/v4/organisations;trkref=D10",
         "customer_experience_reviews_path":"/v4/organisations;trkref=D10/customer_experience_reviews"
      }
   ]
}
{% endhighlight %}
