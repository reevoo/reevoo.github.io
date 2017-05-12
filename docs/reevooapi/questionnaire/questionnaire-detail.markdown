---
id: questionnaire-detail
layout: docs
title: Platform API v4 / Questionnaire
navId: docs
group: reevooapi
---

# Questionnaire

Returns a questionnaire state and url or redirects to the questionnaire.

## **Request**

`GET /v4/organisations/:trkref/questionnaire?email=:email&first_name=:first_name&order_ref=:order_ref&sku=:sku`

### Parameters

{: .documentation-table}
| Parameter | Requirement   | Description |
|-----------|---------------|-------------|
|trkref     | mandatory     | organisation trkref |
|email      | mandatory     | email of purchaser |
|sku        | mandatory     | sku of product|
|order_ref  | mandatory     | order reference|
|first_name | optional      | first name of purchaser |
|redirect   | optional      | if passed 'true', it redirects to the actual questionnaire/review|


## **Response**

### Attributes

{: .documentation-table}
| Attribute | Description |
|-----------|-------------|
|state      |status of the review (see below)                                                              |
|url        |the url where the customer can leave or edit the review or see the review if it was published |

### Review state options

- **published** - review published on the client website
- **rejected** - review rejected by vetter and can be edited
- **pending_order** - review submitted and waiting for a matching order
- **pending_moderation** - review submitted and waiting for moderation
- **pending_publication** - review accepted and waiting to be published
- **not_reviewed** - no review submitted yet
- **undefined** - it is not possible to determine the review state


## Example

Request:

`GET /v4/organisations/D10/questionnaire?email=jane@example.com&order_ref=FA78623&sku=A1002`

Response:

{% highlight json %}
{
  "state": "not_reviewed",
  "url": "http://reviews.reevoo.com/review/fill_review?hashcode=1aozsg-69r0yqm2mzzdep5naihtrfi9o20xp04&"
}
{% endhighlight %}
