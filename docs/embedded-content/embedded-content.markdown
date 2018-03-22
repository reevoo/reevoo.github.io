---
id: embedded-content
layout: docs
title: Embedded Content Implementation Guide
navId: docs
group: embedded-content
---

<b>Note</b>:  This guide explains how to implement our server side embedded reviews and conversations solution (using one of our server side client libraries: Java/JSP, PHP, ASP/.NET or Ruby). Since search engines now crawl javascript, we also offer as an alternative a full client side implementation for our embedded content. If you prefer to implement using our full client side solution, you can find instructions in the following links:
<br/><br/>
* [Full client side implementation of embedded Product Reviews](/docs/reevoomark/embedded-product-reviews/)<br/>
* [Full client side implementation of embedded Customer Experience Reviews](/docs/reevoomark/embedded-customer-experience-reviews/)<br/>
* [Full client side implementation of embedded Conversations](/docs/reevoomark/embedded-conversations/)<br/>


# Overview
Fresh, crawl-able, and frequently updated reviews can provide great content for search engines to discover and index. The ReevooMark in-line SEO module allows merchants to embed reviews on product pages, or customer experience reviews on any page, easily and efficiently with seamless integration with the standard ReevooMark product.

Our technical integration is:

* Straightforward to setup and implement
* Supports high volume web sites by automatically handling efficient storage and caching of data
* Automatically handles frequently updating review content
* Integrates seamlessly with the standard ReevooMark product

<br/><br/>
<img alt="embedded product reviews" src="/images/seo/seo_1.png" width="600px" />

## Detail

The ReevooMark in-line SEO module comes in the shape of platform-specific tag libraries that, once implemented, automatically take care of fetching the correct review content for a product or retailer and caching that content according to a set of rules, rendering that content within the enclosing page, and interacting appropriately with the standard ReevooMark product.

#### Tag Library Installation

We provide 4 different versions of the ReevooMark tag library, one for each of the major platforms we support: PHP, Java/JSP, ASP/.NET and Ruby. Each of the different tag libraries take advantage of the different caching infrastructure available to them from the enclosing framework to ensure that content is appropriately cached and available to the calling page with a low overhead. It has been successfully deployed within very high volume sites such as the Telegraph Online and a myriad of publishers, retailers and manufacturers.

Reevoo’s tag libraries are open-source and available on GitHub. We welcome contributions to any of our hosted projects on GitHub. Please click on the appropriate link below, according to your platform's language, to find detailed instructions on how to use our tag library to embed review content in your site.

* [**Java/JSP**](https://github.com/reevoo/reevoomark-java-api)
* [**PHP**](https://github.com/reevoo/reevoomark-php-api)
* [**ASP/.NET**](https://github.com/reevoo/reevoomark-dotnet-api)
* [**Ruby**](https://github.com/reevoo/reevoomark-ruby-api)

<br/>
**Note:** We also provide connectors for leading eCommerce platforms IBM WebSphere Commerce, hybris, Demandware and coming soon Magento. Please get in touch with us for more details on these connectors.

<br/>

#### Embedded Product Reviews

In the standard configuration a number of between three and twenty verified user product reviews are placed on the page, typically sorted by the most helpful reviews.
These reviews are dis-aggregated from the ReevooMark network so that only reviews originating from the source merchant are embedded on a source merchant’s page. This allows a merchant to benefit from the incredible power of the ReevooMark aggregated network and its associated increased coverage, whilst simultaneously providing fresh, unique content for search engines to crawl and index.
The user will be able to read the rest of reviews associated to the product by clicking on the "Reed more reviews" link, which will open open the standard ReevooMark lightbox.
<br/><br/><br/>
<img alt="embedded product reviews" src="/images/seo/seo_2.png" width="600px" />
<br/><br/>
In the paginated configuration, all reviews are embedded in the retailer site. Pagination links and sorting and filtering are present in the embedded content allowing the user to navigate through all the reviews in the same way they would do in the standard ReevooMark lightbox.
<br/><br/>
<img alt="embedded product reviews" src="/images/seo/seo_3.png" width="600px" />

#### Embedded Conversations

Peer-to-peer conversations can also be embedded, both in standard and paginated modes. See example below.

<br/>
<img alt="embedded conversations" src="/images/seo/seo_5.png" width="600px" />
<br/><br/><br/>

#### Embedded Customer Experience Reviews

As well as product reviews we also provide embedded customer experience review content, both in standard and paginated modes.

<br/>
<img alt="embedded customer experience reviews" src="/images/seo/seo_4.png" width="600px" />
<br/><br/><br/>

## Tag Library Example

The following Java JSP code example shows how you would use the tag library to insert embedded review content at the appropriate place within a page. Please refer to the github documentation links provided above for much more detailed instructions on how to use the tag libraries.

{% highlight jsp linenos %}
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="reevoo" uri="http://reevoo.com/java-taglib/v1" %>

<html>
<head>
  <title>Test New Tags Page</title>

  <reevoo:cssAssets/>

</head>

<body>

  <reevoo:productReviews trkref="ACER_EN_GB" sku="430"
                         numberOfReviews="10" locale="en-GB"
                         paginated="true" />

  <reevoo:javascriptAssets trkref="PID"/>

</body>
</html>
{% endhighlight %}

Line 3 : includes the ReevooMark jsp tag library in your page

Line 9 : load the necessary stylesheets for the styling of the Reevoo content. This styling must be maintained in all implementations.

Line 19 : Loads the ReevooMark Javascript library to allow for interaction with the standard ReevooMark service and lightbox.

Lines 15, 16, 17 : call the “embeddable_reviews” API for inline-SEO with the appropriate locale (in this case en-GB), TRKREF , SKU and number of reviews, as per the standard ReevooMark implementation instructions. Set the "paginated" attribute to true or false depending on whether you want the standard or paginated version of embedded reviews.

## Behaviour of the Tag Libraries

The tag library will render nothing if the SKU or TRKREF provided is unrecognised.

In the event of a lack of connectivity with the Reevoo review servers, the tag will timeout appropriately and render the previous cached response, or nothing if there is no previous cached response.

The tag library implementation is designed to allow for operation with very high throughput sites. Review responses from the Reevoo infrastructure are carefully cached (adhering to HTTP cache-control headers) and stored locally within your application environment.

