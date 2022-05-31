freebayes \
-f ../analysis/4_bowtie2/G.morbida.fa \
-p 1 \
-F 0.4 \
--min-coverage 10 \
-d \
../analysis/5_samtobam/*.dedup.bam > ../analysis/6_freebayes/allgm_101020_ajo.vcf
