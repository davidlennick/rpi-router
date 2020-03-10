FROM ubuntu:latest

#RUN systemctl status dnsmasq

RUN apt update & apt install -y curl nmap dnsutils dhcping python3 ngrep
RUN ping google.com

CMD /bin/bash