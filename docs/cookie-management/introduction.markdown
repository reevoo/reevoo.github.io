---
id: introduction
layout: docs
title: Cookie Management Introduction
navId: docs
group: cookie-management
---

# Cookie Management

If you integrate Reevoo javascript library to your website, the library will drop 3 cookies (listed below) to clients browser.
Those cookies are required for full functionality of Reevoo components, but it is possible to disable its usage.
Reevoo javascript supports [Optanon cookie integration](https://www.cookielaw.org/) which enables you or users to control which
cookie is dropped to the browser.

List of cookies and its functionality

{: .documentation-table}
| Name | Usage  | Expiration | Optanon Group ID |
|------------------|---------------|-------------|
| ReevooStoredVotes | 1&nbsp;hour | Enable review helpfulness voting | 2 |
| reevoo_sp_id | 2&nbsp;years | Tracking cookie which persists information about a user's activity on the domain between sessions. It contains the following information: <br/> <br/> &bull; An ID for the user based on a hash of various browser attributes <br/> &bull; How many times the user has visited the domain <br/> &bull; The timestamp of the user's first visit <br/> &bull; The timestamp of the current visit <br/> &bull; The timestamp of the last visit <br/> &bull; The ID of the current session | 3 |
| reevoo_sp_ses | 30&nbsp;min | Tracking cookie. Its only purpose is to differentiate between different visits. | 3 |


## How to enable/disable cookie

As mentioned above, Reevoo javascript library supports [Optanon cookie integration](https://www.cookielaw.org/).
The logic behind is quite simple. When javascript library loads, it checks if `OptanonConsent` cookie is present. In case it is, then it reads its configuration for enabled and disabled groups and change initialization strategy regarding to it.

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

**Note: Disabling tracking cookie does not stop user to be tracked!** Tracking functionality just anonymize user and every page load is treated as visit of new person.
