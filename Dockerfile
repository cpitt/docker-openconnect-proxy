FROM alpine:3.12
RUN apk add --update --no-cache \
      --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
      bash \
      curl \
      dumb-init \
      git  \
      iptables \
      make \
      build-base \
      openconnect \
      tinyproxy \
      xmlstarlet

RUN mkdir /build \
      && cd /build \
      && git clone https://github.com/rofl0r/microsocks.git \
      && cd microsocks \
      && make \
      && make install \
      && rm -R /build

RUN sed -i -e '/^Allow /s/^/#/' \
      -e '/^ConnectPort /s/^/#/' \
      -e '/^#DisableViaHeader /s/^#//' \
      /etc/tinyproxy/tinyproxy.conf


ADD ./scripts ./scripts
ADD https://gitlab.com/openconnect/openconnect/-/raw/master/trojans/csd-post.sh ./scripts/csd.sh
RUN chmod 755 ./scripts/*

ENTRYPOINT [  "dumb-init", "./scripts/entrypoint.sh" ]
