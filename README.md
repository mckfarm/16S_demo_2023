# Microbiome analysis with 16S rRNA amplicon sequencing
Demo for the Wells Lab prepared by McKenna Farmer, July 2023


## Overview
This repo contains data and scripts for introducing 16S rRNA amplicon sequence analysis to the Wells Lab. Throughout this demo, I refer to the data processing steps interchangeably as a "workflow" or "pipeline". This is meant to convey that the analysis is performed in multiple steps, with inputs and outputs feeding into subsequent steps.  

This demo will cover a simplified analysis of bacterial communities in a wastewater microbiome. The concepts and workflow used here can apply to other study systems. 

## Topics
- [Pre work](/docs/00_prework.md)
- [QIIME overview and getting set up](/docs/01_qiime_intro.md)
- [Import data](/docs/02_import_data.md)
- [Trim reads](/docs/03_trim_reads.md)

More coming soon! 


## Advanced topics
### Interactive job vs bash submission script
We will be using the command line version of QIIME to process our data and will be using bash submission scripts to run each step. You can run some steps in an interactive job because they run relatively quickly, but for the purposes of this demo, we will only be using bash scripts so you have copies of your code saved and have a record of how long things took to execute and with how much memory. 


### Other sources of data
In this tutorial, I provided you with curated sequencing data from a past sequencing project. Feel free to look for datasets you find in literature or through collaborations to practice the pipeline. If you do this, be sure to have the raw reads in the fastq.gz format and find the associated metadata so you can perform the data analysis portion. 


### Automation with Snakemake
This workflow is meant for beginners to both microbiome analysis as well as interfacing with computing clusters. To help facilitate learning both aspects, each step of the workflow is laid out in individual scripts or commands that are executed sequentially. More advanced users may wish to automate this process by automatically triggering scripts to run if previous steps have been completed. I have started to do this using [Snakemake](https://snakemake.readthedocs.io/en/stable/), a Python-based workflow management system. You can check out that workflow [here](https://github.com/mckfarm/snakemake_16S), which is still a work in progress. 