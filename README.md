# docker-basepuppet

## Description

Base image based on debian:jessie with Puppet, Facter and r10k installed.

This image is intended to be used as a base image to build containers using
Puppet instead of plain shell script.

## How to use this image

Example Dockerfile to install apache using puppet

```
FROM fr3nd/basepuppet
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

ADD Puppetfile /etc/puppet/Puppetfile
WORKDIR /etc/puppet
RUN r10k puppetfile install

RUN puppet apply -e "include apache"

EXPOSE 80
CMD apache2 -DFOREGROUND
```

Contents of Puppetfile

```
mod 'puppetlabs/apache', '1.4.1'
mod 'puppetlabs/stdlib', '4.6.0'
mod 'puppetlabs/concat', '1.2.1'
```

If you want to use a CentOS based base image, you can use
fr3nd/basepuppet:centos7 instead

## FAQ

