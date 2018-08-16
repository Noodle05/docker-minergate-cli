FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        ca-certificates \
        wget \
        libxcb1 \
        libpcre16-3 \
        libssl1.0-dev \
    && wget -q --content-disposition https://minergate.com/download/deb-cli \
    && dpkg -i *.deb \
    && apt-get -qq --purge --autoremove remove wget \
    && rm -r /var/lib/apt/lists/* \
    && rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["--user", "wei@gaofamily.org", "--xmr"]
