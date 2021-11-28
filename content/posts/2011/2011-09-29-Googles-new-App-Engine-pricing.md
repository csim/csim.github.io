---
title: "Google's new App Engine pricing"
date: "2011-09-29T08:00:00-08:00"
tags: [ "App Engine" ]
---

Google App engine is in the process of changing it's pricing model. At present this new pricing model goes into effect on December 1, 2011. There has been quite an uproar among App engine developers. In some cases the new billing model raises monthly costs by more than 300%. This has cause quite a reaction among the community and the backlash is very real

### What is changing?
The primary change is that Google is moving from a model where you are charged by CPU time to a model where you are charged by "instance time". This means that google charges are not necessarily based on pure CPU use but rather on the amount of instances of your application the Google scheduler decides to run. To magnify matters, most web applications are IO bound and the current version of Python supported by App Engine is single threaded. 

That means that your application is probably using more instances that you think. Because one instance can only handle a fixed amount of traffic based on IO and threading, the scheduler is forced to create instances more often for Python applications. All of these circumstances add up to a much higher cost for developers.

Google has added sliders that allow you to tweak the scheduler behavior. You can now change the maximum number of idle instances and the minimum pending wait time. This allow us to dictate how long is a acceptable waiting time per request and how many instances show be available for traffic spikes. 

I'm personally glad these are available, although others disagree. I have found them to be helpful for my small(ish) application because latency is not a concern, so I can set the min latency up to around 700ms. This means that requests can wait to be served from an _existing_ instance. Basically all output from my application is cached, so my request processing time is under 100ms. Setting the min pending latency to 700ms basically means that my application can remain free. I like free.

It appears as though CPU billing was a bad idea in the first place and Google is now correcting for this by changing to instance based billing. In the end, Google needs to pay for the physical resources an application uses and as it turns out web applications use very little CPU as compared to IO with the datastore or other APIs. 

So, is the dream of a true "Platform as a Service" dead? Yes and No. The precise billing aspect of PaaS is dead at Google for the moment, but App Engine (and PaaS for that matter) is not defined by this shortcoming. Ultimately Google has recognized that having an instance running costs money even if the CPU usage for that instance is zero. Said another way, memory costs money. An instance will always consume memory if it is running. And not only will it consume memory but Google will need to reserve all the memory that it _may_ need. This is a reality of physics.

I think we have become a little spoiled in that we have come to expect that computing will always become cheaper over time. I wonder how much it would cost to build your own ultra scalable, redundant, highly replicated system?

### Optimization
In the new world of App Engine where instances are charged, the emphasis is now on eliminating IO bound activities. That means eliminate datastore calls, URL fetch call, etc. If you have instances that are waiting around for IO activities to complete, then you are running to many instances.

Here are a few ideas:

* Don't pull more data than you need for the data store. Use "Select _key_" where possible. Limit your fetches to the smallest possible row sets.
* Cache results when ever possible. If you are displaying the same data, then cache it per page, per user or per application.
* Use a Task Queue. Can this operation run in the background? Task queues can eliminate instances by way of pushing work for a dedicated backend.

### The good news...
App Engine was not decommissioned. I know this sounds like little consolation, but many Google projects have been scrapped over the past 6 months and App Engine is not one of them. This shows that Google is willing to make difficult decisions when it comes to App Engine and that they are committed to having a PaaS offering for the long term. 

The bottom line is that Google has a right to at least break even on App Engine. The service is incredible, the free tier still exists and the new [SLA terms](http://code.google.com/appengine/sla.html) are top notch. App Engine is still a worth competitor in the PaaS market, even with the new pricing.
