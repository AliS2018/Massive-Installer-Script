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

echo "Returning to the Main page..."
sleep 3
        cd ~/
       ./MIS.sh
