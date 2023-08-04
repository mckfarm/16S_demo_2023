#!/bin/bash
#SBATCH --job-name="trim"
#SBATCH --output=trim.out
#SBATCH --error=trim.err
#SBATCH -A p31629
#SBATCH -p normal
#SBATCH -t 00:30:00
#SBATCH -N 1
#SBATCH --mem=5G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu

module purge all
module load qiime2/2023.2

# trim primers
qiime cutadapt trim-paired \
--i-demultiplexed-sequences /projects/p31629/practice/mckenna/qiime_io/reads.qza  \
--o-trimmed-sequences /projects/p31629/practice/mckenna/qiime_io/reads_trimmed.qza \
--p-front-f GTGYCAGCMGCCGCGGTAA \
--p-front-r CCGYCAATTYMTTTRAGTTT

# make .qzv file
qiime demux summarize \
--i-data /projects/p31629/practice/mckenna/qiime_io/reads_trimmed.qza  \
--o-visualization /projects/p31629/practice/mckenna/qiime_io/readquality_trimmed.qzv