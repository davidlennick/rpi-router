#    Copyright 2015 Robin Smidsrød <robin@smidsrod.no>

#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at

#        http://www.apache.org/licenses/LICENSE-2.0

#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

# ripped from https://github.com/networkboot/docker-dhcpd/tree/2ff24759518778e1cff6009cfede61257e4a5be8


# changed to use the rpi image 
FROM balenalib/raspberrypi3-ubuntu  

RUN apt-get -q -y update \
 && apt-get -q -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" install apt-utils \
 && rm /etc/dpkg/dpkg.cfg.d/excludes \
 && apt-get -q -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" install dumb-init isc-dhcp-server man \
 && apt-get -q -y autoremove \
 && apt-get -q -y clean \
 && rm -rf /var/lib/apt/lists/*


# changed to use the predefined conf file
RUN mkdir /data && touch "/data/dhcpd.leases"
COPY dhcpd.conf /data

ENV IFACE=""
CMD exec /usr/sbin/dhcpd -4 -f -d --no-pid -cf "/data/dhcpd.conf" -lf "/data/dhcpd.leases" $IFACE