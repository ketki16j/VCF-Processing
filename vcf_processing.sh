#!/bin/bash
##extract individual chromosome vcf from the whole genome vcf
for chr in $(seq 1 22); do
     plink --vcf GTEx_Analysis_2017-06-05_v8_WholeExomeSeq_979Indiv_VEP_annot.vcf.gz \
           --chr $chr \
           --recode \
           --out /myData.chr$chr ;
done


