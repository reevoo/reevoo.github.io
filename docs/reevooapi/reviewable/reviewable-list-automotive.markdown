---
id: reviewable-list-automotive
layout: docs
title: Platform API v4 / Reviewables with Review Fetcher Automotive aggregation
navId: docs
group: reevooapi
prev: reviewable/reviewable-list
next: reviewable/reviewable-detail
---

# Reviewables with Review Fetcher Automotive aggregation

This page describes the reviewables endpoint available for clients using Review Fetcher Automotive aggregation.
It returns list of all reviewables available for particular TRKREF together with number of reviews and aggregated score.


## Request
`POST /v4/organisations/{trkref}/reviewables`

With JSON body:
{% highlight json %}
{
  "query": {...}
}
{% endhighlight %}

`trkref` is required parameter in path specifying customer tracking reference.

`query` is optional part of request JSON body. It can be used to filter the available reviewables. When it's not used
the endpoint returns all reviewables available for specified `trkref`. We currently support *manufacturer* and
*model* fields to be part of query.


### Examples
`POST /v4/organisations/D10/reviewables`

With JSON body:
{% highlight json %}
{
  "query": {
    "manufacturer": "Audi",
    "model": "A1"
  }
}
{% endhighlight %}
to return just Audi A1 model.

Or
{% highlight json %}
{
  "query": {
    "manufacturer": "Audi",
    "model": ["A1", "A3", "A4"]
  }
}
{% endhighlight %}
to return models A1, A3 and A4.

Or
{% highlight json %}
{
  "query": {
    "manufacturer": "Audi"
  }
}
{% endhighlight %}
to return all available Audi models.


## Response

{: .documentation}
|summary                                                          |                                                           |
|<span class="indent-1">count</span>                              |number of returned reviewables                             |
|reviewables                                                      |array of reviewables matching the query                    |
|<span class="indent-1">attributes</span>                         |attributes specifying the reviewable                       |
|<span class="indent-2">manufacturer</span>                       |                                                           |
|<span class="indent-2">model</span>                              |                                                           |
|<span class="indent-1">product_summary</span>                    |                                                           |
|<span class="indent-2">review_count</span>                       |number of published reviews associated to the reviewable   |
|<span class="indent-2">average_score</span>                      |average score of published reviews                         |
|<span class="indent-2">show_badge</span>                         |is badge displayed                                         |
|<span class="indent-2">show_international_review_badge</span>    |is international badge displayed                           |


### Example
{% highlight json %}
{
  "summary": {
    "count": 44
  },
  "reviewables": [
    {
      "attributes": {
        "manufacturer": "Audi",
        "model": "A1"
      },
      "product_summary": {
        "review_count": 1222,
        "average_score": 9.1,
        "show_badge": true,
        "show_international_review_badge": true
      }
    },
    {
      "attributes": {
        "manufacturer": "Audi",
        "model": "A1 Sportback"
      },
      "product_summary": {
        "review_count": 329,
        "average_score": 8.9,
        "show_badge": true,
        "show_international_review_badge": true
      }
    },
    ...
  ]
}
{% endhighlight %}
