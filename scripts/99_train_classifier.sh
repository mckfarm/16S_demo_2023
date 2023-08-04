#!/bin/bash
#SBATCH --job-name="classifier"
#SBATCH --output=classifier.out
#SBATCH --error=classifier.err
#SBATCH -A p31629
#SBATCH -p normal
#SBATCH -t 02:00:00
#SBATCH -N 1
#SBATCH --mem=20G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu

module purge all
module load qiime2/2023.2

qiime tools import \
  --type 'FeatureData[Sequence]' \
  --input-path /projects/b1052/mckenna/resources/qiime_2023_2/midas_4.8.1.fa \
  --output-path /projects/b1052/mckenna/resources/qiime_2023_2/midas_seqs.qza

qiime tools import \
  --type 'FeatureData[Taxonomy]' \
  --input-format HeaderlessTSVTaxonomyFormat \
  --input-path /projects/b1052/mckenna/resources/qiime_2023_2/midas_4.8.1.txt \
  --output-path /projects/b1052/mckenna/resources/qiime_2023_2/midas_tax.qza

qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads /projects/b1052/mckenna/resources/qiime_2023_2/midas_seqs.qza \
  --i-reference-taxonomy /projects/b1052/mckenna/resources/qiime_2023_2/midas_tax.qza \
  --o-classifier /projects/b1052/mckenna/resources/qiime_2023_2/midas_4.8.1_classifier.qza