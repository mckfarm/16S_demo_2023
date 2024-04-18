# 01 Intro to QIIME and project set up
This document will go over what QIIME is and best practices for setting up a project directory.

Objectives:
- Understand the purpose of QIIME for 16S analysis
- Understand inputs into QIIME and outputs for downstream data analysis
- Set up working directory and manifest file

## What is QIIME?
QIIME is a bioinformatics platform that allows you to run multiple tools and analyses using the same general syntax. Unlike other bioinformatics pipelines, which typically consist of multiple software packages strung together, QIIME integrates all of the packages you need for 16S analysis into one program. You can input raw reads from a sequencing center and end up with usable figures and data. You can read more about QIIME (we will be using QIIME2 in this tutorial) in their [publication](https://www.nature.com/articles/s41587-019-0209-9) and [documentation](https://qiime2.org/). 

A unique and valuable aspect of QIIME is the "provenance" data, which is a record of each processing step you've performed and what parameters you used in those steps. This provenance record can help you keep track of what outputs you have and how you got there, especially if you take a break then come back to your work. A detailed provenance record is not common for other microbiome analysis tools. 

QIIME is also a great tool for sharing data with others. You can easily make visualization files, which store the underlying data and provenance data, while producing a viewable webpage. For an example, visit [view.qiime2.org](https://view.qiime2.org/) and look at the "Taxonomic Bar Plots" example in the Gallery. You can view and interact with the taxonomic data, see the citation details of each tool used in the analysis, and view the provenance data to understand how the analysis worked from beginning to end. 


## How do I use QIIME?
You only need a few inputs to get started: raw reads in a `fastq.gz` format and a manifest file. You will transform these inputs into a QIIME-compatible format, then use a few different plugins to transform the raw sequencing data into unique sequences known as amplicon sequence variants (ASVs). Once you have your ASVs, you will be able to generate abundance tables and predict taxonomy, which is how you will be able to tell what bacteria were in a sample and how many were there. 

QIIME has some built-in data analysis and visualization tools, but I prefer to generate the ASVs, abundance tables, and taxonomy tables, then import that data into R for analysis and visualization. You are welcome to use the analysis and visualization tools available in QIIME but I will not be covering that in this tutorial. 

### What is fastq??? 
Fastq (sometimes abbreviated to `.fq`) is a type of text file used to store sequencing data. The fastq format stores information on reads - continous lengths of sequenced DNA - by recording the bases (AGCT) as well as the quality score. In simple terms, the quality score is the probability that the recorded base was incorrect. You can [read more about the quality score](https://en.wikipedia.org/wiki/FASTQ_format), but for our purposes, just remember that a higher quality score is better. Another really common sequencing data format is fasta (abbreviated to `.fa`), which is simply the reads with each base recorded without any quality information. Most sequencing centers will send you a `.fastq.gz` file, which is a compressed version of a .fastq. Most bioinformatics programs let you use the gzipped (`.gz`) version of the file, so check your program requirements before you start decompressing anything. QIIME lets us use the compressed version, so make sure you are using `.fastq.gz` for the upcoming tutorial steps. 

### Paired-end reads
If you are using paired-end sequencing (which we are using for this demo), you will have two fastq.gz files per sample. One file contains the forward reads and the other contains the reverse. Paired-end sequencing is a relatively simple concept; DNA fragments are sequenced in one direction (forward), then sequenced again in the opposite direction (reverse). For 16S rRNA sequencing, this type of sequencing allows you to capture the entire target length of the 16S gene you amplified using PCR. If your sequencing type was paired-end reads with a 250 base pair (bp) length (which you would see in a paper reported as 2x250bp), this means you could hypothetically get a total read of 499 bp length: 250 bp in the forward direction and 250 in the reverse direction, with one bp of overlap. In actuality, we want to ensure our PCR product is shorter than 499 bp, so the overlap between forward and reverse reads is greater. 

In this demo, we are using data from 2x300 bp sequencing on an Illumina MiSeq. The 16S PCR primers used target the region between positions 515-926 of the 16S rRNA gene, which is 411 bp. Then add the length of the primers and linkers to the target sequence, which is 41 bp on each primer, to obtain a final PCR product length of 494 bp. This is well below the 599 bp length limitation of the sequencing method, so we are good to go! 


## Practice
Now that you have a broad overview of QIIME and what you need to get started, it's time to set up a working directory in Quest to use for this tutorial. **I provide practice data in this tutorial, but if you have your own sequencing data you would like to use, see [this page](/docs/01.1_data_to_quest.md) for more details.**

First, create folder in this directory that you will use for the rest of the tutorial: 
`/projects/p31629/practice`. 

Then, make the following directories in your folder:
- `qiime_io`
- `scripts`

Finally, copy the raw reads you will use for the rest of this tutorial into your own directory. The reads are saved here: `/projects/p31629/practice/raw_reads`. To do this, you can...
- Make a `raw_reads` directory in your own working folder, then selectively copy files with the extension `fastq.gz` into your `raw_reads` folder (hint: use a wildcard * with the cp function to grab files that match the extension)
- Directly copy the `raw_reads` folder from the above location into your project folder (hint: copy the directory recursively with the -r flag to copy all the files within the `raw_reads` directory)

To check if you created your directory properly and copied the reads correctly, make sure you check the directory with `ls` or use a program with a GUI to look at your files.