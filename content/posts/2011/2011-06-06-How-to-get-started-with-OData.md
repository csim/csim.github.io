---
title: "How to get started with OData"
date: "2011-06-06T08:00:00-08:00"
tags: [ "Programming" ]
---

Open data protocol or OData is a new Microsoft technology standard which allows for simple data exchange over a REST style interface. The idea is to create a web based interface for complex data stores and in the process free data from silos. This will in theory create a data utopia complete with bunnies, fairies and a side of mash potatoes.

There are a couple of intriguing facets to this proposition. First, since OData is purely REST based, data is available cross platform and also on the client side. JavaScript is a real possibility as a data consumer, mashups just got a whole lot better. To top it all off, natively you can get data in Atom or JSON formats, making JavaScript a first class consumer.

Secondly, Microsoft has bundled a LINQ provider with the .Net Framework. This makes server side integration a snap. You can literal point to an OData endpoint and start writing a LINQ query against it. Bring on the fairies.

To start out, download LINQPad. LINQPad is a lightweight tool that let's you query a LINQ data source in real-time with minimal setup necessary. It gives you a great interface to run quick LINQ based queries. LINQPad does not require an OData source in fact you can use LINQ to SQL or Entity Framework endpoints among others.

Once you have installed LINQPad, click on new connection. For the data context user "WCF Data Service (OData)". For the URI use http://odata.netflix.com/catalog. That's right the Netflix catalog has an OData interface!

OData sources are broken into top level elements called collections. You can think of collections as two dimensional tables with columns and rows. A column can also represent a relationship between two collections.

You can see that in our Netflix service endpoint there are several collections that define the dimensions tracked within the catalog. Genres, People, Titles, etc. This is where the cool starts. You can now construct LINQ queries against the Netflix catalog by typing some LINQ syntax into the main windows and hitting F5.

![](/images/image_thumb5.png)

If you are unfamiliar with LINQ syntax, here are tons of examples: 
http://msdn.microsoft.com/en-us/vcsharp/aa336746

To use OData from Visual Studio, open a new project, add a new service reference and paste in the Netflix service endpoint URI. VS will automatically understand that this is an OData service and that it should generate a LINQ context class and all the associated classes that define the data collections and data types. Fairies!

Now you can code against this new LINQ data source as you would any other. However, watch out for performance. Remember that you have taken an outside dependency into your project, anytime you do this there are inherent risks.

Furthermore, LINQ makes the query process very transparent which means that you can flagrantly throw queries at you data source without regard for impact to the service. Bottom line is, think about what you are doing.  Do I really need to run this extra query? Can I consolidate this data pull into a single query?
