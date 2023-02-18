#!/bin/bash

sudo apt-get install isc-dhcp-server

# set static IP in ubuntu
# sudo nmcli con mod cf79158c-1e3f-35e5-83d8-6b4a26462748 ipv4.address 10.1.1.2/24
# sudo nmcli con mod cf79158c-1e3f-35e5-83d8-6b4a26462748 ipv4.method manual
# restart VM to apply -> how to change ?

# show info
# nmcli connection show

# setup TFTPD ubuntu 
sudo apt-get install tftpd-hpa

