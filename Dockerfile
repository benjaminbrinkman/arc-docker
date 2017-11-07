FROM debian:stretch-slim
MAINTAINER Benjamin Brinkman <ben@benjaminbrinkman.com>

WORKDIR /arc

RUN apt-get update && \
apt-get install -y --no-install-recommends \
ca-certificates git racket rlwrap && \
rm -rf /var/lib/apt/lists/*

ENV ARC_BRANCH stable
ENV ARC_URL https://github.com/arclanguage/anarki
ENV PATH /arc:$PATH

RUN git clone $ARC_URL -b $ARC_BRANCH /arc

ADD ./arc.sh /arc

CMD ["arc.sh"]
