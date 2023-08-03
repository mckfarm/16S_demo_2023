# 02 Importing data
This document will cover how to import raw reads into a QIIME-compatible format.

Objectives:
- Understand purpose of QIIME-compatible file formats 
- Create manifest file
- Import reads to use in QIIME
- Use the QIIME viewer

## How do I work with my sequencing data with QIIME?
QIIME uses files called "artifacts", which store data and metadata together in one file, either with a `.qza` or `.qzv` file extension. The data is whatever type of biologically relevant data you are working with at any given step, whether that is raw reads or abundance tables. The metadata includes information about the type of data you are working with and the steps taken to get there.

To use your raw reads from the sequencing center, you will have to import your reads into a `.qzv` file. To do this, you will need your raw reads in a known location (done in the previous tutorial) and a manifest file.

## What is a manifest file?
A manifest file is a text file that you use tell QIIME a unique sample name, where the raw reads are of each sample are saved and, if you are using paired-end sequences, whether each file is a forward or reverse read. It is critical you follow the format provided in the [example manifest file](/resources/manifest_example.csv). 

## Practice

### Making a manifest file
**To get you started, I have provided you the sample ids that correspond with the raw reads [here](/resources/sample-ids.txt).** These sample ids can be found in the file names of the individual reads files. 

You must make sure the following components are correct in your manifest file:
- Headers are **sample-id**, **forward-absolute-filepath**, and **reverse-absolute-filepath**. These must be in lowercase, spelled correctly, and with a dash in **sample-id**.
- The file paths to each read must be complete - this includes the file name and every directory back up to the `projects` folder.
- The manifest file must be saved as a comma separated values (.csv) file. You cannot use a tab or space delimited file.

Making the manifest file can be very tedious. With only a handful of samples like this, I typically copy the outputs of `ls -l` into an Excel spreadsheet, then manipulate the information until it is in the correct format, save as a csv, then upload to Quest. If you had hundreds of samples to process, I would recommend writing a Python or R script to automate this task. 

When you are done making the manifest file, save your manifest as `manifest.csv` to your `qiime_io` folder. Now that you have your raw reads and manifest file, you are ready to import your data into QIIME!

### Importing data
We will be using a bash submission script to invoke the `import` command in QIIME. This will consolidate your separate files into one `.qza` file. You can find an [example script here](/scripts/02_import.sh).

If you remember from the Intro to Quest video, there are a few key components of the script: the SLURM scheduler instructions at the top and the actual command you would like to execute after that. You can keep the allocation and partition info as is, but make sure to review the other SLURM scheduler lines at the top before running the script. You may find you need to adjust the time and memory parameters if the job doesn't finish running.

There are a few critical components to the `import` command:
- `input-path` - where the manifest is saved
- `output-path` - where you want your QIIME `.qza` artifact to be saved
- `input-format` - what kind of data you have. Illumina uses PHRED33 in their `.fastq` files so use the `PairedEndFastqManifestPhred33V2` option.
- `type` - similar to `input-format`, this tells QIIME what kind of data we have and where we are in the analysis process. Use the `SampleData[PairedEndSequencesWithQuality]` 

To see a full list of options for the `input-format` and `type` flags, activate the QIIME2 module in the command line, then run `qiime tools import --show-importable-formats` and `qiime tools import --show-importable-types`. You can also run the `--help` flag on any QIIME commands or view the [QIIME documentation](https://docs.qiime2.org/2023.5/) if you'd like to learn more than what you see in this tutorial. 

Run your script with the `sbatch` command. If it is successful, you should see a new file with a `.qza` extension in your output directory.