---
layout: post
title:  Shadow Stress Test
date:   2014-08-19 14:31:39
categories: blog
navId: blog
---

In my previous blog post "[Refactoring without good test coverage][refactoring]” I mentioned using Shadow Stress Test at Reevoo - real time stress testing under live mirrored traffic. Therefore we are able to test new code with real clients traffic without affecting clients.

Our production servers hosted at Amazon EC2 allow us to create a snapshot of server instance.
One of our live instances configured to send a copy of live traffic into copied (shadow) instance.

To do this, we decided to use [EM-Proxy][em-proxy] gem (EventMachine Proxy DSL).

Current flow is:

- Production server redirecting live traffic from interface eth0 and port 80 to port 8001;
- Defining shadow and production server connections (production as localhost, instead of eth0 to not introduce a loop);
- Setting connection as closed;
- On response - setting up a response code from shadow and production servers;
- Calculating a response time;
- Writing stats as STDOUT into file;
- Logstash parsing this file.

This is our em-proxy configuration file:

{% highlight ruby %}
require 'em-proxy'

Proxy.start(:host => "0.0.0.0", :port => 8001, :debug => false) do |conn|
  @start = Time.now

  conn.server :production, :host => "127.0.0.1", :port => 80
  conn.server :shadow, :host => “xxx.xxx.xxx.xxx", :port => 80

  conn.on_data do |data|
    data.gsub!(/\sHTTP\/1\.1/, " HTTP/1.1\r\nConnection: close")
    @url = data.match(/^\w+\s(\/.*)\sHTTP\/1\.1/)[1]
    data
  end

  conn.on_response do |backend, resp|
    instance_variable_set("@" + backend.to_s + "_response_code", resp.match(/^HTTP\/\d\.\d\s(\d+)\s/)[1]) if resp.match(/^HTTP\/\d\.\d\s(\d+)\s/)
    backend == :production ? resp : nil
  end

  conn.on_finish do |backend|
    instance_variable_set("@" + backend.to_s + "_time", (Time.now - @start).round(3))
    if all_servers_finished?
      print "#{@url} #{@production_time} #{@shadow_time} #{(@shadow_time - @production_time).round(3)} #{@production_response_code} #{@shadow_response_code}\n" if ( @url && @url != "/v3")
      $stdout.flush
      unbind
    end

    :close if backend == :production
  end

  def conn.close_connection(*args)
    @server_side_close = true
    super
  end

  def conn.unbind
    super if !@server_side_close or all_servers_finished?
  end

  def conn.all_servers_finished?
    @servers.values.compact.size.zero?
  end
end
{% endhighlight %}

Using various filters in [Kibana][kibana] (browser based analytics and search interface to [Logstash][logstash]) we are able to compare response code and response time from production and shadow servers.

For example you can see on the graph - response code breakdown.

![Response code][shadow2]

Later you can filter traffic with response code 200 from production and not 200 from shadow to identify the difference, especially if you legacy application does not have a good test coverage.

![Shadow/Production comparison][shadow1]

[refactoring]: /blog/2014/07/28/refactoring-without-good-test-coverage/
[shadow1]: /images/shadow1.png
[shadow2]: /images/shadow2.png
[kibana]: https://github.com/elasticsearch/kibana
[logstash]: https://github.com/elasticsearch/logstash
[em-proxy]: https://github.com/igrigorik/em-proxy
