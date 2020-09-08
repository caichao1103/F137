ARG BASE_IMAGE=centos:7.8.2003
FROM $BASE_IMAGE
ARG BASE_IMAGE
RUN yum install epel-release zlib-devel gcc-c++ openssl-devel -y &&  yum install scons -y && yum clean all
