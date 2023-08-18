# 06 Making a phylogenetic tree
This document will cover the use of QIIME to assign produce a phylogenetic tree.

Objectives:
- Understand the purpose of a phylogenetic tree
- Produce a phylogenetic tree from your DADA2 outputs

## What is a phylogenetic tree?
Phylogenetic trees are a way to represent how species are related by evolution. In microbiology, specifically with sequencing-based methods, we use **sequence alignment** to determine how bacteria are related to each other. You can learn more about the basics of [sequence alignment in this video](https://www.youtube.com/watch?v=9bCkAsaP_z4). 

Bacteria with similar regions of DNA are more likely to be related to each other than bacteria with less regions. We can trace potential evolutionary relationships by inferring common ancestors between bacterial species. We use phylogenetic trees to represent these evolutionary relationships. For your reference, [this paper](https://www.nature.com/articles/nmicrobiol201648) published in 2016 was a *big deal* for expanding our understanding of microbial phylogeny.  

### Rooted vs unrooted
You will see the terms rooted tree and unrooted tree throughout this tutorial and in phylogenetic analyses in general. Rooted trees are created in reference to a common ancestor, while unrooted trees do not have this common ancestor. [This video](https://www.youtube.com/watch?v=vi8v3bjTazc) is helpful in showing the differences between rooted and unrooted (the explanation starts at 4:31 but the whole video is a good resource). 

## What do I use the tree for in the rest of my analysis?
In our work, we can use phylogenetic trees to show how the bacteria identified in our projects compare or are related to other bacteria from published works. We can also use phylogeny to determine general trends in microbial abundances in the context of our experimental variables - think about something like figure 4 in [this paper](https://www.frontiersin.org/articles/10.3389/fmicb.2022.824267/full). 


## Practice
### Make the tree
Like the previous steps, we will execute this command in a bash submission script - check out the script [here](/scripts/06_phylotree.sh). This command is pretty straightforward. Any flag starting with `i` is an input, and flags starting with `o` are the outputs. Notice that we use the `align-to-tree-mafft-fasttree` method, which means we will align our sequences with the sequence alignment program MAFFT, then feed the alignment into a phylogenetic tree program fasttree. 
