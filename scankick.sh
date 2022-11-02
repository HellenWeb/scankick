#!/bin/bash

# Color

red='\033[1;31m'
rset='\033[0m'
grn='\033[1;32m'
ylo='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
pink='\033[1;35m'

# Function for scaning open ports and sending request

scan_and_port() {
   echo -n -e "$grn[*]$grn$blue OPEN PORTS $host:$blue$red\n";
   echo ""
   nmap $host -oG -|grep -oP '[0-9]*(?=/open)'
   echo ""
   echo -n -e "$grn[*]$grn$ylo CURL Request$ylo\n"
   echo -e "$grn-----------------------------------$grn\n"
   curl --proxy 127.0.0.1:8080 "http://$host"
}

# Function for test port via zmap

scan_port() {
   echo ""
   echo -n -e "$grn[*]$grn$ylo SCAN PORT$ylo\n"
   zmap -p $port $host
}

# Echo ||

clear
apt list --installed nmap zmap boxes
echo ""
echo -n -e "$grn[*]$grn Install APT Modules (N/y)? "; read apt

if [[ $apt == "y" ]]; then
	apt install nmap zmap boxes
fi

clear
echo ""
echo -n -e "$red"
echo -e -n "\n$red[*] SCANKICK\n[-] https://github.com/HellenWeb/scankick" | boxes -d dog
echo ""
echo ""

echo -n -e "$grn[*]$grn$ylo Enter your site: $ylo"; read url

if [[ "$USER" != "root" ]]; then
	echo ""
	echo -n -e "$red[-]$red$yellow Permission Denied$yellow\n"
	echo -n -e "$red[-]$red$yellow Can only be run by root$yellow"
	exit
fi

host=$url
scan_and_port

echo ""
echo -n -e "$grn[*]$grn$ylo Enter your port for test via zmap: $ylo"; read p

port=$p
scan_port
