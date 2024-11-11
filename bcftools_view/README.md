Variant calling file (VCF) files can be large and unwieldy. The format specification is also such that fields might have different numbers of subfields, depending, for example, on the number of alleles found at a variant. Both of these features make it hard to directly read a VCF file through R or python.

I’d recommend utilizing bcftools view option:

