---
id: experiences-getting-started
layout: docs
title: Experiences
navId: docs
group: experiences
---

# Getting started

Reevoo Experiences helps brands solve brand perception, customer acquisition and loyalty problems through authentic user-generated content. This content can influence consumers and drive them onwards on their purchase journey. It can range from photos and stories about road trips from car owners to destination tips from cottages owners to DIY tips from power drill owners, etc. For more information see [https://www.reevoo.com/experiences](https://www.reevoo.com/experiences).

We provide two types of widgets to display collected content on your page.

- Experiences Teaser: box that you can embed in your website and contains a sample of hand-picked content. When clicked, the teaser will open an overlay listing of all the cards which meet the teaser filter configuration.
- Experiences Embedded: Widget that displays a container with a mosaic of all the cards that meet the widget filter configuration, directly embedded in your page. The widget includes pagination so users can browse through the full content.

This guide will help you to implement these widgets in your site.

## Setup

#### Include experiences css link

To include experiences css link, which is needed for the correct rendering of the widgets, please include the following line in the `<head>` of your page:

```html
<link href="//content.reevoo.com/experiences.css" rel="stylesheet">
```

Note: in case your stylesheets are using `!important` in html tags, some of our styles might look broken. If that is your case, include this line instead:

```html
<link href="//content.reevoo.com/experiences-important.css" rel="stylesheet">
```

#### Include experiences javascript link

In order for the experiences widgets to be able to render, you also need to include the following javascript link just before the closing of the `<body>` tag in your page:

```html
<script src="//content.reevoo.com/experiences.js"></script>
```

#### Example page after css and javascript setup

So after the css and javascript setup, your page should look like below:

```html
<html>
    <head>

        // any other non-reevoo head content

        <link href="//content.reevoo.com/experiences.css" rel="stylesheet">
    </head>

    <body>

        // all the contents of you body here....

        <script src="//content.reevoo.com/experiences.js"></script>
    </body>
</html>
```


## Experiences Teaser

To include the experiences teaser in your page, you have 2 options. You can generate a teaser on the fly by providing a number of configuration and filtering parameters to the widget; or if Reevoo has provided
to you a pre-configured teaser id, you can render that teaser by providing the teaser id to the widget. For more details about these two ways of including a teaser, read the sections
below.

#### Teaser sketch

[![Teaser sketch](/images/teaser_sketch.svg)](/images/teaser_sketch.svg)

**1) Generate a teaser on the fly**

As long as the page where you are including the teaser has been setup with the experiences css and javascript as explained in the previous section, you can include the teaser
anywhere in your page by adding the following web component html (with your own custom values for each of the web component attributes):

```html
<reevoo-experiences-teaser
    tags="location1:scotland,general:cycling_tips"
    teaser-title="Walking in Scotland"
    overlay-title="Walking in Scotland"
    trkref='ABC123'
    desktop-layout="desktop-default"
    mobile-layout="mobile-default"
    styles-brand-color="red"
    show-teaser-cards-driver
    show-teaser-cards-text
    target-url="https://www.reevoo.com" />
```

Find below a description of each of the attributes in the web component:

{: .documentation-table}
| Name             | Required | Default value | Description |
|------------------|----------------|----------|---------------|--------------|
| tags | true | N/A | A comma separated list of tags. The teaser and associated overlay will only display content that has been tagged with all the provided tags. Each tag has to be provided in format `namespace:tag_key`. Both `namespace` and `tag_key` have to be **downcased** and **underscored**.|
| teaser-title | false | N/A | Define a teaser title. |
| overlay-title | false | We asked real people | Title of the overlay list of cards that opens when the teaser is clicked. |
| trkref | true | N/A | Here you should use your unique account code, which Reevoo will have provided to you. |
| desktop-layout | false | desktop-default | Define desktop layout. ex: 1rows-4columns. |
| mobile-layout | false | mobile-default | Define mobile layout. ex: 1rows-4columns. |
| styles-brand-color | false | #2fcb59 | This color affects titles, button backgrounds and some links. You can provide any colour name or hex value supported as a CSS colour. |
| <nobr>show&#45;teaser&#45;cards&#45;driver</nobr> | false | N/A | This attribute does not have a value. If the attribute is present, every card in the teaser will display a driver link to the associated product. Otherwise the driver link will not be available. |
| show-teaser-cards-text | false | N/A | This attribute does not have a value. If the attribute is present, caption text will be hidden on the teaser cards, which will only display user name, location, and image. Otherwise, caption text will be displayed along. |
| target-url | false | N/A | As default, click on teaser will open overlay collection. But there can be the case where you want to redirect user to specific url. In this case pass the url as a value of *target-url* attribute |

