#!/bin/bash
##extract individual chromosome vcf from the whole genome vcf
for chr in $(seq 1 22); do
     plink --vcf GTEx_Analysis_2017-06-05_v8_WholeExomeSeq_979Indiv_VEP_annot.vcf.gz \
           --chr $chr \
           --recode \
           --out /myData.chr$chr ;
done

##for each chr vcf update the column ID with dbSNP identifier and format to get only the genotype information from the vcf:
for chr in $(seq 1 2);do
bcftools annotate -x ID chr${chr}.vcf > chr${chr}_noid.vcf  ##removes id
## now annotate dbSNP "rsid" in ID column for vcf files
bgzip chr${chr}_noid.vcf
tabix -p vcf chr${chr}_noid.vcf.gz
java -jar SnpSift.jar annotate 00-All.vcf chr${chr}_noid.vcf.gz > chr${chr}.vcf
## one annotated with rsid now format it to keep only GT information
bcftools annotate -x FORMAT chr${chr}_annotate.vcf > chr${chr}_en.vcf
done
