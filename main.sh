#!/bin/bash

set -u
set -v

# Download BAM
gdc-client download ${TARGET_GENOME_UUID}
unzip ${TARGET_GENOME_UUID}

# Determine source bam file and destination fastq name
BAM_NAME=`ls ${TARGET_GENOME_UUID} | grep '\.bam$'`
BAM_FILE=${TARGET_GENOME_UUID}/${BAM_NAME}
NAME=`echo ${BAM_NAME} | sed -e 's/\.bam$//'`

# Convert the BAM to FASTQs
java -jar /picard.jar SamToFastq \
  I=${BAM_FILE} \
             FASTQ=${OUTDIR}/${NAME}_1.fastq \
  SECOND_END_FASTQ=${OUTDIR}/${NAME}_2.fastq