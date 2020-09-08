ARG BASE_IMAGE=ubuntu:18.04
FROM $BASE_IMAGE
RUN apt-get update -y && apt-get install -y zlib1g-dev && apt-get install -y g++ && apt-get install -y libssl-dev && apt-get install -y scons && apt-get clean

