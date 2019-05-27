---
layout: post
title: Solving the libXp.so.6 library missing error on Ubuntu 16.04
date: 2016-11-27 18:14:00
comments: true
permalink: /blog/libXp_library_missing_error
---


{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>


I downloaded the latest sequin executable on NCBI (`ftp://ftp.ncbi.nih.gov/sequin/`), but I got the following error when I tried to run it on Ubuntu 16.04:

{% highlight bash %} 
$./sequin 
./sequin: error while loading shared libraries: libXp.so.6: cannot open shared object file: No such file or directory
{% endhighlight %}

After searching solutions online, I finally solved this problem by these commands:

{% highlight bash %} 
sudo vim /etc/apt/sources.list
# append this line to sources list: deb http://security.ubuntu.com/ubuntu precise-security main
sudo apt update
sudo apt install libxp6
{% endhighlight %}

