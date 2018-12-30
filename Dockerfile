FROM gradle:jdk11-slim

ENV FLATC_HOME=/usr/local/bin

USER root

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils git gcc g++ cmake
WORKDIR /temp
RUN git clone https://github.com/google/flatbuffers.git
WORKDIR /temp/flatbuffers
RUN cmake -G "Unix Makefiles" && \
    make install
