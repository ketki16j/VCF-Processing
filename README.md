VCF_Processing.sh: (1) Shell script takes an input of a whole genome vcf file. By utilizing plink tool, we split the whole genome vcf to individual vcf file for each chromosome.
(2) Update the ID column (3rd column) in the vcf file with dbSNP identifier "rsid" by using position and allele as a matching criteria. We then extract genotype information (GT) from vcf for elastic net model 

DP_info.sh: This shell script focus more on extracting the DP(dosage information) from vcf file after imputation. Also, it retain genotypes that have R2>=0.8 during imputation
