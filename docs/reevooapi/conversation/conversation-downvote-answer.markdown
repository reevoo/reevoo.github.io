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

## URL Format
POST /v4/conversation_anwers/{answer_id}/increment_unhelpful?trkref={TRKREF}

### Example
POST /v4/conversation_anwers/38373/increment_unhelpful?trkref=D10

### Parameters

{: .documentation}
|trkref        |                                     |
|answer_id     |id of the conversation answer        |

## Possible responses

By HTTP status:

 * 202 Accepted - action was successful and will be processed asynchronously
 * 404 Not Found - conversation answer with given ID does no exist or you are not authorised to access it
