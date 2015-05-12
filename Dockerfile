FROM debian:jessie
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

RUN apt-get update && apt-get install -y \
    git \
    locales-all \
    ruby \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/info/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

ENV PUPPET_VERSION 3.7.1
ENV FACTER_VERSION 2.4.1
ENV R10K_VERSION 1.5.1
ENV R10K_MODULE_VERSION 2.7.3
ENV LANG en_US.UTF-8

RUN echo "gem: --bindir /usr/bin --no-ri --no-rdoc" > ~/.gemrc
RUN gem install facter -v $FACTER_VERSION
RUN gem install puppet -v $PUPPET_VERSION
RUN mkdir -p /etc/puppet/manifests /etc/puppet/modules
COPY puppet.conf /etc/puppet/puppet.conf

RUN gem install r10k -v $R10K_VERSION
