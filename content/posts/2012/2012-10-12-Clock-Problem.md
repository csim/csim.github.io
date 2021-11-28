---
title: "Tech Interview Question: The Clock Problem"
date: "2012-10-12T08:00:00-08:00"
tags:  [ "Programming", "Interviews" ]
---

"The Clock Problem" is an interview question that I have been using for a few years. I first learned about it when I was being interviewed. I have now adopted it as my first line of defense against imposters. :)

It's a simple problem that can be used to determine a candidate's capacity for analytical problem solving. The beauty is that the problem has a simple and elegant solution which can be found in less than 10 minutes. More importantly it forces the candidate to think about a problem that he or she has not likely considered before. The problem domain is also easily understood, everyone knows how a clock works.

### Problem Statement
Write a function that can compute the angle between the hands of a clock given a time of day. Take your time and think it through, then we will walk-through your solution.

### Solution

1. Deduce that for each hour on the clock there are 30 degrees. 360 degrees divided by 12 hours.
2. Deduce that for each minute on the clock there are 6 degrees. 360 degrees divided by 60 minutes.
3. Compute the angle with respect to 12 o'clock for both the hour hand and the minute hand. For the hour hand the formula is: hour * 30, for the minute hand: minute * 6
4. Subtract the hour angle from the minute angle to get the solution. Ensure that the result is less than 180 degrees.
5. Extra Credit: The hour hand doesn't point directly to the hour, it moves proportionally to the minute value between hours. This can be computed by adding a factor to the hour hand position. This factor is computed based on the minute value and added to the hour hand angle (see solution below). 

### Full solution in JavaScript 

[http://jsfiddle.net/ctrl1024/2Mk24/](http://jsfiddle.net/ctrl1024/2Mk24/)

<script src="https://gist.github.com/csim/10286010.js"></script>

### Likely outcomes
After giving this problem dozens of times, I have noticed responses that roughly fall into these tags:

1. Candidate goes quiet for about 5 minutes. Then says that he/she would create a lookup table where given an hour or minute, they would retrieve the angle. This is skirting the exercise entirely, my response is that we should take a few minutes and compute some of the lookup values. If this doesn't work then I ask if there is a mathematical way to relate the hand position to an angle. 

2. Candidate understands that there is a mathematical solution but struggles to find the relationship between hand position and angle. I wait about 10 minutes, then start to give hints like: How many minutes per rotation? How many degrees per rotation? The important thing here is not to give away the solution but just enough information to direct the candidate towards the solution.

3. Candidate struggles at each stage. I give small hints and eventually the solution is found. I try to determine if nerves are a factor or if there is a lack of skill. Usually I would pass on the candidate unless there are other factors at play. I may give another coding problem to find a pattern if one exists.

4. Candidate gives up after about 10 minutes of floundering. This is a total fail and I usually end the interview politely but quickly.  In my opinion this problem can be solved by 8th grader (without coding) and any developer with some experience should be able to solve.

### Conclusion
This may sound like a simple problem but I believe it really does show analytical ability. Most importantly it allows for discussion and discourse in the context of an interview. This will tell you how the candidate reacts to a real-time challenge.
