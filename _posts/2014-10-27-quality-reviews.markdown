---
soapboxContentId: af9970cc-51c1-43fb-a540-e2ccb230d93e
layout: post
title:  Putting Quality Reviews First
date:   2014-10-27 11:44:39
categories: blog
navId: blog
---

At Reevoo we get thousands of reviews a day for many different products. Some reviews are better than others, in terms of quality rather than score. How can we make sure that our users see reviews that will help them make the right decision? Can we create an algorithm that sorts our reviews in such a way that high quality reviews are shown first?

This article hopes to identify what needs to go into this algorithm.

## What Is The Most Useful Review?

Perhaps the most difficult question around this algorithm is determining what we believe to be a quality review.

We have an important tool in our arsenal: *Helpfulness*. We invite any user to upvote or downvote a review based on whether the review was helpful or not when considering their purchase. We can therefore say that the best reviews are the most helpful. As a result, we could use Helpfulness as our ordering and knock off early, right?

Wrong. Only 15% of our reviews have ever had Helpfulness votes. Of the reviews with Helpfulness, 82% of them have had less than 3 votes. This unfortunately means that the vast majority of our reviews do not have any Helpfulness data at all. Is this because it is difficult to understand Helpfulness? It's more likely that the review hasn't been seen.

On the plus side, we have a *lot* of reviews. Even if we only select reviews with 3 or more Helpfulness votes, we have over 100,000 reviews. This gives us a good training set to use. If we can determine the qualities of a useful review from these 100,000 reviews, we can then go on to analyse the millions of unvoted reviews and hopefully provide more useful reviews to Reevoo's users.

## What's the Algorithm?

The problem that we have has been encountered many times before, when taken in general terms:

- We would like to calculate a number (Helpfulness) from some text (a review).
- We have a set of data that we can use to tune the algorithm (reviews with 3+ Helpfulness votes). This data has come from human interactions.

This algorithm falls neatly into the realm of **Machine Learning**. The 'learning' here is simply the tuning of the algorithm, based on the training data we give it.

Machine Learning is a vast field. Strategies can be simple or complex, fast or slow, and some even continue to 'tune' the algorithm on-the-fly as more training data is fed into it. Many research papers use SVM (Support Vector Machine) as the strategy of choice, but some prototyping should be done to determine whether this is correct for us. This is especially true as SVM is a classification algorithm (the output is a limited set of values, such as 'good'/'bad') rather than a regression algorithm (the output is a number that can be any value).

## What Do We Put Into The Algorithm?

The algorithm we want to write will output a number, our predicted Helpfulness, but what do we put into the algorithm? These inputs, known in Machine Learning as *features*, are the most important things to get right: with the wrong features, no amount of training will give you reliable data.

So how do we pick our features? Luckily there have been a number of studies before us that have looked into the best features to use:

- *Weimer et al (2007)* classified forum posts as 'good' or 'bad' with 89% accuracy. Some features were forum-specific, but other features included word count, spelling error frequency, and the frequency of different parts of speech.
- *Kim et al (2006)* ranked Amazon.com reviews according to helpfulness with a rank correlation of 0.66. They found the most useful features were the word count, relative importance of individual words (unigrams) and product rating.
- *Mudambi and Schuff (2010)* showed that there was a positive correlation between word count and helpfulness for reviews on Amazon.com. They also showed that the product type (whether product quality can be determined before purchase or not) determined whether users found moderate or extreme reviews the most helpful.
- *Yu et al (2012)* improved the accuracy of rankings by Kim and Liu by including features such as the use of product keywords and certain language ('is' instead of 'might'). They also noted the inclusion of mainstream opinion as a feature improved accuracy.

One of the mixed blessings of machine learning algorithms is that the number of features is not limited. In theory we could include all of these features; however, if the number of features can be kept small the algorithm will run faster and be easier to understand. Some useful resources around feature selection and tuning are available on Coursera's online Machine Learning course (https://class.coursera.org/ml-004). 

## What Can We Do Differently?

### Ask The Moderators

A useful tool we have at our disposal is our network of moderators. These moderators ensure a review adheres to our guidelines. They also ensure that a review is checked by a person, rather than an automated system.

Moderators could be a useful input to our algorithm. We could get moderators to respond to one or more questions about the review and this information could be fed into our algorithm.

One option would be to get the moderator to rate the quality of the review. For example:

    How would you rate the quality of this review?
    A good quality review:
    - Has good spelling and grammar.
    - Is specific about features of the product.
    - Is reasoned (it mentions both good and bad).
    [Good] [Indifferent] [Bad]

