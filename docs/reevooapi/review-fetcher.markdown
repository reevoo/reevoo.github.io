---
id: review-fetcher
title: "Review Fetcher"
layout: docs
navId: docs
group: reevooapi
---

# Review Fetcher

## Automotive - Additional params for filtering

Some of our automotive clients can use the following params for request to [reviewables](../reviewable/reviewable-list)
and [reviews list](../review/review-list) endpoints. If you would like access to these parameters please contact your account manager.

{: .documentation}
|manufacturer         | *string*  |
|model                | *string*  |
|engine_size          | *string*  |  
|used                 | *boolean* |
|doors                | *integer* |
|axle                 | *string*  |
|body_type            | *string*  |
|fuel_type            | *string*  |
|transmission         | *string*  |
|model_from_month     | *integer* |
|model_from_year      | *integer* |
|model_to_month       | *integer* |
|model_to_year        | *integer* |
|model_variant        | *string*  |

### URL Example

`https://api.reevoocloud.com/v4/organisations/GMFU-HYC-U/reviews?manufacturer=ford&model=b-max&doors=5&used=true&locale=en-GB`
