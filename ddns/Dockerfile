ARG BASE="balenalib/raspberrypi3-alpine"
FROM ${BASE}

ENV DUCKDNS_TOKEN=""
ENV DUCKDNS_DOMAINS=""
ENV DUCKDNS_INTERVAL=""
ENV LOG_DIR=""


WORKDIR /app
RUN apk add --no-cache curl
RUN mkdir duckdns && cd duckdns
COPY duck.sh /app/duckdns
RUN chmod 700 /app/duckdns/duck.sh

COPY start.sh /app
CMD /app/start.sh