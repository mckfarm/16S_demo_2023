# 05 Assigning taxonomy to ASVs
This document will cover the use of QIIME to assign taxonomy to amplicon sequence variants. 

Objectives:
- Understand how QIIME classifies ASVs
- Understand outputs of taxonomy classification

## How do we classify sequences? 
Once we have our unique ASVs, we can estimate the bacterial community composition. We assign taxonomic classification to each ASV by comparing our sequences to a reference database. Like all the previous steps, we can use tools in QIIME to perform this comparison.

### What does QIIME actually do to assign taxonomy???
QIIME and other 16S microbiome tools use machine learning methods to accurately and quickly assign taxonomy to ASVs.  

To briefly summarize, QIIME uses the **multinomial naive Bayes classifier** to assign taxonomy to your sequences. [This video](https://www.youtube.com/watch?v=O2L2Uv9pdDA) gives a great explanation of how this type of classifier works. The example from the video is training a classifier to filter spam emails based on occurrences of key words in emails. In our work, QIIME uses **k-mers** to train the classifier instead of email keywords. K-mers are simply sequences of length *k*. For example, AGGTC is a k-mer of length 5. Check out the table on the [Wikipedia page](https://en.wikipedia.org/wiki/K-mer) for another illustration of k-mers.  

You can read more about the QIIME feature classifier tool in [their publication](https://microbiomejournal.biomedcentral.com/articles/10.1186/s40168-018-0470-z).  

### How do we train a classifier?
Luckily, QIIME has a built-in method to build the naive Bayes classifier for us. We need to supply QIIME with reference sequences and their taxonomy. You have a few options for what reference to use. The two most commonly used and well-maintained references are [SILVA](https://www.arb-silva.de/) and [Greengenes](https://greengenes.secondgenome.com/). These are very broad databases that cover all types of microbiome data.   

There are other curated databases that often take a subset of sequences from SILVA or Greengenes as a foundation but are focused on a particular microbe or environment. For activated sludge and anaerobic digester communities, I would recommend using the [MiDAS](https://midasfieldguide.org/guide) database. It doesn't hurt to run the taxonomic classification using more than one reference database, but we will only be using MiDAS for this tutorial.  

A trained classifier is stored in another `.qza` file. An important note is that feature classifiers are often not compatible between different versions of QIIME due to upgrades in the [scikit-learn package](https://scikit-learn.org/stable/). If you find that an existing classifier doesn't work with a newer QIIME version, you will likely have to make your own pre-trained classifier. See this [example script](/scripts/99_train_classifier.sh) or the QIIME documentation for more info on how to do this. I already have the classifier prepared for this tutorial. 


## Practice
### Run classifier
Like the previous steps, we will execute this command in a bash submission script - check out the script [here](/scripts/05_taxonomy.sh). Let's walk through the key components of the classifier command.  

- `feature-classifier` is the command we are executing
- `classify-sklearn` is telling QIIME to use the scikit-learn method of classification
- `--i-classifier` tells QIIME where the pre-trained classifier is saved
- `--i-reads` is where your ASVs are saved
- `--o-classification` is where you'd like the taxonomy QIIME artificat to be saved

### View taxonomy tables
The last command in the [taxonomy bash script](/scripts/05_taxonomy.sh) creates the `.qzv` file to view in the QIIME viewer. Check out the output and see what kind of data is produced. Start thinking through how you can connect this output to the abundance table you produced in the last step.
