# Microbiome analysis with 16S rRNA amplicon sequencing
Demo for the Wells Lab prepared by McKenna Farmer, July 2023


## Overview
This repo contains data and scripts for introducing 16S rRNA amplicon sequence analysis to the Wells Lab. Throughout this demo, I refer to the data processing steps interchangeably as a "workflow" or "pipeline". This is meant to convey that the analysis is performed in multiple steps, with inputs and outputs feeding into subsequent steps.  

This demo will cover data processing and simple analysis examples of a wastewater microbiome. The concepts and workflow used here can apply to other study systems. 

## Topics
- [Pre work](/docs/00_prework.md)
- [QIIME overview and getting set up](/docs/01_qiime_intro.md)
    - [Getting data from Illumina BaseSpace](/docs/01.1_data_to_quest.md)
- [Import data](/docs/02_import_data.md)
- [Trim reads](/docs/03_trim_reads.md)
- [Make amplicon sequence variants](/docs/04_make_asv.md)
- [Classify taxonomy](/docs/05_taxonomy.md)
- [Make phylogenetic tree](/docs/06_phylogeny.md)
- [Preparing for data analysis](/docs/07_analysis_prep.md)
- [Example analysis](https://github.com/mckfarm/16S_demo_2023/blob/main/scripts/analysis_example.Rmd)
- [Submitting to SRA](/docs/08_sra.md)


## Useful programs  
Prior to starting this tutorial, you should set up your computer with some key programs to access computing resources and files. I recommend the following:
- A command line terminal to interact with Quest (SSH client)
    - Windows: install [PuTTY](https://www.putty.org) 
    - Mac: use Terminal, which comes preinstalled
- A code editor
    - Install [Visual Studio Code](https://code.visualstudio.com) (VSCode) for Windows and Mac 
- A file explorer (FTP client)
    - Windows: [WinSCP](https://winscp.net/eng/download.php)
    - Mac: install [FileZilla](https://filezilla-project.org)


## Advanced topics
### Interactive job vs bash submission script
We will be using the command line version of QIIME to process our data and will be using bash submission scripts to run each step. You can run some steps in an interactive job because they run relatively quickly, but for the purposes of this demo, we will only be using bash scripts so you have copies of your code. 


### Other sources of data
In this tutorial, I provided you with curated sequencing data from a past sequencing project. Feel free to look for datasets you find in literature or through collaborations to practice the pipeline. If you do this, be sure to have the raw reads in the fastq.gz format and find the associated metadata so you can perform the data analysis portion. 
