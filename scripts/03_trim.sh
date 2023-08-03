#!/bin/bash
#SBATCH --job-name="trim"
#SBATCH --output=trim.out
#SBATCH --error=trim.err
#SBATCH -A p31629
#SBATCH -p normal
#SBATCH -t 00:15:00
#SBATCH -N 1
#SBATCH --mem=5G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu


module purge all
module load qiime2/2023.2


