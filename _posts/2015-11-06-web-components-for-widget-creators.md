---
soapboxContentId: 9a55db36-c10e-4a01-9ede-88dfbbd58291
layout: post
title:  Web Components for widget creators
date:   2015-11-06 13:00
categories: blog
navId: blog
author: Victor Vila
github: irikuo
---

Web Components seem to be 'The Next Big Thing'™ for the web. They try to solve an old problem with a new approach: having reusable components on the web. There are lots of articles explaining [what they are and how they work](http://blogs.windows.com/msedgedev/2015/07/14/bringing-componentization-to-the-web-an-overview-of-web-components/), but this is not the goal of this post.

# Explaining the problem
When you are building a full site or web application you have a huge advantage: you control everything. That means you can add as many libraries and/or polyfills as you need. If something has a conflict you can try to solve it. No problem there. But at Reevoo we're building a lot of widgets that are going to be included in other websites. So we need to be really careful with our widget's dependencies.

How is that related to Web Components? Because they provide isolation from the global CSS styles and from the global JavaScript scope they seem like a perfect fit for our needs as widget creators. This isolation is provided by the Shadow DOM, via the so-called shadow boundary, which keeps the component safe from accidental overriding. But it's not a security mechanism and you can always explicitly override something inside a Web Component if you are willing to.

But (yes, there is a but) as of today [there is not a final specification for Web Components](https://hacks.mozilla.org/2015/06/the-state-of-web-components/). And that means a poor [browser support](http://caniuse.com/#search=components). How can we use Web Components if browsers don't support them? Easy, [polyfills to the rescue](http://webcomponents.org/polyfills/)!

Ok, so if we know that the browser support is poor but we can solve it with polyfills, where is the problem? The core of the problem is that we wanted to have isolation to avoid problems with websites using the widget, but now we need to pollute the global scope with polyfills to make the different technologies supporting Web Components work in all the browsers. Furthermore, those polyfills are using the current implementation of the Chrome's API for Web Components and we can't be sure that this implementation is not going to change in the near future.

# The good parts
As we already said, the Shadow DOM provides some level of isolation, and that helps to avoid unintended overriding of styles or functionality. Web Components have some [lifecycle callback methods](http://www.html5rocks.com/en/tutorials/webcomponents/customelements/#lifecycle) that allow us to bind functionality at certain points of the component's execution. This can simplify the logic of our widget, because we don't need to deal with weird events and we avoid risks of facing race conditions.

# Our vision
It looks like Web Components are the future and browsers will keep getting better at supporting them (once they agree on a final specification). We should totally keep an eye on the evolution of the specification.

It would be good to keep building examples and experimenting with them, to know in deep what can and can't be done. We think that Web Components are not mature enough to use them as the default approach for building widgets. In the future, when we're able to use Web Components without polyfills, it might be really interesting to have them as a wrapper for every widget, to get the isolation and the flow control natively from the browser. Until then, it's yet-another-cool-browser-feature (YACBF?) that we'll have to wait for.
