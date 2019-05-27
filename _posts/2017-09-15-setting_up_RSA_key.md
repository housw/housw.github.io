---
layout: post
title: Setting up an RSA Key Pair for password-less authentication
date: 2017-09-15 20:22:00
comments: true
permalink: /blog/setting_up_RSA_key
---

{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>

By putting your public key on the remote servers, one can connect to them without passwords, the pairing private key on your local client will do the authentication work.


- **Generate an RSA Key Pair on your local machine**

{% highlight bash %} 
ssh-keygen -t rsa
{% endhighlight %}

File location and passphrase will be asked while generating the RSA key pair. After that, we can find the public (`id_rsa.pub`) and private (`id_rsa`) keys under the `~/.ssh/` folder.

- **Install the public key to remote servers**

{% highlight bash %} 
ssh-copy-id -i ~/.ssh/id_rsa.pub user@host_name
{% endhighlight %}

By running this command, the content within the public key `id_rsa.pub` will be copied into the authorized_keys file on the remote server. Alternatively, we can just copy the content of `~/.ssh/id_rsa.pub` on the client side, then append it at the end of the file `~/.ssh/authorized_keys` on the server side. The following command [^1] will do the same work:

{% highlight bash %} 
cat ~/.ssh/id_rsa.pub | ssh user@host_name "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"
{% endhighlight %}

- **Change the file and folder permissions of remote server** [^2]

{% highlight bash %} 
ssh user@host_name "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
{% endhighlight %}


- **Enable SSH key authentication** [^3]

Edit the SSH server config file `/etc/ssh/sshd_config` as below:

{% highlight bash %} 
RSAAuthentication yes
PubkeyAuthentication yes
ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
{% endhighlight %}


- **Troubleshooting**

    - The following error might be raised when you re-built your remote server:

{% highlight bash %} 
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@       WARNING: POSSIBLE DNS SPOOFING DETECTED!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
The ECDSA host key for shengweihou.com has changed,
and the key for the corresponding IP address XX.XX.XX.XX
is unchanged. This could either mean that
DNS SPOOFING is happening or the IP address for the host
and its host key have changed at the same time.
Offending key for IP in /home/USER/.ssh/known_hosts:50
  remove with:
  ssh-keygen -f "/home/USER/.ssh/known_hosts" -R XX.XX.XX.XX
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:......................................................
Please contact your system administrator.
Add correct host key in /home/USER/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/USER/.ssh/known_hosts:48
  remove with:
  ssh-keygen -f "/home/USER/.ssh/known_hosts" -R host_name.com
ECDSA host key for domain_name.com has changed and you have requested strict checking.
Host key verification failed.
{% endhighlight %}

The solution has been suggested in the error message:

{% highlight bash %} 
ssh-keygen -f "/home/USER/.ssh/known_hosts" -R [host_name.com or host_IP] 
{% endhighlight %}

- **Reference**

[^1]: https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2
[^2]: https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[^3]: http://linux-sys-adm.com/ubuntu-16.04-lts-how-to-install-and-configure-ssh/