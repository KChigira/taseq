#!/bin/sh

taseq_hapcall -I ./fastq \
              -R ./genome.fasta \
              -V ./template.vcf \
              -n taseq_hapcall_1

taseq_genotype -I ./taseq_hapcall_1/result_taseq_hapcall.vcf \
               -p1 Parent01 \
               -p2 Parent02 \
               -n taseq_genotype_1

taseq_filter -I ./taseq_genotype_1/result_taseq_genotype.tsv \
             --parent_sample1 Parent01 \
             --parent_sample2 Parent02 \
             -n taseq_filter_1

taseq_draw -I ./taseq_filter_1/result_taseq_filter.tsv \
           -F ./genome.fasta.fai \
           --name_A Parent01 --name_B Parent02 \
           -n taseq_draw_1