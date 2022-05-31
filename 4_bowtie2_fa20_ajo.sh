cd ../analysis/4_bowtie2

bowtie2-build \
-f G.morbida.fa \
G.morbida

for R1  in ../2.2_trimmomatic/*1P.fq
do
baseR1=`basename $R1`
R2=`echo $R1 | sed 's/1P/2P/'`
baseR2=`echo $baseR1 | sed 's/1P/2P/'`
echo R1 $R1
echo R2 $R2
base=`echo $baseR1 | sed 's/.trimmed_1P.fq//'`
echo mapping $base to G. morbida reference genome

bowtie2 \
-x G.morbida \
-1 $R1 \
-2 $R2 \
-X 1000 \
-S $base.sam \
>& $base.align.summarystats.txt
done
