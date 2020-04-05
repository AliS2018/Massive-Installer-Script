#!/bin/bash
#This is a Debian Installer Script for Products based on Ubuntu 18.04 version 1.3©Ali Sadykov
#This script is not supported by ARM64 architecture (Raspberry Pi, etc...), thus preventing the correct Docker functionality.
#If you wish to improve the script by adding logical parts and statements, please send your copy to the following email --> maintenanceos.mos@gmail.com Thank You!
#Current Script version 1.3.35B Improvements Pending <-no commercial use->
# RUN THIS SCRIPT AS ROOT!

##Add Key for a Plex Media Server
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
sudo apt-get update
#Download the debian installer for your Ubuntu Server 18.04.xx
echo "||||||||||||||||||||||||||||||RUN ME AS ROOT|||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||GO TO THE SCRIPT LOCATION AND TYPE IN:||||||||||||||||||||"
sleep 3
echo "||||||||||||||||||        sudo ./scriptname.sh             ||||||||||||||||||||"
sleep 3
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "Continuing..."
sleep 6
echo "=================================================================="
sleep .1
echo "=======Welcome to the Plex Media Server Installer Script=========="
sleep .1
echo "=================================================================="
sleep .1
echo ""
echo ""
echo ""
echo "Installer Starts in 3...
sleep .1
echo "                      2...
sleep .1
echo "                        1..."
sleep .3
echo "********************      CREATING DIRECTORIES...    ***********************"
sleep .5
cd /temp_data01/
echo "********************      PULLING INSTALLERS...      ***********************"
sleep .2
wget https://downloads.plex.tv/plex-media-server/1.14.1.5488-cc260c476/plexmediaserver_1.14.1.5488-cc260c476_amd64.deb
echo "********************      INSTALLING MEDIA...        ***********************"
sleep .3
sudo dpkg -i plexmediaserver*.deb
echo "********************      STARTING SERVICES...       ***********************"
sleep .5
sudo systemctl enable plexmediaserver.service
sudo systemctl start plexmediaserver.service

echo "========================================================="
sleep .2
echo "=======Thanks for installing Plex Media Server==========="
sleep .3
echo "========================================================="
sleep .4
echo "========================================================="
sleep .1
echo "===========               DONE           ================"
sleep .1
echo "========================================================="
sleep .1

