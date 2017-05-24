---
id: feeds-dealer-fields
layout: docs
title: Dealer fields
navId: docs
group: feeds
---

# Feeds

## Dealer Fields

### Summary

{: .documentation-table}
| Attribute                                      | Requirement | Type    | Max length |
|------------------------------------------------|-------------|---------|------------|
|[code](#code)                                   | mandatory   | text    | 191        |
|[name](#name)                                   | mandatory   | text    | 191        |

## **code**
----------

### Definition
  Unique dealership identifier

### Usage
  Dealer code is used to link Purchaser feed with Branch/Dealer feed so that we can identify name of the dealer where customer made a purchase and display reviews on the relevant website(s).

  Dealer code is used for review collection and review display purposes

### Constraints
  + URL friendly
  + Alphanumeric only
  + No break space

### Examples
  + D1234


## **name**
----------

### Definition
  Dealership name

### Usage
  Dealer code is used for review collection (name displays in emails and questionnaires send to customers) It is also used on the website (in review lightbox)

### Constraints
  + Display name

### Examples
  + Grand Bristol Motors
