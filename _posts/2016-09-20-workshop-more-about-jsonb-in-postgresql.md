---
layout: post
title:  Workshop - More about JSONB in PostgreSQL                                                                                                                                                                   re about JSONB in PostgreSQL
date:   2016-09-19 13:00
categories: blog
navId: blog
author: Alex Malkov
github: amalkov
---

So many companies began to understand the fact that their architecture and design toolkit has evolved from being relational database-centric (Relational Database Management Systems) to also including a varied and maturing set of non-relational options (NoSQL database systems).
There are pros and cons for both database types, however we need to understand that NonSQL databases were never meant to replace relational ones.

So, why not to have 2 in 1?
PostgreSQL offers an alternative, by providing special data types with a loose structure, which mimic NoSQL behavior on a RDBMS


## Setup

{% highlight bash %}
$: createdb json_test
$: psql json_test
{% endhighlight %}

{% highlight sql %}
CREATE TABLE users (
  id serial primary key,
  jsonb_data jsonb,
  json_data json,
  numbers integer
);
\d+ users;
{% endhighlight %}

## JSONB vs JSON

JSON - will store the JSON string "as is" as long as it's valid. 
JSONB - will parse it for indexing sake: trimming extra whitespace, ordering of object keys and overriding existing keys. 

This could mean that the JSON data has two items with the same key, but JSONB will have only one key. 

Therefor never store a JSON dump for debugging reason from an API call or something similar in JSONB columns.

{% highlight sql %}
INSERT INTO users(jsonb_data, json_data) 
  VALUES (
    '{"key1": "value1", "key2": "value 2", "key2": "value 3"}',
    '{"key1": "value1", "key2": "value 2", "key2": "value 3"}'
  );
{% endhighlight %}

{% highlight sql %}
select * from users;
 id |              jsonb_data               |                        json_data                         | numbers
----+---------------------------------------+----------------------------------------------------------+---------
  2 | {"key1": "value1", "key2": "value 3"} | {"key1": "value1", "key2": "value 2", "key2": "value 3"} |
{% endhighlight %}


## When you would consider JSON/JSONB

