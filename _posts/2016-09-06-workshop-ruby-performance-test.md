---
layout: post
title:  Workshop - Ruby Performance Test
date:   2016-09-06 11:00
categories: blog
navId: blog
author: Alex Malkov
github: amalkov
---

The goal of this workshop is to highlight how you can archive better performance of your Ruby applications.
We can choose different ways of writing code, but which one works faster? 

I did some benchmarks the other day, so just want to share results with you.
 
 
## Don't create unnecessary objects, use merge!

{% highlight ruby %}
require 'benchmark'

def merge!(array)
  array.inject({}) { |h, e| h.merge!(e => e) }
end

def merge(array)
  array.inject({}) { |h, e| h.merge(e => e) }
end

N = 10_000
array = (0..N).to_a

Benchmark.bm(10) do |x|
  x.report("merge!") { merge!(array) }
  x.report("merge")  { merge(array)  }
end
{% endhighlight %}


RESULT (ruby 2.3.0):

{% highlight bash %}
                 user     system      total        real
merge!       0.010000   0.000000   0.010000 (  0.007616)
merge       18.380000   0.740000  19.120000 ( 19.143505)
{% endhighlight %}

 
## Be careful with calculation within iterators
Try to avoid nested methods. In ```n_func``` we do only one iteration over an array without any hard calculation within the iterator 

{% highlight ruby %}
require 'benchmark'

def n_func(array)
  array.inject({}) { |h, e| h[e] = e; h }
end

def merge_bang_func(array)
  array.inject({}) { |h, e| h.merge!(e => e) }
end

def n2_func(array)
  array.inject({}) { |h, e| h.merge(e => e) }
end

N      = 10_000
array = (0..N).to_a

Benchmark.bm(10) do |x|
  x.report("O(n)") { n_func(array) }
  x.report("O(n)merge!") { merge_bang_func(array) }
  x.report("O(n2)") { n2_func(array) }
end
{% endhighlight %}


RESULT (ruby 2.3.0):

{% highlight bash %}
                 user     system      total        real
O(n)         0.000000   0.000000   0.000000 (  0.002110)
O(n)merge!   0.010000   0.000000   0.010000 (  0.007396)
O(n2)       19.000000   0.760000  19.760000 ( 19.794764)
{% endhighlight %}


## Use DateTime instead of Time

Try to avoid active_support, it will slow down your calculations significantly.

{% highlight ruby %}
require 'benchmark'
require 'date'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/time/calculations'

Benchmark.bm(17) do |bm|
  bm.report('DateTime:') do
    n1 = DateTime.now
    n2 = DateTime.now
    1_000_000.times { n1 < n2 }
  end
  bm.report('Time:    ') do
    n1 = Time.now
    n2 = Time.now
    1_000_000.times { n1 < n2 }
  end

  puts DateTime.parse('2012-10-10 10:10 +0300')
  bm.report('DateTime parse:') do
    1_000_000.times { DateTime.parse('2012-10-10 10:10 +0300') }
  end

  puts Time.parse('2012-10-10 10:10 +0300')
  puts Time.zone.parse('2012-10-10 10:10 +0300')
  Time.zone = 'EET'
  puts Time.zone.parse('2012-10-10 10:10 +0300')
  bm.report('Time:    parse:') do
    1_000_000.times { Time.zone.parse('2012-10-10 10:10 +0300') }
  end
end
{% endhighlight %}

RESULT (ruby 1.9.2-p330):

{% highlight bash %}
      user     system      total        real
DateTime:  4.980000   0.020000   5.000000 (  5.063963)
Time:      0.330000   0.000000   0.330000 (  0.335913)
{% endhighlight %}

Nowadays it is faster... 

RESULT (ruby 2.3.0):

{% highlight bash %}
       user     system      total        real
DateTime:  0.150000   0.000000   0.150000 (  0.151570)
Time:      0.170000   0.000000   0.170000 (  0.169885)
DateTime parse: 20.710000   0.060000  20.770000 ( 20.779141)
Time     parse: Not implemented
{% endhighlight %}

After requiring active support

RESULT (ruby 2.3.0):

{% highlight bash %}
       user     system      total        real
