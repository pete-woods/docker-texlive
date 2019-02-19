FROM debian:sid-slim

ENV DEBIAN_FRONTEND noninteractive

RUN set -eu; \
    apt-get update; \
    apt-get install --quiet --yes --no-install-recommends \
      texlive-full \
      biber \
      python-pygments \
      gnuplot \
      pandoc \
      make \
    ; \
    apt-get remove --quiet --yes "texlive-*-doc"; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* ; \
    rm -rf /tmp/* ;

WORKDIR /root
