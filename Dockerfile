FROM gradle:jdk11-slim

ENV FLATC_HOME=/usr/local/bin

RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/*
RUN sudo apt-get update && \
    sudo apt-get install --yes gcc g++ cmake && \
    git clone https://github.com/google/flatbuffers.git && \
    cd flatbuffers && \
    cmake -G "Unix Makefiles" && \
    make install
