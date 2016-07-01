---
layout: post
title:  React Europe 2016 - A reevoolver in Paris
date:   2016-07-01 10:00
categories: blog
navId: blog
author: Victor Vila
github: irikuo
---

Almost a month ago, I attended the [ReactEurope 2016](https://www.react-europe.org/) conference in Paris. It was my first time on an event of this kind, and I was very surprised by the vibe and energy of all the attendants and speakers. Some of the them were authors of libraries that we use at Reevoo or people who I follow on Twitter. It was interesting seeing the RealWorld™ people instead of their digital versions for a change.

# The conference

The conference lasted for two days, June 2nd and 3rd. The structure was quite similar both days: sessions consisting of two half-hour talks followed by 30 minutes break, where you could have some coffee, stretch your legs and talk with people. [Christopher Chedeau](https://twitter.com/Vjeux) (one of the developers who has been involved in React since the beginning) was introducing all the speakers and encouraging people to go and talk to each other or the speakers during the breaks. By the end of both days there was a round of lightning talks, with some interesting surprises.

## Day one

The conference opened with a [keynote](https://www.youtube.com/watch?v=uvAXVMwHJXU) from [Dan Abramov](https://twitter.com/dan_abramov). He's the co-creator of [Redux](http://redux.js.org/) (probably the most popular Flux-like library) and he talked about what happened since he [released it in last year's ReactEurope](https://www.youtube.com/watch?v=xsSnOQynTHs).

<iframe width="560" height="315" src="https://www.youtube.com/embed/uvAXVMwHJXU" frameborder="0" allowfullscreen></iframe>

The first surprise of the day came from [Christopher Chedeau](https://twitter.com/Vjeux) talking about "Being successful at Open Source" and how they managed to make React popular. He suggested that every developer should have a blog or write about what they do. Share the knowledge, contribute back to the community. Very inspiring.

<iframe width="560" height="315" src="https://www.youtube.com/embed/nRF0OVQL9Nw" frameborder="0" allowfullscreen></iframe>

The biggest highlight was [Cheng Lou](https://twitter.com/_chenglou)'s talk "On the Spectrum of Abstraction". In the weirdest (by far) and coolest talk of the conference, he defined abstraction and the concepts "power" and "usefulness" in terms of programming languages and libraries. It was mind-blowing seeing how he tied everything together and the final pun was priceless. If you are going to watch just one talk, this is it.

<iframe width="560" height="315" src="https://www.youtube.com/embed/mVVNJKv9esE" frameborder="0" allowfullscreen></iframe>

It was also interesting seeing Daniel Schafer talking about [how Facebook solves some common problems with GraphQL](https://www.youtube.com/watch?v=etax3aEe2dA) and [Jeff Morrison](https://github.com/jeffmo) talking about [Flow internals](https://www.youtube.com/watch?v=VEaDsKyDxkY).

By the end of the day there were some lightning talks, where we could see [how you do a demo when your YouTube video fails](https://www.youtube.com/watch?v=It7jU4uKxSk) (minute 2:25), or how [Sebastian McKenzie](https://twitter.com/sebmck) is trying to [make JavaScript initialise faster to improve the React Native experience](https://www.youtube.com/watch?v=xbZzahWakGs).

## Day two

It seemed like day two was going to have a hard time keeping up with the awesomeness level of day one. But you know what? It kept up.

The first surprising and totally unexpected talk was "The evolution of React UI development". [Max Stoiber](https://twitter.com/mxstbr) and [Nik Graf](https://twitter.com/nikgraf) introduced [carte-blanche](https://github.com/carteb/carte-blanche), a tool that allows you to render all the React components in your project and modify their properties live, so you can see how they look and behave. I bet that in a short period of time, most React projects will be using this or something very similar.

<iframe width="560" height="315" src="https://www.youtube.com/embed/0IkWuXeKPV0" frameborder="0" allowfullscreen></iframe>

[Andrew Clark](https://twitter.com/acdlite), co-creator of Redux, talked about higher-order components (HOC) and how to compose them and simplify the boilerplate needed in his talk "Recomposing your React application". If you are using HOC I am sure you have felt the pain of combining them, and some of you colleagues thought your code looked weird. This talk will show you a new approach that you might find interesting and even decide to use in your code.

<iframe width="560" height="315" src="https://www.youtube.com/embed/zD_judE-bXk" frameborder="0" allowfullscreen></iframe>

[GraphQL](http://graphql.org/) is a cool new data query language with lots of useful features, but some real world limitations. In "GraphQL Future" [Laney Kuenzel](https://twitter.com/laneykuenzel) and [Lee Byron](https://twitter.com/leeb) talk about how are they trying to overcome these limitations and what we can expect in the next months and years. This is particularly interesting for someone thinking about using GraphQL in production.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ViXL0YQnioU" frameborder="0" allowfullscreen></iframe>

If GraphQL doesn't fit your needs, try [Netflix's Falcor](https://netflix.github.io/falcor/) as an alternative. [Jafar Husain](https://twitter.com/jhusain) explains you the differences in ["Falcor: One model everywhere"](https://www.youtube.com/watch?v=nxQweyTUj5s) much better than I can in a few lines. Oh, and he is an awesome speaker.

After all the talks, there was a [full hour of Q&A](https://www.youtube.com/watch?v=5pMDd1t2thc) with core members of React, React Native, GraphQL and Flow teams.

## Videos

If you want to see all the videos, you can find them ordered in YouTube playlists here:

[Talks playlist for Day one](https://www.youtube.com/playlist?list=PLCC436JpVnK09bZeayg-KeLuHfHgc-tDa)

[Talks playlist for Day one](https://www.youtube.com/playlist?list=PLCC436JpVnK0LTDKW3O_BGTZnrZ8dBAof)

[Q&A with React core members](https://www.youtube.com/watch?v=5pMDd1t2thc)

[Lightning talks](https://www.youtube.com/playlist?list=PLCC436JpVnK36ZI7-b3hgRSXP3me7rSvt)

[Impromptu lightning talks](https://www.youtube.com/playlist?list=PLCC436JpVnK0o0sL6fHGE3xNrvn0GI22J)

# Final thoughts

React is getting strong because it's driven by an extremely enthusiastic community. The big difference with other frameworks or ecosystems is that people are willing to challenge the established way of thinking and constantly try new things. Thanks to that, there has been a lot of evolution in just two years since it was released. Now we have React Native (JavaScript in mobile apps done in the right way), and a nice replacement for MVC: Flux. Flux was an interesting idea, but now it has evolved and we have Redux - a simple and powerful alternative.

Those are the kind of things that you get when there are a lot of people interested in the same topic. ReactEurope 2016 was just the confirmation of how healthy React is, and that it's going to stay with us for a long time.
