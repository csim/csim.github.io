---
title: "SharePoint Custom Application Development Methodologies"
date: "2008-01-07T08:00:00-08:00"
tags: [ "SharePoint", "Programming" ]
---

As SharePoint becomes more prevalent in the custom application development realm, there has been some friction and malcontent expressed in relation to deployment processes, team development methods and application upgrade paths. I believe that Microsoft has fallen short on providing the tools necessary to promote and support custom application development on the SharePoint platform.

In my opinion, the SharePoint platform should not limit nor impede my ability as a custom application developer to deliver solutions that follow the same deployment principals as any other custom asp.net application. As some readers may be aware, at present the standard Microsoft guidance is flawed because it does not fully support repeatable build processes. This is a huge barrier for custom application developers who are accustom to building applications using source control for all assets, build automation and continuous integration. SharePoint as a lot to offer but taking advantage of the platform as a vehicle for custom applications should be more congruent with standard software development practices.

### The Microsoft approach
The Microsoft approach dictates that for team development environments, artifacts such as aspx, html, css files or any other file that lives in the content database should be created, stored and version controlled in a SharePoint authoring environment. These artifacts are created and maintained by "content developers". These content developers use SharePoint designer to create and propagate changes to production.

In parallel, custom application developers are to use standard team development principals (source control, etc) to create assemblies that are then promoted to the authoring environment where they are tested and eventually deployed to the production environment.

Read more:
http://msdn2.microsoft.com/en-us/library/bb428899.aspx

### Where the Microsoft approach falters
The primary problem with the Microsoft approach is that in many cases there is a *hard dependency* between artifacts and assemblies. You need to have the same version of artifacts and assemblies to be able to test in any environment and it is not possible get a synchronized version of both sets of assets from a single source. This relegates developers to constantly migrating and updating both content and assemblies to get a consistent version to test. The problem is only compounded because content authors may not be technically able to update assemblies in the authoring environment.

For a custom application of any complexity you need to be able to build and deploy a set of files that work as a unit. For a standard data-driven (SQL Server) asp.net application that means you would have your database creation scripts in source control and when deploying to a new environment (or upgrading an environment), you would run your scripts to create a new copy of the database for that environment. This way, deploying to a test environment becomes easy because you have a repeatable process. Why treat a SharePoint site any differently? You will of course need to use the SharePoint API instead of a SQL database creation script, but the basic function is the same.

## A Solution
After working with SharePoint for 6+ years I have found that it is possible to treat a SharePoint custom application as you would any other asp.net custom application. The Microsoft tools (and therefore the approach) fall short on these topics but with some motivation and know-how you can achieve substantial benefits by following these steps:

### Use [SPDeploy](http://rapid-tools.googlecode.com)
Ok, this is shamefully self promotional. What I really mean is that you should be using a deployment tool that can support creating customizations inside Visual Studio and deploying those customization via a SharePoint Solution Package (.wsp) to a remote server. There are a few tools that compile a wsp from Visual Studio such as WSPBuilder or Andrew Connell's custom approach. In my opinion SPDeploy is the most complete and easily repeatable solution to solve this problem, but I am biased :)

### Create all your SharePoint customizations inside Visual Studio.
We are custom application developers and we use Visual Studio solutions. This should not change when you are working on a SharePoint project.

### Use source control
Because we now have all of our SharePoint customizations inside Visual Studio, the next logical step is to commit that solution to source control. Read more about the benefits of source control:
http://msdn2.microsoft.com/en-us/library/ms173539.aspx

### Design your solution to provision all site collection assets from source control
Provisioning all site collection assets enables you to create your projects site collection from source control at will. This means that when a new developer steps onto your project, he or she can pull a copy of the files from source control and create a site collection that is identical to your site collection. Furthermore because you now have a repeatable site collection provisioning process, when deploying to test you can hand-off your wsp and have a tester create a site instance in no time at all.

Implementing this can be a bit tricky. For a brute force approach you can create a feature that lives at the site level that will provision all sub sites, files, etc. Or if you are adventurous you can create an XML configurable feature that will provision all assets according to a configurable XML file.

### Use developer isolated environments
Because we have the infrastructure in place to provision all site collection assets, it is possible to create isolated developer environments. This is the standard development method for any asp.net application and it should not change when developing a custom application on top of SharePoint.

### Use continuous integration
This one is somewhat optional but I would strongly recommend using continuous integration on any project. Because of the previous points, continuous integration for a SharePoint project becomes possible. Read more about continuous integration:
http://en.wikipedia.org/wiki/Continuous_integration

### Use SharePoint Designer only as a "Immediate Feedback" tool
SharePoint designer should not be used as a primary development tool (as MS suggests) but rather as a tool to quickly and conveniently see changes inside your site instance. Once you are happy with a change, then it should be placed in your Visual Studio solution so that it can participate in source control.

This is usually helpful with rendering assets such as page layouts, XML files, XSLT transforms and stylesheets. It sure is nice to be able to see changes immediately, but be sure to commit your changes to your Visual Studio project (and hence source control) so that they are visible to other developers on the project.
