#!/bin/bash

# rename ethernet devices 
echo "Changing interface names"
python3 /app/fixeth.py

echo "Changing iptable rules"
/app/iptables.sh

echo "Changing interface IPs"
ip addr add 10.0.0.1/24 brd 10.0.0.255 dev lab 
ip addr add 192.168.9.1/24 brd 192.168.9.255 dev lan 

#fix problems with SSL... be careful, depends on ISP I think
echo "Setting wan MTU"
ip link set wan mtu 1500

echo "Starting webmin..."
service webmin start 
tail -F /var/webmin/miniserv.error