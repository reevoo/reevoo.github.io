---
id: reviewable-short-format-detail
layout: docs
title: Platform API v4 / Reviewable Short Format
navId: docs
group: reevooapi
prev: reviewable/reviewable-detail
next: review/review-list
---

# Reviewable - Short Format
If you pass the parameter format=short to the reviewable endpoint you will be provided with
a short set of key values for the reviewable, including the review count and average score.

## **Request**

`GET /v4/organisations/:trkref/reviewable?locale=:locale&sku=:sku&format=:format`

## Parameters

{: .documentation-table}
| Parameter | Requirement | Description    |
|-----------|-------------|----------------|
|trkref     |mandatory    |                |
|branch_code|optional     |                |
|locale     |optional     |                |
|sku        |optional     |                |
|format     |optional     | Allowed values: short |

## **Response**

### Attributes

{: .documentation-table}
| Attribute   | Description   |
|-------------|---------------|
|sku          |the sku of the reviewable                               |
|review_count |number of published reviews associated to the reviewable|
|average_score|average score associated to this reviewable             |

### Example

`GET /v4/organisations/D10/reviewable?locale=en-GB&sku=AIPTPDV5700&format=short`

{% highlight json %}
{
   "sku":"AIPTPDV5700",
   "review_count":0,
   "average_score":"0"
}
{% endhighlight %}
