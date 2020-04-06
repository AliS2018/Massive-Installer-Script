#!/bin/bash

##Add key server repo for webmin
cd /root
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc

##Add webmin repo
add-apt-repository "deb https://download.webmin.com/download/repository sarge contrib"

##Install webmin
apt update && apt upgrade -y
apt install webmin -y
echo "If you want Webmin to work please go to the following address: cd /etc/webmin/ and type in nano miniserv.conf and change ssl=1 to ssl=0 type in CTRL+X then Y and then ENTER to save the file"
echo "To access the Webmin Dashboard please refer to the following address"
hostname -I | cut -f1 -d' '
echo ":10000// and you will be able to see the dashboard."
sleep 15
echo "Returning to the Main page..."
sleep 3
        cd ~/
       ./MIS.sh
