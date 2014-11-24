---
id: conversation-upvote-question
layout: docs
title: Platform API v4 / Conversation / Upvote question
navId: docs
group: reevooapi
prev: conversation/conversation-create
next: conversation/conversation-downvote-question
---

# Conversation - Upvote question

Increments the helpful attribute of the question by 1.

<div class="warning">
  It is your responsibility to restrict users of your website from sending multiple requests for the same question.
</div>

## URL Format
POST /v4/conversations/{question_id}/increment_helpful

### Example
POST /v4/conversations/38373/increment_helpful

### Parameters

{: .documentation}
|question_id     |id of the conversation question        |

## Possible responses

By HTTP status:

 * 202 Accepted - action was successful and will be processed asynchronously
 * 404 Not Found - conversation question with given ID does no exist or you are not authorised to access it
