---
title: "Data Migration is Hard"
date: "2014-08-06T08:00:00-08:00"
tags: [ "Consulting", "Programming" ]
---

Data migration can sink your project. It lurks around the edges of your estimation model, hiding deep dark secrets that will only be uncovered at the very end of the project. Nothing could be worse. Discovering that you need to increase the migration schedule 5 fold at the 11th hour can not only derail your project but if it happens too often it might derail your career.

I have learned a few lesson on this topic:

__Re-estimate your migration scope of work when there are significant changes in the new application.__ At the beginning of the project, migration seems easy. A new system with like functionality should have a similar data model with a one-to-one mapping against the old data model.

Often times the new system will morph into something completely different, creating complex transforms for the data migration process. Not only is this extra work for the data migration but you have to _define_ this extra work.

Ideally when changes creep into the new system build, the data migration estimates are updated and timelines are adjusted. Having a designated data migration subject matter expert helps to spot trouble on the horizon and alert the team to data migration impact.

__Run your migration on the real data.__ There is no substitute for real migration data. Often times, sample data is used for too long which engenders a false sense of confidence. When you finally use the real data, there are a boat load of issues that you could not have predicted.

Use the real customer data as soon as possible in the process. Look at the outcomes in the new application, run scenario testing early and often. You simply have no idea what issues you will bump into.

__Think about performance.__ No matter how elegant your code or how perfect you attribute mappings are, there will come a time when performance is paramount. If the migration takes 10 days to complete, most likely you have failed.

Have a focus on performance from the beginning of the development effort. Identify the total number of source records to be transformed. Then get some baseline throughput numbers from you migration process. This will tell you how long the migration execution will take. You can also use a known duration to calculate how many records per second you need to achieve.

Once you know the desired parameters, you can start to optimize your code. Optimizing performance is an [art form](http://www.amazon.com/NET-Performance-Testing-Optimization-Complete/dp/1906434409). 

Multithread is a good way to improve performance but it comes with major pitfalls. The saying goes: You implemented multithreading to solve your problem, now you have two problems. If you understand thread safety and the basics of multithreaded software design, then multithreading is a good option, otherwise stay away from it.

__Think about the execution plan & timings.__ What time window is available to perform the migration? How much down time can you afford? Put together a timeline that clearly delineates the time allotted for each phase of the migration. 

Often times one way around performance and timing issues is to implement a "delta" load where only the changed data is migrated. First you run the full load, then the delta process moves only the data that has changed since the last migration pass. This breaks the migration process into smaller pieces and allows for those pieces to be spread across a longer period of time. When it's time to go live, you only need to run the delta process once more to bring the data into synchronization, then you can launch the new system.

__Understand the differences between legacy and new systems with regard to business use cases.__ Don't just think about data model differences, think about business process differences. The business context around data attributes is important when the situation dictates a complex transformation.

__Document all data gaps for the customer.__ Inevitably you will run into data that simple cannot be directly mapped, transformed or converted to the new system. It is of the utmost importance to document these gaps, triage these issues with the client and work toward some form of resolution.

There are general three things that the client may decide:

1. Ignore the data attribute. It is not important in the new system. Keep a backup of the old database just in case.
2. Map the attribute to a different attribute in the new system. Things have been simplified or consolidated and the new system recognizes this attribute in a different way.
3. Force the new system to consume the old attribute. Make a change request to add the old attribute to the new system. This usually stems from a mistake where important data attributes have been lost in the new system.


__Plan for surprises.__ Your source and destination are fixed, therefore scope is fixed. The causes more timeline risk, therefore you need to counter with rigor in estimation, planning, engineering and additional timeline contingency. There is no room to remove features or functionality from the migration process.

I have seen one scope reduction approach work, which is to propose the reduction of data volume by the process of archiving old data. This does not reduce the data mapping scope but reduces the timeline because migration execution time is reduced.