**2) Request a specific teaser by its ID**

Make sure the page where you are including the teaser has been setup with the experiences css and javascript (see above for details). You can include the teaser
anywhere in your page by adding the following web component html (with your own custom values for each of the web component attributes):

```html
<reevoo-experiences-teaser
    teaser-id="78b18b1b-40b9-4fd3-a085-220658e8760b"
    trkref='ABC123'
    styles-brand-color="red"
    show-teaser-cards-driver
    show-teaser-cards-text />
```

Find below a description of each of the attributes in the web component:

{: .documentation-table}
| Name             | Required | Default value | Description |
|------------------|----------------|----------|---------------|--------------|
| teaser-id | true | N/A | The teaser id value will be provided to you by Reevoo. |
| trkref | true | N/A | Here you should use your unique account code, which Reevoo will have provided to you. |
| styles-brand-color | false | #2fcb59 | This color affects titles, button backgrounds and some links. You can provide any colour name or hex value supported as a CSS colour. |
| <nobr>show&#45;teaser&#45;cards&#45;driver</nobr> | false | N/A | This attribute does not have a value. If the attribute is present, every card in the teaser will display a driver link to the associated product. Otherwise the driver link will not be available. |
| show-teaser-cards-text | false | N/A | This attribute does not have a value. If the attribute is present, caption text will be hidden on the teaser cards, which will only display user name, location, and image. Otherwise, caption text will be displayed along. |


**Note:** The teaser widget, whether generated on the fly or by id, will not display if there are not enough cards available to fill the chosen layout.


## Experiences Embedded

To include experiences embedded in your page, make sure the page has been setup with the experiences css and javascript (see above for details), and then add the following web component html to your page (with your own custom values for each of the web component attributes):


```html
<reevoo-experiences-embedded
    embedded-title="Cycling near Exeter - customer experiences"
    description="Many of our guests have had such a great time cycling near Exeter that they were happy to share some of their cycling experiences with others. Their experiences were independently collected by Reevoo, the company that also collects and displays the reviews on our website."
    tags="location1:england,general:cycling_tips"
    trkref="ABC123"
    pagination
    styles-brand-color="red"
    show-card-driver
    spotlight-action-button-title="VIEW COTTAGE" />
```

Find below a description of each of the attributes in the web component:

{: .documentation-table}
| Name             | Required | Default value | Description |
|------------------|----------------|----------|---------------|--------------|
| embedded-title | false | N/A | If a title is provided, it will be displayed at the top of the embedded cards container. |
| description | false | N/A | If a description is provided, it will be displayed at the top, as a sub-header, in between the embedded container title and the cards. |
| tags | true | N/A | A comma separated list of tags. The embedded cards container will only display content that has been tagged with all the provided tags. Each tag has to be provided in format `namespace:tag_key`. Both `namespace` and `tag_key` have to be **downcased** and **underscored**.|
| trkref | true | N/A | Here you should use your unique account code, which Reevoo will have provided to you. |
| styles-brand-color | false | #2fcb59 | This color affects titles, button backgrounds and some links. You can provide any colour name or hex value supported as a CSS colour. |
| pagination | false | N/A | This attribute does not have a value. If the attribute is present, the embedded cards container will display classic numbered pagination links by which users can browse the full content. If this attribute is not present, there will be a "More" button at the botton of the container, through which the user can load the next page worth of cards in an infinite scrolling style.|
| <nobr>show-card-driver</nobr> | false | N/A | This attribute does not have a value. If the attribute is present, every card in the embedded container will display a driver link to the associated product. Otherwise the driver link will not be available. |
| <nobr>spotlight-action-button-title</nobr> | false | MORE | When you click on a card in the embedded container, the card will open in spotlight view. The spotlight view includes a button to visit the product page associated to the card. You can use this property to configure the label of the button. |
