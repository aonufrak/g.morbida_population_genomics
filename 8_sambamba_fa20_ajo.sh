cd ../analysis/5_samtobam

# Marking duplicates
for file in *.bam
do
base=`echo $file | sed 's/.bam//'`
echo Marking duplicate reads in $base
sambamba markdup $file $base.dedup.bam
done
