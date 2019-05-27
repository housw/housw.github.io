---
layout: post
title: Install EMBOSS
date: 2016-10-14 11:16:00
comments: true
permalink: /blog/install_emboss
---

{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>

- **Download EMBOSS**

First download the latest version from here: ftp://emboss.open-bio.org/pub/EMBOSS/

{% highlight bash %} 
pwd # /home/hou/Software
mkdir EMBOSS
wget ftp://emboss.open-bio.org/pub/EMBOSS/EMBOSS-6.6.0.tar.gz
tar zxfv EMBOSS-6.6.0.tar.gz
rm EMBOSS-6.6.0.tar.gz
{% endhighlight %}


- **Install EMBOSS**

{% highlight bash %} 
cd EMBOSS-6.6.0
./configure --prefix=/home/hou/Software/bin
make
make install
{% endhighlight %}

- **Troubleshooting**

In case you got error like this: `/home/hou/Software/bin/bin/embossupdate: error while loading shared libraries: libnucleus.so.6: cannot open shared object file: No such file or directory`, then you need to install the emboss library(check [here](https://www.biostars.org/p/86327/)), and copy the library to the lib folder where your server can visit:

{% highlight bash %} 
sudo apt-get install emboss-lib
cp -r /usr/lib/emboss/ /home/hou/Software/bin/lib
{% endhighlight %}
