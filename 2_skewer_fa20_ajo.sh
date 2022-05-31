# This file describes the trimming process with Skewer. 

cd ../analysis/2_skewer # First change the directory to 2_skewer directory where raw sequence files should be soft linked

# Creating a for loop that iterates over all of the forward read files (R1)
for R1 in *_R1*
do
base=`echo $R1 | sed 's/_R1.*//'` # This will create a base name that is only the sample name
R2=`echo $R1 | sed 's/R1/R2/'` # Next create a variable that represents the reverse read. This needs to be done so that the for loop can operate over the forward and reverse files at the same time.
echo R1 $R1 # Should print name of forward read
echo R2 $R2 # Should print name of reverse read
echo Trimming $base # Should print name of sample being trimmed.

skewer \ # Next we will call skewer
-x IlluminaClip.fa \ # This contains all of the illumina adapters available from trimmomatic.
-l 30 \ # This filters out reads shorter than 30 bp following adapter trimming
-q 30 \ # Trims 3' end until a minimum qscore of 30 is met
-Q 20 \ # Filters out reads that do not have a mean quality score of 20
$R1 \ # Calls forward read
$R2 \ # Calls reverse read
-t 16 \ # indicates number of threads
-o $base # Output basename (should be sample name)
done
