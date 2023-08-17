#!/bin/bash
#SBATCH --job-name="taxonomy"
#SBATCH --output=taxonomy.out
#SBATCH --error=taxonomy.err
#SBATCH -A p31629
#SBATCH -p normal
#SBATCH -t 24:00:00
#SBATCH -N 1
#SBATCH --mem=10G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu

module purge all
module load qiime2/2023.2

# classify sequences from previous step
qiime feature-classifier classify-sklearn \
--i-classifier /projects/p31629/practice/midas_4.8.1_classifier_new.qza \
--i-reads /projects/p31629/practice/mckenna/qiime_io/rep_seqs_dada2.qza \
--o-classification /projects/p31629/practice/mckenna/qiime_io/taxonomy.qza

qiime metadata tabulate \
--m-input-file /projects/p31629/practice/mckenna/qiime_io/taxonomy.qza \
--o-visualization /projects/p31629/practice/mckenna/qiime_io/taxonomy.qzv