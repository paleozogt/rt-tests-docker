FROM --platform=$TARGETPLATFORM ubuntu:bionic as builder

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libnuma-dev \
  && rm -rf /var/lib/apt/lists/*

RUN git clone -b stable/v1.0 git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git && \
    cd rt-tests && \
    make all && \
    make install && \
    cd .. && \
    rm -rf rt-tests 

########
FROM --platform=$TARGETPLATFORM ubuntu:bionic

RUN apt-get update && apt-get install -y \
    libnuma1 \
    time \
  && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /usr/local/src /usr/local/src
