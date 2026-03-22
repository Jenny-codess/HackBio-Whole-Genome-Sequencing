#!/bin/bash
SAMPLES=(
  "ACBarrie"
  "Alsen"
  "Baxter"
  "Chara"
  "Drysdale"
)

for SAMPLE in "${SAMPLES[@]}"; do

  fastp \
    -i "/home/rmourao/jenny/hackbio/raw_reads/${SAMPLE}_R1.fastq.gz" \
    -I "/home/rmourao/jenny/hackbio/raw_reads/${SAMPLE}_R2.fastq.gz" \
    -o "trimmed_reads/${SAMPLE}_R1.fastq.gz" \
    -O "trimmed_reads/${SAMPLE}_R2.fastq.gz" \
    --html "trimmed_reads/${SAMPLE}_fastp.html" 
done
