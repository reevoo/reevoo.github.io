---
layout: post
title:  "Easier Reevoo Assets Integration"
date:   2014-08-01 10:58:44
categories: blog
---

Adding Reevoo content into customer sites (badges, embedded reviews and purchase tracking), can sometimes become challengin for the less technical customers, which can result in delay of integration and increased support time devoted by the development team to help troubleshoot this integration.

As an example, looking at the current technical documentation being handed to customers, they could end up in situations like the one described in the following steps:

* They decide they want to add badges to their page, so following the current documentation they add the following in their page:

{% highlight javascript %}
<script id="reevoomark-loader" type="text/javascript" charset="utf-8">
	(function() {
		var script = document.createElement('script');
    		script.type = 'text/javascript';
    		script.src = 'http://cdn.mark.reevoo.com/assets/reevoo_mark.js';
    		var s = document.getElementById('reevoomark-loader');
    		s.parentNode.insertBefore(script, s);
  	})();
  
  	afterReevooMarkLoaded = [function() {
    		ReevooApi.load('TRKREF', function(retailer) {
   			retailer.init_badges();
    		});
  	}];
</script>
{% endhighlight %}

* Later on they decide they want to add purchase tracking to their page, and going by the documentation they find they need to add the following to their page:

{% highlight javascript %}
<script id="reevoomark-loader" type="text/javascript" charset="utf-8">
	(function() {
   		var script = document.createElement('script');
   		script.type = 'text/javascript';
   		script.src = 'http://cdn.mark.reevoo.com/assets/reevoo_mark.js';
   		var s = document.getElementById('reevoomark-loader');
   		s.parentNode.insertBefore(script, s);
  	})();
	afterReevooMarkLoaded = [function(){
    		ReevooApi.load('TRKREF', function(retailer){
      			retailer.track_purchase(["SKU1", "SKU2"], orderValue);
    		});
  	}];
</script>
{% endhighlight %}


* Now most will not realize that both the javascript blocks above are almost identical, and only change the declaration of the "afterReevooMarkLoaded" variable. Most clients will just include both blocks in the page resulting on double import of the reevoo_mark.js and on overriting of the "afterReevooMarkLoaded" array, which will result on either badges or tracking not happening.
What they should have included in the page in thisinstance if they wanted both badges and tracking "in the same page" is:

{% highlight javascript %}
<script id="reevoomark-loader" type="text/javascript" charset="utf-8">
	(function() {
		var script = document.createElement('script');
    		script.type = 'text/javascript';
    		script.src = 'http://cdn.mark.reevoo.com/assets/reevoo_mark.js';
    		var s = document.getElementById('reevoomark-loader');
    		s.parentNode.insertBefore(script, s);
  	})();
  
  	afterReevooMarkLoaded = [
  	  function() {
    		ReevooApi.load('TRKREF', function(retailer) {
   			retailer.init_badges();
    		});
  	  },
  	  function(){
    		ReevooApi.load('TRKREF', function(retailer){
      			retailer.track_purchase(["SKU1", "SKU2"], orderValue);
    		});
  	  }
  	];
</script>
{% endhighlight %}

But nowhere in the documentation this is indicated so it would require clients to have a certain knowlege of javascript and even of the internal implementation of our reevoo_mark.js javascript in order to be successful implementing this without support from our technical team.


In order to make integration easier for customes using the java client, we've abstracted all this technical details through a couple extra tracking tags:


{% highlight jsp %}
<reevoo:purchaseTrackingEvent trkref="REV" skus="999,222,888" value="342.00"/>
<reevoo:propensityToBuyTrackingEvent trkref="REV" action="Requested_Brochure" sku="234"/>
{% endhighlight %}

Which you can find documentation about in our reevoo-mark java client github documentation at https://github.com/reevoo/reevoomark-java-api.

Now clients wanting to have any type of content in their pages don't have to worry about duplicated import of reevoo_mark.js or overriding the "afterReevooMarkLoaded" variable, etc... They just need to have in their page the  <reevoo:javascriptAssets/> tag once, and then they can mix and match as many tracking, badge or embedded reviews tags as they wish.

