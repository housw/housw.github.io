---
layout: post
title: converting the ^M character back to newline on linux and mac
date: 2017-09-15 21:34:00
comments: true
permalink: /blog/converting_the_M_character
---

{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>

Sometimes when I saved a sheet from Excel on a Windows or Mac OSX computer as a tab-delimited file for further data processing, I frequently encountered the annoying '^M' issues. To save my own time and to help the others who have the same issues, here are the solutions:

Open the file you want to convert with `vim`, then replace the '^M' characters to `\r` like this:

{% highlight bash %} 
:%s/CTRL-V+CTRL-M/\r/g
:wq
{% endhighlight %}

Here <code>CTRL-V+CTRL-M</code> really means hold your Control-V and Control-M keys, which will be finally shown as '^M' in place.

Alternatively, you can also simply use the <code>dos2unix</code> command:

{% highlight bash %} 
# for linux 
sudo apt install dos2unix 
dos2unix input_file1 [input_file2 ... input_filen]

# for macOS
brew install dos2unix 
dos2unix -c mac input_file1 [input_file2 ... input_filen] 
{% endhighlight %}
