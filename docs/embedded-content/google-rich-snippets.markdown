---
id: google-rich-snippets
layout: docs
title: Google Rich Snippets
navId: docs
group: embedded-content
---

# Reviews Star Rich Snippet

By "Reviews Star Rich Snippet" we refer to the nice orange and gray stars that sometimes appear next to some of your results when you perform a search in Google. See example images below:


<img alt="embedded product reviews" src="/images/rich_snippets/product_rich_snippets.png" width="600px" />

<br/>
<br/>

<img alt="embedded product reviews" src="/images/rich_snippets/cx_rich_snippets.png" width="600px" />


These star rich snippets are a representation of the average review score for the given product or organisation, and in order for Google to be able to show them, you need to include certain structured data markup in you pages. Keep reading to find out how to include this structure data in your pages.

<br/>

# Implement Star Rich Snippet for Product Reviews

In order to include in your page the structured data needed by Google for displaying the star rich snippet, you need to take the following steps:

**1) Make sure the page where you are going to include the product structured data is a product page**. By a "product page" we mean a page where you are showing the details of "one" specific product, along with the reviews collected by Reevoo on your behalf for that specific product. Please note that the reviews should be visible in the page, or if not visible, the page should at least have on display a badge or link by which a user can get to the specific product reviews.

**2) Have your TRKREF and product SKU ready if you get your product reviews from Reevoo using skus**. If you use automotive metadata instead of skus, skip this step and go to step number 3 instead.

&nbsp;&nbsp;&nbsp;The **TRKREF** value will have been given by Reevoo to you when you open your account with us. 

&nbsp;&nbsp;&nbsp;The **SKU** value must be the same value by which you identify the product on the ProductFeeds you provide to Reevoo.

**3) Have your TRKREF and automotive metadata ready if you get your product reviews from Reevoo using  automotive metadata**. If you get your reviews from reevoo using skus, skip this step. 

&nbsp;&nbsp;&nbsp;In most cases you will only use "model" and "manufacturer", but the full list of valid automotive metadata fields can be seen <a href="http://reevoo.github.io/docs/feeds/feeds-automotive-product-fields/" target="_blank">here</a>. 

&nbsp;&nbsp;&nbsp;**Important**: If you use any metadata that includes the underscore symbol, like for example "model_variant", make sure you use it exactly as it is (with underscores), do not replace the undercores by hyphens.

**4) Include the following javascript link in your page** (but make sure to replace the capitalized **TRKREF** and **SKU** by your own values for this parameters as explained in point 2 above). The link **should be included in the <HEAD> section** in your html and **before any other javascript** links you might have in the page.

```
<script async src="//mark.reevoo.com/reevoomark/product_reviews_rich_snippets.js?trkref=TRKRF&sku=SKU"></script>
```
EXAMPLES:
  ```
  <script async src="//mark.reevoo.com/reevoomark/product_reviews_rich_snippets.js?trkref=CYS&sku=22091143"></script>
  <script async src="//mark.reevoo.com/reevoomark/product_reviews_rich_snippets.js?trkref=PIU&sku=series:414"></script>
  <script async src="//mark.reevoo.com/reevoomark/product_reviews_rich_snippets.js?trkref=BEV&sku=NEAAC80001"></script>
  ```


or if you use automotive metadata instead of skus the link to include would look like below (also replace the capitalize MODEL and MANUFACTURER by the specific vehicle values):

```
<script async src="//mark.reevoo.com/reevoomark/product_reviews_rich_snippets.js?trkref=TRKRF&manufacturer=MANUFACTURER&model=MODEL"></script>
```
EXAMPLES:
  ```
  <script async src="//mark.reevoo.com/reevoomark/product_reviews_rich_snippets.js?trkref=MAZ&manufacturer=mazda&model=mazda3"></script>
  <script async src="//mark.reevoo.com/reevoomark/product_reviews_rich_snippets.js?trkref=VOL&manufacturer=volvo&model=xc90&model_variant=Inscription"></script>
  <script async src="//mark.reevoo.com/reevoomark/product_reviews_rich_snippets.js?trkref=VOL&manufacturer=volvo&model=xc90&model_variant=Inscription&model_year=2018"></script>
  ```

**5) Do not include the structured data for the same product in more than one page**. Google has clamped down on which sites/pages get stars in their rich snippets. Even if you do everything properly, you still may not see stars on every (or any) of the pages you want them on. The best bet, though, is to try to keep your implementation as above board as possible by also following these rules:

  - Don’t use aggregateRating on your home page (they just won’t work and may be a spam signal).
  - If you don’t show the actual reviews on a given page, but are using aggregateRating schema, that page needs to clearly show the review score and link to the page where the reviews are visible.
  - Pages you put the aggregateRating score on must be relevant to the reviews.
  - Reviews should be unique to your site (not pulled from Google, Yelp, etc.). Just the revies provided by Reevoo for you.
  - Here is a link to the official Google review snippets guidelines for further reading on the subject <a href="https://developers.google.com/search/docs/data-types/review#review-snippet-guidelines" target="_blank">Google Review snippet guidelines</a>.

And that is all. The structured data needed for Google to display rich snippets will automatically be embedded in your page if you follow the previous steps.

### What does the the product reviews structured data look like  

The structured data automatically injected in your page by Reevoo is in JSON-LD format and looks like in the example below (of course the values of most of the attributes will be different and related to the specific product in your product page).

{% highlight html %}
<script type="application/ld+json">
 {
    "@context": "http://schema.org",
    "@type": "Product",
    "@id": "#reviewable_sku_100A",
    "name": "KIA RIO",
    "sku": "100A",
    "aggregateRating": {
        "@type": "aggregateRating",
        "ratingValue": 9.0,
        "bestRating": "10",
        "ratingCount": 4544,
        "worstRating": "1"
    }
  }
