# RTEMS Toolchain build for cross compile on x86_64

FROM ubuntu:20.04 AS environment

ENV RTEMS_MAJOR_VERSION=5
ENV RTEMS_MINOR_VERSION=1
ENV RTEMS_TOP=/rtems
ENV RTEMS_BSP="beatnik"
ENV RTEMS_SRC=rtems-${RTEMS_MAJOR_VERSION}.${RTEMS_MINOR_VERSION}

# install host build tools and utilities
RUN apt-get update -y && apt-get upgrade -y && \
    export TERM=linux && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends \
    bison \
    build-essential \
    busybox \
    ca-certificates \
    diffutils \
    flex \
    git \
    pax \
    python \
    python-dev \
    rsync \
    ssh-client \
    texinfo \
    unzip \
    && rm -rf /var/lib/apt/lists/*



WORKDIR ${RTEMS_TOP}

COPY install-rtems.sh .

RUN bash install-rtems.sh

