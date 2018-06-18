#!/bin/bash

# This script should be `awsub-compose.yml` in the future.

awsub \
  --image otiai10/gdc-client \
  --script ./main.sh \
  --tasks ./MCF7-fastq.csv \
  --aws-ec2-instance-type m4.2xlarge \
  --disk-size 64 \
  -v
