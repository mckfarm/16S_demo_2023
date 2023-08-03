#!/bin/bash
#SBATCH --job-name="import"
#SBATCH --output=import.out
#SBATCH --error=import.err
#SBATCH -A p31629
#SBATCH -p normal
#SBATCH -t 00:15:00
#SBATCH -N 1
#SBATCH --mem=1G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu

# activate QIIME2 
module purge all
module load qiime2/2023.2

# import reads into qiime-comatible format
qiime tools import \
--input-path /projects/p31629/calumet/qiime_io/manifest.csv \
--output-path /projects/p31629/calumet/qiime_io/reads.qza \
--input-format PairedEndFastqManifestPhred33V2 \
--type SampleData[PairedEndSequencesWithQuality]

## using a space and backslash allows you to insert a linebreak without disrupting the function
## you can also have the command written as one line but this is harder to read