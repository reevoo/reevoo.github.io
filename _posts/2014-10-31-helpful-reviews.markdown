---
layout: post
title:  How Helpful Are Reviews?
date:   2014-10-31 08:44:00
categories: blog
navId: blog
---

On every review we give users the opportunity to say whether the review was helpful to them or not - a value that I have unimaginatively coined as Helpfulness. An upvote/downvote system is used for this, and users can sort their reviews from most to least helpful in the hope of bringing quality reviews first.

Whilst researching around Helpfulness for another article I started crunching some numbers to answer a question: **is there a correlation between the helpfulness of a review and the review's score?**

A couple of database queries and some pretty graphs later, we have this:

<iframe width="793" height="437" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/1h2zeqvAEz8V14heOgHbGhAHieAdbOW7WtQdtT1WKzWk/pubchart?oid=1415431543&amp;format=image"></iframe>

<iframe width="781" height="481" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/1h2zeqvAEz8V14heOgHbGhAHieAdbOW7WtQdtT1WKzWk/pubchart?oid=476501498&amp;format=image"></iframe>

All of the data can be sifted through at [this Google Drive link.](https://docs.google.com/spreadsheets/d/1h2zeqvAEz8V14heOgHbGhAHieAdbOW7WtQdtT1WKzWk/edit?usp=sharing)

I also pulled out a few reviews to show the differences (or not?) between helpful and unhelpful reviews:

### Top

All of the top 10 reviews are for phones, and give a score of 6 or higher.

    Samsung Tocco Lite S5230, rated 10/10 by Margaret from Glasgow:

    + Very easy to use, simple format to understand...love it!    
    - the only bad point i would say is that is very easy to unlock and sometimes if the phone is in a bag and other items hit off it, it can start to browse etc.

    +864 -125 = +739

### Bottom

All of the bottom 10 reviews are for electronics products, and give a score of 4 or less.

    Samsung Galaxy Nexus 16GB, rated 4/10 by Jake from Reading:

    + Amazing screen. Good design and feel.   
    - I'm really dissapointed in this phone. This is.my first android device- coming from iOS the overall experience is below expectation. First the hardware: Bad call quality. Bad audio- speakers sound tinny. Bad photo quality, also the flash is sometimes slower than the snap.itself meaning no flash effect in many photos. Volume jumps eratically during calls. Re the Software- as an operating system.Android is really buggy still! Problems in the simplest functions such as uploading photos to Picasa doesn't work. Screenshots doesn't work. Difficulty in writing in online forms( such as this one) stock application crashes causes the phone to freeze. Battery life could have been better. Lack of quality applications on the market. Problems with viewing documents in emails not rendered correctly( my iPhone 3GS did better) I will definitely not reccomend Android to anyone yet.

    +34 -329 = -295

### Controversial

Only 3 products make up the reviews for the top 10 most controversial, defined as the reviews with the highest total votes, divided by the difference between them.

    Samsung SM2333HD, rated 9/10 by Dave from Gatwick:

    + Nice looking unit, easy setup, good picture.
    - When watching TV and mute is selected, the mute sign is huge and moves up and down the screen.

    +52 -51 = +1 after 103 votes

# What Can We Learn?

There are a couple of interesting observations:

- Generally speaking, reviews with a rating of 1 aren't very helpful. This is probably due to the 'angry consumer' expressing how bad a product is, without necessarily specifying what is wrong with it. 
- Lower scores tend to be considered less helpful. A psychological bias could explain this: people tend to agree with their own thinking, and if you're looking at product review you are likely to already like the product.
- On average, the most helpful reviews have a score of 9. This is likely to be a user that is happy overall with the product, but mentions something specific that they don't like about it. This specific mention is likely to be valuable to a consumer.
- When all of the votes are counted together, we get a higher ratio of helpful votes to unhelpful votes when the review score is higher. It is possible that higher-scoring reviews are more expressive about what they like about a product, which is more helpful to the consumer.
- There aren't a lot of obvious differences between the text of a good review and that of a bad review (based on a small manual look through the data). It's possible that a lot of votes could be due to 'fanboyism', both positively and negatively, but further sampling would be required to determine that.

It would be interesting to hear what your theories are on these statistics, and other questions you'd like to ask about the data.

*This article was written by Jonny Arnold for Reevoo Engineering. Thanks to Edwin Bos for suggesting the extraction of individual reviews to exemplify usefulness.*