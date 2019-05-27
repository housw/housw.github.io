---
layout: post
title: Setting up SSH login on remote server
date: 2017-09-27 15:52:00
comments: true
permalink: /blog/setting_up_ssh_server
---

{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>


* **Install SSH Server**

{% highlight bash %} 
sudo apt-get update 
sudo apt-get upgrade 
sudo apt-get install openssh-server
{% endhighlight %}


* **Configure SSH server on port 1234**

{% highlight bash %} 
sudo sed -ri 's/^Port 22/Port 1234/g' /etc/ssh/sshd_config
{% endhighlight %}

* **Set maximum login attempts to 3 [^1]**

Edit the SSH server config file `/etc/ssh/sshd_config` as below:

{% highlight bash %} 
# Maximum login tries
MaxAuthTries 3
# Allowed users
AllowUsers user1 user2
{% endhighlight %}

* **Restart ssh service**
{% highlight bash %} 
sudo systemctl restart ssh
{% endhighlight %}


* **What's next** 

  - [Setting up an RSA Key Pair for password-less authentication](/blog/setting_up_RSA_key)

* **Reference** 

[^1]: http://linux-sys-adm.com/ubuntu-16.04-lts-how-to-install-and-configure-ssh/