#!/bin/bash

# Title: APK Key Tool
# Version: 1.0
# Date: Sept. 7, 2024
# Contact: hwac121@ptorbox.onion
# Author: RJ Levesque, Jr. - Majik Cat Security
# GitHub: https://github.com/hwac121

#-----------------------------------------------------------------

# Description:
# A simple script to sign and create a key for an APK package.

#=======================================================================
#                         FUNCTIONS
#=======================================================================

splash(){
	figlet "APK Key Tool" | lolcat
	echo -e "\e[32mVersion 1.0 for Kali Linux\e[0m"
	echo -e "\e[32mby Majik Cat Security\e[0m"
}

#==================================
#         CHECK IF ROOT           #
#==================================

if [ "$EUID" -ne 0 ]
  then 
	clear
	splash
	echo " "
	echo -e "\e[35mMust be run as root or sudo ./apkkeytool.sh directly from the application\e[0m"
	echo -e "\e[35mfolder or using the command apkkeytool anywhere in a terminal.\e[0m"
	sleep 0.5
  exit
fi

#===================================================================#
#			 CHECK FOR DEPENDENCIES                     #
#===================================================================#
clear
splash
echo " "
echo -e "\e[35mINSTALLATION PROCESS...\e[0m"
echo " "
echo -e "\e[35mby Majik Cat Security\e[0m"
sleep 2
rm /usr/bin/apkkeytool
chmod +x apkkeytool.sh
cp apkkeytool.sh /usr/bin/apkkeytool
chmod +x /usr/bin/apkkeytool
echo -e "\e[32mThe APK Key Tool is ready for use..."
sleep 3
clear
