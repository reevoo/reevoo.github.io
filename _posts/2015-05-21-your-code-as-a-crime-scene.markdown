---
layout: post
title:  Your Code as a Crime Scene
date:   2015-05-21 13:00:00
categories: blog
navId: blog
---

I first heard of Adam Tornhill when I attended his talk at QCon London 2015. His talk, titled [*Your Code as a Crime Scene*](http://qconlondon.com/presentation/treat-your-code-crime-scene), was a well-delivered presentation highlighting the untapped potential of version control systems (VCS). In what I felt was the best talk of the day, Tornhill showed the wealth of information we provide to our VCS as well as some simple techniques to extract and use it.

The promise of the talk was to equip you with tools (plucked from forensic science) to identify problem areas in your code, allowing you to focus your effort on the areas that really matter.

One of the reasons I was captivated by the talk was the sheer simplicity of the concepts described; if you've done any kind of statistical analysis you already know how to analyse your VCS logs.

I don't know if Tornhill was explicitly selling his book with his talk (!), but it worked - I got hold a copy of his book (also titled [*Your Code as a Crime Scene*](http://www.amazon.co.uk/Your-Code-Crime-Scene-Bottlenecks/dp/1680500384/ref=sr_1_1?ie=UTF8&qid=1432283554&sr=8-1&keywords=your+code+as+a+crime+scene)) as soon as I could, and read it within a few days of receiving it. The book doesn't disappoint: Tornhill's writing style is entertaining, informative and insightful. 

A lot of the book focuses around Tornhill's tool [*Code Maat*](https://github.com/adamtornhill/code-maat) which provides an easy way to analyse your own code base. In reality *Your Code as a Crime Scene* could have been a dull instruction manual for the tool, but thankfully Tornhill uses the book instead to explain the theory behind the tool and the implications of the results it provides. As long as you're not afraid of the command line *Code Maat* is easy to install and use.

## Analysing Your Own Code Base

Tornhill outlines a number of analyses that can be performed on code bases small and large. But does it work? I experimented with some repositories at Reevoo to see where we should be focussing our attention.

*rw* is a 10-year-old behemoth of a Rails application that has acted as our monolith for a long time. The summary of the application from Git for 2014/2015 is below:

```
git log --pretty=format:'[%h] %aN %ad %s' --date=short --numstat --after=2014-01-01 --before=2015-01-01 > rw.log
```

```
java -jar code-maat-0.8.6-standalone.jar -l rw.log -c git -a summary > summary.csv
```

| statistic | value |
| --------- | ----: |
| number-of-commits | 1519 |
| number-of-entities | 1558 |
| number-of-entities-changed | 5455 |
| number-of-authors | 21 |

As you can see, a pretty busy project! Are there any particularly busy areas? Let's run the authors analysis.

```
java -jar code-maat-0.8.6-standalone.jar -l rw.log -c git -a authors  > authors.csv 
```

| entity | n-authors |  n-revs |
|--------|----------:|--------:|
| *.../reviews_controller_spec.rb* | *14* | *78* |
| .../routes.rb    | 14 | 70 |
| Gemfile.lock    | 14 | 63 |
| .../schema.rb    | 13 | 68 |
| Gemfile | 13 | 44 |

The top 5 doesn't seem particularly unusual for a Rails project, *except for the top entry.* Reviews are obviously a big part of Reevoo's business, but why only the spec?

As Tornhill notes himself, you need to do some digging yourself once *Code Maat* has shown you where to go.

The first thing you need to know about *reviews_controller_spec.rb* is that it is, at the time of writing, **1,634 lines**; this is surprising, given that *reviews_controller.rb* is only 110 lines long. 

The first test in *reviews_controller_spec.rb* is on line 364 - above this, there are three large methods that setup, modify and check the data returned by the API. The 'big check' is the problem - we verify the entire data packet in each of our tests, which is why it is so difficult to setup. 

We will clear this up soon. Thanks *Code Maat*!

### Coupling

One of my favourite demonstrations Tornhill exhibited was how commits can be used to find coupled code in your system, simply by correlating which files change together. What does it look like for *rw*?

The following table shows the top 10 (ordered by coupling degree) after removing specs and common Rails coupling such as `Gemfile <-> Gemfile.lock`:

```
java -jar code-maat-0.8.6-standalone.jar -l rw.log -c git -a coupling  > coupling.csv
```

| (ref) | entities | degree | average-revs |
|:-----:|----------|-------:|-------------:|
| 1 | *.../import_scripts/default_importer_algorithm.rb* <br/> *.../import_scripts/[COMPANY_X]_adapter.rb* | *100* | *5* |
| 2 | .../mailers/video_review_mailer.rb <br/> .../views/video_review_mailer/fill_out_a_video_review.html.slim | 92 | 7 |
| 3 | *.../reviewable/product_group.rb* <br/> *.../reviewable/retailer_product.rb* | *90* | *6* |
| 4 | .../app/assets/stylesheets/platform_api_v4/documentation.css <br/> .../lib/platform_api_v4/documentation.rb | 76 | 7 |
| 5 | .../reviews_presenter/sort_order.rb <br/> .../reviews_presenter/sort_order_collection.rb | 63 | 10 |
| 6 | .../conversations/question.rb <br/> .../conversations/question/response.rb | 58 | 12 |
| 7 | .../summary/parent.rb <br/> .../summary/parent/organisation.rb | 58 | 9 |
| 8 | .../customer_experience_reviews/summary.rb <br/> .../customer_experience_reviews/summary/parent.rb | 54 | 11 |
| 9 | .../api_models/retailer_review.rb <br/> .../api_models/review.rb| 52 | 12 |
| 10 | *.../models/api_provider.rb* <br/> *.../models/automotive_aggregation_api_adapter.rb* | *52* | *10* |

*degree* here refers to the percentage of commits where the two files have been changed in the same commit.

On the whole, this looks pretty good: things that change together are very close in naming and directory structure. However, there are some interesting observations:

- A number of the top 10 are just areas of the code that were developed together. For example, it looks like our base import script (#1) isn't as generic as we thought. However this was built from scratch in 2014 and *COMPANY X* was our first customer to use this mechanism, so it makes sense that they changed together. This is the same for #10 as well.
- The coupling of product group and retailer product (#3) is, on the face of it, more concerning. This is in the response rendering code of our application. Looking at the logs, however, we find that there is no code coupling - it's just a coincidence! (phew)

Looking through, our initial analysis says our coupling was pretty good - in 2014 at least. Obviously we cannot extrapolate and say "the code base is lossely coupled".

### Knowledge Gaps

One of the issues I imagined we would have a problem with at the beginning of this analysis was with knowledge gaps - areas of the code that were authored by developers that are no longer around.

Tornhill makes a good point in *Your Code as a Crime Scene* about knowledge gaps: you only need to worry about areas of the code that nobody knows about *and* need changing. If an area of code is stable, you don't need to worry about it (until you change it, of course!). Our analysis does this: we are only using commits between 2014/2015, we only know about files that have changed recently.

This one requires a little bit more effort. First we run the entity ownership analysis:

```
java -jar code-maat-0.8.6-standalone.jar -l rw.log -c git -a entity-effort > entity-effort.csv
```

With the analysis done, we need to highlight which authors are still in the team to get the percentage of code that was written by current developers.

How do we figure out where we should be worried? Well, we are looking for areas with lots of commits made by developers who are no longer here. I conjured the following metric out of the air:

```
S[e] = R[e] * U[e]
```

where:

- `S[e]` is the *scariness factor* for the entity.
- `R[e]` is the number of revisions for the entity.
- `U[e]` is the percentage of commits for the entity written by employees who are no longer in the company.

Should we weight these two measures equally? I would suggest that the percentage of 'knowledge gap' commits is *more* important than the number of revisions. I eventually settled on:

```
S[e] = SQRT(R[e]) * U[e]
```

If you've got all that, then good (and well done)! Here are the top 10:

| entity | revs | %unknown | scariness |
|--------|-----:|---------:|----------:|
| *.../reviews_controller_spec.rb* | *78*  | *50* | *4.4* |
| *.../response_builder/organisation.rb* | *40* | *60* | *3.8* |
| *.../response_builder/customer_experience_review.rb* | *37* | *57* | 3.5 |
| *.../models_to_delete/review_v4.rb* | *13* | *92* | *3.3* |
| .../reviewables_controller_spec.rb | 48  | 46 | 3.2 |
| *.../reviews_container_json_builder.rb*  | *9*   | *100*    | *3.0* |
| *.../response_builder/review.rb*   | *53* | *40* | *2.9* |
| .../reviewables_controller.rb   | 28  | 54 | 2.8 |
| *.../new_categories_controller.rb*  | *8*   | *100*    | *2.8* |
| .../organisations_controller_spec.rb   | 35  | 46 | 2.7 |

So what do we learn here about *rw*?

- We have validated our concern for `reviews_controller_spec.rb`, because here it is again at the top of our list! We *really* need to look at this file.
- We have a number of knowledge gaps in the response builder. This code uses [a custom transformer](https://github.com/reevoo/responsible) to serialize objects to JSON for our API. This is an important knowledge gap to fill, as we've run into problems before.
- We have a folder called `models_to_delete`. We should probably delete them, but given it was written by developers who are no longer here, how can we know whether we can delete it? (Trust the tests, perhaps?)
- There are a number of files we know nothing about.

Plenty of work to do following this analysis. But what do you do with a knowledge gap? One way of fixing it is to delete the unknown code and see what happens. The other is to assign people to 'learn' these areas of the system (and hope they don't leave soon!).

As Tornhill rightly says in *Your Code as a Crime Scene*, the metric I made up is not infallible. It has many biases, such as the developer's usual commit frequency. However, it provides a good place to start.

## Summary

*Code Maat* is an excellent tool that, together with *Your Code as a Crime Scene*, can allow you to identify areas of your system that need some care and attention.

It's not perfect - I had a number of times where I followed the instructions correctly, but received an error telling me that my log was corrupt. (This was typically fixed by using the `.jar` instead of running it directly with `lein`.) Also, visualisation is left as an exercise to the analyst. Finally, *Code Maat* is a diagnosis tool; it will not fix your problems. *Code Maat* is for highlighting problem areas to show you where to start working.

If you can convince your business to give you the time, I would thoroughly recommend reading the book and giving *Code Maat* a try; it could save you a lot of headache in the future.

*This article was written by Jonny Arnold for Reevoo Engineering. Thanks to the Reevoo Engineering Team for reading and commenting on the article before it was released into the wild.*
