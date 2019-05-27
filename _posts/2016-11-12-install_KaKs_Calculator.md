---
layout: post
title: Install KaKs_Calculator2.0 on Ubuntu 16.04
date: 2016-11-12 16:39:00
comments: true
permalink: /blog/install_KaKs_Calculator
---

{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>


- **download KaKs_Calculator2.0**

{% highlight bash %} 
mkdir -p ~/Software/Module_Phylogeny/KaKs_Calculator
cd ~/Software/Module_Phylogeny/KaKs_Calculator
wget https://netcologne.dl.sourceforge.net/project/kakscalculator2/KaKs_Calculator2.0.tar.gz
tar zxfv KaKs_Calculator2.0.tar.gz
ln -s KaKs_Calculator2.0/ current
{% endhighlight %}


- **edit header file and install**

{% highlight bash %} 
cd current/src
vim base.h 
# add #include<string.h> below #include<time.h>, save and exit
make
cp KaKs_Calculator ~/Software/bin/
{% endhighlight %}


It's important to add `#include<string.h>` into `base.h`, otherwise the following error will throw:

{% highlight bash %} 
g++  -O -o  KaKs_Calculator  KaKs_Calculator.cpp KaKs.cpp MSMA.cpp MYN.cpp base.cpp NG86.cpp LWL85.cpp LPB93.cpp GY94.cpp YN00.cpp -lstdc++ -lm
KaKs.cpp: In member function ‘bool KAKS::parseParameter(int, const char**)’:
KaKs.cpp:356:90: error: ‘strlen’ was not declared in this scope
       if (genetic_code<1 || genetic_code>NCODE || strlen(transl_table[2*(genetic_code-1)])<1) 
                                                                                          ^
KaKs.cpp: In member function ‘void KAKS::helpInfo()’:
KaKs.cpp:756:28: error: ‘strlen’ was not declared in this scope
   if(strlen(transl_table[i])>0) {
                            ^
MYN.cpp: In member function ‘virtual int MYN::GetKappa(std::__cxx11::string, std::__cxx11::string)’:
MYN.cpp:35:31: warning: converting to non-pointer type ‘double’ from NULL [-Wconversion-null]
  double kdefault=2, nullValue=NULL;
                               ^
base.cpp: In constructor ‘Base::Base()’:
base.cpp:65:24: warning: converting to non-pointer type ‘double’ from NULL [-Wconversion-null]
   Si[i] = Vi[i] = L[i] = NULL;
                        ^
base.cpp:72:46: warning: converting to non-pointer type ‘double’ from NULL [-Wconversion-null]
  Ka = Ks = Sd = Nd = S = N = snp = t = kappa = NULL;
                                              ^
base.cpp: In member function ‘std::__cxx11::string Base::parseOutput()’:
base.cpp:479:13: warning: NULL used in arithmetic [-Wpointer-arith]
  if (Si[0]!=NULL || Si[2]!=NULL || Si[4]!=NULL) { //Si[0], Si[2], Si[4]
             ^
base.cpp:479:28: warning: NULL used in arithmetic [-Wpointer-arith]
  if (Si[0]!=NULL || Si[2]!=NULL || Si[4]!=NULL) { //Si[0], Si[2], Si[4]
                            ^
base.cpp:479:43: warning: NULL used in arithmetic [-Wpointer-arith]
  if (Si[0]!=NULL || Si[2]!=NULL || Si[4]!=NULL) { //Si[0], Si[2], Si[4]
                                           ^
base.cpp:490:13: warning: NULL used in arithmetic [-Wpointer-arith]
  if (Vi[0]!=NULL || Vi[2]!=NULL || Vi[4]!=NULL) { //Vi[0], Vi[2], Vi[4]
             ^
base.cpp:490:28: warning: NULL used in arithmetic [-Wpointer-arith]
  if (Vi[0]!=NULL || Vi[2]!=NULL || Vi[4]!=NULL) { //Vi[0], Vi[2], Vi[4]
                            ^
base.cpp:490:43: warning: NULL used in arithmetic [-Wpointer-arith]
  if (Vi[0]!=NULL || Vi[2]!=NULL || Vi[4]!=NULL) { //Vi[0], Vi[2], Vi[4]
                                           ^
GY94.cpp: In member function ‘int GY94::preProcess(const char*, const char*)’:
GY94.cpp:229:22: error: ‘strlen’ was not declared in this scope
  com.ls = strlen(seq1);
                      ^
GY94.cpp:238:23: error: ‘strcpy’ was not declared in this scope
  strcpy(com.z[0], seq1);
                       ^
YN00.cpp: In member function ‘virtual int YN00::GetKappa(std::__cxx11::string, std::__cxx11::string)’:
YN00.cpp:81:31: warning: converting to non-pointer type ‘double’ from NULL [-Wconversion-null]
  double kdefault=2, nullValue=NULL, t;
                               ^
makefile:9: recipe for target 'KaKs_Calculator' failed
make: *** [KaKs_Calculator] Error 1
{% endhighlight %}