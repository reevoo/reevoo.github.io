---
id: downvote-review
layout: docs
title: Platform API v4 / Downvote Review
navId: docs
group: reevooapi
prev: review/upvote-review
next: customer-experience-review/customer-experience-review-list
---

# Downvote Review

Increments the not_helpful attribute of the review by 1.

<div class="warning">
  It is your responsibility to restrict users of your website from sending multiple requests for the same review.
</div>

## **Request**

`POST /v4/reviews/:id/increment_unhelpful?trkref=:trkref`


### Parameter

{: .documentation-table}
| Parameter      | Requirement    |   Description |
|----------------|----------------|---------------|
|id              | mandatory      |id of the review                |
|trkref          | optional       |your organisation's identifier  |

### Example

`POST /v4/reviews/882783/increment_unhelpful?trkref=D10`

## **Response**

By HTTP status:

 * 202 Accepted - action was successful and will be processed asynchronously
 * 404 Not Found - review with given ID does no exist or you are not authorised to access it
