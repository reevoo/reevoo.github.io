---
id: conversation-downvote-answer
layout: docs
title: Platform API v4 / Conversation / Downvote answer
navId: docs
group: reevooapi
prev: conversation/conversation-upvote-answer
next: customer-order/customer-order-single-submission
---

# Conversation - Downvote answer

Increments the unhelpful attribute of the answer by 1.

<div class="warning">
  It is your responsibility to restrict users of your website from sending multiple requests for the same answer.
</div>

## **Request**

`POST /v4/conversation_answers/:answer_id/increment_unhelpful?trkref=:trkref`

### Parameters

{: .documentation-table}
| Parameter | Requirement | Description |
|-----------|-------------|-------------|
|trkref     | mandatory   |             |
|answer_id  | mandatory   |id of the conversation answer |

### Example

`POST /v4/conversation_answers/38373/increment_unhelpful?trkref=D10`

## **Response**

By HTTP status:

 * 202 Accepted - action was successful and will be processed asynchronously
 * 404 Not Found - conversation answer with given ID does no exist or you are not authorised to access it
