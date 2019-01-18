---
id: introduction
layout: docs
title: Cookie Management Introduction
navId: docs
group: cookie-management
---

# Cookie Management

If you integrate Reevoo's JavaScript library on your website, the library will drop 3 cookies (listed below) in the client's browser.
Those cookies are required for full functionality of Reevoo components, but it is possible to disable their usage.
Reevoo's JavaScript library supports [Optanon cookie integration](https://www.cookielaw.org/) which enables you or users to control which
cookie is dropped in the browser.

**List of used Optanon cookie groups and its explanation**

{: .documentation-table}
| ID | Name  | Description |
|------------------|---------------|-------------|
| 2 | Performance Cookies | Measure which pages are visited by the consumers. E.g. Google Analytics |
| 3 | Functional Cookies | Enable the site to provide enhanced functionality and personalization. E.g. Sitecore Personilisation |


**List of cookies and its functionality**

{: .documentation-table}
| Name | Expiration | Usage | Optanon Group ID |
|------------------|---------------|-------------|
| ReevooStoredVotes | 1&nbsp;hour | Enable review helpfulness voting | 3 |
| reevoo_sp_id | 2&nbsp;years | Tracking cookie which persists information about a user's activity on the domain between sessions. It contains the following information: <br/> <br/> &bull; An ID for the user based on a hash of various browser attributes <br/> &bull; How many times the user has visited the domain <br/> &bull; The timestamp of the user's first visit <br/> &bull; The timestamp of the current visit <br/> &bull; The timestamp of the last visit <br/> &bull; The ID of the current session | 2 |
| reevoo_sp_ses | 30&nbsp;min | Tracking cookie. Its only purpose is to differentiate between different visits. | 2 |


## How to enable/disable cookie

As mentioned above, Reevoo's JavaScript library supports [Optanon cookie integration](https://www.cookielaw.org/).
The logic behind this is quite simple. When the JavaScript library loads, it checks if `OptanonConsent` cookie is present. If so, it reads its configuration for enabled and disabled groups and changes the initialization strategy regarding to it.

**Note: Disabling tracking cookie does not stop user to be tracked! Tracking functionality just anonymizes the user and every page load is treated as a visit of a new person.**


#### Examples of OptanonConsent cookie setting.

**Disable Helpfullness Voting Cookies**
```javascript
document.cookie = "OptanonConsent=groups=3:0"
```

**Disable Tracking Cookies**
```javascript
document.cookie = "OptanonConsent=groups=2:0"
```

**Disable All Cookies**
```javascript
document.cookie = "OptanonConsent=groups=3:0,2:0"
```

**Enable All Cookies**
```javascript
document.cookie = "OptanonConsent=groups=3:1,2:1"
```
