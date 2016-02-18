---
id: conversation-upvote-answer
layout: docs
title: Platform API v4 / Conversation / Upvote answer
navId: docs
group: reevooapi
prev: conversation/conversation-downvote-question
next: conversation/conversation-downvote-answer
---

# Conversation - Upvote answer

Increments the helpful attribute of the answer by 1.

<div class="warning">
  It is your responsibility to restrict users of your website from sending multiple requests for the same answer.
</div>

## URL Format
POST /v4/conversation_answers/{answer_id}/increment_helpful?trkref={TRKREF}

### Example
POST /v4/conversation_answers/38373/increment_helpful?trkref=D10

### Parameters

{: .documentation}
|trkref        |                              |
|answer_id     |id of the conversation answer |

## Possible responses

By HTTP status:

 * 202 Accepted - action was successful and will be processed asynchronously
 * 404 Not Found - conversation answer with given ID does no exist or you are not authorised to access it
