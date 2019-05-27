---
layout: post
title: Install lastz on Mac
date: 2016-10-31 19:56:00
comments: true
permalink: /blog/install_lastz_on_Mac
---

{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>


- **download lastz**

{% highlight bash %} 
wget http://www.bx.psu.edu/miller_lab/dist/lastz-1.02.00.tar.gz
mv lastz-1.02.00.tar.gz ~/Software/src
tar zxfv lastz-1.02.00.tar.gz
cd lastz-distrib-1.02.00
{% endhighlight %}


- **edit install path**

{% highlight bash %} 
vim make-include.mak
# change installDir like this :
installDir = ${HOME}/Software/bin
{% endhighlight %}

- **install lastz** 

{% highlight bash %} 
cd src
make
make install
{% endhighlight %}


- **troubleshooting**

In case of the following error occurred,

{% highlight bash %} 
segment.c:1330:10: error: comparison of array 'st->seg' equal to a null pointer is always false [-Werror,-Wtautological-pointer-compare]
if (st->seg == NULL) return;
~~~~^~~ ~~~~
1 error generated.
make: *** [segment.o] Error 1
{% endhighlight %}

just remove `-Werror` in the `Makefile` at this line:

{% highlight bash %} 
definedForAll = -Wall -Wextra -Werror -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
{% endhighlight %}