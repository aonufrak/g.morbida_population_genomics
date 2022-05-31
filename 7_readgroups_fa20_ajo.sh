for bam in ../analysis/4_bowtie2/GM*.bam
do
base=`basename $bam` 
sm=`echo $base | sed 's/.bam//'`
echo Adding read groups to $sm
lane=`echo $base | sed 's/GM[0-9]*_S[0-9]*_//' | sed 's/.bam//'`

samtools addreplacerg \
-r ID:$sm \
-r SM:$sm \
-o ../analysis/5_samtobam/$sm.bam \
$bam

done

for bam in ../analysis/4_bowtie2/gm*.bam
do
base=`basename $bam`
sm=`echo $base | sed 's/.bam//'`
echo Adding read groups to $sm

samtools addreplacerg \
-r ID:$sm \
-r SM:$sm \
-o ../analysis/5_samtobam/$sm.bam \
$bam

done

