################################################
# Init
################################################
echo "cleaning iptable"
iptables-save > out.bak
sed '/wan/d' -i out.bak
sed '/lan/d' -i out.bak
sed '/lab/d' -i out.bak
sed '/-i lo/d' -i out.bak
sed '/-o lo/d' -i out.bak
iptables-restore out.bak
echo "restoring iptable"

iptables -F INPUT
iptables -F OUTPUT
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
# iptables -P INPUT ACCEPT
# iptables -P OUTPUT ACCEPT
# iptables -P FORWARD ACCEPT

################################################
# NAT
################################################

# Masquerade for WAN and downstream network
iptables -t nat -A POSTROUTING -o wan -j MASQUERADE
iptables -t nat -A POSTROUTING -o lan -j MASQUERADE


################################################
# Routing
################################################

# Always accept loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow traffic initiated from local host
iptables -A INPUT -i wan -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o wan -j ACCEPT

# foward cons from lan -> lab
iptables -A FORWARD -i lan -o wan -j ACCEPT
iptables -A FORWARD -i wan -o lan \
    -m state --state ESTABLISHED,RELATED -j ACCEPT

# foward cons from lab -> wan
iptables -A FORWARD -i lab -o wan -j ACCEPT
iptables -A FORWARD -i wan -o lab \
    -m state --state ESTABLISHED,RELATED -j ACCEPT

# foward lan -> lab
iptables -A FORWARD -i lan -o lab -j ACCEPT
iptables -A FORWARD -i lab -o lan \
    -m state --state ESTABLISHED,RELATED -j ACCEPT


################################################
# Ports
################################################

# iptables -A INPUT -i lab -p tcp -s 10.0.0.0/24 --match multiport --dports 53,2375,2376,10000,22222,48484 -j ACCEPT
# iptables -A OUTPUT -o lab -p tcp -s 10.0.0.0/24 --match multiport --sports 53,2375,2376,10000,22222,48484 -j ACCEPT

# iptables -A INPUT -i lab -p udp -s 10.0.0.0/24 --match multiport --dports 53,67,68 -j ACCEPT
# iptables -A OUTPUT -o lab -p udp -s 10.0.0.0/24 --match multiport --sports 53,67,68 -j ACCEPT

iptables -A INPUT -i lab -p tcp --match multiport --dports 53,2375,2376,10000,22222,48484 -j ACCEPT
iptables -A OUTPUT -o lab -p tcp --match multiport --sports 53,2375,2376,10000,22222,48484 -j ACCEPT

iptables -A INPUT -i lab -p udp --match multiport --dports 53,67,68 -j ACCEPT
iptables -A OUTPUT -o lab -p udp --match multiport --sports 53,67,68 -j ACCEPT


# iptables -A INPUT -i lan -p tcp -s 192.168.0.0/16 --match multiport --dports 53,2375,2376,10000,22222,48484 -j ACCEPT
# iptables -A OUTPUT -o lan -p tcp -s 192.168.0.0/16 --match multiport --sports 53,2375,2376,10000,22222,48484 -j ACCEPT

# iptables -A INPUT -i lan -p udp -s 192.168.0.0/16 --match multiport --dports 53,67,68 -j ACCEPT
# iptables -A OUTPUT -o lan -p udp -s 192.168.0.0/16 --match multiport --sports 53,67,68 -j ACCEPT

iptables -A INPUT -i lan -p tcp --match multiport --dports 53,2375,2376,10000,22222,48484 -j ACCEPT
iptables -A OUTPUT -o lan -p tcp --match multiport --sports 53,2375,2376,10000,22222,48484 -j ACCEPT

iptables -A INPUT -i lan -p udp --match multiport --dports 53,67,68 -j ACCEPT
iptables -A OUTPUT -o lan -p udp --match multiport --sports 53,67,68 -j ACCEPT

iptables -A INPUT -i wlan0 -p tcp --match multiport --dports 2375,2376,10000,22222,48484 -j ACCEPT
iptables -A OUTPUT -o wlan0 -p tcp --match multiport --sports 2375,2376,10000,22222,48484 -j ACCEPT

