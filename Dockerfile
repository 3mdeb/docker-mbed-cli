FROM ubuntu:16.04

MAINTAINER maciej.pijanowski <maciej.pijanowski@3mdeb.com>

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python2.7 python-pip software-properties-common git \
    mercurial gcc-arm-none-eabi

COPY requirements.txt /

RUN pip install mbed-cli && \
    pip install -r requirements.txt

RUN mkdir -p /home/build

WORKDIR /home/build

RUN /usr/local/bin/mbed toolchain  --global GCC_ARM

ENTRYPOINT ["/usr/local/bin/mbed"]
