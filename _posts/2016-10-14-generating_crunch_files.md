---
layout: post
title: Generating ACT crunch files using blastall
date: 2016-10-17 17:01:00
comments: true
permalink: /blog/generating_crunch_files
---

{% include note.html content="This is an export from my old wordpress website, your comments or references might be lost during the migration. Sorry for the inconvenience." %} <br>


When doing comparative genomics analysis, we need to order the assembled contigs against a reference genome using [Mauve](http://darlinglab.org/mauve/mauve.html) or [MUMmer](http://mummer.sourceforge.net/manual/).


In the case of using [Mauve](http://darlinglab.org/mauve/mauve.html), we need to prepare a comparison file, or a crunch file. To generate the file, one can upload the genome sequences in genbank/embl/fasta format to [WebACT](https://www.webact.org/WebACT/home), or upload sequences in fasta format to [Double ACT](http://www.hpa-bioinfotools.org.uk/pise/double_actv2.html) (It has been reported that genbank format didn't work well with DoubleACT[^1]), then wait for their notification when finished.

Alternately, one can generate a crunch file locally using blastall like this:

{% highlight bash %} 
#!/bin/bash
if [ $# -ne 4 ]; then 
    echo -e "\nUsage: $0 [blastn/tblastx] [input_first_genome.fna] [input_second_genome.fna] [output_filename]\n"
    exit 1
fi

# run formatdb
formatdb -p F -i $2 

# do blastall with 30 cores
blastall -p $1 -m 8 -e 1e-5 -d $2 -i $3 -o $4 -a 30
{% endhighlight %}


Besides, `ACT` works just like `Artemis`, except `gbk` file, a `gff` file can be loaded as well for annotations.

To sum up, here is the steps need to be done:

1. get genome sequences in fasta format
2. do pairwise blastn search to generate the comparison crunch files.
3. load the genome fasta and crunch files
4. load the annotation files in gff format

[^1]: https://www.mail-archive.com/artemis-users@sanger.ac.uk/msg00372.html