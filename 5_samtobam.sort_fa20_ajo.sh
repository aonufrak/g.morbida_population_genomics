# Change directory to samtobam directory in analyses

cd ../analysis/4_bowtie2


for sam in *.sam
do

base=`echo $sam | sed 's/.sam//'`
echo $base
echo Compressing $sam to bam

samtools sort -o $base.bam $sam 
done

