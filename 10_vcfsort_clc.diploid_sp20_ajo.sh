cd ../analysis/7_vcf.formatting

bcftools sort \
mulit_g.morbida.diploid_v1_clc.vcf |
bcftools norm \
-m - \
-o sorted_multi_g.morbida.diploid_v1_clc.vcf

