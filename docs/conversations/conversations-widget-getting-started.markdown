---
id: conversations-widget-getting-started
layout: docs
title: Conversations
navId: docs
group: conversations
---

# Getting started

Reevoo Conversations provides a system that allows users to interact with content on customer sites.

Features include:

- Drop-in widget to allow customers to add comments to any part of their site.
- Comments with hierarchical replies and split into several sections.
- User-reported vetting of responses.
- Ask an Expert - send your question to self-proclaimed experts to answer.

## Setting you up as an Content Provider

To be able to use Reevoo's Conversations Widget you will need to get in contact with us so we can set you up as a content provider in our system.

The information we will need from you in order to set you up is the following:

- **Organisation Name**: This name will be used as an identifier for your organisation in our side, and you will need to use it as part of the api calls made in order to create content ids and user profiles. More about this in following sections below.
- **Url of the login page in the the website where you will be using our conversations widget**: Once the widget is in your page, for users to be able to comment, they will need to be logged in. The widget will display a link to a login page. The link will redirect the user to the login page url that you provide to us. In your login page, once the user logs in, you will need to set up a special cookie that will allow the widget to identify the user as a logged in user. More details on this in following sections.
- **Url of your organisation's logo image to include in email notifications**: When users post comments, other users that contributed to the same conversation, or whose comments are being replied to, will get email notifications. The email templates are configurable to include your organisation's logo in the email header, if you provide us with one.

Once we set you up in our system, we will provide you with the following two pieces of very important information:

- A **Provider Secret** : You will use this when issuing calls to our API in order to created/update content ids and user profiles.
- A **User Secret**: You will use this when creating the user authentication cookie after the user log in. More details on this in sections below.

You must keep this information secret! It should be treated like passwords. Attackers will be able to impersonate your organisation or your users with this information if they get hold of it, so keep it safe!


## Creating Content Ids

You can place as many conversations widget in your site as you wish, but every conversations widget must be linked to a specific content id in our system.

So before you place a conversations widget instance in your site, you will need to make a call to our API to request the creation of a content id to use with that widget instance.

To request the creation of a content id, you must issue and API call as below:

```html
Method: POST
URL: https://comments-api.reevoo.com/v1/content
Headers:
  Content-Provider: PROVIDER_NAME
  Provider-Secret: PROVIDER_SECRET
  Content-Type: application/json
Body:
  {
    // Required: the url of the page in your website where this conversations widget will be placed.
    "url": "http://my-site.com/article/123",

    // Required: types of threads shown on the Widget.
    "thread_types": ["tip", "question"],

    // Optional: A list of tags that will be linked to the content in our side,
    // so we can identify what the content is about.
    // This will be used when selecting experts to be notified by email about user's questions.
    "tags": ["carpentry", "garden"]
  }
```

*PROVIDER_NAME*, in the Content-Provider header above, should be replaced by the *Organisation Name* that you provided to us when we set you up as a content provider. See section **Setting you up as an Content Provider** above.

*PROVIDER_SECRET*, in the Provider-Secret header above, should be replaced by the *Provider Secret* that we gave to you after setting you up as a content provider. See section **Setting you up as an Content Provider** above.

As for the rest of the parameters in the body section of the api call above, their description is as follow:

{: .documentation}
|url*                                            |Here you need to provice the exact url of the page where you are going to place this instance of the conversations widget. This is important as, if the user is not logged in, the widget will redirect the user to a login page, and will use this url to know how to redirect the user back to the widget page after the login.|
|thread_types*                                   |Here you specify the thread types that you want this instance of the widget to include. We have three different types of threads: *tip*, *question* and *comment*. You can request your content to have only one of them, or two, or the three of them if you wish. The widget will display a tab per each thread type. Conceptually, the "tip" thread is for users to post tips; the "question" thread is for users to post questions; and the "comment" thread is for users to post general comments. But any user can post and reply in any of the threads without restriction. The "question" type of thread is special in the sense that when someone posts a question, the system is configured to identify other users that are subscribed as experts to any of the tags linked to the content, and send those users an email notification asking them to reply to the question. But any other user can reply to the question as well, even if they are not subscribed as experts. The only difference is that they will not receive email notifications when someone posts a question.|
|tags                                            |Here you specify a list of tags associated to the content. Normally, if the content is going to talk about carpentry for example, you would send the tag "carpentry", so when we create the content on our side, we know what the content is about. Tagging your content is very important, especially when you configure your widget to include the thread type "question". This is because when users post questions in the "question" thread, we can automate the sending of notification emails to other users that are subscribed as experts in the subject, so they can provide answers quicker. The way we identify which users are experts in the subject is by looking for users that share any of the tags linked to the content. We will explain later how you can link tags to users. If you do not provide tags for your content, then when users post questions in the thread, nobody will get notified by email, although the questions can still get answered by any user in the system that happens to see the questions and wishes to reply to them. The email notifications are only to alert the experts so they can answer quicker.|

