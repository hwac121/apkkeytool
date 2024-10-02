#!/bin/bash

# Title: APK Key Tool for Kali Linux
# Version: 1.0
# Date: Sept. 7, 2024
# Contact: hwac121@ptorbox.onion
# Author: RJ Levesque, Jr. - Majik Cat Security
# GitHub: https://github.com/hwac121

#-----------------------------------------------------------------

# Description:
# A simple script to create a key for an APK package.

#==================================
#         CHECK IF ROOT           #
#==================================

if [ "$EUID" -ne 0 ]
  then 
	clear
	splash
	echo " "
	echo -e "\e[35mMust be run as root or sudo ./apkkeytool.sh directly from the application folder\e[0m"
	echo -e "\e[35mor using the command apkkeytool anywhere in a terminal.\e[0m"
	sleep 0.5
  exit
fi

#==================================
#            FUNCTIONS            #
#==================================

splash(){
	figlet "APK Key Tool" | lolcat
	echo -e "\e[32mVersion 1.0\e[0m"
	echo -e "\e[32mby Majik Cat Security for Kali Linux\e[0m"
}

#==================================
#            MAIN MENU            #
#==================================

options=( "Instructions" "Setup" "Make APK Key" "Sign the APK" "Quit")
PS3='Choose what action to take: '
while [ "$menu" != 1 ]; do
	clear
	splash
	echo " "
	sleep 0.25
	select opt in "${options[@]}"; do
    	case $opt in 
    	
#==================================
#            OPTIONS              #
#==================================

		"Instructions")
			clear
			splash
			echo " "
			echo -e "\e[34mStep 1: You MUST run this application from the same directory your apk package is in.\e[0m"
			echo -e "\e[34mStep 2: Run Setup.\e[0m"
			echo -e "\e[34mStep 3: Run Make APK Key.\e[0m"
			echo -e "\e[34mStep 4: Run Sign the APK.\e[0m"
			echo -e "\e[34mBe sure to write down your password when asked for one, it will be needed during signing the APK package.\e[0m"
			sleep 15
		break
		;;
		"Setup")
			clear
			splash
			echo " "
			echo -e "\e[34mAdd your keystore name, no space or punctuation.\e[0m"
			read KeyStoreName
			echo -e "\e[34mGive an alias, single word only, all lowercase.\e[0m"
			read AliasName
			echo " "
			echo -e "\e[33mSetup Complete!\e[0m"
			echo -e "\e[33 Now you can make your key and then sign the APK package."
			sleep 2
		break
		;;
		"Make APK Key")
			clear
			splash
			echo " "
			echo -e "\e[34mAdd your keystore name, no space or punctuation.\e[0m"
			read KeyStoreName
			echo -e "\e[34mGive an alias, single word only, all lowercase.\e[0m"
			read AliasName
			keytool -genkey -v -keystore $KeyStoreName.keystore -alias $AliasName -keyalg RSA -keysize 2048 -validity 10000
			echo " "
			echo -e "\e[33mOperation Complete!\e[0m"
			echo -e "\e[33mUse the ls command in another terminal to view new APK key.\e[0m"
			sleep 3
		break
		;;
		"Sign the APK")
			clear
			splash
			echo " "
			echo -e "\e[34mEnter your APK package name (example: myapplication.apk).\e[0m"
			read ApplicationName
			jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $KeyStoreName.keystore $ApplicationName $AliasName
			echo " "
			echo -e "\e[33mOperation Complete!\e[0m"
			echo -e "\e[33mUse the ls command in another terminal to view the completed APK package.\e[0m"
			sleep 3
		break
		;;
		"Quit")
			clear
			splash
			echo " "
			echo -e "\e[32mClosing APK Key Tool v1.0\e[0m"
			sleep 2
			menu=1
			clear
		break
		;;
	* )		
			echo -e "\e[32m$REPLY is an invalid option\e[0m"
			sleep 3
		break
		;;
    	esac
	done
done

exit 0

