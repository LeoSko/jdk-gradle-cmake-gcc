FROM gradle:jdk11-slim

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends sudo
    
ENV FLATC_HOME=/usr/local/bin

COPY --from=neomantra/flatbuffers /usr/local/bin/flatc /usr/local/bin/flatc
COPY --from=neomantra/flatbuffers /usr/local/include/flatbuffers /usr/local/include/flatbuffers
COPY --from=neomantra/flatbuffers /usr/local/lib/libflatbuffers.a /usr/local/lib/libflatbuffers.a
COPY --from=neomantra/flatbuffers /usr/local/lib/cmake/flatbuffers /usr/local/lib/cmake/flatbuffers

COPY --from=neomantra/flatbuffers /usr/local/bin/flatcc /usr/local/bin/flatcc
COPY --from=neomantra/flatbuffers /usr/local/include/flatcc /usr/local/include/flatcc
COPY --from=neomantra/flatbuffers /usr/local/lib/libflatcc.a /usr/local/lib/libflatccrt.a /usr/local/lib/
