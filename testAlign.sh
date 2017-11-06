#!/bin/bash -l

# This is our test pipeline script for Melanie's honours thesis
# Jimmy Breen & Melanie Smith
# 2017-10-16

#  
# On the VM under the "ubuntu" user, run:
# sudo apt-get install bowtie

# module load BEDTools/2.26.0-foss-2016a
# sudo apt-get install bedtools

# To create index to align against - run this in your local directory
###NO### bowtie-build /data/biohub/Refs/human/hg19_GRCh37d5/hg19_1000g_hs37d5.fasta hg19_bowtie_index

# Human (*homo sapien*) reference genome version GRCm37 (Ensembl release 75) was downloaded on Tuesday 17th October, 2017, using: 
# ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_human/release_27/GRCh37_mapping/GRCh37.primary_assembly.genome.fa.gz
# unzipped using gunzip

# To create index to align against - run this in your local directory
#bowtie-build ./GRCh37.primary_assembly.genome.fa hg19_bowtie_index

# Assign our variables
BASE=$(pwd)
DB=${HOME}/Data/hg19_bowtie_index
MIRBASE=/home/a1627211/Data/hsa.gff3

# Assign output directories
mkdir -p ${BASE}/Alignment
mkdir -p ${BASE}/Counts

# Handy unix command - find
# Find the trimmed data in my pipeline and symboliclly link them all to the current directory
# mkdir -p Data; cd Data; find  /path/on/my/VM/ -name "*.clean.fastq.gz" -exec ln -s {} \;

# Run the loop over trimmed data in "Data"
for i in ~/Data/*.clean.fastq.gz; do
	# Run bowtie against hg19 index
	gunzip -c $i > ${BASE}/Alignment/$(basename $i .clean.fastq.gz).fq
	bowtie ${DB} ${BASE}/Alignment/$(basename $i .clean.fastq.gz).fq -S ${BASE}/Alignment/$(basename $i .clean.fastq.gz).hg19.sam
	samtools view -bhS -o ${BASE}/Alignment/$(basename $i .clean.fastq.gz).hg19.bam  ${BASE}/Alignment/$(basename $i .clean.fastq.gz).hg19.sam
	rm ${BASE}/Alignment/$(basename $i .clean.fastq.gz).hg19.sam

	# Sort the BAM file because its easier to run
	samtools sort ${BASE}/Alignment/$(basename $i .clean.fastq.gz).hg19.bam \
		${BASE}/Alignment/$(basename $i .clean.fastq.gz).hg19.sorted

	# Intersect your BAM file against the mirBase annotation and count the uniq matches 
	#  i.e. count the reads that match each annotation
	bedtools intersect -a ${MIRBASE} \
		-b ${BASE}/Alignment/$(basename $i .clean.fastq.gz).hg19.sorted.bam \
		-s -wa -f 0.9 | uniq -c > ${BASE}/Counts/$(basename $i .clean.fastq.gz).hg19.uniq.counts.txt
	
	# Clean that shit up yo
	rm ${BASE}/Alignment/$(basename $i .clean.fastq.gz).fq
done

# Fin
