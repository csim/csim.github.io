---
title: "How to add your last tweet to your blog"
date: "2011-09-30T08:00:00-08:00"
tags: [ "Programming" ]
---

I thought it would be nice to see my last tweet on my blog. It turns out that there is an easy way to do this using jquery and the twitter api. These instructions may not work for you if your blogging platform does not allow embedded JavaScript (wordpress.com does not).

To get the tweets for any user in JSON format you can visit [http://api.twitter.com/1/statuses/user_timeline/username.json?callback=?](http://api.twitter.com/1/statuses/user_timeline/username.json?callback=?)

Where username is the twitter username.

Make sure that you first have jquery included in your page like this:

<script src="https://gist.github.com/csim/10285505.js?file=jquery.html"></script>

Then add this script to pull the last tweet for a username:

<script src="https://gist.github.com/csim/10285505.js?file=pulltweet.html"></script>

Replace techhike with the twitter username that you are interested in.

Next add this markup to your page:

<script src="https://gist.github.com/csim/10285505.js?file=div.html"></script>

This will act as a container for your last tweet.

As an added bonus I decided to write a little javascript to convert URLs in the tweet to hyperlinks. This mimics the behavior on twitter.com. Also, I added a function that creates hyperlinks for twitter handles such as (@TechHike). This link points to the appropriate profile on twitter.com.

<script src="https://gist.github.com/csim/10285505.js?file=helpers.html"></script>

The final javascript looks like this:

<script src="https://gist.github.com/csim/10285505.js?file=load.html"></script>

Cheers!
