---
id: conversation-downvote-question
layout: docs
title: Platform API v4 / Conversation / Downvote question
navId: docs
group: reevooapi
---

# Conversation - Downvote question

Increments the unhelpful attribute of the question by 1.

<div class="warning">
  Is your responsibility to restrict user of your website from sending multiple requests for the same question.
</div>

## URL Format
POST /v4/conversations/{question_id}/increment_unhelpful

### Example
POST /v4/conversations/38373/increment_unhelpful

### Parameters

{: .documentation}
|question_id     |id of the conversation question        |

## Possible responses

By HTTP status:

 * 202 Accepted - action was successful and will be processed asynchronously
 * 404 Not Found - conversation question with given ID does no exist or you are not authorised to access it
