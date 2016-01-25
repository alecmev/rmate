FROM debian

RUN \
  apt-get update && \
  apt-get install wget -y && \
  wget -O /usr/local/bin/rmate http://raw.githubusercontent.com/aurora/rmate/master/rmate && \
  chmod +x /usr/local/bin/rmate && \
  apt-get purge --auto-remove wget -y && \
  apt-get clean

ENTRYPOINT ["/usr/local/bin/rmate"]
