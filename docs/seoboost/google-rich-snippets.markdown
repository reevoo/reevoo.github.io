---
id: google-rich-snippets
layout: docs
title: Google Rich Snippets
navId: docs
group: seoboost
---

# Google Rich Snippets

When you add our embedded product reviews to your page, along with the reviews we also include a JSON-LD structured data snippet,
where we provided the product's aggregate rating information. This will allow Google to display rich snippets for your page in
their search results. See an example below of how this JSON-LD snippet looks like:


{% highlight html %}
<script type="application/ld+json">
 {
    "@context": "http://schema.org",
    "@type": "Product",
    "@id": "/reviewable/sku/100A#this",
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



The product structured data allows many more properties beyond the ones Reevoo includes with embedded reviews, like for example "description", "brand", "offers", etc...
You can see details about all the allowed extra properties in the following link <a href="https://developers.google.com/search/docs/data-types/products" target="_blank">Google Product Structured Data</a>.

A problem may arise when the retailer implementing our embedded product reviews wants to provide any of these extra product properties
beyond the ones Reevoo includes with the embedded reviews.

In many cases the retailer will add their own product JSON-LD snippet in the page, which causes Google to think the page contains multiple product items, in which case <b>"Google will not display the rich snippets"</b>.


For example the retailer might include their own product structured data to include extra information like below:

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


If you want to include your own product JSON-LD to the page but still want Google to display rich snippets, then you must make sure to do the following:


<b>1\. Include in your JSON-LD snippet the same @id attribute that Reevoo is using in the JSON-LD snippet included with the embedded reviews.</b>

This "@id" attribute is always set by Reevoo with the value "/reviewable/sku/SKU#this". Where the capitalized SKU must be replaced by the sku of the product.
For example if the sku of the product is "100A", the the @id attribute will be as below:

{% highlight html %}
  "@id": "/reviewable/sku/100A#this"
{% endhighlight %}

<b>2\. Make sure that your JSON-LD snippet does not include the "aggregateRating" property, this must only be present in the JSON-LD snippet provided by Reevoo.</b>


So by having both product JSON-LD snippets share the same "@id" attribute, they will be identified as the same product and will not interfere with the Rich Snippets functionality.





