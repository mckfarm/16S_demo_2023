# 01 Intro to QIIME and project set up
This document will go over what QIIME is and best practices for setting up a project directory.

Objectives:
- Understand the purpose of QIIME for 16S analysis
- Understand inputs into QIIME and outputs for downstream data analysis
- Set up working directory and manifest file

## What is QIIME?
QIIME is a bioinformatics platform that allows you to run multiple tools and analyses using the same general syntax. Unlike other bioinformatics pipelines, which typically consist of multiple software packages strung together, QIIME integrates all of the packages you need for 16S analysis into one program. You can input raw reads from a sequencing center and end up with usable figures and data. You can read more about QIIME (we will be using QIIME2 in this tutorial) in their [publication](https://www.nature.com/articles/s41587-019-0209-9) and [documentation](https://qiime2.org/). 


## How do I use QIIME?
We will be using the command line version of QIIME to process our data and will be using bash submission scripts to run each step. You can run some steps in an interactive job, but for the purposes of this demo, we will only be using bash scripts so you have copies of your code saved. You only need a few inputs to get started: raw reads in a fastq.gz format and a manifest file. You will transform these inputs into a QIIME-compatible format, then use a few different plugins to transform the raw sequencing data into unique sequences known as amplicon sequence variants (ASVs). Once you have your ASVs, you will be able to generate abundance tables and predict taxonomy, which is how you will be able to tell what bacteria were in a sample and how many were there. QIIME has some built-in data analysis and visualization tools, but I typically prefer to generate the ASVs, abundance tables, and taxonomy tables, then import that data into R to analyze and visualize. You are welcome to use the analysis and visualization tools available in QIIME but I will not be covering that in this tutorial. 

### What is fastq??? 
Fastq (sometimes abbreviated to .fq) is a type of text file used to store sequencing data. The fastq format stores information on reads - continous lengths of sequenced DNA - by recording the bases (AGCT) as well as the quality score. In simple terms, the quality score is the probability that the recorded base was incorrect. You can [read more about the quality score](https://en.wikipedia.org/wiki/FASTQ_format), but for our purposes, just remember that a higher quality score is better. Another really common sequencing data format is fasta (abbreviated to .fa), which is simply the reads with each base recorded without any quality information. Most sequencing centers will send you a .fastq.gz file, which is a compressed version of a .fastq. Most bioinformatics programs let you use the gzipped (.gz) version of the file, so check your program requirements before you start decompressing anything. QIIME lets us use the compressed version, so make sure you are using .fastq.gz for the upcoming tutorial steps. 

### What is a manifest file?
A manifest file is a text file that you use tell QIIME a unique sample name, where the raw reads are of each sample are saved and, if you are using paired-end sequences, whether each file is a forward or reverse read. It is critical you follow the format provided in the [example manifest file](/resources/manifest_example.csv). You will make your own manifest file to go along with the tutorial data at the end of this document. 

### Paired-end reads
If you are using paired-end sequencing (which we are using for this demo), you will have two fastq.gz files per sample. One file contains the forward reads and the other contains the reverse. Paired-end sequencing is a relatively simple concept; DNA fragments are sequenced in one direction (forward), then sequenced again in the opposite direction (reverse). For 16S rRNA sequencing, this type of sequencing allows you to capture the entire target length of the 16S gene you amplified using PCR. If your sequencing type was paired-end reads with a 250 base pair (bp) length (which you would see in a paper reported as 2x250bp), this means you could hypothetically get a total read of 499 bp length: 250 bp in the forward direction and 250 in the reverse direction, with one bp of overlap. In actuality, we want to ensure our PCR product is shorter than 499 bp, so the overlap between forward and reverse reads is greater. 

In this demo, we are using data from 2x300 bp sequencing on an Illumina MiSeq. The 16S PCR primers used target the region between positions 515-926 of the 16S rRNA gene, which is 411 bp. Then add the length of the primers and linkers to the target sequence, which is 41 bp on each primer, to obtain a final PCR product length of 494 bp. This is well below the 600 bp length limitation of the sequencing method, so we are good to go! 

## Practice
Now that you have a broad overview of QIIME and what you need to get started, it's time to set up a working directory in Quest to use for this tutorial. I would like you to create a folder in this directory: `/projects/p31629/practice`. Then create the following subfolders in your folder: 
- `raw_reads`
- `qiime_io`
- `scripts`

Next, copy files with the extension `fastq.gz` into your `raw_reads` folder from this directory: `/projects/p31629/raw_reads`. (hint: use a wildcard * with the cp function to grab files that match the extension)

Finally, create a manifest file. You must make sure the following components are correct in your manifest file:
- Headers are **sample-id**, **forward**, and **reverse**. These must be in lowercase, spelled correctly, and with a dash in **sample-id**.
- The file paths to each read must be complete - this includes the file name and every directory back up to the `projects` folder.
- The manifest file must be saved as a comma separated values (.csv) file. You cannot use a tab or space delimited file.

**To get you started, I have provided you the sample ids [here](/resources/sample-ids.txt).**

Making the manifest file can be very tedious. With only a handful of samples like this, I typically copy the outputs of `ls -l` into an Excel spreadsheet, then manipulate the information until it is in the correct format, save as a csv, then upload to Quest. If you had hundreds of samples to process, I would recommend writing a Python or R script to automate this task. 

When you are done making the manifest file, save your manifest as `manifest.csv` to your `qiime_io` folder. Now that you have your raw reads and manifest file, you are ready to import your data into QIIME!