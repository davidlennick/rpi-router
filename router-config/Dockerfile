FROM ubuntu:latest

RUN apt-get update && apt-get install -y python python3 iptables

RUN mkdir /app
COPY start.sh /app
COPY fixeth.py /app
COPY iptables.sh /app

CMD /app/start.sh
