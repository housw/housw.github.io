---
layout: post
title: Mounting remote folders into local directories using sshfs
date: 2016-07-13 18:07:00
comments: true
permalink: /blog/mounting_remote_directories
---

{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>

If `sshfs` is currently not installed on your current operating system, you need first install it. A very nice guide to install on different operating systems can be found [here](https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh).

Taking Ubuntu as an example, once sshfs has been installed, one needs to uncomment the line

{% highlight bash %} 
#user_allow_other
{% endhighlight %}

in the `fuse` configure file `/etc/fuse.conf`.

To allow our current account be able to run `sshfs` commands, we need to add current user into the `fuse` group list, this can be done using the following command:

{% highlight bash %} 
sudo groupadd fuse
sudo usermod -aG fuse user
{% endhighlight %}

and we need to log out then log in again, to make this change taking effect. You can use

{% highlight bash %} 
groups username
{% endhighlight %}

to check if `fuse` in your current user's groups list, check [here](http://blog.tordeu.com/?p=50) for more information.

Now we can start to mount our remote folder onto our local folder. Suppose we want to mount data folder from `test.server` to our `/mnt` directory, we need first to give the write permission of `/mnt` to current user:

{% highlight bash %} 
sudo chmod -R go+rwx /mnt
{% endhighlight %}

Then create a local data directory, which will be used to mount remote data onto, as below:

{% highlight bash %} 
cd /mnt && mkdir data
sshfs user@test.server:/data /mnt/data -o allow_other
{% endhighlight %}

Enjoy!