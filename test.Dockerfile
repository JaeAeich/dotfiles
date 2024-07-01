FROM ubuntu:latest AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential vim && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo stow && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS final
COPY . /root
WORKDIR /root
ENV USER root
RUN apt install -y locales && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    apt-get clean autoclean && \
    apt-get autoremove --yes