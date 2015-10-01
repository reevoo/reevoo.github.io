---
soapboxContentId: f2212896-aebd-4636-a902-572577f5cc71
layout: post
title:  How we chose React
date:   2015-09-22 17:00
categories: blog
navId: blog
author: Richard Batty
github: richardbatty
---


# How we chose React

In a recent project to build a comments widget, we decided to experiment with different approaches and frameworks. This post explains what we did and how we ended up choosing [React](https://facebook.github.io/react/).

## What we didn't want

### Angular

We knew we didn't like Angular from previous experience. Firstly, it took ages to learn - there are lots of unnecessarily confusing parts like the differences between service, factory, and provider or what @, &, and = mean in directives. We also didn't like its templates. Having a special templating language is more to learn, and even worse, it is hard to debug. When you cause an error in your template, you get a stack trace that doesn't include any of your code, making it hard to find the problem. And because it's not JavaScript, you can't put a debugger in to see what's going on. Finally, we found the testing time consuming. There was a lot of error-prone boilerplate that we had to write in the `beforeEach` of every set of tests. Overall it felt like we had to warp our brains into Angular's world, rather than the framework helping us and then getting out of the way.

## Experiments

### Vanilla JavaScript

When we started the comments widget, our first approach was to write vanilla JavaScript. We aimed to keep the size low and we thought the widget would be simple enough not to need a framework. But as we continued found we were doing a lot of this sort of thing:

{% highlight javascript %}
response.reportElement = response.element.find('.report-container');
response.reportElement.onclick = response.showReportConfirm;
{% endhighlight %}

Our code had lots of verbose DOM manipulation that made it hard to read. And we were having a lot of trouble with state. When your frontend code consists of step by step manipulation of the DOM, the state of your program is stored partly in the DOM. For example, if you show nested comments by removing a hide class, the state of your system has changed. But because that state is stored implicitly in the DOM, rather than explicitly in a data structure in your code, it's easy to write code that assumes the DOM is in one state when it is in a different state. This leads to confusing bugs.

Ideally, we wanted to have code for turning a data structure into an HTML component separated from the code that created and manipulated that data structure. This sounds like we wanted a templating library, so we ignored our previous bad experience with Angular's templating and tried [Rivets](https://github.com/mikeric/rivets), which is similar to Angular's templates.

### Rivets

We started to rewrite our widget using [Rivets](https://github.com/mikeric/rivets). But we quickly realised it wasn't the right choice: it isn't well maintained, its documentation is poor, and like Angular's templates, it gives errors that are hard to debug.

So we had to think deeper about what we wanted.

### React and Riot

[React](https://facebook.github.io/react/) and [Riot](http://riotjs.com/) are similar and seemed to fit our needs. Both help you to create components that render based on a JavaScript data structure which allows you to separate templating and application logic.

To compare them, we spent a morning with one person writing the widget in Riot and the other in React. Then we swapped in the afternoon.

Although both were good, we went for React. This was because of its large community, good documentation and support, and use by Facebook. We also liked the fact that React's JSX was just sugar on top of JavaScript, meaning that we could play with real JavaScript to debug template problems.

As we were rewriting the app in React, we found it a pleasure to use. For example, we had a photo uploading component within the widget which had to be displayed in different states depending on whether there were no photos or some photos, whether the photo upload limit had been reached or not, and whether a photo was currently being uploaded or not. We decided to create objects that defined each photo uploader state and then re-render the component every time the state changed. Rewriting the component this way was easy despite the multiple state changes going on. This shows the power of programming state change explicitly and separating logic code from templating code.

## What we learned

The most important thing we learned was about how to deal with problems: If you're having problems with your current approach, stop and solve the problem. Don't just plough on thinking that going back will take too much time. It will take you more time fighting with a solution that doesn't work properly and will lead to a worse result.

We also learned more about how to design front-end apps. We found that manipulating data and then re-rendering a stateless component based on that data is far easier to reason about than doing imperative DOM manipulations. From the comparison between Angular and React we learned that a library of few simple composable entities like functions or components are much easier to use than a framework with many overlapping and hard-to-understand concepts.

## Further reading

Take a look at James Shore's reviews of [Angular](http://www.letscodejavascript.com/v3/blog/2015/01/Angular_review) and [React](http://www.letscodejavascript.com/v3/blog/2014/09/react_review) for a deeper look at both.
