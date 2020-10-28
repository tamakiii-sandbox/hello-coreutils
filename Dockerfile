FROM debian:10.5

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      automake \
      autoconf \
      autopoint \
      bison \
      gettext \
      gperf \
      texinfo \
      rsync \
      git \
      wget \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
