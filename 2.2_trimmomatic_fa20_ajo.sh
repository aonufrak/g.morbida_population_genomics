cd ../analysis/2.2_trimmomatic # First change the directory to 2.2_trimmomatic directory where raw sequence files should be soft linked

# Creating a for loop that iterates over all of the forward read files (R1)
for R1 in *_R1*
do
base=`basename $R1 | sed 's/_R1.*//'`# This will create a base name that is only the sample name
echo $base
R2=`echo $R1 | sed 's/R1/R2/'` # Next create a variable that represents the reverse read. This needs to be done so that the for loop can operate over the forward and reverse files at the same time.
`echo basename $R1` # Should print name of forward read
`echo basename $R2` # Should print name of reverse read
echo Trimming $base with Trimmomatic # Should print name of sample being trimmed.

java -jar ../../scripts/trimmomatic-0.39.jar \ # This is calling trimmomatic
PE \ # Indicates paired end mode
$R1 \ # Represents forward read
$R2 \ # Represents reverse read
-baseout $base.trimmed.fq.gz # Represents the basename for output files. Trimmomatic will produce four different output files, two paired and two unpaired.
 \
ILLUMINACLIP:IlluminaClip.fa:2:30:10:2:keepBothReads \ # Represents file where the illumina adapters to be trimmed are located. The remaining info in this line tells the program how to find the adapters. There is more info about this on the trimmomatic manual
LEADING:3 \ # Cuts bases at beginning of read if below qscore of 3
TRAILING:3 \ # Removes bases at end of read if below qscore of 3
SLIDINGWINDOW:4:20 \ # Indicates a sliding window of 4 basepairs. If the sliding window has a mean qscore less than 20 it begins trimming.
MINLEN:36 # Indicates that the minimum read length for a sequence to be retained is 36 bp. 


done
