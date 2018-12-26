FROM debian:stretch-slim

ARG BUILD_DATE=''
ARG VCS_REF=''

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="imapsync" \
      org.label-schema.description="Simple container image built to run imapsync interactively" \
      org.label-schema.url="https://github.com/kns-it/docker-imapsync" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/kns-it/docker-imapsync" \
      org.label-schema.vendor="KNS" \
      org.label-schema.version=$PANDOC_VERSION \
      org.label-schema.schema-version="1.0" \
      maintainer="sebastian.kurfer@kns-it.de"

RUN apt-get update \
  && apt-get install -y \
  libjson-webtoken-perl \
  libauthen-ntlm-perl \
  libcgi-pm-perl \
  libcrypt-openssl-rsa-perl \
  libdata-uniqid-perl \
  libfile-copy-recursive-perl \
  libio-socket-ssl-perl \
  libio-socket-inet6-perl \
  libio-tee-perl \
  libhtml-parser-perl \
  libjson-webtoken-perl \
  libmail-imapclient-perl \
  libparse-recdescent-perl \
  libmodule-scandeps-perl \
  libpar-packer-perl \
  libreadonly-perl \
  libregexp-common-perl \
  libsys-meminfo-perl \
  libterm-readkey-perl \
  libtest-mockobject-perl \
  libtest-pod-perl \
  libunicode-string-perl \
  liburi-perl  \
  libwww-perl \
  procps \
  && rm -rf /var/lib/apt/lists/*

ADD https://imapsync.lamiral.info/imapsync /usr/bin/imapsync

RUN chmod 555 /usr/bin/imapsync

USER nobody

ENTRYPOINT ["/usr/bin/imapsync"]
