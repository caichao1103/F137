ARG BASE_IMAGE=centos:centos7.8.2003
FROM $BASE_IMAGE
ARG BASE_IMAGE
RUN case "${BASE_IMAGE%:*}" in \
       centos) yum install epel-release zlib-devel gcc-c++ openssl-devel -y &&  yum install scons -y && yum clean all ;; \
       ubuntu) apt-get update -y && apt-get install -y zlib1g-dev && apt-get install -y g++ && apt-get install -y libssl-dev && apt-get install -y scons && apt-get clean ;; \
    esac
