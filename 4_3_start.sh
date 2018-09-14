#!/bin/bash

sudo -v
read -p "Enter Username(example@students.iiit.ac.in): " uname
read -sp "Password: " password

mkdir ~/openvpn &> /dev/null

echo $uname > ~/openvpn/.sec_data.txt
echo $password >> ~/openvpn/.sec_data.txt
if [[ -e ~/openvpn/ubuntu.ovpn ]]
then
	rm ~/openvpn/ubuntu.ovpn
fi
wget -q https://vpn.iiit.ac.in/secure/ubuntu.ovpn --http-user $uname --http-password $password -P ~/openvpn/
if [ $? -ne 0 ]
then
    echo "some Error occured :("
    exit 1
fi

command -v openvpn &> /dev/null
if [ $? -ne 0 ]
then
    sudo apt install openvpn
fi

sudo openvpn --config ~/openvpn/ubuntu.ovpn --auth-user-pass ~/openvpn/.sec_data.txt --daemon

sleep 5
ifconfig | grep -q "tun"

if [ $? -eq 0 ]
then
    sudo sed -i '1s/^/nameserver 10.4.20.204\n/' /etc/resolv.conf
    echo -e '\nVpn Started (^_^)'
else 
    echo -e '\nSome Error occured..try again later :('
fi
