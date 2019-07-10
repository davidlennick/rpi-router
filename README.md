# rpi-router

uses a raspberry pi 3 b+ with three ethernet ports (the on-board nic + 2 usb to rj45 adaptors), named:

- `wan` -> used by WAN or upstream internet gateway, masqueraded 
- `lan` -> used by downstream network, `192.168.9.1`, DHCP on `192.168.9.2 -> 192.168.9.254`, passthrough to WAN
- `lab` -> some network, probably should be used for labs and nothing production-ready 

from your local machine:

```
cd rpi-router
sudo balena local scan
sudo balena push <ip> -s .
```


## setup
```
modem --- wan if --- rpi --- lan if --- lan
                      |
                       ----- lab if --- lab
```

## containers

### router-admin

- debian image with `webmin` installed
- reassigns eth devices by MAC address using the environment variables in the compose file
    - `WAN_IF_MAC=<mac_goes_here>`
    - `LAN_IF_MAC=<mac_goes_here>`
    - `LAB_IF_MAC=<mac_goes_here>`

- on boot, assigns names to eth devices: 
    - `WAN_IF_MAC` -> `wan`
    - `LAN_IF_MAC` -> `lan`
    - `LAB_IF_MAC` -> `lab`

- changes `lan` address to `10.0.0.1/24`, broadcast `10.0.0.255`

### dhcp

- `lan` and `lab` have a DHCP server attached to them, provisioning from `192.168.9.2 -> 192.168.9.254` and `10.0.0.2 -> 10.0.0.254` 


### ddns

- uses https://www.duckdns.org/ 