We can then input this into our Helpfulness algorithm. Alternatively, we could ask about individual properties of the review:

    Please answer the following questions about this review:

    Does the review have good spelling and grammar? [Yes] [No]
    Does the review mention specific features of the product? [Yes] [No]
    Does the review mention good and bad points? [Yes] [No]

This provides more information about the review and allows us to weight each feature differently in the algorithm. Also, the questions are more specific, which is likely to lead to less variation between moderators. However, these questions may take longer to answer than the single question suggested earlier.

### Identify the Experts

*Connors et al (2011)* proved in a series of experiments that 'reviews written by a self-described expert are more helpful than those that are not'.

When we send out a review we sometimes ask the reviewer to place themself into a segment. If we adapt this segmentation and ask users to highlight whether they are an expert in the product's field (e.g. for a car, a mechanic may be considered an expert), users may find these reviews more helpful than others. This could be added as a feature to our algorithm.

### Introduce Timeliness

One factor that is likely to affect helpfulness is how recent the review is. If a review was for an older model of the product, their review may no longer be relevant. Also, reviewers who have owned the product longer may have more to say about a product than someone who has just received it. As a result, time is likely to be an important factor when determining how helpful a review is.

Including timeliness in the machine learning algorithm is a problem: votes on reviews are permanent, so it doesn't make sense to include time as a factor when predicting its Helpfulness.

A possible solution is to train the algorithm against Helpfulness without timeliness; timeliness can be introduced after training. The disadvantage of this method is that timeliness will need to be arbitrary chosen - we cannot 'tune' timeliness because we have nothing obvious to tune it against. We could take the timestamps of Helpfulness votes and apply a timeliness factor before using it as a training set, but the machine learning algorithm will simply learn our timeliness factor. Further reading may be able to determine what a 'good' timeliness factor would be.

Another confounding factor is that the lifetimes of different products are different: a board game is likely to stay the same for years, but an MP3 player is likely to upgrade more quickly. As a result, we may need to introduce different factors for different product types, but this is complicated. We should see how our algorithm behaves for different product types to ensure our timeliness factor makes sense for all product types before we launch head-long into more complexity.

## Summary

- We intend to create a machine learning algorithm to predict Helpfulness of reviews. This can be used to bring the most helpful review to the first page, whether we have human voting on it or not.
- Researchers tend to use the Support Vector Machine for this kind of problem; we should prototype this to see if it suits our needs.
- We will develop this algorithm iteratively, adding more and more features until a satisfactory level of accuracy is achieved. Suggestions on the features are given in research papers above.
- The use of vetters will allow us to add human judgement to our algorithm calculations.
- We should consider adding 'expert' reviews to the system to improve the credibility of the review and to be factored into our algorithm.
- By making our algorithm time-based we can ensure fresh reviews are considered more helpful than stale reviews. We should check whether a global time factor is applicable to all product types.

*This post was written by Jonny Arnold for Reevoo Engineering. Special thanks to John Plummer, Zoe Feltham and Ed Robinson for reading through drafts and some great suggestions.*

## References and Further Reading

- Weimer et al, *Automatically assessing the post quality in online discussions on software*, [[1]](http://dl.acm.org/citation.cfm?id=1557806&CFID=588005427&CFTOKEN=61141331)
- Kim et al, *Automatically assessing review helpfulness*, [[2]](http://dl.acm.org/citation.cfm?id=1610135&CFID=588005427&CFTOKEN=61141331)
- Mudambi and Schuff, *What makes a helpful online review? A study of customer reviews on Amazon.com*, [[3]](http://aisel.aisnet.org/cgi/viewcontent.cgi?article=2898&context=misq&sei-redir=1&referer=http%3A%2F%2Fscholar.google.co.uk%2Fscholar%3Fq%3Dreview%2Bhelpfulness%26btnG%3D%26hl%3Den%26as_sdt%3D0%252C5#search=%22review%20helpfulness%22)
- Yu et al, *What Reviews are Satisfactory: Novel Features for Automatic Helpfulness Voting*, [[4]](http://webcache.googleusercontent.com/search?q=cache:pImixE2-otYJ:nlp.suda.edu.cn/~gdzhou/publication/hongy2012_SIGIR_Automatic%2520helpfulness%2520voting.pdf+&cd=2&hl=en&ct=clnk&gl=uk)
- Connors et al, *Is It the Review or the Reviewer? a Multi-Method Approach to Determine the Antecedents of Online Review Helpfulness*, [[5]](http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=5718695&url=http%3A%2F%2Fieeexplore.ieee.org%2Fxpls%2Fabs_all.jsp%3Farnumber%3D5718695)