*Attributes marked with * are mandatory*


The reponse to this API call will be as below:

```html
{
  "id": "f46bdb24-cacb-49fc-a049-6876b10cc783",
  "threads": [

  ],
  "more_available": false,
  "login_url_template": "http://my-site.com/login?returnurl=redirect_url"
}

```


Make sure you keep the "id" value safe, as you will need to use this value when you place the conversations widget in your page. This will be explained in the section **Placing the Conversations Widget in your page**, down below in this document.

## Placing the Conversations Widget in your page.

Wherever you want the Comments Widget to show in your page, put the following custom HTML tag:

```html
<reevoo-comments-widget content-id='CONTENT_ID'></reevoo-comments-widget>
```

Replace *CONTENT_ID*  by the id value you obtained when you requested the creation of the content, as described in section **Creating Content Ids** above.

Also, at the end of your page, just before the closing of your html \</body\> tag, add the following css and javascript links, these are needed for the widget to function properly and to have the correct css styling:

```html
<link type='text/css' rel='stylesheet' href='https://comments.reevoo.com/css/widgets.css' />
<script type='text/javascript' src='https://comments.reevoo.com/js/widgets.js'></script>
```

That's all you need. If you reload your page, you should be able to see the conversations widget in your page.


## Localisation
To change the default language (English) of the conversations widget add the following script before the `widgets.js` script tag, making sure to change `LOCALE_REF` for one of the supported locale references listed below:

```js
<script>
  window.reevoo = window.reevoo || {};
  window.reevoo.locale = 'LOCALE_REF'
</script>
```

Supported locales:
- Danish `da_DA`
- Dutch `nl_NL`
- Finnish `sv_FI`
- French `fr_FR`
- German `de_DE`
- Greek `el_EL`
- Hungarian `hu_HU`
- Italian `it_IT`
- Norwegian `no_NO`
- Polish `pl_PL`
- Portuguese `pt_PT`
- Slovakian `sk_SK`
- Spanish `es_ES`
- Swedish `sv_SE`

The default/fallback locale is `en_GB` so ignore this section if the language you require is English.


## Creating User Profiles.

In order for users to be able to post comments in the conversations widget, they need to have a profile in Reevoo's system.

The creation of profiles is your responsability. We provide a user profile endpoint in our API that you need to call when you want to create a new user profile, or update an existing user profile.

Adding or updating a user profile is done from the same endpoint. Based on the "external_user_id" value, we will identify whether the user profile already exists in our system and we need to treat the call as an update, or if the user profile does not exist in our system and therefore we need to treat the call as an update.

To request the creation or update of a user profile, you must issue an API call as below:


```html
Method: POST
URL: https://comments-api.reevoo.com/v1/user/profile?external_user_id=EXTERNAL_USER_ID
Headers:
  Content-Provider: PROVIDER_NAME
  Provider-Secret: PROVIDER_SECRET
  Content-Type: application/json
Body:
  {
    "name": "John Doe",
    "email": "new@email.com",
    "avatar_url": "http://widgets.reevoo.com/img/anonymous.png",
    "tags": ["carpentry", "garden"]
  }
```

*PROVIDER_NAME*, in the Content-Provider header above, should be replaced by the *Organisation Name* that you provided to us when we set you up as a content provider. See section **Setting you up as an Content Provider** above.

*PROVIDER_SECRET*, in the Provider-Secret header above, should be replaced by the *Provider Secret* that we gave to you after setting you up as a content provider. See section **Setting you up as an Content Provider** above.

*external_user_id*, is a unique identifier for the user in your system. Make sure to replace "EXTERNAL_USER_ID" in the API call url by the specific unique identifier of the user for which you are creating or updating a profile.

As for the rest of the parameters in the body section of the api call above, their description is as follow:

