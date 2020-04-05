#!/bin/bash
#This is a Debian Installer Script for Products based on Ubuntu 18.04 version 1.4©Ali Sadykov
#This script is not supported by ARM64 architecture (Raspberry Pi, etc...), thus preventing the correct Docker functionality.
#If you wish to improve the script by adding logical parts and statements, please send your copy to the following email --> maintenanceos.mos@gmail.com Thank You!
#Current Script version 1.4.65B Improvements Pending <-no commercial use->
# RUN THIS SCRIPT AS ROOT!

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
sleep 6
echo "||||||||||||||||||     CHECKING IF JDK8 IS INSTALLED       ||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .4
echo "*********************************************************************************************"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*******" if dpkg -l | grep openjdk-8-jre; then                         echo "         *******"
    echo "You have Open JDK 8 installed on your system >> continuing..."
else
    echo "You don't have Open JDK installed on your system << stopping..."
    sleep .5
    read -p "Install open-jdk-8 on the server (y/n)?" choice
    if [ "$choice" = "y" ]; then
    sleep 2
        echo "Launching services...";
    apt-get install --yes openjdk-8-jre;
    apt-get install --yes openjdk-8-jre-headless;
    else
    sleep 3
        echo "Script is stopping the java installer >> continuing...";
        exit 0
    fi
fi
echo "*******                                                                               *******"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*********************************************************************************************"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*******                  Verifying if Open JDK 8 is installed [*=]                    *******"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*******                                                                               *******"
if dpkg -l | grep openjdk-8-jre; then
echo "*******           You have Open JDK 8 installed on your system >> DONE...             *******"
else
    echo "***********You don't have Open JDK installed on your system << HALTING SERVICE...******"
    sleep .1
echo "*******                                                                               *******"
    exit 3
echo "*******                                                                               *******"
sleep 1
fi
sleep .1
echo "*******                                                                               *******"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*******                                                                               *******"
sleep .4
echo "*********************************************************************************************"
sleep 5
echo " "
echo " "
sleep 2
echo " "
echo "============================================================================================="
sleep .2
echo "===============                                                             ================="
sleep .2
echo "===============                                                             ================="
sleep .2
echo "=============== Welcome to the Minecraft Server Installer Ubuntu 18.04 upd  ================="
sleep .2
echo "===============                                                             ================="
sleep .2
echo "===============                                                             ================="
sleep .2
echo "============================================================================================="
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
sleep .1
echo ""
sleep .1
echo "Installer Starts in 3*.."
sleep .2
echo "                      2.*."
sleep .2
echo "                          1..*"
sleep 10
echo "********************              CREATING DIRECTORIES...                  ***********************************"
echo "********************         PULLING MINECRAFT SERVER PACKAGE...           ***********************************"
sleep .1
mkdir -p /var/minecraft/server/
if [ -d "/var/minecraft/server/" ];
then
    echo "+++++++++++++++++++++ The Directory has been created >> continuing.... +++++++++++++++++++++++++++++"
    sleep 2
    echo "REDIRECTING..."
    cd /var/minecraft/server/

    if [-f "server.jar"]
        then
        echo "File Already Exists!"
    else
        echo "Downloading a server package"
        echo ""
        echo ""
    fi
wget https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
else
    echo "******************  Error: The Directory already exists, Launching the Minecraft Server  *****************"
fi

echo "********************                     ==DONE==                          ***********************************"
echo "********************                  PULL COMPLETE                        ***********************************"
echo ""
sleep 5
echo "********************              SETTING UP THE SERVER...                 ***********************************"
java -Xmx1024M -Xms1024M -jar server.jar nogui

sleep 10
    echo ""
    echo ""
    sleep .5
    echo "Please type in //nano eula.txt// and change one line from FALSE to TRUE, press CTRL X, Y (as yes) and ENTER to save the document"
    sleep .5
    echo "Run this script again after applying these changes"
echo "********************                   ===DONE===                          ***********************************"
echo ""
sleep .1
echo ""
sleep 3
echo "==============================================================================="
sleep .2
echo "=====       THE INSTALLATION HAS BEEN SUCCESSFULLY COMPLETED            ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=====        Thank You for using Minecraft Installer Script             ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "======                Copyright 2020 Ali Sadykov     v.1.4              ======="
sleep .2
echo "==============================================================================="
