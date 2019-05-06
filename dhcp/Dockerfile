ARG BASE=balenalib/raspberrypi3-alpine
FROM ${BASE}

RUN apk update && apk --no-cache add dnsmasq 

RUN mkdir -p /etc/default/
RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq
COPY dnsmasq.conf /etc/dnsmasq.conf

CMD dnsmasq --no-daemon