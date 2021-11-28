---
title: "Getting started with Windows Phone 7 application development"
date: "2014-02-16T08:00:00-08:00"
tags: [ "Windows Phone" ]
---

Get ready to create your first Windows Phone 7 (WP7) application! With only minimum software development skills, you can create your very own shiny new WP7 app.

### Get the tools
The first step is to go get the tools you'll need to build your application. Microsoft has the best development tools in world (in my humble opinion). Since WP7 application development is an extension of general .NET platform development and Silverlight technology, you can use the standard .NET tools set to development WP7 apps. This includes visual studio 2010, C# or Visual Basic, and most of the .NET framework. This is a fantastic set of tools with a myriad of features design to make application development as easy as possible.

Here's the kicker. For WP7, these tools are completely free. No need to shell out the green, Microsoft has you covered.

First go here: 
http://www.microsoft.com/downloads/en/details.aspx?FamilyID=04704acf-a63a-4f97-952c-8b51b34b00ce

Download the installer and run it. The release to web (RTW) installer will download and install Visual Studio 2010, the WP7 emulator, Silverlight 4 tools for Visual Studio, XNA game studio tools and Microsoft Expression blend for Windows Phone. These are all the tools you need, the install is easier than Sunday morning.

### Hello World
Now we can start to create our first project. Microsoft makes it super easy to create and run a WP7 project. Launch Visual Studio and go to: File -> New Project

Now pick the type of project you want to create. For now this is not an important choice, so just pick one. The most interesting choices are the Panorama application and the Pivot application. The Panorama is the nifty application where the view scrolls from left to right and the screen to the right has the edge showing. The Pivot application still scrolls but this more like a tabbed interface where all the tabs show up in the heading and you can swipe through the left and right.

For you first project, choose the Panorama application, it's the best looking and you do want to impress your friends, right?

<div class="vinette">
<img src="/images/image2.png" />
</div>

![](/images/image1_1.png)

Once you have created the project, take a look at the contents. Might familiar if you have done any work with C# projects. It's a basic Silverlight 3 application with some extra juice added to run on the phone. Don't worry about the juice for now. MainPage.xaml is the entry point for the application. My default it uses MVVM or the Model View View Model pattern. This pattern is somewhat new but it is a way to separate the presentation from the data and logic, which is a good thing. Nice to see the Microsoft is being a bit progressive.

Drumroll please ...

Just hit F5. You now have a running WP7 application in under 2 minutes. Notice all the details: fluid animations, scrolling, sample data. In short, this is a working application that you can simply start to customize. This could not be easier. To me this is the power of Microsoft at work in a real way. They have brought together a strong set of technologies here, dev tools,Silverlight and the phone OS. The OS still need to mature a bit, but I think you can see that this is a baseline for building great mobile applications.

<div class="vinette">
<img src="/images/image2_1.png" />
</div>

### Will it blend?
One more thing (like that? I borrowed it from a famous guy I won't mention here), Expression Blend is in the mix also. For those unfamiliar, Expression Blend is like Visual Studio for designers. It lets creative types work on the same xaml file that developers work on, it understands visual studio projects and it can churn out all the animations, icons and motion that are available in Silverlight and WPF. If you want to develop WP7 applications, make Blend your friend.

![](/images/image_thumb3.png)

To launch Blend, right click on the project inside Visual Studio and choose "Open with Expression Blend".

You will be greeted with a design surface with tons of bells and whistles. Blend can be daunting when you open it for the first time. It is one of those tools that you will probably never learn in totality because it is complex. The best way to learn is to tackle it.

<div class="vinette">
<img src="/images/image_thumb4.png" />
</div>

### Building more complex apps
I am certain that there are application on the marketplace that were written in under 2 hours. If you already have a data source and you want to tie to a WP7 app as an alternate access method, general it is very easy. Microsoft gives you an exceptionally good starting point with the built-in WP7 project templates. I have only touched on the true potential here.

Go make some apps!
