FROM ubuntu:20.04 

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    autoconf \
    automake \
    build-essential \
    curl \
    git \
    libtool \
    libgmp-dev \
    libjpeg-turbo8-dev \
    libsdl2-dev \
    libxpm-dev \
    xserver-xorg-dev \
    zlib1g-dev \
    unzip \
    zip

RUN git clone https://gitlab.com/xonotic/xonotic.git /opt/xonotic
WORKDIR /opt/xonotic

RUN ./all update -l best
RUN ./all compile
RUN ./all compile -r dedicated

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 26000

CMD ./all run dedicated

