---
soapboxContentId:
layout: post
title:  How we chose React
date:   2015-09-22 17:00
categories: blog
navId: blog
author: Richard Batty
github: richardbatty
---


# How we chose React

We were building a comments widget that would go on a clients site. We needed to be able to isolate our javascript from the client's javscript, and we wanted to keep the size of our JavaScript reasonable.

## What we didn't want

### Angular

We knew we didn't like Angular from previous experience. It took ages to learn and slowed down our development. We particularly didn't like its:

* Unnecessary obscurity (e.g. @, &, and =)
* Conceptual complexity (e.g. the digest loop)
* Difficulty for testing
* Special templating language that gives poor errors

## Experiments

### Vanilla JavaScript

Our first approach was to write vanilla javascript. This would keep the size low but as we continued found we were doing a lot of this sort of thing:

```javascript
response.reportElement = response.element.find('.report-container');
response.reportElement.onclick = response.showReportConfirm;
```

Lots of verbose DOM manipulation made it hard to read and led us into tricky bugs because it was hard to keep track of state. So, we decided to find a templating library that could handle updating the view while our javscript just handled the logic.


### Rivets

[Rivets](https://github.com/mikeric/rivets) seemed to fit our needs and we started to rewrite our widget using it. But it isn't well maintained, its documentation is poor, and like angular's templates, it gives errors that are hard to debug.

So we had deeper think about what we wanted.

### React and Riot

[React](https://facebook.github.io/react/) and [Riot](http://riotjs.com/) are very similar and seemed to not have the problems of Angular, vanilla JavaScript, or Rivets.

To compare them, we spent a morning with one person writing the widget in Riot and the other in React. Then we swapped in the afternoon.

Although both were good, we went for React because it has:
* A large community and good documentation
* JavaScript instead of a special templating language
* Helpful errors

## What we learned

If you're having problems with your current approach, stop and solve the problem. It was well worth us spending the time to explore these options once we realised vanilla javascript wasn't working.

A few simple composable entities like functions or components are better than lots of hard to understand complex entities like angular's directives and providers.

Take a look at James Shore's reviews of [angular](http://www.letscodejavascript.com/v3/blog/2015/01/angular_review) and [React](http://www.letscodejavascript.com/v3/blog/2014/09/react_review) for a deeper look at both.
