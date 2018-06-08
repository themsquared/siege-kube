FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install -y  wget make gcc openssl libssl-dev libc-dev zlib1g-dev \
    && rm -rf /varl/lib/apt/*

RUN mkdir /siege
WORKDIR /siege
RUN wget http://download.joedog.org/siege/siege-4.0.4.tar.gz \
    && tar --strip-components=1 -zxvf siege-latest.tar.gz \
    && rm siege-latest.tar.gz

RUN ./configure
RUN make
RUN make install
RUN mkdir -p /root/.siege

WORKDIR /root

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD /run.sh
