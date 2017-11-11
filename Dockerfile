FROM debian:stretch-slim
MAINTAINER Benjamin Brinkman <ben@benjaminbrinkman.com>

WORKDIR /arc

RUN apt-get update && \
apt-get install -y --no-install-recommends \
ca-certificates git racket && \
rm -rf /var/lib/apt/lists/*

ENV ARC_BRANCH stable
ENV ARC_URL https://github.com/arclanguage/anarki
ENV PATH /arc:$PATH

RUN git clone $ARC_URL -b $ARC_BRANCH /arc

ADD srv.arc /arc
ADD arc.sh /arc

RUN groupadd -g 999 arcgroup
RUN useradd -u 999 arcuser
RUN mkdir -p /arc/arc/logs
RUN chown arcuser:arcgroup /arc/arc/logs

CMD ["arc.sh"]
