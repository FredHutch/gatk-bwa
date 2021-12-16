FROM broadinstitute/gatk:4.2.2.0
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update -y && apt-get install -y zlib1g-dev

WORKDIR /
RUN curl -LO https://github.com/lh3/bwa/archive/v0.7.17.tar.gz

RUN tar zxf v0.7.17.tar.gz
WORKDIR /bwa-0.7.17
RUN make && cp ./bwa /usr/local/bin
WORKDIR /
RUN rm -rf v0.7.17.tar.gz bwa-0.7.17
