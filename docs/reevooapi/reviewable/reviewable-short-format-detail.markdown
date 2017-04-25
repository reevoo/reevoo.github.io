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

## URL Example(s)
`/v4/organisations/D10/reviewable?locale=en-GB&sku=AIPTPDV5700&format=short`

<div class="warning">
  <strong>This URL: </strong>
  /v4/organisations;trkref=D10/reviewables;locale=en-GB;sku=AIPTPDV5700?format=short
  <strong> is deprecated. Please switch to the current URL above.</strong><br/>
</div>

## Parameter(s)

{: .documentation}
|trkref     |        |
|branch_code|optional|
|locale     |        |
|sku        |        |
|format     |short   |

## Attribute(s)

{: .documentation}
|sku          |the sku of the reviewable                               |
|review_count |number of published reviews associated to the reviewable|
|average_score|average score associated to this reviewable             |

## JSON Example
{% highlight json %}
{
   "sku":"AIPTPDV5700",
   "review_count":0,
   "average_score":"0"
}
{% endhighlight %}
