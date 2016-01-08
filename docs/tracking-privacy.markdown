---
id: tracking-privacy
title: Tracking and Your Privacy
layout: docs
navId: docs
---

# Tracking and Your Privacy

This article aims to answer the following questions:

- Who is Reevoo?
- How does tracking work?
- What information do you track when I use a website with Reevoo content on it, and why?
- What do you do with the information?
- How can I control what you track?
- Where can I read more about tracking?


## About Reevoo

[Reevoo](https://www.reevoo.com/) provides companies with opportunities to connect with their customers. Primarily this is done through [ratings and reviews](https://www.reevoo.com/products/ratings-and-reviews/), which we collect and display on their website.

In order to show reviews on a website, our customers add two things to their web pages:

1. ReevooMark: a [JavaScript library](http://javascript.about.com/od/reference/p/javascript.htm) that includes everything necessary to get reviews on the website.
2. Placeholders that are replaced with real content by ReevooMark when the page is loaded.

We deliver several types of content as part of our reviews service. *Badges* summarise the reviews of a product into a single average score, and are usually seen when comparing several products or at the top of the page. When a badge is clicked, you are taken to the *reviews* for the product.


## How Tracking Works

As well as delivering content, ReevooMark has the ability to send messages back to Reevoo. We do this when an event that we care about occurs; for example, if someone clicks on one of our badges, we will send a message back to Reevoo. This message will be stored by Reevoo in our database.

We also use [Google Analytics](https://www.google.co.uk/analytics/) to send and store some messages. Similar to ReevooMark, Google Analytics puts a JavaScript library on the website and provides the ability to send messages back to Google's database for use by Reevoo and the companies that use Reevoo.

When you first visit a website, Reevoo and Google Analytics will set [cookies](http://www.bbc.co.uk/privacy/cookies/about) on your device. Their names start with *reevoo* and allow us to identify you between web pages by a unique number. *(For more information on why we want to identify you between web pages, see the following section.)*


## What We Track and Why We Track It

**We want to give users the information they want easily.** In order to do this, we need to understand how users behave when using Reevoo's services. To do this, we track information on what users do and don't use. This involves tracking clicks on Reevoo content.

Every user has a different way of using our customers' websites. **We want to make sure that users can use Reevoo's services**, irrespective of their browser or device. We test out new features on a representative sample of devices and browsers to ensure compatibility. To determine what a "representative sample" is, we track information on what browsers and devices our users are using. We also track error messages, so we can investigate the issue and fix it for the future.

**We need to prove to our customers that we are valuable to them.** They usually have asked for Reevoo's services in order to increase sales or the time spent on their website. In order to prove that we do this, we track information on how long users spend reading reviews. We also track when users read reviews and then go on to purchase the product.

**We want to make sure our services are being used honestly**. Trust is fundamental to Reevoo's business, and if companies are hiding bad reviews or changing scores we need to do something about it. To ensure our services are being used correctly, we track information on requests for badges and reviews.

**We *do not* track any information that is linked to an individual**, such as a name or address. When you first visit a site you are given a unique number, and everything we track uses this number only.


## What We Do With The Information

The information that we collect is stored in our database or in Google Analytics, depending on the service used to send the message. This data is usually aggregated as it comes into the database to reduce the amount of storage space it takes up.

This information is used within Reevoo for the reasons described in the sections above. Our customers also have access to this information for their own analysis.

**Reevoo does not sell tracking information to anyone,** and we do not give your information to advertisers. 

We *do not* use tracking information to filter what you see from our services.


## Controlling Tracking

If you do not wish for your information to be used, you can take the following measures:

- If you have an ad blocker in your browser, add `t.mark.reevoo.com` and `skynet.reevoo.com` (we hope you enjoy the reference!) to your ad-blocking blacklist. This is our dedicated tracking URL, and all other features of ReevooMark will still work.
- To disable all Google Analytics traffic (not just Reevoo's), add `google-analytics.com` to your ad-blocking blacklist or download the [Google Analytics Opt-Out Browser Add-On](https://tools.google.com/dlpage/gaoptout/).
- You may want to [disable cookies](http://files.investis.com/info/disabling-cookies.html), although some non-tracking functionality may stop working if you do this.

## Further Information

- More on tracking from [How-To Geek](http://www.howtogeek.com/115483/htg-explains-learn-how-websites-are-tracking-you-online/).
- [The Good and Bad of Online Tracking](http://blog.thepitagroup.com/2012/the-good-and-bad-of-online-tracking/) from The Pita Group, a marketing agency.
- Google Analytics has been explained by [Wikipedia](https://en.wikipedia.org/wiki/Google_Analytics), [The Guardian](http://www.theguardian.com/technology/2012/apr/23/google-tracking-trackers-cookies-web-monitoring) and many others. It is bound by [Google's Privacy Policy](https://www.google.com/policies/privacy/).
- Our instructions to implementors for the tracking features of ReevooMark is [on this website](/docs/reevoomark/tracking/).
- Our tracking JavaScript library is open source! [Check it out here!](https://github.com/reevoo/reevoo-ping.js)