DateTime:        0.500000   0.010000   0.510000 (  0.503089)
Time:            1.730000   0.000000   1.730000 (  1.749615)
DateTime parse: 25.490000   0.100000  25.590000 ( 25.613761)
Time:    parse:110.320000   0.260000 110.580000 (110.743532)
{% endhighlight %}

## Avoid using += to concatenate strings in favor of << method 

{% highlight ruby %}
require 'benchmark'

N = 1_000
LENGTH = 10_000

Benchmark.bm(15) do |x|
  x.report("+=") do
    str1 = ""
    str2 = "s" * LENGTH
    N.times { str1 += str2 }
  end

  x.report("interpolation") do
    str1 = "s"
    str2 = "s" * LENGTH
    N.times { str1 = "#{str1}#{str2}" }
  end

  x.report("<<") do
    str1 = "s"
    str2 = "s" * LENGTH
    N.times { str1 << str2 }
  end
end
{% endhighlight %}


{% highlight ruby %}
str1 = "first"
str2 = "second"
str1.object_id       # => 16241320

str1 += str2    # str1 = str1 + str2
str1.object_id  # => 16241240, id is changed

str1 << str2
str1.object_id  # => 16241240, id is the same
{% endhighlight %}


RESULT (ruby 2.3.0):

{% highlight bash %}
                      user     system      total        real
+=                1.310000   2.060000   3.370000 (  3.374704)
interpolation     0.780000   0.900000   1.680000 (  1.677559)
<<                0.000000   0.000000   0.000000 (  0.004387)
{% endhighlight %}



## class_eval  

Try to avoid this, but if you can not, this section for you.
class_eval works slower but it’s preferred since methods generated, as generated methods work faster.

{% highlight ruby %}
require 'benchmark'

class Metric
  N = 1_000_000

  def self.class_eval_with_string
    N.times do |i|
      class_eval(<<-eorb, __FILE__, __LINE__ + 1)
        def smeth_#{i}
      #{i}
        end
      eorb
    end
  end

  def self.with_define_method
    N.times do |i|
      define_method("dmeth_#{i}") do
        i
      end
    end
  end
end

Benchmark.bm(22) do |x|
  x.report("class_eval with string") { Metric.class_eval_with_string }
  x.report("define_method")          { Metric.with_define_method     }

  metric = Metric.new
  x.report("string method")  { Metric::N.times { metric.smeth_1 } }
  x.report("dynamic method") { Metric::N.times { metric.dmeth_1 } }
end
{% endhighlight %}


class_eval works slower but it’s preferred since methods generated with class_eval and a string of code work faster

RESULT (ruby 2.3.0):

{% highlight bash %}
                             user     system      total        real
class_eval with string  23.730000   0.510000  24.240000 ( 24.301654)
define_method            9.280000   0.210000   9.490000 (  9.510544)
string method            0.070000   0.000000   0.070000 (  0.071356)
dynamic method           0.120000   0.000000   0.120000 (  0.128129)
{% endhighlight %}


## Use detect

{% highlight ruby %}
require 'benchmark'

ARRAY = (1..100_000_000).to_a

Benchmark.bm(20) do |x|
  x.report("Enumerable#select.first") { ARRAY.select { |x| x.eql?(15) }.first }
  x.report("Enumerable#detect")   { ARRAY.detect { |x| x.eql?(15) } }
  x.report("Enumerable#select.first") { ARRAY.select { |x| x.eql?(15_000_000) }.first }
  x.report("Enumerable#detect")   { ARRAY.detect { |x| x.eql?(15_000_000) } }
end
{% endhighlight %}

RESULT (ruby 2.3.0):

{% highlight bash %}
                           user     system      total        real
Enumerable#select.first  9.480000   0.020000   9.500000 (  9.521282)
Enumerable#detect      0.000000   0.000000   0.000000 (  0.000019)
{% endhighlight %}

In the middle of the Array still fast enough.

{% highlight bash %}
                           user     system      total        real
Enumerable#select.first  9.670000   0.040000   9.710000 (  9.759445)
Enumerable#detect      1.730000   0.010000   1.740000 (  1.751693)
{% endhighlight %}


