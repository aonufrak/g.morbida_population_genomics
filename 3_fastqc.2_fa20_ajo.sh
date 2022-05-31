# This code is used to run fastqc on all of the fastq files for the Geosmithia morbida population genomics project. 

cd ../analysis/3_fastqc.2

for isolate in ../2.2_trimmomatic/*.fq
do
fastqc $isolate
done

multiqc .
