FROM ubuntu:latest

# Install gdc-client to download MCF-7.bam
ARG GDC_CLIENT_ZIP=https://gdc.cancer.gov/system/files/authenticated%20user/0/gdc-client_v1.3.0_Ubuntu14.04_x64.zip
RUN apt-get update -qq
RUN apt-get install -y wget zip unzip
RUN wget -q ${GDC_CLIENT_ZIP}
RUN unzip `basename ${GDC_CLIENT_ZIP}` \
  && rm `basename ${GDC_CLIENT_ZIP}` \
  && mv ./gdc-client /usr/local/bin

# Install Picard to convert bam to fastq
RUN apt-get install -y default-jdk
RUN wget -q https://github.com/broadinstitute/picard/releases/download/2.18.7/picard.jar
# RUN mv ./picard.jar /picard.jar