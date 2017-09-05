---
id: feeds-automotive-product-fields
layout: docs
title: Automotive Product Fields
navId: docs
group: feeds
---

# Feeds

## Automotive Product Fields

Detailed descriptions of the attributes (fields) available for use within each of the required data feeds can be found below. Mandatory attributes are marked accordingly. Issues with the data feed processing will occur if any of the fields are missing.

It is important to provide as many recommended (optional) columns as possible. The more data a client provides about a product / car model and customer, the better we will be able to manage the reviews that we collect for the client.

### Summary

{: .documentation-table}
| Attribute                                      | Requirement | Type    | Max length |
|------------------------------------------------|-------------|---------|------------|
|[sku](#sku)                                     | mandatory   | text    | 191        |
|[manufacturer](#manufacturer)                   | mandatory   | text    | 40         |
|[model](#model)                                 | mandatory   | text    | 40         |
|[model_variant](#model_variant)                 | mandatory   | text    | 40         |
|[model_year](#model_year)                       | mandatory   | integer | 4          |
|[image_url](#image_url)                         | mandatory   | text    | 2000       |
|[body_type](#body_type)                         | mandatory   | text    | 40         |
|[doors](#doors)                                 | mandatory   | integer | 1          |
|[used](#used)                                   | mandatory   | boolean | 1          |
|[vehicle_type](#vehicle_type)                   | mandatory   | text    | 40         |
|[fuel_type](#fuel_type)                         | mandatory   | text    | 40         |
|[transmission](#transmission)                   | optional    | text    | 40         |
|[engine_size_in_liters](#engine_size_in_liters) | optional    | float   | 6          |
|[model_display](#model_display)                 | optional    | text    | 40         |
|[spec_description](#spec_description)           | optional    | text    | 191        |

## **sku**
----------

### Definition
  Unique product identifier

### Usage
  SKU is used to link Product feed with Purchaser feed (customer sales data) so that Reevoo system can identify product(s) that customer purchased and use the relevant car information in email/questionnaire we send to the customer.

  SKU is also used to aggregate, search and populate relevant reviews on the website.

  Failure to provide SKU information in Product feed will result not only in customer data not being processed for that particular SKU- which can seriously impact review collection.

### Constraints
  + URL friendly

### Examples
  + DR26BBA1234
  + 234172
  + ss124


## **manufacturer**
----------

### Definition
  Brand/Marque/Make name of the carline

### Usage
  Manufacturer is used for review collection and display purposes. It is a mandatory parameter when displaying aggregated review content.

  This plays a significant role in review aggregation, so it must be provided in the correct format. We may reject feeds with manufacturers we don't recognize.

### Constraints
  + URL friendly

  + We accept a specific set of manufacturers only. This is continually maintained and updated when necessary. You can contact your account manager if you need more information.

### Examples
  + Dacia
  + Ford
  + Honda


## **model**
----------

### Definition
  Model range of a specific carline

### Usage
  Model is used for review collection and when displaying reviews by model on the website. It is a mandatory parameter when displaying aggregated review content.

  This will ensure the reviews displaying on the website are aggregated from vehicles of the specified model only. This aggregation will also filter on other attributes such as manufacturer, body_type, doors and others

  This plays a significant role in review aggregation, so it must be provided in the correct format. We may reject feeds with models we don't recognize.

### Constraints
  + Must not include manufacturer name
  + Must not include variant, body type or any other parameters that are covered by other attributes in this feed spec
  + We accept a specific set of models only. This is continually maintained and updated when necessary. You can contact your account manager if you need more information.

### Examples
  + Duster
  + FIESTA
  + JAZZ
  + i20
  + XE


## **model_variant**
----------

### Definition
  Model variant is a particular brand of vehicle sold under a marque by a manufacturer, usually within a range of models, often of different sizes or capabilities.

  Model variant may include main group/categories of Trim options. These are often denoted by lettering after the model name

### Usage
  Model variant is used for review collection and when displaying reviews by model_variant on the website. It is a mandatory parameter when displaying aggregated review content.

  This will ensure the reviews displaying on the website are aggregated from vehicles of the specified model_variant only. This aggregation will also filter on other attributes such as manufacturer, model, body_type, doors and others

  This plays a significant role in review aggregation, so it must be provided in the correct format.

  This will also be displayed as additional review detail on our reviews display solutions (alongside each review displaying in review lightbox).

### Constraints
  + It must not include manufacturer and/or model name
  + It must not include every trim option available for the model range. If multiple options available, they should be grouped by the main aspect and more granular levels can be specified within spec_description column

### Examples
  + SE-L Lux Nav
  + x-cite
  + ST-Line Red Edition


## **model_year**
----------

### Definition
  Model year is a calendar year for when the model of a specific carline was first launched.

  For the specific carline this usually changes every 2-5 years

### Usage
  This is used for review aggregation when filtering reviews by model_year on the website, especially when separating reviews collected for new and old models. It is a mandatory parameter when displaying aggregated review content.

  This will ensure the reviews displaying on the website are aggregated from vehicles of the specified model_year only. This aggregation will also filter on other attributes such as manufacturer, model, model_variant, body_type, doors and others

  This can be also displayed as additional review detail on our reviews display solutions (alongside each review displaying in review lightbox).

### Constraints
  + Numeric, 4 digits only
  + Allowed format: "YYYY"
  + No break space or special characters

### Examples
  + 2015
  + 2013


## **image_url**
----------

### Definition
  Vehicle image of the specific model range

### Usage
  This is used mainly in review e-mails and questionnaires, but also for the review displaying purposes (alongside individual review in the lightbox)

### Constraints
  + JPG or PNG
  + Min size 200x200px
  + No break space in URL
  + URL must start with http:// or https://

### Examples
  + http://www.pcworld.ie/Images/PCWorld/productimages//Large/190828_004.jpg


## **body_type**
----------

### Definition
  Standard body type name

### Usage
  Vehicle body type is used to aggregate, search and populate relevant reviews on the website.

  This will ensure the reviews displaying on the website are aggregated from vehicles of the specified body_type only. This aggregation will also filter on other attributes such as manufacturer, model, model_variant, doors and others

  We may reject a feed if it contains a body_type we do not recognize.

### Constraints
  + No break space or special characters
  + Allowed body types: hatchback / saloon / suv / mid-suv / crossover / retractable / fastback / sedan / estate

### Examples
  + hatchback
  + suv
  + sedan


## **doors**
----------

### Definition
  Number of doors

### Usage
  Number of doors is used to aggregate, search and populate relevant reviews on the website.

  This will ensure the reviews displaying on the website are aggregated from vehicles of the specified number of doors only. This aggregation will also filter on other attributes such as manufacturer, model, model_variant, body_type and others

### Constraints
  + Numeric, max 1 digit
  + No break space or special characters

### Examples
  + 2
  + 3
  + 5


## **used**
----------

### Definition
  Vehicle condition when sold.

  "0" means vehicle is being sold as brand new

  "1" means vehicle is being sold as second-hand / used

### Usage
  This is used to ensure reviews collected for new vehicles are separated from reviews collected for second-hand / used vehicles of the same manufacturer and model.

  This is mainly used when displaying and filtering reviews for used vehicles (used=1) on pages for used cars on the website.

### Constraints
  + 1 = Used Vehicle
  + 0 = New Vehicle

### Examples
  + 1
  + 0


## **vehicle_type**
----------

### Definition
  Type of the vehicle

### Usage
  This is used mainly for review collection but also for review product categorisation purposes (for data reporting when distinguishing between various vehicle types)

  We may reject a feed if it contains a vehicle_type we do not recognize

### Constraints
  + Allowed vehicle types: car / van / motorcycle / truck

### Examples
  + car
  + van
  + motorcycle


## **fuel_type**
----------

### Definition
  Fuel type is a type of motor fuel that provides power to motor vehicles

### Usage
   Fuel Type is used to aggregate, search and populate relevant reviews on the website.

  This will ensure the reviews displaying on the website are aggregated from vehicles of the specified fuel_type only. This aggregation will also filter on other attributes such as manufacturer, model, model_variant, doors and others

  We may reject a feed if it contains a fuel_type we do not recognise.

  This will be also displayed as additional review detail on our reviews display solutions (alongside each review displaying in review lightbox).

### Constraints
  + No break space or special characters
  + Allowed fuel types: petrol / diesel / hybrid / plug-in_hybrid / lpg / electric / hydrogen

### Examples
  + petrol
  + diesel
  + electric


## **transmission**
----------

### Definition
  Transmission is the mechanism by which power is transmitted from an engine to the axle in a motor vehicle

### Usage
  This will be displayed as additional review detail on our reviews display solutions (alongside each review displaying in review lightbox).

  This could also be used for displaying relevant reviews on the website on specific, very granular model pages.

  This will ensure the reviews displaying on the website are aggregated from vehicles of the specified transmission only. This aggregation will also filter on other attributes such as manufacturer, model, model_variant, body_type and others

  We may reject a feed if it contains a transmission we do not recognize

### Constraints
  + This attribute is required if displaying reviews by vehicle transmission
  + No break space or special characters
  + Allowed transmissions: manual / automatic / semi-automatic / electric / cvt

### Examples
  + manual
  + automatic
  + cvt


## **engine_size_in_liters**
----------

### Definition
  Engine size is a measurement of the engine capacity.

  The number is expressed in cubic centimeters (cc) and on engines with a capacity or displacement greater than 1,000cc (one litre) it’s usually rounded up to the nearest tenth of a litre

### Usage
  This will be displayed as additional review detail on our reviews display solutions (alongside each review displaying in review lightbox).

  This could also be used for displaying relevant reviews on the website on specific, very granular model pages.

  This will ensure the reviews displaying on the website are aggregated from vehicles of the specified engine size only. This aggregation will also filter on other attributes such as manufacturer, model, model_variant, body_type and others

### Constraints
  + Must be in litres
  + No break space or special characters

### Examples
  + 2.0
  + 1.0
  + 0.5


## **model_display**
----------

### Definition
  Model display usually consists of combination of manufacturer, model, and sometimes model variant name of the carline

### Usage
  Model display is used for review collection purposes only.

  It is used in emails and questionnaires send to customers.

### Constraints
  + Should be customer facing.
  + It is recommended to use a combination of manufacturer, model and model variant name, but can consists of any other name the customer wish to be used in the e-mails and questionnaires.
  + If missing, the system will default to "manufacturer" and "model" values instead

### Examples
  + Dacia Duster Access
  + KIA cee'd GT-Line
  + Land Rover RANGE ROVER VOGUE

## **spec_description**
----------

### Definition
  Description of full vehicle specification

### Usage
  This could be used as a reference in reporting, or other Reevoo tools

### Constraints
  + Max length 191 characters

### Examples
  + Dacia Sandero 1.5 dCi Laureate 5dr
  + Jaguar New XF 2.2d Luxury Auto [Keyless Entry]
  + HDi 92 EGC Start & Stop
