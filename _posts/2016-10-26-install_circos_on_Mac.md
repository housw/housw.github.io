---
layout: post
title: Install circos on macOS Sierra
date: 2016-10-26 22:25:00
comments: true
permalink: /blog/install_circos_on_Mac
---

{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>

- **download circos**

download circos at http://circos.ca/distribution, move it to `~/Software/circos/`:

{% highlight bash %} 
wget http://circos.ca/distribution/circos-0.69.tgz
mkdir -p ~/Software/circos
mv ./circos-0.69.tgz ~/Software/circos
{% endhighlight %}


- **uncompress and export to PATH**

{% highlight bash %} 
cd ~/Software/circos
tar xvfz circos-0.69.tgz
ln -s circos-0.69 current
export PATH=~/software/circos/current/bin:$PATH
. ~/.bash_profile
{% endhighlight %}

- **install libpng**

{% highlight bash %} 
mkdir ~/Software/src/libpng
cd ~/Software/src/libpng
wget http://prdownloads.sourceforge.net/libpng/libpng-1.6.26.tar.gz
tar zxfv libpng-1.6.26.tar.gz
rm libpng-1.6.26.tar.gz
ln -s libpng-1.6.26 current 
cd current
./configure
make
sudo make install 
{% endhighlight %}

- **install libjpeg**

{% highlight bash %} 
mkdir ~/Software/src/libjpeg
cd ~/Software/src/libjpeg
wget http://www.ijg.org/files/jpegsrc.v9b.tar.gz
tar zxfv jpegsrc.v9b.tar.gz
rm *.gz
ln -s jpeg-9b current
cd current
./configure
make
sudo make install
{% endhighlight %}


- **install freetype**

{% highlight bash %} 
mkdir ~/Software/src/freetype
cd ~/Software/src/freetype
wget http://circos.ca/distribution/lib/freetype-2.4.0.tar.gz
tar zxfv freetype-2.4.0.tar.gz && rm freetype-2.4.0.tar.gz
ln -s freetype-2.4.0 current
cd current 
./configure
make
sudo make install
{% endhighlight %}


- **install libgd**

{% highlight bash %} 
. ~/.bash_profile
mkdir ~/Software/src/libgd
cd ~/Software/src/libgd
wget https://github.com/libgd/libgd/releases/download/gd-2.2.3/libgd-2.2.3.tar.gz
tar xfvz ./libgd-2.2.3.tar.gz
ln -s libgd-2.2.3/ current
cd current
./configure --without-fontconfig --disable-werror --prefix=/opt/local
make
sudo make install
sudo cpan
cpan[1]> install GD
cpan[2]> exit
gdlib-config --all
## gdlib-config: warning: this script is deprecated; please use the pkg-config file instead.
## GD library  2.2.3
## includedir: /usr/local/include
## cflags:     -I/usr/local/include
## ldflags:     -L/usr/X11/lib
## libs:          -lz  -L/usr/local/lib -lpng16  -L/usr/local/lib -lfreetype   -lfontconfig   -ljpeg   -lXpm -liconv
## libdir:     /usr/local/lib
## features:   GD_GIF GD_GIFANIM GD_OPENPOLYGON GD_ZLIB GD_PNG GD_FREETYPE GD_FONTCONFIG GD_JPEG GD_XPM 
{% endhighlight %}


- **install missing perl modules**

check missing modules:

{% highlight bash %} 
circos -modules
## ok       1.29 Carp
## ok       0.36 Clone
## missing            Config::General
## ok       3.62 Cwd
## ok      2.154 Data::Dumper
## ok       2.52 Digest::MD5
## ok       2.84 File::Basename
## ok       3.62 File::Spec::Functions
## ok     0.2304 File::Temp
## ok       1.51 FindBin
## missing            Font::TTF::Font
## ok            GD
## missing            GD::Polyline
## ok       2.39 Getopt::Long
## ok       1.16 IO::File
## ok       0.33 List::MoreUtils
## ok       1.38 List::Util
## missing            Math::Bezier
## ...
{% endhighlight %}

install missing modules:

{% highlight bash %} 
sudo cpan
cpan[1]> install Config::General
cpan[2]> install Font::TTF::Font
cpan[3]> install Math::Bezier
cpan[4]> install Math::VecStat
cpan[5]> install Readonly
cpan[6]> install SVG
cpan[7]> install Set::IntSpan
cpan[8]> install Statistics::Basic
cpan[9]> install Text::Format
...
cpan[*]> exit
{% endhighlight %}


- **example run**

to test your circos installation, simply go to the example folder, and run the run script.

{% highlight bash %} 
cd ~/Software/circos/current/example
./run
open circos.png
{% endhighlight %}

If you see the following figure, you've successfully installed circos!

<div class="col three center"  id="circos_example" style="border: thin solid white">
    <img class="col three center" src="{{ site.baseurl }}/assets/img/circos_example.png" alt="" title="the circos example output figure"/>
</div>
<div class="col three caption">
    An example output figure from circos.
</div>

- **troubleshooting**

In some case, `GD-2.56` might not work properly, so we can manually install `GD-2.51` from cpan: http://search.cpan.org/~lds/GD-2.51/

{% highlight bash %} 
wget http://search.cpan.org/CPAN/authors/id/L/LD/LDS/GD-2.51.tar.gz
tar xfvz ./GD-2.51.tar.gz
cd GD-2.51/
perl Makefile.PL 
make
sudo make install
{% endhighlight %}
