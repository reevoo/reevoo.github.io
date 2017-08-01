---
id: experiences-public-api-cards
layout: docs
title: Experiences / Cards
navId: docs
---

# Experiences Cards

Returns a list of experiences cards.

## **Request**

`GET https://experiences-api.reevoo.com/api/v3/cards?trkref=:trkref&tags[]=location2:turkey&page_index=1&page_size=20`

### Parameters

{: .documentation-table}
| Parameter | Requirement   | Description |
|------------------|---------------|-------------|
|trkref            | mandatory     | Here you should use your unique account code, which Reevoo will have provided to you. |
|tags              | optional      | Array of tag descriptors. Only cards that have been tagged with all the provided tags will be returned. If no tags are provided or no content is available for the provided tags, then all available content for the trkref will be returned. Each tag descriptor has to be provided in format namespace:tag_key. Both namespace and tag_key have to be downcased and underscored. For example, if you want to provide two tags like "location1:london" and "general:bars_and_restaurants", you would add the following to the endpoint url:  tags[]=location1:london&tags[]=general:bars_and_restaurants|
|page_index        | optional      | Cards are paginated and ordered by most recent first. This value must be set to the page of cards required. If not provided it will default to 1 |
|page_size         | optional      | Cards are paginated and ordered by most recent first. This value must be set to the number of cards you want the endpoint to return per page. If not provided it will default to 20|


## **Response**

### Example
{% highlight json %}
{
  "summary": {
    "pagination": {
      "total_entries": 105,
      "total_pages": 6,
      "current_page": 1,
      "per_page": 20,
      "previous_page": null,
      "next_page": 2
    }
},
"cards": [
  {
    "id": "ab85f5c5-f6c6-4d59-9286-a8982dfb6b4a",
    "date": "2017-07-30 15:22:52 +0000",
    "verified": true,
    "user": {
      "id": 53380163,
      "first_name": "Frank",
      "location": "London"
    },
    "text_items": [
      {
        "text": "The views of Istanbul and the city itself"
        }
    ],
    "image_items": [
      {
        "url": "https://images.reevoo.com/reviews/f221336a-34ee-4923-acbe-e9d1071c640a/540x.jpg?compress=true",
        "caption": "Sunset in Istanbul"
      }
    ],
    "tags": [
      {
        "id": "6cd82efb-db79-4435-9d0a-50eca7da263c",
        "key": "general:memory"
      },
      {
        "id": "8328d0a5-1e35-43fd-930f-79bb0bb654df",
        "key": "location3:istanbul"
      },
      {
        "id": "9296933c-f4e7-4f50-8a05-531cc33eaddd",
        "key": "location2:turkey"
      },
      {
        "id": "f0afc28e-58de-42dd-9d31-31ad41247cd7",
        "key": "location1:e_europe_n_africa_and_portugal"
      }
    ],
    "product": {
      "name": "Levni Hotel Istanbul",
      "location1": "E Europe N Africa and Portugal",
      "location2": "Turkey",
      "location3": "Istanbul",
      "url": "https://wwww.url.where.the.product.that.this.card.refers.to.can.be.purchased",
      "purchase_description": "Holiday booked"
    }
  },
  { ... }, // another card
  { ... }, // another card
  ...
]
{% endhighlight %}

### Attributes

{: .documentation-table}
| Attribute | Description |
|-----------|-------------|
|summary                                                |                             |
|<span class="indent-1">pagination</span>               |                             |
|<span class="indent-2">total_entries</span>            |                             |
|<span class="indent-2">total_pages</span>              |                             |
|<span class="indent-2">current_page</span>             |                             |
|<span class="indent-2">per_page</span>                 |                             |
|<span class="indent-2">previous_page</span>            |                             |
|<span class="indent-2">next_page</span>                |                                                                                                             |
|cards                                                  |array of cards                                                                                               |
|<span class="indent-1">id</span>                       |card identifier                                                                                              |
|<span class="indent-1">date</span>                     |date when the card's contents were provided                                                                      |
|<span class="indent-1">verified</span>                 |whether the card's contents were provided by a verified purchaser of the product                             |
|<span class="indent-1">user</span>                     |the user who provided the card's contents                                                                   |
|<span class="indent-2">id</span>                       |internal identifier of the user who provided the card's contents                                             |
|<span class="indent-2">first_name</span>               |first name of the user who provided the card's contents                                                      |
|<span class="indent-2">location</span>                 |location of the user who provided the card's contents                                                        |
|<span class="indent-1">text_items</span>               |array of all textual comments/reviews in this card                                                           |
|<span class="indent-2">text</span>                     |comment or review                                                                                            |
|<span class="indent-1">image_items</span>              |array of urls of images in this card                                                                         |
|<span class="indent-2">url</span>                      |url of an image                                                                                              |
|<span class="indent-2">caption</span>                  |textual caption provided for the image                                                                       |
|<span class="indent-1">tags</span>                     |list of tags by which this card has been tagged                                             |
|<span class="indent-2">id</span>                       |internal tag id                                                                                              |
|<span class="indent-2">key</span>                      |tag descriptor                                                                                               |
|<span class="indent-1">product</span>                  |the product which the card content is about                                                            |
|<span class="indent-2">name</span>                     |name of the product                                                                                          |
|<span class="indent-2"><i>metadatafields</i></span>    |These are variable metadata fields which the retailer can send in their product feeds to Reevoo. As such the names and values of these metadata fields can be anything and will be aggreed between Reevoo and the retailer. See in the example above how it shows the following example metadata fields: location1, location2, location3, url and purchase_description.                          |
