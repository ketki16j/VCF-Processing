#!/bin/bash

##some bcftools operations on VCF files:

#download the vcf file using wget:
wget https://www.dropbox.com/s/dzwixabvy3wwfdr/chinook-32-3Mb.vcf.gz

# show the whole file from the top (use show just the first 10 lines)
bcftools view chinook-32-3Mb.vcf.gz | head

# show just the header with -h.  Here look at just the last 10 lines of the header
bcftools view -h chinook-32-3Mb.vcf.gz | tail

# show the variants themslves (no header) with -H
bcftools view -H chinook-32-3Mb.vcf.gz | head


# extract CHROM POS and BaseQRankSum, separated by TABs
bcftools query -f '%CHROM\t%POS\t%INFO/BaseQRankSum\n' chinook-32-3Mb.vcf.gz | head

# extract CHROM POS and total read depth DP
bcftools query -f '%CHROM\t%POS\t%INFO/DP\n' chinook-32-3Mb.vcf.gz | head

#What if we want to look at variants only in two 10 Kb regions, like NC_037124.1:5000000-5010000 and NC_037124.1:6000000-6010000? Pass those, separated by commas, to the -r option:

bcftools view -H -r NC_037124.1:5000000-5010000,NC_037124.1:6000000-6010000 chinook-32-3Mb.vcf.gz


#combine/ merge multiple VCFS:

# make two files from different regions
bcftools view -Oz -r NC_037124.1:4000000-5000000 chinook-32-3Mb.vcf.gz  > A.vcf.gz
bcftools view -Oz -r NC_037124.1:6000000-7000000 chinook-32-3Mb.vcf.gz  > B.vcf.gz

# how many variants in each of those?
bcftools stats A.vcf.gz | awk '/^SN/'
bcftools stats B.vcf.gz | awk '/^SN/'

# catenate the back together
bcftools concat -Oz  A.vcf.gz B.vcf.gz > CAT.vcf.gz

# how many variants in that?
bcftools stats CAT.vcf.gz | awk '/^SN/'
