#!/bin/bash
#SBATCH --job-name="denoise"
#SBATCH --output=denoise.out
#SBATCH --error=denoise.err
#SBATCH -A p31629
#SBATCH -p normal
#SBATCH -t 12:00:00
#SBATCH -N 1
#SBATCH --mem=10G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu

module purge all
module load qiime2/2023.2


# run dada2 to identify ASVs
qiime dada2 denoise-paired --verbose \
--i-demultiplexed-seqs /projects/p31629/practice/mckenna/qiime_io/reads_trimmed.qza \
--p-trunc-len-f 242 --p-trunc-len-r 200 \
--o-representative-sequences /projects/p31629/practice/mckenna/qiime_io/rep_seqs_dada2.qza \
--o-table /projects/p31629/practice/mckenna/qiime_io/table_dada2.qza \
--o-denoising-stats /projects/p31629/practice/mckenna/qiime_io/stats_dada2.qza

## p trunc len f and r should be determined based on your data quality

# make visualization files
qiime metadata tabulate \
--m-input-file /projects/p31629/practice/mckenna/qiime_io/stats_dada2.qza \
--o-visualization /projects/p31629/practice/mckenna/qiime_io/stats_dada2.qzv

qiime feature-table tabulate-seqs \
--i-data /projects/p31629/practice/mckenna/qiime_io/rep_seqs_dada2.qza \
--o-visualization /projects/p31629/practice/mckenna/qiime_io/rep_seqs_dada2.qzv