#!/bin/bash 
# 
# echo_google_hosts.sh
#
# Adding the new google IPs for rclone to get full speeds
#
# run it once as sudo and it should add the new google IPs to /etc/hosts
# should not need to restart after
#
# run: wget -q -O- https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/echo_google_hosts.sh | sudo bash
# 

echo "142.250.189.170 www.googleapis.com" >> /etc/hosts
echo "142.251.32.42 www.googleapis.com" >> /etc/hosts
echo "172.217.6.42 www.googleapis.com" >> /etc/hosts
echo "142.250.189.234 www.googleapis.com" >> /etc/hosts

echo "Added the new google IPs to /etc/hosts. Rclone should link to gdrive at full speeds now."
