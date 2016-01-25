FROM gliderlabs/alpine

RUN apk add --no-cache bash
RUN \
  wget -O /usr/local/bin/rmate \
    http://raw.githubusercontent.com/aurora/rmate/master/rmate && \
  chmod +x /usr/local/bin/rmate

ENTRYPOINT ["/usr/local/bin/rmate"]
