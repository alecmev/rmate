FROM gliderlabs/alpine

RUN apk add --no-cache wget bash
RUN \
  wget -O /usr/local/bin/rmate --no-check-certificate \
    http://raw.githubusercontent.com/aurora/rmate/master/rmate && \
  chmod +x /usr/local/bin/rmate

ENTRYPOINT ["/usr/local/bin/rmate"]
