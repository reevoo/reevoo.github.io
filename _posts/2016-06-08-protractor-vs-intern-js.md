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
  - Not very well documented (Documentation can be found [here](https://theintern.github.io/leadfoot/) but it's not very comprehensive. It does not describe very well how to use them and there are no practical usage examples).
  - Not easy to find solutions when you get stuck.
  - Lacks very basic functionality like condition find (After looking at the documentation and searching online I came up with a solution that worked but it looked quite messy).
  - Syntax is hard to read and the nesting becomes hard to follow (hard to find where to put end() and where to put .then()).
  - Lack of basic methods like find element by text.
  - It can be integrated easily with BrowserStack if you need to do cross browser checking. This is quite important if you need to test against a real browser and not PhantomJS.
  - For AngularJS applications sometimes can be hard to debug (eg: to write in a text input you would expect that firstly you have to click the input to get the focus and then to type. Because of the working of AngularJS this is flaky. Instead of this you can use type()).
  
## Syntax

    'it should allow the user to login': function () {
        
      return this.remote.setFindTimeout(5000)
        .get('#/auth/sign_in')
        .findByCssSelector('input[ng-model="credentials.email"]').type('example@example.com').end()
        .findByCssSelector('input[ng-model="credentials.password"]').type('password').end()
        .findByCssSelector('[type="submit"]').click().end()    
        .findByCssSelector('.side-menu')
        .getVisibleText()
        .then(function (text) {
          expect(text).to.equal('You are now logged in!');
        });
    },

# Protractor
  - Specific for AngularJS applications:
    - come with some methods specifically for AngularJS which reduces the complexity of the specs (eg: by.model('person.name'), by.binding('person.concatName'), by.repeater('person.results')).
    - wait to load is built in (in Intern you have to specify for each test the default wait time with setFindTimeout()).
  - Intuitive syntax, easy to read and understand (specially if you come from a Ruby background).
  - Not a good choice for non AngularJS applications.
  - Easy to setup with Grunt.
  - More tutorials and practical example than Intern.

## Syntax

    it('should allow the user to login', function() {
      browser.get('#/auth/sign_in');
        
      element(by.model('credentials.email')).sendKeys('example@example.com');
      element(by.model('credentials.password')).sendKeys('password');
      element(by.css('[type="submit"]')).click();
        
      var title = element(by.css('.side-menu'));
      expect(title.getText()).toEqual('You are now logged in!');
    });

# Chosen Framework

  Even if syntax is harder and not intuitive enough we went for Intern as it would be easier to have the same framework to test all our applications. 
  While you can use Intern to do that it's not that easy to use Protractor to test a react application for example. The specific methods for Protractor provides for AngularJS applications are not a reason big enough to chose it over a more generic and better supported tool.
  
# Resources
  - [Intern](https://theintern.github.io/)
  - [Protractor](http://www.protractortest.org/#/)
  - [Protractor tutorial](http://www.protractortest.org/#/toc)


