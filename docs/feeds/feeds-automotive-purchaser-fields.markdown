---
id: feeds-automotive-purchaser-fields
layout: docs
title: Automotive Purchaser Fields
navId: docs
group: feeds
---

# Feeds

## Automotive Purchaser Fields

### Summary

{: .documentation-table}
| Attribute                                      | Requirement | Type    | Max length |
|------------------------------------------------|-------------|---------|------------|
|[sku](#sku)                                     | mandatory   | text    | 191        |
|[first_name](#first_name)                       | mandatory   | text    | 80         |
|[email](#email)                                 | mandatory   | text    | 191        |
|[purchase_date](#purchase_date)                 | mandatory   | date    | n/a        |
|[customer_ref](#customer_ref)                   | mandatory   | text    | 64         |
|[order_ref](#order_ref)                         | mandatory   | text    | 64         |
|[delivery_date](#delivery_date)                 | mandatory   | date    | n/a        |
|[dealer_code](#dealer_code)                     | mandatory*  | text    | 191        |
|[google_place_id](#google_place_id)             | mandatory*  | text    | 40         |
|[autotrader_dealer_id](#autotrader_dealer_id)   | mandatory*  | number  | 15         |
|[title](#title)                                 | optional    | text    | 24         |
|[country](#country)                             | optional    | text    | 40         |
|[price](#price)                                 | optional    | float   | 191        |
|[currency](#currency)                           | optional    | text    | 3          |
|[vehicle_registration](#vehicle_registration)   | optional    | text    | 191        |
|[vin](#vin)                                     | optional    | text    | 191        |
|[salesexec](#salesexec)                         | optional    | text    | 191        |

## **sku**
----------

### Definition
  Unique model identifier

### Usage
  SKU is used to link Product feed with Purchaser feed (customer sales data) so that Reevoo system can identify product that customer purchased and use the relevant car information in email/questionnaire send to customer.

  Failure to provide SKU information in Product feed will result not only in customer data not being processed for that particular SKU- which can seriously impact review collection, but also not being able to populate reviews collected for products New SKU/set of SKUs must be provided in Product feed prior to provision of Purchaser feed.

### Constraints
  + URL friendly
  + Alphanumeric only
  + No break space

### Examples
  + DR26BBA1234
  + 234172
  + ss124


## **first_name**
----------

### Definition
  Customer's first name

### Usage
   Customer's first name is used in e-mail and questionnaires send to customers.

  This will be also displayed as additional review detail on our reviews display solutions (alongside each review displaying in review lightbox).

### Constraints
  + Does not include customer's surname.
  + No break space

### Examples
  + John


## **email**
----------

### Definition
  Customer's email address

### Usage
  Customer's email address is used to contact/invite customer to fill in Reevoo questionnaire.

### Constraints
  + Valid email address
  + Encrypted after processed

### Examples
  + jon.smith@email.com


## **purchase_date**
----------

### Definition
  Date when the vehicle was sold to the customer

### Usage
   Purchase date is used (when delivery_date is not available) for email scheduling rules to estimate when the e-mail should be sent to customer (x number of days after they bought a vehicle).

  This might be also displayed as additional review detail on our reviews display solutions (alongside each review displaying in review lightbox).

### Constraints
  +  Allowed formats: "DD/MM/YYYY" or "DD-MM-YYYY" or "YYYYMMDD"

### Examples
  + 19/12/2015
  + 19-12-2015
  + 20151219

## **customer_ref**
----------

### Definition
  Customer's unique reference number

### Usage
   Customer's unique reference is used for e-mail sending rules to ensure the same emails are not send to a single customer multiple times.

  Customer's unique reference can be used for reporting purposes.

### Constraints
  + No break space

### Examples
  + CUST29054


## **order_ref**
----------

### Definition
  Purchase reference of the product(s) sold within the same purchase

### Usage
  Order reference or purchase number is used for e-mail sending rules to ensure multiple emails are not sent to a customer for a single order.

  This would be used when single customer bought multiple vehicles/products within a single transaction.

  Customer's unique reference can be used for reporting purposes

### Constraints
  + No break space or special characters

### Examples
  + 849AB9053


## **delivery_date**
----------

### Definition
  Date when a product was delivered

### Usage
  Delivery date is used for email scheduling rules to estimate when the e-mail should be sent to customer (x number of days after a product was delivered).

  This might be also displayed as additional review detail on our reviews display solutions (alongside each review displaying in review lightbox).

### Constraints
   + Allowed formats: "DD/MM/YYYY" or "DD-MM-YYYY" or "YYYYMMDD"

### Examples
  + 19/12/2015
  + 19-12-2015
  + 20151219


## **dealer_code**
----------

### Definition
  Dealership code is referencing dealership name (taken from Branch / Dealer code feed) where the specific sale took place

### Usage
  Dealer code is used to link dealership name gathered from "Branch/Dealership feed" where the vehicle sale took place.

  It is used in emails and questionnaires sent to customers, for review collection purposes.

  It is also used to display reviews on the website that are filtered by dealership. It allows displaying customer experience reviews on dealership websites.

  This will be also displayed as additional review detail on our reviews display solutions (alongside each review displaying in review lightbox).

  \* This is required if displaying individual dealership reviews on the website that can be filtered by dealer_code.

### Constraints
  + URL friendly
  + Alphanumeric only
  + No break space

### Examples
  + D1234


## **google_place_id**
----------

### Definition
  Google Place IDs uniquely identify a place in the Google Places database and on Google Maps

### Usage
  More information can be accessed via link here: https://developers.google.com/places/place-id

  \* This is required for sending reviews to Google My Business.

### Constraints

### Examples
  + ChIJF6Kftcm23fcr-Jib130oiHo


## **autotrader_dealer_id**
----------

### Definition
  Auto Trader Dealer IDs uniquely identify a dealer on Auto Trader platform.


### Usage
  \* This is required for displaying CX reviews on Auto Trader.

### Constraints

### Examples
  + 20380


## **title**
----------

### Definition
  Customer's title

### Usage
  Customer's title is used together with customer's surname in email and questionnaires send to customers when
  customer's first name was not selected as option to refer to customer in the email.

### Constraints
  + No break space or special characters

### Examples
  + Mr


## **country**
----------

### Definition
  Country in which customer lives

### Usage
  Country can be used for reporting purposes.

### Constraints
  + ISO 3166-1 alpha-2 country code

### Examples
  + United Kingdom


## **price**
----------

### Definition
  Price the customer paid for the vehicle

### Usage
  Price can be used for reporting purposes.

### Constraints
  + No break space or special characters

### Examples
  + 12000


## **currency**
----------

### Definition
  Currency in which the customer paid for the vehicle

### Usage
  Currency can be used for reporting purposes.

### Constraints
  +  ISO 4217 currency code
  + No break space or special characters

### Examples
  + GBP


## **vehicle_registration**
----------

### Definition
  Vehicle registration number of the vehicle bought

### Usage
  Vehicle registration number can be used for reporting purposes.

  \* This attribute is required for clients who would like to run reports on this value

### Constraints

### Examples
  + XY1234Z


## **vin**
----------

### Definition
  VIN is a Vehicle Identification Number

### Usage
  VIN number can be used for reporting purposes.

  \* This attribute is required for clients who would like to run reports on VIN

### Constraints

### Examples
  + JLAKJF123456778


## **salesexec**
----------

### Definition
  Sales Executive/Manager name or code.

  This referencing a person who made the sale

### Usage
  Salesexec can be used for reporting purposes.

  \* This attribute is required for clients who would like to run reports on sales executive

### Constraints

### Examples
  + SP9654
