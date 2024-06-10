#!/bin/bash
#code to extract DP(dosage information) from vcf after imputation from michigan imputation server
##generate input file for michigan imputation server:


plink --ped chr22.ped --map chr22.map --recode vcf --out chr22_impute_qc
bcftools sort chr22_impute_qc.vcf -Oz -o chr22_sort_impute_qc_plink.vcf.gz

##steps for after imputation to extract DP information:
gzip -d chr22.dose.vcf.gz
awk '{gsub(/^chr/,""); print}' chr22.dose.vcf > chr22.dose1.vcf #remove chr
bgzip chr22.dose1.vcf
##filter genotypes based on R2 score for imputation:
bcftools view -i 'R2>.8' -Oz chr22.dose1.vcf.gz > chr22_dosage.filtered.vcf.gz
bcftools +dosage chr22_dosage.filtered.vcf.gz > output2.tsv
mv output2.tsv genotype_chr22_filtered_dosage.txt
sed -e 's/\[[^][]*\]//g' genotype_chr22_filtered_dosage.txt > genotype_chr22_filtered_dosage1.txt

