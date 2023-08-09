# 04 Turning reads into amplicon sequence variants
This document will cover how to use the dada2 plugin to turn your reads into amplicon sequence variants (ASVs). 

Objectives:
- Understand the role of ASVs
- Use dada2 to produce ASVs
- View results in QIIME viewer

## What are amplicon sequence variants? 
Amplicon sequence variants (ASVs) are the unique DNA sequences found across all of your samples. In this work, ASVs will refer to every unique sequence of the 16S rRNA gene from the 515 to the 926 position. ASVs are a representation of the unique bacteria in your samples. In theory, each unique bacteria will be represented by a corresponding ASV. We use ASVs for the rest of our analysis steps; we will calculate the abundance of each ASV in each sample, identify the taxonomic classification of each ASV, and find out how each sequence is related phylogenetically (evolutionary relationships). ASVs are relatively new in 16S analysis work. You can read more about ASVs [here](https://www.nature.com/articles/ismej2017119). 

### Is an "OTU" the same as an ASV?
No! An OTU, or operational taxonomic unit, serves a similar purpose to an ASV but is not exactly the same. An OTU is a bin or cluster of sequences similar within a certain threshold, typically 97% similarity. OTU analysis is less popular given the rise of ASVs, but you will likely see this terminology in past studies. Unlike ASVs, OTUs cannot be directly compared across studies and may not be relevent biologically since they represent a cluster of sequences rather than unique sequences. You can read more about the difference between ASVs and OTUs in the same paper that introduces ASVs [here](https://www.nature.com/articles/ismej2017119). 


## Making ASVs with DADA2
We will be using the program DADA2 to generate the ASVs from our sequencing data. You can read more about DADA2 on [the package GitHub page](https://benjjneb.github.io/dada2/) and [the publication](https://www.nature.com/articles/nmeth.3869). DADA2 is sort of the gold standard for generating ASVs from Illumina sequencing data. DADA2 has been incorporated into QIIME as a plugin, so we can use it with our trimmed reads from the [previous step](/docs/03_trim_reads.md)! 

DADA2 performs a few steps in sequence to produce unique ASVs. First, we can specify some quality cutoffs to filter or trim ends of reads that do not meet certain quality scores. 

DADA2 performs **denoising**, which basically parses unique sequences from the reads while accounting for potential sequencing errors. Accounting for sequencing errors is important because a completely unique sequence could be a result of a sequencing error rather than actual biological uniqueness. You can read more about their approach to denoising in [the publication](https://www.nature.com/articles/nmeth.3869), but it's not critical to understand it completely. After denoising, DADA2 will merge paired end reads into longer single reads. Then, DADA2 predicts the presence of **chimeras** and removes them. Chimeras, named after the [hybrid creature from Greek mythology](https://en.wikipedia.org/wiki/Chimera_(mythology)), typically originate from PCR, where multiple DNA products are joined together. Since chimeras are unique, they typically pass the denoising step, but should be removed before any downstream analysis because they don't represent anything biologically meaningful. 


## Practice
### Run DADA2
Like the previous steps, we will execute this command in a bash submission script - check out the script [here](/scripts/04_asv.sh). Let's walk through the key components of the main DADA2 command.

- `qiime dada2 denoise-paired` is the command we are executing, notice that we are denoising paired end reads 
- `--verbose` tells QIIME to print a detailed output of the command as its running. This will be saved in the `.out` file you specify in the SLURM submission details in the header.
- `--p-trunc-len-f` and `--p-trunc-len-r` tell DADA2 how much you would like to trim off the end of the reads. I alluded to this at the end of the [previous step](/docs/03_trim_reads.md). See the note at the end of this section for more info about picking a length to trim.
- `--i-demultiplexed-seqs` are the trimmed reads you produced in the previous step. Make sure you use the `.qza` file, *not* the `.qzv`.
- The last three lines specify the outputs of the command.
  - `--o-representative-sequences` produces a `.qza` file with the unique ASVs in a table with their unique sequence identifier.
  - `--o-table` produces a `.qza` file with the unique sequence identifiers and the total abundance of each sequence in each sample. These abundance quantities are given in reads per sample.
  -  `--o-denoising-stats` produces a `.qza` file with the statistics about how DADA2 ran, specifically how many reads passed through each step of filtering, denoising, and chimera removal.

**Note about read trimming**: There is no precise cutoff for read quality, but a common practice is to find the point where the median read quality starts to dip below 25 - 30. If there is a clear part of the plot where the quality declines sharply, you can also use this as your trim point. *Make sure that your trim points will still cover the desired amplicon length.*

### View outputs from dada2
The last two commands in the [example script](/scripts/04_asv.sh) produce `.qzv` files for you to upload to the QIIME viewer. Check out the outputs and see what info each file gives you. We will talk about these outputs more in person! 