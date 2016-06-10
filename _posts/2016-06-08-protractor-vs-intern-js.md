---
layout: post
title:  Protractor or Intern ?
date:   2016-06-08 14:00
categories: blog
navId: blog
author: Alexandru Anca
github: ionut998
---

The focus of this post is a comparison between Protractor and Intern for the integration testing of an AngularJS application.

# Current Implementation

Currently the application is tested using Ruby and Capybara framework. As it turns out using this combination to test a single page application is very flaky. Out of 3 CI runs only 1 is usually successful, the rest is the result of flakiness. 
Another downside of this is that you need to install Ruby on top of your application dependencies only to run the tests.

# Intern
  - More generic than Protractor (Integration testing should not be coupled with the application framework).
  - In Intern everything is a promise. This is the way intern handles asynchronicity. The method `setFindTimeout()` sets the default wait time for elements to be loaded. If the page will take longer than specified `setFindTimeout()` to load then the test will fail.
  - It can be integrated easily with BrowserStack if you need to do cross browser checking. This is quite important if you need to test against a real browser and not PhantomJS.
  - Not very well documented (Documentation can be found [here](https://theintern.github.io/leadfoot/) but it's not very comprehensive. It does not describe very well how to use them and there are no practical usage examples).
  - Not easy to find solutions when you get stuck.
  - Lacks very basic functionality like find element by text or condition find (After looking at the documentation and searching online I came up with a solution that worked but it looked quite messy).
  - Syntax is hard to read and the nesting becomes hard to follow (hard to find where to put `.end()` and where to resolve the promise with `.then()`).  
  - For AngularJS applications sometimes can be hard to debug (eg: to write in a text input you would expect that firstly you have to click the input to get the focus and then to type. Because of the working of AngularJS this is flaky. Instead of this you can use `type()`).
   
# Protractor
  - Specific for AngularJS applications:
    - Come with some methods specifically for AngularJS which reduces the complexity of the specs (eg: `by.model('person.name')`,` by.binding('person.concatName')`, `by.repeater('person.results')`).
    - To solve the asynchronicity problem Protractor binds to AngularJS elements to check when the elements finished loading.
    - Easy to learn if you know AngularJS
  - Intuitive syntax, easy to read and understand (specially if you come from a Ruby background).
  - Not a good choice for non AngularJS applications. If used for non AngularJS applications there is no way of ensuring that elements are loaded dynamically therefore you will have to use `setTimeout()`.
  - More tutorials and practical example than Intern.

# Syntax examples

## Intern
{% highlight js %}
'it should allow the user to login': function () {
    
  return this.remote.setFindTimeout(5000) // here is where we set the default timeout for the elements to be loaded
    .get('#/auth/sign_in')
    // write email address
    .findByCssSelector('input[ng-model="credentials.email"]').type('example@example.com').end() // firstly we find the element, then the scope changes so every other find will look inside that element. By adding end() we change the scope to the previous found element.
    // write password
    .findByCssSelector('input[ng-model="credentials.password"]').type('password').end()
    // click submit
    .findByCssSelector('[type="submit"]').click().end()    
    .findByCssSelector('.side-menu')
    // check login message
    .getVisibleText()
    .then(function (text) {
      // here is where we resolve the promise 
      expect(text).to.equal('You are now logged in!');
    });
},
{% endhighlight %}    

## Protractor
{% highlight js %}
it('should allow the user to login', function() {

  browser.get('#/auth/sign_in');
  // write email address
  element(by.model('credentials.email')).sendKeys('example@example.com');
  // write password
  element(by.model('credentials.password')).sendKeys('password');
  // click submit
  element(by.css('[type="submit"]')).click();
  // check login message
  var title = element(by.css('.side-menu'));
  expect(title.getText()).toEqual('You are now logged in!');
});
{% endhighlight %}

# Chosen Framework

By looking at the pros and cons of both frameworks we can see more pros for Protractor therefore seem like the right choice to make. That is only true for AngularJS applications. If you have to test a non AngularJS application worth protractor you will need a way to deal with the asynchronicity and you can end up with some flaky tests.
On the other hand Intern solves the asynchronicity problem by using promises and you can also use it to test an AngularJS application even if is not as good as Protractor in this particular case. 

Our conclusion is that if you are testing an AngularJS application then you should use Protractor but if you can only choose one testing framework and you have also non AngularJS applications to test then you should use Intern.

# Resources
  - [Intern](https://theintern.github.io/)
  - [Intern API documentation](https://theintern.github.io/leadfoot/)
  - [Simplifying Intern tests](https://www.sitepen.com/blog/2016/04/19/command-helpers/)
  - [Protractor](http://www.protractortest.org/#/)
  - [An Overview Of Protractor](http://engineering.wingify.com/posts/angularapp-e2e-testing-with-protractor/)
  - [Protractor tutorial](http://www.protractortest.org/#/toc)


