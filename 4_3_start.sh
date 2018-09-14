#!/bin/bash

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

command -v openvpn &> /dev/null
if [ $? -ne 0 ]
then
    sudo apt install openvpn
fi

sudo -b openvpn --config ~/openvpn/ubuntu.ovpn --auth-user-pass ~/openvpn/.sec_data.txt &> /dev/null