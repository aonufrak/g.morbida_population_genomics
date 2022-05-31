# This code is used to run fastqc on all of the fastq files for the Geosmithia morbida population genomics project. 

cd ../analysis/1_fastqc # Changing the directory to the fastqc directory where files will be stored. raw sequence files will need to be symbolically linked to this directory prior to running the script.

# For loop that iterates over each sequence file (ending in fastq.gz) within the 1_fastqc directory.
for isolate in .fastq.gz
do
fastqc $isolate # Calling the fastqc program
done

# To run multiqc simply call multiqc and reference the directory that the fastqc documents were placed by fastqc. In this case, because I am already in the 1_fastqc directory with my fastqc output, a '.' is all that needs to follow multiquc
multiqc .
