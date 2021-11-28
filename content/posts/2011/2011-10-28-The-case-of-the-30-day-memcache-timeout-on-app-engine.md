---
title: "The case of the 30 day memcache timeout on app engine"
date: "2011-10-28T08:00:00-08:00"
tags: [ "App Engine", "Programming" ]
---

I ran into an interesting problem with Google app engine. It seems that the memcache time limit is enforced differently on the development server versus the production servers.

[The documentation][d] says that the time limit for a memcache key is 30 days. The behavior that I have observed is that if you set a memcache key to timeout at 30 days, the development server (on windows) will happily persist the data as expected.

On the production servers, it seems that the behavior is much different. I have notice with a timeout of 30 days, that memcache will not only ignore the persisted key but it will also cause erratic behavior for instances in your application.

Under these conditions a new instance of my application was start for each request! Obviously this adversely effects performance.

Once I changed the memcache timeout to a lesser value (under 30 days), the problem stopped.


[d]: http://code.google.com/p/memcached/wiki/FAQ#What_are_the_limits_on_setting_expire_time?_(why_is_there_a_30_d