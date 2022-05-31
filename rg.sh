cd ../analysis/4_bowtie2

# First compress sam file to bam files and create indices using samtools
for sam in *.sam
do

base=`echo $sam | sed 's/.sam//'`
echo $base
echo Compressing $sam to bam

samtools view -S -b $sam --write-index  > $base.bam

done

# Then add read groups to bam files. Two read groups, Hadziabdic and Zerillo
# Adding read groups to GM files from Hadziabdic
for file in GM*bam
do
base=`echo $file | sed 's/.bam//'`
echo Adding read groups to $base
samtools addreplacerg \
-r "ID:$base" \
-o $base.bam \
$file
done

# Adding readgroups to GM files from Zerillo
for file in gm*bam
do
base=`echo $file | sed 's/.bam//'`
echo Adding read groups to $base
samtools addreplacerg \
-r "ID:$base" \
-o $base.bam \
$file
done 

# Marking duplicates
for file in *.bam
do
base=`echo $file | sed 's/.bam//'`
echo Marking duplicate reads in $base
sambamba markdup $file -o $file.dedup.bam
done
