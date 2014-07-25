---
layout: post
title:  "Elasticsearch in production"
date:   2014-08-01 10:58:44
categories: blog
---

{% highlight json %}
{
   "took":22,
   "timed_out":false,
   "_shards":{
      "total":5,
      "successful":5,
      "failed":0
   },
   "hits":{
      "total":1,
      "max_score":1,
      "hits":[
         {
            "_index":"example",
            "_type":"example",
            "_id":"1",
            "_score":1,
            "_source":{
               "_id":"1",
               "content":"present"
            }
         }
      ]
   }
}
{% endhighlight %}

ElasticSearch - Difficulties

It isn't MySQL
It isn't indexes
It isn't tables

Using a system without understanding the underlying behaviour

The ease of setup
Running it on MacOSX

Chef scripts for deployment
Multiple nodes

Kopf
Marvel(?)

Understanding the data you want to put into it
Understanding how you want to search on that data

