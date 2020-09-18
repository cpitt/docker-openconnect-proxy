FROM ubuntu
RUN  apt-get update -qq \
      && apt-get install -y -qq \
      curl \
      openconnect \
      iptables \
      git \
      gcc \ 
      make \
      git  \
      make \
      dumb-init \
      && apt-get clean \
      && rm -rf /var/cache/apt/* \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir /build \
      && cd /build \
      && git clone https://github.com/rofl0r/microsocks.git \
      && cd microsocks \
      && make \
      && make install \
      && rm -R /build


ADD ./scripts ./scripts
ADD https://gitlab.com/openconnect/openconnect/-/raw/master/trojans/csd-post.sh ./scripts/csd.sh
RUN chmod 755 ./scripts/*

ENTRYPOINT [ "./scripts/entrypoint.sh" ]
