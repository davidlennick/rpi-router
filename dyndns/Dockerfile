ARG BASE="balenalib/raspberrypi3-alpine"
FROM ${BASE}

ENV NOIP_UN=""
ENV NOIP_PW=""
ENV NOIP_DOMAINS=""
ENV NOIP_INTERVAL=""
ENV LOG_DIR=""

WORKDIR /app
RUN apk --update upgrade && apk add wget gzip coreutils
COPY noipupdater.sh configgen.sh start.sh /app/

CMD /app/start.sh