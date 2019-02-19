FROM debian:sid-slim

ENV DEBIAN_FRONTEND noninteractive

RUN set -eu; \
    apt-get update; \
    apt-cache depends texlive-full|grep 'Depends:'|awk '{print $2;}'|grep -v '\-doc'|xargs apt-get install -y --no-install-recommends; \
    apt-get install --quiet --yes --no-install-recommends \
      biber \
      python-pygments \
      gnuplot \
      pandoc \
      make \
    ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* ;

WORKDIR /root
