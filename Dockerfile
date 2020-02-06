# docker build -t searchsploit .

FROM debian:latest
MAINTAINER reedcrif <reedcrif@outlook.com>

#install updates, some packages and do cleanup:
RUN apt-get update && apt-get upgrade -y \
 && apt-get install apt-utils git make -y \
 && git clone https://github.com/offensive-security/exploit-database.git \
# && ./exploit-database/searchsploit --update \
 && apt-get clean autoclean \
 && apt-get autoremove -y \
 && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["/exploit-database/searchsploit"]
