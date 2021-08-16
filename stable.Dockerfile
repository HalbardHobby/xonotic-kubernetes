FROM ubuntu:20.04 

ARG DEBIAN_FRONTEND=noninteractive
ARG XONOTIC_DL_URL=http://dl.xonotic.org/xonotic-0.8.2.zip

RUN apt-get update && \
    apt-get install -y psmisc zip unzip curl wget git

RUN wget ${XONOTIC_DL_URL} --progress=bar -O xonotic-0.8.2.zip
RUN unzip xonotic-0.8.2.zip -d /opt && \
    rm xonotic-0.8.2.zip && \
    cp /opt/Xonotic/server/server_linux.sh /opt/Xonotic/server_linux.sh

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/Xonotic
EXPOSE 26000

CMD ./server_linux.sh
