#!/bin/bash
#This is a Debian Installer Script for Products based on Ubuntu 18.04 version 1.3.2B©Ali Sadykov
#This script is not supported by ARM64 architecture (Raspberry Pi, etc...), thus preventing the correct Docker functionality.
#If you wish to improve the script by adding logical parts and statements, please send your copy to the following email --> maintenanceos.mos@gmail.com Thank You!
#Current Script version 1.3.91B Improvements Pending <-no commercial use->
# RUN THIS SCRIPT AS ROOT!

echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "||||||||||||||              RUNNING SOME ERRANDS                  |||||||||||||"
sleep 1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep 1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "==============================================================================="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=========Welcome to the (Docker Based) WordPress Installer Script ============="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "======                                                                  ======="
sleep .2
echo "==============================================================================="
sleep .5
echo ""
sleep .5
echo ""
sleep .5
echo ""
sleep .5
echo ""
sleep .5
echo ""
sleep .5
echo "@@@@@@@@@@@@@@@@@@@@ CHECKING YOUR INTERNET CONNECTION @@@@@@@@@@@@@@@@@@@@@@@@"
if ping -q -c 5 -W 5 google.com >/dev/null; then
 echo "You have a Stable Internet Connection, The Installer may Proceed..."
else
 echo "You don't have a Stable Internet Connection, Please Fix any Inconsistencies regarding this Problem and Relaunch this Script Again. Thanks!"
  exit 1
fi
echo ""
sleep .1
echo ""
sleep .1
echo "Installer Starts in 3..."
sleep .2
echo "                      2..."
sleep .2
echo "                        1..."
sleep 10
echo ".............................   DOCKER HAS BEEN INITIALISED  ......................."
sleep .1
echo "      *..         "
sleep .2
echo "      .*.         "
sleep .1
echo "      ..*         "
sleep .2
echo "      *..         "
sleep .1
echo "      .*.         "
sleep .2
echo "      ..*         "
sleep .1
echo ""
sleep 1
echo "************************        DOCKER IS ABOUT TO PULL THE IMAGE         *************************************"
docker run -d --name temp_dta_wp wordpress
echo "********************                  PULL COMPLETE                        ***********************************"
sleep 5
echo ""
echo "********************              CREATING DIRECTORIES...                  ***********************************"
sleep .1
mkdir -p /var/docker/wordpress_media
sleep .1
echo "********************                     ==DONE==                          ***********************************"
echo ""
sleep 2
echo "********************              SETTING UP A CONTAINER...                ***********************************"
docker cp temp_dta_wp:/var/www/html/* /var/docker/wordpress_media
echo "********************                   ===DONE===                          ***********************************"
echo ""
sleep .1
echo "********************              CLEANING UP TEMP DATA...                 ***********************************"
sleep .1
docker rm --force wordpress_media
echo "********************                  ====DONE====                         ***********************************"
echo ""
sleep 3
echo "********************              VERIFYING THE SCRIPT...                  ***********************************"
ls -la /var/docker/wordpress_media
sleep .5
    echo "The installation may proceed"
sleep .5
echo "********************                  ====DONE====                         ***********************************"
sleep .1
echo ""
echo "********************               PULLING CONFIG FILE...                  ***********************************"
cd ~/temp_data01/
git clone https://github.com/AliS2018/DockerC-ConfigFiles.git
echo "********************                  ====DONE====                         ***********************************"
echo ""
sleep 3
echo "********************              CONFIGURING SQL SERVER...                ***********************************"
sleep .1
echo "please wait." 
sleep .1 
echo ".." 
sleep .1 
echo "..." 
sleep .1 
echo "...." 
sleep .1 
echo "....."
cd ~/temp_data01/DockerC-ConfigFiles/
docker-compose -f wrdprss.yaml up -d
sleep .5
docker logs wrdpress-container
sleep 5
docker exec wrdpress-container /bin/bash -c "ls -la /var/www/html/"
echo "********************                  ====DONE====                         ***********************************"
sleep .5
echo ""
sleep .5

echo "********************                  GLOBAL CLEANUP...                     ***********************************"
echo ""
sleep .5
cd /
docker system prune -a
echo "********************                  ====DONE====                         ***********************************"
sleep .5
echo ""
sleep .5
echo "                                  CONFIGURATION DATA SUMMARY                                                  "
echo ""
echo "Loading Containers..."
sleep 2
docker ps -a | grep wrdpress-container
echo "WordPress is working!"
sleep 2
echo "Loading the Server Main IP address..."
hostname -I | cut -f1 -d' ' && echo "port--> :8095"
echo "Open your browser and type in the information that is mentioned above. . . "
sleep 10
echo "==============================================================================="
sleep .2
echo "=====       THE INSTALLATION HAS BEEN SUCCESSFULLY COMPLETED            ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=====       Thank You for using Mass Installer Script Global Edition    ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "======                Copyright © 2020 A.Sadykov                        ======="
sleep .2
echo "==============================================================================="

echo "Relaunching the Docker Management System Interface a.k.a (DMSI)..."
sleep 3
        cd ~/temp_data01/Mass-Installer-Script/DockerManager/
       ./Launcher.sh
