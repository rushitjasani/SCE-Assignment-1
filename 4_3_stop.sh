#!/bin/bash


sudo sed -i '/nameserver 10.4.20.204/d' /etc/resolv.conf

sudo killall openvpn &> /dev/null

echo "VPN Closed :) "