</script>
{% endhighlight %}

You can **check whether your page is including the structured data correctly** by using <a href="https://search.google.com/structured-data/testing-tool/u/0/" target="_blank">Google's Structured Data Testing Tool</a>.

### What if my page already has product structured data  

The structured data automatically injected by Reevoo in your page is just the reviews "aggregateRating"  along with the product name and sku, nothing else, as you can see in the example above.

But the product structured data specification allows to indicate many more properties beyond the ones Reevoo provides. Google only needs the aggregateRating details in order to display star rich snippets so you don't need to add anything extra. But many organisations do add extra structured data that Google will use for other purposes beyond displaying star rich snippets. Some of these other attributes are for example "description", "brand", "offers", etc... You can see details about all the allowed extra properties in the following link <a href="https://developers.google.com/search/docs/data-types/products" target="_blank">Google Product Structured Data</a>.

**A problem may arise** if a retailer which already has included their own product structured data in the page, also includes the structured data provided by Reevoo. When Google scans the page it will find two different blocks of product structured data in the page and will deem the implementation invalid. In this case **Google will not display the rich snippets**.


For example the retailer might be already including their own product structured data like in the example below:

{% highlight html %}
<script type="application/ld+json">
  {
    "@context": "http://schema.org/",
    "@type": "Product",
    "name": "KIA RIO",
    "sku": "100A",
    "image": "https://an-image-for-the-product.png",
    "description": "Long description about the product",
    "brand": {
        "@type": "Thing",
        "name": "KIA"
    },
    "offers": {
        "@type": "Offer",
        "priceCurrency": "USD",
        "price": "6999.00"
    }
   }
</script>
{% endhighlight %}

In this case, if you still want to include Reevoo's structured data in your page in order to get star rich snippets, you need to link your structured data to Reevoo's one so Google sees them as one.  In order to link your structure data to Reevoo's one both blocks must be using the same "@id" attribute. To link your product structured data to Reevoo's one take the following steps:

**1) Include in your JSON-LD snippet the same @id attribute that Reevoo is using**. Reevoo sets the "@id" attribute with the value "#reviewable_sku_SKU". Where the capitalized SKU must be replaced by the sku of the product.

For example if the sku of the product is "100A", then the @id attribute will be as below:

{% highlight html %}
  "@id": "#reviewable_sku_100A"
{% endhighlight %}

Or, if you identify products based on automotive metadata, then the @id attribute will have a value of "#reviewable/manufacturer/MANUFACTURER/model/MODEL. As in the example below for manufacturer "mazda" and model "mazda3":

{% highlight html %}
  "@id": "#reviewable/manufacturer/mazda/model/mazda3"
{% endhighlight %}

**2) Make sure that your JSON-LD snippet does not include the "aggregateRating" property**, this must only be present in the JSON-LD snippet provided by Reevoo.</b>

By having both product JSON-LD snippets share the same "@id" attribute, they will be identified as the same product and will not interfere with the Rich Snippets functionality.



# Implement Star Rich Snippet for Customer Experience Reviews

In order to include in your page the structured data needed by Google for displaying the star rich snippet for your customer experience reviews, you need to take the following steps:

**1) Make sure the page where you are going to include the customer experience reviews structured data is not your root or home page**. Don’t use aggregateRating on your home page (they just won’t work and may be a spam signal).

**2) Make sure the page where you add the customer experience reviews structured data also has your Reevoo Customer Experience reviews on display**. If you don’t show the actual reviews on the given page, the page needs at least to clearly show the review score and link to the page where the reviews are visible.

**3) Reviews should be unique to your site (not pulled from Google, Yelp, etc.). Just the reviews collected by Reevoo specificallly for you.**

**4) Only add the customer experience reviews structured data to "one" page in your site**. If you add the customer experience reviews structured data to more than one page Google might now show rich snippets at all.

**5) Have your TRKREF ready**. The **TRKREF** value will have been given by Reevoo to you when you open your account with us. 

**6) Finally, and most importantly, include the javascript link shown below in your page** (but make sure to replace the capitalized **TRKREF** by your own value). The link **should be included in the <HEAD> section** in your html and **before any other javascript** links you might have in the page.

```
<script async src="//mark.reevoo.com/reevoomark/cx_reviews_rich_snippets.js?trkref=TRKRF"></script>
```
EXAMPLES:
  ```
  <script async src="//mark.reevoo.com/reevoomark/cx_reviews_rich_snippets.js?trkref=CYS"></script>
  <script async src="//mark.reevoo.com/reevoomark/cx_reviews_rich_snippets.js?trkref=PIU"></script>
  <script async src="//mark.reevoo.com/reevoomark/cx_reviews_rich_snippets.js?trkref=BEV"></script>
  ```

### What does the the customer experience reviews structured data look like  

The structured data automatically injected in your page by Reevoo is in JSON-LD format and looks like in the example below (of course the values of most of the attributes will be different and related to the specific product in your product page).

{% highlight html %}
<script type="application/ld+json">
  { 
    "@context": "http://schema.org",
    "@type":"Organization",
    "name":"KIA",
    "aggregateRating": {
      "@type":"aggregateRating",
      "ratingValue":95,
      "bestRating":"100",
      "worstRating":"0",
      "ratingCount":85185
    }
  }
</script>
{% endhighlight %}

You can **check whether your page is including the structured data correctly** by using <a href="https://search.google.com/structured-data/testing-tool/u/0/" target="_blank">Google's Structured Data Testing Tool</a>.
