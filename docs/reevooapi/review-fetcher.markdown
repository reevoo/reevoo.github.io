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
|body_type            | *string*  | e.g. Hatchback or Saloon or SUV or Mid-SUV or Crossover
|doors                | *integer* | e.g. 3 or 4 or 5
|engine_size          | *string*  | e.g. 2.0 or 1.0 or 1.1
|fuel_type            | *string*  | e.g. Petrol or Diesel
|manufacturer         | *string*  | e.g. Mazda or Volvo or BMW
|model                | *string*  | e.g. 3 or 2 or MX-5 or CX-5
|model_variant        | *string*  | e.g. GX or GS or SPORT GX or SPORT GS or Arctic or SE or SE-L
|model_year           | *integer* | e.g. 2015 or 2016
|transmission         | *string*  | e.g. Manual or Automatic or Electric or CVT or Hybrid
|used                 | *boolean* | e.g. 1 or 0
|vehicle_type         | *string*  | e.g. car or van or motorcycle or truck

### URL Example

`https://api.reevoocloud.com/v4/organisations/GMFU-HYC-U/reviews?manufacturer=ford&model=b-max&doors=5&used=true&locale=en-GB`
