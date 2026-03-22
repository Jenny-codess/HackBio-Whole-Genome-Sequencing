#!/bin/bash

SAMPLES=(
  "ACBarrie"
  "Alsen"
  "Baxter"
  "Chara"
  "Drysdale"
)

mkdir -p repaired

for SAMPLE in "${SAMPLES[@]}"; do

    repair.sh in1="trimmed_reads/${SAMPLE}_R1.fastq.gz" in2="trimmed_reads/${SAMPLE}_R2.fastq.gz" out1="repaired/${SAMPLE}_R1_rep.fastq.gz" out2="repaired/${SAMPLE}_R2_rep.fastq.gz" outsingle="repaired/${SAMPLE}_single.fq"
    echo $PWD
    bwa mem -t 1 \
    references/reference.fasta \
    "repaired/${SAMPLE}_R1_rep.fastq.gz" "repaired/${SAMPLE}_R2_rep.fastq.gz" \
  | samtools view -b \
  > "alignment/${SAMPLE}.bam"
done
