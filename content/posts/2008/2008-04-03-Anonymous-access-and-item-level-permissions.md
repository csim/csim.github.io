---
title: "Anonymous access and item level permissions"
date: "2008-04-03T08:00:00-08:00"
tags: [ "SharePoint" ]
---

You are probably familiar with the fact that SharePoint now has the capability to host site with anonymous access turned on. I learned the hard way that item level permissions do not participate in the anonymous access behavior the way you might expect. When an item **does not** inherit permissions, it is not possible to enable anonymous access on that item.
Note the document library permission settings menu:

<div class="vinette">
<img src="/images/sp1.png" />
</div>

Here's the same menu for an item which is not inheriting permissions from the parent library:

<div class="vinette">
<img src=" /images/sp2.png" />
</div>

I found an [interesting post](http://yvonneharryman.wordpress.com/2007/11/23/follow-up-on-anonymous-access-and-item-level-permissions-from-sharepoint-connections-07/) that quotes [Tom Rizzo](http://blogs.msdn.com/thomriz/) on the subject. He explains that this behavior is by design and due to the fact that the product team feels that it is important that anonymous access setting should always cascade and child node should never have a higher degree of anonymous access than it's parent.
