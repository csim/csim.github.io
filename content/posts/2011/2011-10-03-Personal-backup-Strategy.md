---
title: "Personal Backup Strategy"
date: "2011-10-03T08:00:00-08:00"
---

There are a million and one ways to backup files from your hard drive. For me, the most important things are making sure that the files that cannot be replaced are safe. 

Rather than opt for a relatively complicated system image based backup system such as [Windows Home Server][1] or a automated file copy utility such [SugarSync][2], I instead prefer good old fashioned [Robocopy][3] and physical DVD media. This might sound archaic in the age of cloud computing but I have found it to be the best way to ensure that I will not lose the most important files and have the least amount of headaches.

### My setup
I have a portable 1TB drive which holds all of my media and working files. This includes family pictures, videos and virtual machines. I also have a non-portable 1TB drive that I use for only backups. 

For everyday files like word docs, excel spreadsheets, etc. I use [Dropbox][4]. These files are important enough that I want then accessible anywhere, anytime but they are not important enough to warrant a physical copy on DVD. [Dropbox][4] is great for this purpose, but it's a big pricey when you go above the 2GB free limit. It runs $99 for 50GB/year and $199 for 100GB/year.

### My strategy
Once a week I use [Robocopy][3] to backup all important files from my laptop and the portable drive to the backup drive. When a backup is done, all important files are duplicated to the desktop drive. This covers the potential case where my portable drive is either lost or stolen.

Once a month I copy all the very important files to physical DVD discs. These include family photos and videos. I use [DVDSpan][5] to burn a set of folders a set of DVD discs. This utility is rather old but it is very useful and has worked fantastically for me. It takes a folder or set of folders and writes them across a set of DVD discs. Granted this won't work if you have hundreds of Gigabytes to backup.

In my case I am only looking to backup around 50GB of media files. To make things even easier the media files don't change over time. once a file is archive, it does not need to be archived again.

Then writing files using [DVDSpan][5], it helps to have the files organized into date folders. For example /Photos/2011/2011-01. This way when it's time to write DVDs, I can simply burn the recent files that have not been archived and ignore the files that I have already archived.

The new discs get sent to the safe-deposit box for safe keeping. I have researched various methods of storing files off site such as [Amazon S3][6] or [KeepVault][7]. So far nothing beats driving down to the safe deposit box at the local bank. I have around 60GB of Gigabytes of photos and videos, but the net new data is less than 10GB per month. That means that I can get away with burning roughly 2 DVD discs for each month.

As cloud backup system mature, I may change my approach but for now I'm staying old school.


[1]: http://www.microsoft.com/windows/products/winfamily/windowshomeserver/default.mspx
[2]: https://www.sugarsync.com/
[3]: http://en.wikipedia.org/wiki/Robocopy
[4]: http://dropbox.com 
[5]: http://hcidesign.com/dvdspan/
[6]: http://aws.amazon.com/s3/
[7]: http://www.keepvault.com/