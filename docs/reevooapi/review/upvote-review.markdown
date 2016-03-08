---
id: upvote-review
layout: docs
title: Platform API v4 / Upvote Review
navId: docs
group: reevooapi
prev: review/review-detail
next: review/downvote-review
---

# Upvote Review

Increments the helpful attribute of the review by 1.

<div class="warning">
  It is your responsibility to restrict users of your website from sending multiple requests for the same review.
</div>

## URL Format
POST /v4/reviews/{review_id}/increment_helpful?trkref={TRKREF}

## URL Example
POST /v4/reviews/882783/increment_helpful?trkref=D10

## Parameter

{: .documentation}
|trkref          |your organisation's identifier  |
|review_id       |id of the review                |

## Possible Responses

By HTTP status:

 * 202 Accepted - action was successful and will be processed asynchronously
 * 404 Not Found - review with given ID does no exist or you are not authorised to access it
