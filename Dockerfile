FROM debian:9-slim
LABEL maintainer="https://keybase.io/tcely"

ENV PAGER="less" PATH="/sbin:/usr/sbin:/bin:/usr/bin"
EXPOSE 4242/tcp

RUN apt update && apt -y install quassel-core ca-certificates iproute2 less procps
RUN apt -y upgrade; apt -y autoremove

RUN install -d -m 00770 -o quasselcore -g quassel /data
VOLUME ["/data"]
USER quasselcore:quassel

ENTRYPOINT ["/usr/bin/quasselcore", "--configdir", "/data"]
CMD ["--help"]
