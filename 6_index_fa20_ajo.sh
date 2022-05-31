cd ../analysis/4_bowtie2

for file in *.bam
do
samtools \
index \
$file
done