- Arbitrary attributes to an entity (you doesn't have control of the attributes)
- Fetch isolated attributes (name/surname in our sample or card in (Trello)[https://trello.com/])
- Maintain data that comes from an external service in the same structure and format (as JSON)
- Avoid transforming data before returning it via your JSON API


## No fixed data typing

Be careful, json/jsonb comparisons are sensitive to data type so, for example, the jsonb values "11111" and 11111 are unequal:

{% highlight sql %}
SELECT '11111'::jsonb, '"11111"'::jsonb, '11111'::jsonb = '"11111"'::jsonb AS "isequal";

  jsonb   |   jsonb    | isequal 
----------+------------+---------
  11111   |   "11111"  | f
{% endhighlight %}

In MySQL it will return `true`

{% highlight sql %}
SELECT '11111' = 11111 ; -- true
{% endhighlight %}


## Filtering

{% highlight sql %}
INSERT INTO users(jsonb_data) VALUES 
('{"name": "Rob",   "surname": "Banks", "mobile": 11111, "town": "Moron"}'),
('{"name": "May",   "surname": "Bee",   "mobile": 22222, "town": "Whynot"}'),
('{"name": "Ken",   "surname": "Bee",   "mobile": 33333, "town": "Whynot"}'),
('{"name": "Chris", "surname": "Cross", "mobile": 44444, "town": "Crapstone"}');

SELECT jsonb_data->>'name' FROM users WHERE jsonb_data->>'town' = 'Whynot';
{% endhighlight %}

{% highlight sql %}
 ?column?
----------
 May
 Ken
(2 rows)
{% endhighlight %}

## JSON key exist?

{% highlight sql %}
INSERT INTO users(jsonb_data) VALUES ('{"random": 555}'); 
SELECT count(*) FROM users WHERE jsonb_data ? 'mobile';
{% endhighlight %}

{% highlight sql %}
 count
-------
     1
(1 row)
{% endhighlight %}

## '->>' vs '->'
 
`->`  will return the attribute as a JSON object

`->>` will return the property as integer or text (the parsed form of the attribute).

## Expand Array

In this case we need to use `->` instead of `->>` as we need to pass JSON object into jsonb_array_elements_text
{% highlight sql %}
INSERT INTO users(jsonb_data) VALUES ('{"names": ["Rob", "May", "Ken", "Chris"]}');
SELECT jsonb_data->>'names' as names FROM users WHERE jsonb_data ? 'names';
SELECT jsonb_array_elements_text(jsonb_data->'names') as name FROM users WHERE jsonb_data ? 'names';
{% endhighlight %}
Note: for 'json' type, need to use json_array_elements_text

## Indexes

Lets seed data first
{% highlight sql %}
INSERT INTO users (jsonb_data)
SELECT ('{"rand":' || (random() * 9999)::integer || '}')::jsonb
FROM generate_series(1, 1000000) AS x(id);
{% endhighlight %}

Here we used Series Generating Function as we don't want to seed it manually.

also we need to enable timing
{% highlight sql %}
\timing
{% endhighlight %}

Now let's select some data

{% highlight sql %}
SELECT COUNT(*) FROM users WHERE (jsonb_data->>'rand') LIKE '%00%';
 count
-------
 18009
(1 row)

Time: 255.829 ms
{% endhighlight %}

{% highlight sql %}
SELECT COUNT(*) FROM users WHERE (jsonb_data->>'rand')::integer>500;
 count
--------
 949626
(1 row)

Time: 389.626 ms
{% endhighlight %}

And add indexes

{% highlight sql %}
CREATE INDEX idxrand ON users ((jsonb_data->>'rand'));
{% endhighlight %}

and select it again

{% highlight sql %}
SELECT COUNT(*) FROM users WHERE (jsonb_data->>'rand') LIKE '%00%';
 count
-------
 18009
(1 row)

Time: 235.776 ms
{% endhighlight %}

{% highlight sql %}
SELECT COUNT(*) FROM users WHERE (jsonb_data->>'rand')::integer>500;
 count
--------
 949626
(1 row)

Time: 345.102 ms
{% endhighlight %}


## RDBMS vs NonSQL 

It would be nice to check how quickly we will get the same data from integer column

{% highlight sql %}
INSERT INTO users (numbers)
SELECT (random() * 9999)::INTEGER
FROM generate_series(1, 1000000) AS x(id);
{% endhighlight %}

Without indexes

{% highlight sql %}
SELECT COUNT(*) FROM users WHERE numbers > 500;
 count
--------
 949796
(1 row)

Time: 223.077 ms
{% endhighlight %}
As expected RDBMS - faster.

And with indexes...

{% highlight sql %}
CREATE INDEX idxnumbers ON users (numbers);
SELECT COUNT(*) FROM users WHERE numbers > 500;
 count
--------
 949796
(1 row)

Time: 191.450 ms
{% endhighlight %}


## GIN index

{% highlight sql %}
DROP INDEX idxrand;
CREATE INDEX idxrandgin ON users USING gin (jsonb_data);
SELECT COUNT(*) FROM users WHERE (jsonb_data->>'rand') LIKE '%00%';
 count
-------
 18009
(1 row)

Time: 306.762 ms
{% endhighlight %}

## Be careful with data types

By default it is treating field as a string, therefore by running
we have to specify 500 as a string as well...
end... it will double the time, GIN index wouldn't help much...

{% highlight sql %}
SELECT COUNT(*) FROM users WHERE (jsonb_data->>'rand')>'500';
 count
--------
 554835
(1 row)

Time: 955.556 ms
{% endhighlight %}

By adding index we will back to the same figures

{% highlight sql %}
DROP INDEX idxrandgin;
CREATE INDEX idxrand ON users ((jsonb_data->>'rand'));
SELECT COUNT(*) FROM users WHERE (jsonb_data->>'rand')>'500';

 count
--------
 554835
(1 row)

Time: 435.364 ms
{% endhighlight %}

## Summary

Having flexibility of JSON structures within relational database is good. However we need to understand what and when we need to use.
Queries that are simple on common data types can get tricky and difficult using the JSON one, especially when dealing with arrays of objects.


## Thanks

Big thanks to [PostgreSQL anti-patterns: Unnecessary json/hstore dynamic columns](http://blog.2ndquadrant.com/postgresql-anti-patterns-unnecessary-jsonhstore-dynamic-columns/) and 
[Unleash the Power of Storing JSON in Postgres](https://blog.codeship.com/unleash-the-power-of-storing-json-in-postgres/)


