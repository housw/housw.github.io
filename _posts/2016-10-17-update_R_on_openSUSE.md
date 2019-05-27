---
layout: post
title: update R on an openSUSE server
date: 2016-10-17 15:21:00
comments: true
permalink: /blog/update_R_on_openSUSE
---

{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>


- **login as root**

{% highlight bash %} 
sudo -i # enter password
{% endhighlight %}


- **add repository**

{% highlight bash %} 
VERSION=$(grep VERSION /etc/SuSE-release | sed -e 's/VERSION = //')
zypper addrepo -f http://download.opensuse.org/repositories/devel\:/languages\:/R\:/patched/openSUSE_$VERSION/ R-base
{% endhighlight %}

- **install R**

{% highlight bash %} 
zypper install R-base R-base-devel
{% endhighlight %}


- **update**

{% highlight bash %} 
zypper update R-base
{% endhighlight %}

check [here](https://cran.r-project.org/bin/linux/suse/README.html) for detailed explainations.