---
id: experiences-getting-started
layout: docs
title: Experiences
navId: docs
group: experiences
---

# Getting started

Reevoo Experiences helps brands solve brand perception, customer acquisition and loyalty problems through authentic user-generated content. This content can influence consumers and drive them onwards on their purchase journey. It can range from photos and stories about road trips from car owners to destination tips from cottages owners to DIY tips from power drill owners, etc. For more information see [https://www.reevoo.com/experiences](https://www.reevoo.com/experiences).

We provide some widgets to display collected content on your page.

- Teaser: box that you can embed in your website and contains hand-picked content. It links to a Dock with some filters applied.
- Dock: filtered set of content Cards.
- Card: an individual piece of content (text and/or image).

This guide will help you to implement these widgets in your site.

## Setup

In the `<head>` of your page include the following line:

```html
<link href="//content.reevoo.com/experiences.css" rel="stylesheet">
```

Note: in case your stylesheets are using `!important` in html tags, some of our styles might look broken. If that is your case, include this line instead:

```html
<link href="//content.reevoo.com/experiences-important.css" rel="stylesheet">
```

Before the closing of the `<body>` tag, add the following:

```html
<script>
  window.afterReevooExperiencesLoaded = function() {
    reevoo.experiences.init({
      trkref: 'TRKREF',
      showCardDriver: true,
      styles: {
        brandColor: 'BRAND_COLOR'
      }
    });
  };
</script>
<script src="//content.reevoo.com/experiences.js"></script>
```

### Config values

The method `reevoo.experiences.init` accepts a series of configuration values:

{: .documentation-table}
| Name | Allowed values | Required | Default value | What it does |
|------|----------------|----------|---------------|--------------|
| `trkref` | trkref string | true | N/A | `'TRKREF'` should be replaced with your unique account code that will be provided by Reevoo. |
| `showCardDriver` | boolean | false | `false` | Shows context information in the Dock Cards about the original product purchased. We recommend to set this to true if you are embedding a Teaser in a non-product page. |
| `styles` | object | false | `null` | Some widget properties can be customised by adding values to this object. |
| `styles.brandColor` | hex color string | false | `'#2fcb59'` | `'BRAND_COLOR'` might be set with your brand main colour. This affects titles, button backgrounds and some links. |

Example:

```html
<script>
  window.afterReevooExperiencesLoaded = function() {
    reevoo.experiences.init({
      trkref: 'ABC123',
      showCardDriver: true,
      styles: {
        brandColor: '#ff0000'
      }
    });
  };
</script>
<script src="//content.reevoo.com/experiences.js"></script>
```


## Teaser

To include a Teaser in your page, you have 2 options. You can request a specific teaser by its ID or you can generate a teaser dynamically from provided tags, title and dock title.

**1) Request a specific teaser by its ID**

You need to provide a JSON config object in the `data-config` attribute of the widget tag.

```html
<div class="reevoo-widget-teaser" data-config='{"id": "TEASER_ID"}'></div>
```

### Config values

This is a list of the available properties for the Teaser:

{: .documentation-table}
| Name | Allowed values | Required | Default value | What it does |
|------|----------------|----------|---------------|--------------|
| `id` | uuid | true | N/A | `'TEASER_ID'` should be replaced with a valid teaser id provided by Reevoo. |



**2) Generate a teaser dynamically from tags, title and dock title**

You need to provide a JSON config object in the `data-config` attribute of the widget tag.

**Notice: The teaser is not displayed in the case that we can't find enough cards to fill the teaser. At this time it is 5 cards.**

```html
<div class="reevoo-widget-teaser"
  data-config='{
    "tags": ["location1:scotland", "general:walking_tips"],
    "title": "Walking tips for walking in Scotland",
    "dockTitle": "We asked our customers to share their walking tips"
  }'>
</div>
```

### Config values

This is a list of the available properties for the Teaser:

{: .documentation-table}
| Name | Allowed values | Required | Default value | What it does |
|------|----------------|----------|---------------|--------------|
| `tags` | array | true | N/A | Select cards with given tags. Each tag has to be provided in format `namespace:tag_key`. Both `namespace` and `tag_key` has to be **downcased** and **underscored**. |
| `title` | String | false | N/A | Define a teaser title |
| `dockTitle` | String | false | We asked real people | Define a dock title |
| `desktopLayout` | String | false | desktop-default | Define desktop layout. ex: 1rows-4columns |
| `mobileLayout` | String | false | mobile-default | Define mobile layout. ex: 1rows-4columns |

### Teaser sketch

[![Teaser sketch](/images/teaser_sketch.svg)](/images/teaser_sketch.svg)
