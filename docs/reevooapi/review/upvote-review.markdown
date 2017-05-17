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

## **Request**

`POST /v4/reviews/:id/increment_helpful?trkref=:trkref`

### Parameters

{: .documentation-table}
| Parameter | Requirement |Description |
|-----------|-------------|------------|
|id         | mandatory   |id of the review                |
|trkref     | optional    |your organisation's identifier  |

### Example

`POST /v4/reviews/882783/increment_helpful?trkref=D10`

## **Response**

By HTTP status:

 * 202 Accepted - action was successful and will be processed asynchronously
 * 404 Not Found - review with given ID does no exist or you are not authorised to access it
