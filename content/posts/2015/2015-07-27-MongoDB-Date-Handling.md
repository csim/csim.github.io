---
title: MongoDB .Net Driver date handling
date: "2015-07-27T08:23:36-08:00"
tags: 
  - MongoDB
  - Programming
---

I ran into an interesting situation when saving dated to MongoDB using the Mongo .Net driver (version 2.0).

When saving a date with [unspecified kind](https://msdn.microsoft.com/en-us/library/system.datetime.kind%28v=vs.110%29.aspx), the driver converts the date to a universal datetime. It appears that the driver will assume that a DateTime object with an unspecified kind is a local time, and convert it to universal time (UTC) before committing it to the database.

In my particular case, my origin date was UTC and was read from SQL server. Because entity framework does not set the Kind property on DateTime fields, MongoDB assuming these dates are local and performed a conversion to UTC. (Arrghhh)

Moral of the story: if you are converting data from SQL Server to MongoDB, make sure to call .ToLocalTime() on all dates even if they are stored as UTC. This will set the DateTime kind to local and avoid an inadvertent conversion by MongoDB on commit. 

EDIT: As Robert suggests below, it is better to set the Kind on the DateTime because of possible UTC/Local conversion issues. Sample:

```
var unspecifiedDateTime = ...; // returned by Entity Framework
var utcDateTime = DateTime.SpecifyKind(unspecifiedDateTime, DateTimeKind.Utc);
```