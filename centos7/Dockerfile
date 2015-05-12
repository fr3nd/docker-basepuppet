FROM centos:centos7
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

RUN yum install -y \
    git \
    hostname \
    ruby \
    tar \
    && yum clean all

ENV PUPPET_VERSION 3.7.1
ENV FACTER_VERSION 2.4.1
ENV R10K_VERSION 1.5.1
ENV R10K_MODULE_VERSION 2.7.3

RUN echo "gem: --bindir /usr/bin --no-ri --no-rdoc" > ~/.gemrc
RUN gem install facter -v $FACTER_VERSION
RUN gem install puppet -v $PUPPET_VERSION
RUN mkdir -p /etc/puppet/manifests /etc/puppet/modules
COPY puppet.conf /etc/puppet/puppet.conf

RUN gem install r10k -v $R10K_VERSION