## Do not use exceptions for a control flow

{% highlight ruby %}
require 'benchmark'

class Obj
  def with_condition
    return unless respond_to?(:mythical_method)

    self.mythical_method
  end

  def with_rescue
    self.mythical_method
  rescue NoMethodError
    nil
  end
end

obj = Obj.new
N = 10_000_000

puts RUBY_DESCRIPTION

Benchmark.bm(15, "rescue/condition") do |x|
  rescue_report     = x.report("rescue:")    { N.times { obj.with_rescue    } }
  condition_report  = x.report("condition:") { N.times { obj.with_condition } }
  [rescue_report / condition_report]
end
{% endhighlight %}

RESULT (ruby 2.3.0):

{% highlight bash %}
                      user     system      total        real
rescue:          24.180000   0.150000  24.330000 ( 24.389499)
condition:        1.410000   0.000000   1.410000 (  1.415949)
rescue/condition 17.148936        Inf        NaN ( 17.224849)
{% endhighlight %}


## Be simple, use Hash or Struct

{% highlight ruby %}
require 'benchmark'
require 'ostruct'
require 'hashie'

N = 1_000_000

Benchmark.bm(25) do |x|
  x.report("Hash")         { N.times { { field_1: 1, field_2: 2 } } }
  s = Struct.new(:field_1, :field_2);
  x.report("Struct")       { N.times { s.new(1, 2) } }
  x.report("OpenStruct")   { N.times { OpenStruct.new(field_1: 1, field_2: 2) } }
  x.report("Hashie::Mash") { N.times { Hashie::Mash.new(field_1: 1, field_2: 2) } }
  x.report("Hash create/read")         { N.times { o = { field_1: 1, field_2: 2 }; o.values } }
  x.report("Struct create/read")       { N.times { o = s.new(1, 2); [o.field_1, o.field_2] } }
  x.report("OpenStruct create/read")   { N.times { o = OpenStruct.new(field_1: 1, field_2: 2); [o.field_1, o.field_2] } }
  x.report("Hashie::Mash create/read") { N.times { o = Hashie::Mash.new(field_1: 1, field_2: 2); [o.field_1, o.field_2] } }
end
{% endhighlight %}


RESULT (ruby 2.3.0):

{% highlight bash %}
                                user     system      total        real
Hash                        0.560000   0.020000   0.580000 (  0.585226)
Struct                      0.190000   0.000000   0.190000 (  0.183596)
OpenStruct                  1.600000   0.020000   1.620000 (  1.624675)
Hashie::Mash                3.950000   0.020000   3.970000 (  3.984425)
Hash create/read            0.620000   0.010000   0.630000 (  0.632089)
Struct create/read          0.270000   0.000000   0.270000 (  0.274975)
OpenStruct create/read      5.910000   0.010000   5.920000 (  5.925728)
Hashie::Mash create/read    6.050000   0.020000   6.070000 (  6.072480)
{% endhighlight %}


## Parallel assignment is slower

{% highlight ruby %}
require 'benchmark'

N = 10_000_000

Benchmark.bm(15) do |x|
  x.report('parallel') do
    N.times do
      a, b, c, d = 10, 20, 30, 40
    end
  end

  x.report('consequentially') do |x|
    N.times do
      a = 10
      b = 20
      c = 30
      d = 40
    end
  end
end
{% endhighlight %}

RESULT (ruby 2.3.0):

{% highlight bash %}
                      user     system      total        real
parallel          2.660000   0.020000   2.680000 (  2.698620)
consequentially   0.750000   0.010000   0.760000 (  0.759135)
{% endhighlight %}


## Source

{% highlight bash %}
git checkout git@github.com:amalkov/ruby-performance-tests.git
{% endhighlight %}


## Thanks

Big thanks to [Ruby Performance Tricks](http://greyblake.com/blog/2012/09/02/ruby-perfomance-tricks/) and
[Array argument vs splat arguments](https://github.com/JuanitoFatas/fast-ruby/blob/master/code/general/array-argument-vs-splat-arguments.rb)

Basically I decided to create some tests and rerun some other tests from those articles on newest ruby versions. 
