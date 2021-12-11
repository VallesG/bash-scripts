#!/bin/bash

#Gil Valles 12-10-2021
#me@gilvalles.com
#This is a scipt to update Debian based Linux distrubtions, specifically  Kali Linux.
#Must use sudo when running script.

clear

#creation of logfile and date/time variables
logfile=/var/log/kali-update.log
dt=$(date '+%d/%m/%Y  %H:%M:%S')

#printing date/time and the user that ran the script to the logfile
#printing empty lines for log file readability 
echo "" >> $logfile
echo -e "$dt $USER Kali Update" >> $logfile
echo "Updating Kali Linux.  Please Wait"
echo "" >> $logfile

#fix any broken install(s) before updating | save output to logfile and print in terminal
apt --fix-broken install -y | tee -a $logfile

#save the results of what needs to be upraged in a temporary text file
apt list --upgradeable >> temp.txt

#download package information | save output to logfile and print in terminal
apt-get update -y | tee -a $logfile

#upgrade all installed packages | save output to logfile and print in terminal
apt-get upgrade -y | tee -a $logfile

# remove and clean packages that are no longer needed | save output to logfile and print in terminal
apt autoremove -y && apt autoclean -y | tee -a $logile

