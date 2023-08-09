# 03 Trim reads
This document will cover what read trimming is and how to do it with QIIME.

Objectives:
- Understand purpose of read trimming
- Trim raw reads
- Compare trimmed reads to raw reads from the previous step

## What is read trimming?
Read trimming refers to data processing steps that remove unwanted sequences from raw sequencing data. In this step, we will be trimming off the primer and adapter sequences. Primer sequences are the DNA from your PCR primers and are not needed in the downstream analysis. Adapter sequences refer to short DNA sequences that are added to PCR products to distinguish samples from each other and make PCR products compatible with the sequencing instrument methods. 

We can also trim sequences based on their quality. Using the information contained in the `.fastq.gz` file, we can cut off parts of sequences that do not pass a certain quality threshold. Short read sequencing on Illumina instruments almost always has decreasing sequence quality per base over the length of the read due to the sequencing method used ([read more about it here](https://www.biostars.org/p/177027/)), so it is common to trim reads to a certain length to remove these error-prone reads. We will be focusing on the adapter trimming in this step and will come back to the quality trimming by length in the next step. 


## Practice
### Trim adapters off the reads
We will use the `cutadapt` QIIME plugin to perform read trimming. Use the [example script](/scripts/03_trim.sh) as a guide. A QIIME plugin is a program that has a standalone version developed by a separate team that has been incorporated into QIIME. 

Pay attention to the following aspects of the `cutadapt trim-paired` command:
- `i-demultiplexed-sequences` - the `.qza` file made in the previous step. The term demultiplexed refers to sequencing data that is sorted and separated by sample. Multiplexed would be sequencing data from multiple samples combined into one file usually distinguisable by barcodes, very short sequences that are attached to PCR products of each sample. You can [read more about multiplexing here](https://www.illumina.com/techniques/sequencing/ngs-library-prep/multiplexing.html), but long story short, we are using demultiplexed data.
- `o-trimmed-sequences` - where you would like your trimmed sequences to be saved.
- `p-front-f` and `p-front-r` - these are the primer sequences that you used to amplify the gene of interest in PCR. This flag tells QIIME to trim anything before and including the `p-front-f` or `p-front-r` sequence. You can keep the sequences that are already in the example script.

You can read more about `cutadapt` and the default settings on the [docs page](https://docs.qiime2.org/2023.5/plugins/available/cutadapt/trim-paired/).

You will also see the visualization command like in the import script to produce a viewable `.qzv` file.

### Compare raw reads to trimmed reads in QIIME viewer
Now that you have produced a `.qzv` for the raw and trimmed reads, look at both files in the [QIIME viewer](https://view.qiime2.org/). What kind of data comes out of these files, and what differences do you notice between the files?

### Take note of the quality dropoff 
We will make use of the `.qzv` output for the [next step](/docs/04_make_asv.md), specifically to determine the "best" place to cut off the ends of our reads. As mentioned previously, Illumina sequencing almost always has a decline in per base quality over the length of the reads due to the sequencing method itself. In the next step, we will specify cutoff points to trim the poor quality parts off of our reads. For now, just make a mental note of the decline in read quality and use the interactive table see how the statistics change over the length of the reads. 