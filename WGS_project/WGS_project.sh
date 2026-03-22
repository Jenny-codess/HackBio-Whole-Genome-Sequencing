#!/bin/bash

fastqc raw_reads/*.fastq.gz -o fastQC/

#Reference genome index
bwa index reference/hg38.fa

SAMPLES=(
	"ERR4298725"
	"ERR4298726"
)


for SAMPLE in "${SAMPLES[@]}"; do
#Trim
	fastp \
		-i "raw_reads/${SAMPLE}_1.fastq.gz" \
		-I "raw_reads/${SAMPLE}_2.fastq.gz" \
		-o "trimmed_reads/${SAMPLE}_1.trim.fastq.gz" \
		-O "trimmed_reads/${SAMPLE}_2.trim.fastq.gz" \
		--html "trimmed_reads/${SAMPLE}_fastp.html"

#Repair (BBTools)
	repair.sh in1="trimmed_reads/${SAMPLE}_1.trim.fastq.gz" \
		  in2="trimmed_reads/${SAMPLE}_2.trim.fastq.gz" \
		  out1="repaired/${SAMPLE}_1_rep.fastq.gz" \
		  out2="repaired/${SAMPLE}_2_rep.fastq.gz" \
		  outsingle="repaired/${SAMPLE}_single.fastq.gz" 
	

#Alignment
	bwa mem -t 8 -R "@RG\tID:${SAMPLE}\tSM:${SAMPLE}\tPL:ILLUMINA" \
	reference/hg38.fa \
	"repaired/${SAMPLE}_1_rep.fastq.gz" \
	"repaired/${SAMPLE}_2_rep.fastq.gz" | \
	samtools sort -@ 4 -o "sorted_bams/${SAMPLE}_sorted.bam"

#Index BAM
	samtools index "sorted_bams/${SAMPLE}_sorted.bam"
done



