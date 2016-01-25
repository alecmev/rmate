FROM gliderlabs/alpine

RUN \
  apk add --no-cache wget bash && \
  wget -O /usr/local/bin/rmate --no-check-certificate \
    http://raw.githubusercontent.com/aurora/rmate/master/rmate && \
  chmod +x /usr/local/bin/rmate && \
  apk del --purge wget

ENTRYPOINT ["/usr/local/bin/rmate"]