{: .documentation}
|name                                            |Name or alias of the user, it will be shown next to their comments and replies in the conversations widget.|
|avatar_url                                      |Url to an image that will be used as an avatar for the user. The avatar image will be shown next to their comments and replies in the conversations widget.|
|email                                           |Email address of the user. It will be used to send the user email notifications when somebody replies to any of their posts. Or to send them notifications about questions if they are subscribed as experts in the subject.|
|tags                                            |Here you specify a list of tags associated to the user. Normally these tags will denote a list of subjects this user knows about. Remember when you request the creation of a content id (see section **Creating Content Ids** above), you could specify a list of tags for the content. Tagging your users and your content is very important, especially when you configure your widget to include the thread type "question". This is because when users post questions in the "question" thread, we can automate the sending of notification emails to other users that are subscribed as experts in the subject, so they can provide answers quicker. The way we identify which users are experts in the subject is by looking for users that share any of the tags linked to the content. If you do not provide tags for your users, then when users post questions in the thread, nobody will get notified by email, although the questions can still get answered by any user in the system that happens to see the questions and wishes to reply to them. The email notifications are only to alert the experts so they can answer quicker.|



## Login Users so they can post in the Conversations Widget.



* When a user navigates to your website and loads a page that contains Reevoo's conversations widget, the widget will look for the presence of a special authentication cookie with the following name: **reevoo.auth**.
* If the authentication cookie is not present, the widget will show a link with the text "You must be logged in to post. Click here to log in."
* When the user clicks on the "Click here to log in" link, they will be redirected to the login page that you provided to us when we set you up as a content provider. See the section **Setting you up as an Content Provider** above for details.
* Note that the widget, when it redirects the user to your login page, it adds a query string parameter named "redirect_to", that will contain the url of the page where the widget is placed. Your login page should use this redirect_to parameter to send the user back to the widget page after the login is completed.
* Once in your login page, we expect you to set the cookie "reevoo.auth" with the appropriate value, and after that, redirect the user back to the page where the conversations widget is placed. In order to generate the authentication cookie for a user, you will need the following 4 pieces of information:

{: .documentation-table}
| Name | What it is |
|------|------------|
| `SESSION_ID` | The SESSION_ID is a unique identifier for this authentication session. Can be any random number, is up to you. A good example would be the current timestamp. |
| `EXTERNAL_USER_ID` | This needs to be the same external_user_id value that you provided to us in the call to our API when you requested the creation of a user profile for the user for which you are generating the authentication cookie. See section **Creating User Profiles** above.|
| `PROVIDER_NAME` | This is the *Organisation Name* that you provided to us when we set you up as a content provider. See section **Setting you up as an Content Provider** above. |
| `USER_SECRET` |  This is the *User Secret* that we gave to you after setting you up as a content provider. See section **Setting you up as an Content Provider** above. |

*  Once you have the previous 4 pieces of information, you need to generate a signature with them. To generate the signature, just concatenate those 4 values in the same order given above, and apply to the concatenated string the SHA256 hashing algorithm. The signature will be the resulting hash. See below an example of how you would generate this signature in ruby:

```ruby
 require 'digest'

 SESSION_ID = '20150101120000'
 EXTERNAL_USER_ID = 'john.smith.2016'
 PROVIDER_NAME = 'Hotels 4 You'
 USER_SECRET = '42c86d677b902eb29662e6bdeed79d1c4c36809a590cd8f2e90'

 SIGNATURE = Digest::SHA256.hexdigest("#{SESSION_ID}#{EXTERNAL_USER_ID}#{PROVIDER_NAME}#{USER_SECRET}")

```

* Once you have generated the signature. You need to set a cookie with name **reevoo.auth**. Make sure the cookie is set in the same domain as the domain where the conversations widget is placed. This is important, as if you set the cookie with a different domain than the one where the widget is placed, authentication will not work. The value of the cookie needs to be the concatenation of the following 4 pieces of information separated by forward slash: SESSIONS_ID, EXTERNAL_USER_ID, PROVIDER_NAME and the signature you generated in the previous step. See example below of how these four pieces of information need to be concatenated:


```ruby

    cookie_value = SESSION_ID/EXTERNAL_USER_ID/PROVIDER_NAME/SIGNATURE

```

* Finally, after setting the cookie, redirect the user back to the page where the conversations widget is placed. The widget will identify the user as a logged in user, and will allow them to post comments.


## Troubleshooting

### My widgets don't appear!

By default, if a widget encounters a problem on its initial load it will hide itself from the page. The widget will also log an error to the console and send an error report to us (if it can!).

Check the error report in the console for more information. Typically this is because the CONTENT ID does not exist, so check your CONTENT ID carefully.


### The styles seem wrong!

All Reevoo Widget CSS is stored behind a base class (such as .reevoo-comments-widget) that aims to isolate the widget from the rest of your page. However, in certain circumstances the existing CSS for the page will interfere with the widget. This is especially true if CSS's !important attribute has been used when styling.

Check the CSS for the offending element to see whether the page's CSS is interacting with it. If it is, consider reducing the scope of your CSS selector to avoid interfering with the widget.
