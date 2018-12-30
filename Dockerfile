FROM alpine:latest

ENV FLATC_HOME=/usr/local/bin

USER root

RUN apk update && apk add --no-cache apt-utils git gcc g++ make cmake
WORKDIR /temp
RUN git clone https://github.com/google/flatbuffers.git
WORKDIR /temp/flatbuffers
RUN cmake -G "Unix Makefiles" && \
    make install

FROM gradle:jdk11-slim
WORKDIR /usr/local/bin
COPY --from=0 /temp/flatbuffers/flatc /usr/local/bin/flatc
