#!/bin/sh

connection=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)

if [ -n "$connection" ]; then
    echo " VPN: # $(curl -4 -sf ifconfig.co)"
else 
    echo ""
fi
