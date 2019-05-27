---
layout: page
permalink: /publications/
title: publications
description: Publications by categories in reversed chronological order. 
years: [2012, 2015, 2016, 2017, 2018, 2019]
---

{% for y in page.years %}
  <h3 class="year">{{y}}</h3>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}


*** 


### **Supplementary Datasets**

* mdRNA-Seq analysis of marine microbial communities from the northern Red Sea

<iframe src="https://widgets.figshare.com/articles/3122254/embed?show_title=1" width="568" height="351" frameborder="0"></iframe>

* Benefit from decline: The primary transcriptome of *Alteromonas macleodii* str. Te101 during *Trichodesmium* demise

<iframe src="https://widgets.figshare.com/articles/5048935/embed?show_title=1" width="568" height="351" frameborder="0"></iframe>

* The primary transcriptome of the fast-growing cyanobacterium *Synechococcus elongatus* UTEX 2973

<iframe src="https://widgets.figshare.com/articles/5712016/embed?show_title=1" width="568" height="351" frameborder="0"></iframe>