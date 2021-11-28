---
title: "Custom Field control implemented as a User Control"
date: "2008-03-13T08:00:00-08:00"
tags: [ SharePoint, Programming ]
---

When creating custom controls it is often must easier to create a control using
the "User Control" development model instead of the "Server Control" model. [Server controls](http://msdn.microsoft.com/en-us/library/zt27tfhy.aspx) generally have a more "low level" feel and dictate that the developer build the control's rendering from scratch. Either by building a control tree or by constructing the rendered output in code.

Alternatively [user controls](http://msdn.microsoft.com/en-us/library/y6wb1a0e.aspx) have nice separation of code and presentation by virtue of having a markup file (.ascx) and a code behind file; much like a standard aspx page. User controls can be created and developed using the same standard approaches and processes that we all know and love from the aspx page model.

When implementing a custom field control for SharePoint, the development experience can be streamlined to a large degree by utilizing a user control. Traditionally field controls are created using the server control model but with a few tricks you can implement a custom field control with a user control.

First, here is the base class used for the field control. It has a virtual property used to set the user control path. A property override for the value of the field which is read from the user control. On initialization it loads the user control and sets the context.

<script src="https://gist.github.com/csim/10280829.js?file=BaseFieldControl.cs"></script>

Here's an example field control subclass. This class simply specifies the user control path and let's the base class handle all the details of loading the user control and setting the context. This is the server control that you will embed into you page layouts.

<script src="https://gist.github.com/csim/10280829.js?file=UserControlFieldBase.cs"></script>

Next, is the abstract base class for the user control. This class provides a property for a reference to the parent field control and an abstract property for the field value. The field control property is important because our user control will need to know all the information about the field it is attached to. This includes the SPField context and control mode among other things.

<script src="https://gist.github.com/csim/10280829.js?file=SPFieldUserControlBase.cs"></script>

Lastly you can create a user control that inherits from the SPFieldUserControlBase class and implement the specific UI that is necessary for you field control to function. See my pervious post on how to create a custom field control for further direction on creating field controls from scratch.
This technique also you to have easiest possible development process while leveraging the SharePoint field control infrastructure. Any questions or comments, please let me know!
