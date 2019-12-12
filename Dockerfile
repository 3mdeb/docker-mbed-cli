FROM ubuntu:18.04

MAINTAINER maciej.pijanowski <maciej.pijanowski@3mdeb.com>

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 python3-pip software-properties-common git \
    mercurial gcc-arm-none-eabi

COPY requirements.txt /

RUN pip3 install -r requirements.txt && \
    pip3 install mbed-cli

RUN mkdir -p /home/build

WORKDIR /home/build

RUN /usr/local/bin/mbed toolchain  --global GCC_ARM

ADD VERSION .

ENTRYPOINT ["/usr/local/bin/mbed"]
