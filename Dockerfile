FROM ubuntu:18.04

LABEL This Dockerfile is for debugging
ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get install -y g++ \
		build-essential \
	   	make \
		git \
		libcurl4 \
		libcurl4-openssl-dev \
		libssl-dev \
		libncurses5-dev \
		libsodium-dev \
		libmariadb-client-lgpl-dev \
		libbz2-dev \
		liblzma-dev \
		libssl-dev \
		zlib1g-dev \
		libcurl4-openssl-dev \ 
		openssl \
		default-jdk \
		lbzip2 \
		unzip \
		bzip2 \
		tzdata \ 
		perl \
		wget \
		bcftools \
		curl

RUN ldconfig
RUN apt-get install -y locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Required files
WORKDIR /

# pip3
RUN apt-get update
RUN apt-get install -y libgdal-dev
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN apt-get install python3-venv -y

# HAMRLINC wrapper script
ADD docker_test.sh $BINPATH
RUN chmod +x $BINPATH/docker_test.sh

ENTRYPOINT ["docker_test.sh"]
