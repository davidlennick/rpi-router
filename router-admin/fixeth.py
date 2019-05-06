import os
import sys
import subprocess


if __name__ == '__main__':
    wan_mac = os.environ['WAN_IF_MAC']
    lan_mac = os.environ['LAN_IF_MAC']
    lab_mac = os.environ['LAB_IF_MAC']

    if_mac = {}
    interfaces = os.listdir('/sys/class/net/')

    for i in interfaces:
        with open('/sys/class/net/{}/address'.format(i)) as f:
            res = f.read().rstrip()
            if_mac[i] = res
    
    for i,mac in if_mac.items():
        cmd = 'ip link set {0} down && ip link set {0} name {1} && ip link set {1} up'
        if mac.lower() == wan_mac.lower():
            subprocess.call(cmd.format(i, 'wan'), shell=True)
        elif mac.lower() == lan_mac.lower():
            subprocess.call(cmd.format(i, 'lan'), shell=True)
        elif mac.lower() == lab_mac.lower():
            subprocess.call(cmd.format(i, 'lab'), shell=True)

    #print(if_mac)
