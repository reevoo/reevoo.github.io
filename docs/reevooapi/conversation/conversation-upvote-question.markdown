---
id: conversation_upvote_question
layout: docs
title: Platform API v4 / Conversation / Upvote question
navId: docs
group: reevooapi
---

# Conversation - Upvote question

Increments by 1 the helpful attribute of the question.

<div class="warning">
  Is your responsibility to restrict user of your website from sending multiple requests for the same question.
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

 * 202 Accepted - action was successful and will be processes asynchronously
 * 404 Not Found - conversation question with given ID does no exist or you are not authorised to access it
