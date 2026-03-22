SAMPLES=(
        "ERR4298725"
        "ERR4298726"
)

mkdir -p marked
mkdir -p BQSR
mkdir -p VCF

for SAMPLE in "${SAMPLES[@]}"; do

#Mark Duplicates
gatk MarkDuplicates \
	-I sorted_bams/${SAMPLE}_sorted.bam \
	-O marked/${SAMPLE}_marked.bam \
	-M marked/${SAMPLE}_metrics.txt

samtools index marked/${SAMPLE}_marked.bam


#Base quality score recalibration
gatk BaseRecalibrator \
	-I marked/${SAMPLE}_marked.bam \
	-R reference/hg38.fa \
	--known-sites reference/dbsnp_146.hg38.vcf.gz \
	--known-sites reference/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz \
	-O BQSR/${SAMPLE}_recal.table

gatk ApplyBQSR \
	-I marked/${SAMPLE}_marked.bam \
	-R reference/hg38.fa \
	--bqsr-recal-file BQSR/${SAMPLE}_recal.table \
	-O BQSR/${SAMPLE}_recal.bam


#Variant Calling
gatk HaplotypeCaller \
	-I BQSR/${SAMPLE}_recal.bam \
	-R reference/hg38.fa \
	-O VCF/${SAMPLE}.g.vcf.gz \
	-ERC GVCF


done

gatk CombineGVCFs \
	-R reference/hg38.fa \
  	--variant VCF/ERR4298725.g.vcf.gz \
  	--variant VCF/ERR4298726.g.vcf.gz \
  	-O VCF/combined.g.vcf.gz

gatk GenotypeGVCFs \
  	-R reference/hg38.fa \
  	-V VCF/combined.g.vcf.gz \
  	-O VCF/final.vcf.gz
