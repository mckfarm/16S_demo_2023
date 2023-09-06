# 07 Preparing for analysis
This document will cover how to prepare your QIIME outputs for use in other programming applications (R or Python). 

Objectives:
- Identify which QIIME outputs are needed for downstream analysis
- Set up a working directory for analysis


## Now what?
We are ready to use our QIIME outputs to analyze our sequencing data! Before we get started with any analysis, make sure you have all the files listed below (notice they are all `.qza` files):
- table.qza
- taxonomy.qza
- rooted_tree.qza
- unrooted_tree.qza

I will also provide you with a metadata table that ties together the sample IDs with data collected from the study system. This is typically in the form of a plain text file, but you could also have this in an Excel file. 


## Best practices for analysis (in my experience)
The following are my own personal tips and best practices for doing microbiome analysis. You can definitely take or leave whatever you'd like, but this is what I have found works for me.
- Set up a GitHub repository with a remote copy (stored on github.com) and a local copy (stored on your computer)
    - Alternatively, set up a working folder with a backup saved to OneDrive/SharePoint - I would recommend GitHub over this option because of its rich version history
    - Set up your working directory with the following subfolders at a minimum - data, scripts, results
    - You may also want to keep a running document of notes in this folder, especially so you can pick up where you left off easily
- Set up [R and RStudio](https://posit.co/download/rstudio-desktop/)
    - You can use Python with a Jupyter notebook to do any analysis as well. This gives you the benefit of working with QIIME artifacts directly (remember that QIIME is a Python-based program). You will have to set up a local environment with QIIME installed [following these instructions](https://docs.qiime2.org/2023.7/install/native/#) depending on your operating system. 
    - I find that R is easier to use for data manipulation and plotting. It's just a matter of personal preference, but I won't be able to help with specific questions on Python plotting libraries. 
- Have an idea of final results you want to generate
    - Before you start doing anything in a programming package, you need to have at least some idea of the types of outputs you'd like to generate with your data. Refer back to the papers shared in the prework doc or look at published papers that you found to be interesting. 

## Practice
This will be a lot more open-ended than the other steps up to now. I have a sample analysis in [this document](), but you can definitely do more than what is shown there.