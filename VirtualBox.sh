#!/bin/bash
#This is a Debian Installer Script for Products based on Ubuntu 18.04 version 1.3©Ali Sadykov
#This script is not supported by ARM64 architecture (Raspberry Pi, etc...), thus preventing the correct Docker functionality.
#If you wish to improve the script by adding logical parts and statements, please send your copy to the following email --> maintenanceos.mos@gmail.com Thank You!
#Current Script version 1.3.35B Improvements Pending <-no commercial use->
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
sleep 2
echo "==============================================================================="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=========     Welcome to the Oracle VirualBox Installer Script    ============="
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
echo "@@@@@@@@@@@@@@@@@@@@  CHECKING YOUR INTERNET CONNECTION...  @@@@@@@@@@@@@@@@@@@@"
#Checking internet connection by resolving names
#If Ping doesn't work correctly this program/script will show an error and exit uppon that mentioned error.
if ping -q -c 5 -W 5 google.com >/dev/null; then
    echo "You have a Stable Internet Connection, The Installer may proceed..."
else
    echo "You don't have a Stable Internet connection, please fix any errors/issues regarding this problem and relaunch this Script again. Thanks!"
    exit 1
fi
sleep .1
echo ""
sleep .1
echo "Installer Starts in 3..."
sleep .1
echo "                         2..."
sleep .1
echo "                            1..."
sleep .1
sleep 10
echo "************************  ADDING NECESSARY REPOS FOR THE VBOX INSTALLATION... *********************************"
add-apt-repository universe
add-apt-repository multiverse
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib"
echo "********************                          DONE                          ***********************************"
sleep 5
echo ""

echo "********************              INSTALLING NECESSARY TOOLS...             ***********************************"
sleep .1
apt-get update && apt-get upgrade && apt-get dist-upgrade

echo "==============================================================================================================="
sleep .1
echo "==============================================================================================================="
sleep .1
apt install --yes build-essential dkms unzip wget
sleep .1
echo "********************                     ==DONE==                          ***********************************"
echo ""
sleep 2

echo "********************              SETTING UP A VBOX KEY...                 ***********************************"
echo "********************         CREATING TEMPORARY DIRECTORIES...             ***********************************"
cd ~/temp_data01/
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
apt update
echo "********************                   ===DONE===                          ***********************************"
echo ""
sleep .1

echo "********************             INSTALLING VIRTUALBOX 6.1...               ***********************************"
sleep .1
apt install --yes virtualbox-6.1
echo "********************                  ====DONE====                         ***********************************"
echo ""
sleep 3

echo "********************             ADDING USERS TO THE GROUP...              ***********************************"
usermod -aG vboxusers root
sleep .5
echo "Check status..."
systemctl status vboxdrv
    echo "The installation may proceed"
sleep .5
echo "********************                  ====DONE====                         ***********************************"
sleep .1
echo ""

echo "********************               PULLING EXTENSION PACK...               ***********************************"
cd /temp_data01/
wget https://download.virtualbox.org/virtualbox/6.1.0/Oracle_VM_VirtualBox_Extension_Pack-6.1.0-135406.vbox-extpack
sleep 2
echo "Configuring the package..."
VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.0-135406.vbox-extpack
echo "********************                  ====DONE====                         ***********************************"
echo ""
sleep .5
echo ""
sleep .5
echo "********************                  INSTALLING phpVirtualBox...          ***********************************"
echo ""
sleep .5
apt install --yes apache2 php php-mysql libapache2-mod-php php-soap php-xml
cd ~/temp_data01/Massive-Installer-Script
unzip phpvirtualbox-6.1.zip
mv phpvirtualbox-6.1/ /var/www/html/phpvirtualbox
chmod 777 /var/www/html/phpvirtualbox/
cp /var/www/html/phpvirtualbox/config.php-example /var/www/html/phpvirtualbox/config.php
echo "********************                  ====DONE====                         ***********************************"
sleep .5
echo "@@@@@@@@@@@@@@@@@@@               RESTARTING SERVICES...                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
systemctl restart vboxweb-service
systemctl restart vboxdrv
systemctl restart apache2
echo "@@@@@@@@@@@@@@@@@@@                       DONE...                          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
sleep .5
echo "To configure your phpVirtualBox you must go to /var/www/html/phpvirtualbox and change some key variables under your server IP"
sleep 1
echo "Thanks!"
sleep 10
echo "If you need to run Remote Desktop on your VM type in the following thing > > > VBoxManage modifyvm YOUR-VM-NAME --vrdeaddress "  hostname -I | cut -f1 -d' ' ; echo "IP address of your local server/machine"
sleep 10
echo "To run your VirtualBox client, so that it can let you log into the system type in the following command on your terminal: > > > |vboxwebsrv| < < < "
sleep 10
echo "++++++++++++++++++++++++++++++++++"
sleep 1
echo "++++ LOCAL USERNAME: admin    ++++"
sleep 1
echo "++++ LOCAL PASSWORD: admin    ++++"
sleep 1
echo "++++++++++++++++++++++++++++++++++"
sleep 10
echo "==============================================================================="
sleep .5
echo "=====       THE INSTALLATION HAS BEEN SUCCESSFULLY COMPLETED            ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=========   Thank You for using VirtualBox 6.1 Installer Script   ============="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "======                Copyright 2020 Ali Sadykov     v.2.1              ======="
sleep .2
echo "==============================================================================="

echo "Returning to the Main page..."
sleep 3
        cd ~/
       ./MIS.sh
