---
id: conversation_upvote_answer
layout: docs
title: Platform API v4 / Conversation / Upvote answer
navId: docs
group: reevooapi
---

# Conversation - Upvote answer

Increments by 1 the helpful attribute of the answer.

<div class="warning">
  Is your responsibility to restrict user of your website from sending multiple requests for the same aswer.
</div>

## URL Format
POST /v4/conversation_anwers/{answer_id}/increment_helpful

### Example
POST /v4/conversation_anwers/38373/increment_helpful

### Parameters

{: .documentation}
|answer_id     |id of the conversation answer        |

## Possible responses

By HTTP status:

 * 202 Accepted - action was successful and will be processes asynchronously
 * 404 Not Found - conversation answer with given ID does no exist or you are not authorised to access it
