# !/bin/bash
# Author: Kushal K S V S
# Script to change the proxy settings in command line in macos.
# Takes user input and then changes the proxy state.

# Function to check the proxy settings.
function check_proxy(){
	echo -e "\nHTTP Proxy State";
	echo "$(networksetup -getwebproxy "Wi-Fi")";
	echo -e "\nHTTPS Proxy State";
	echo "$(networksetup -getsecurewebproxy "Wi-Fi")";
}
# Function to set the proxy settings.
function set_proxy(){
# Checking if username is empty.
    if [ $# == 2 ]; then
        networksetup -setsecurewebproxy "Wi-Fi" $1 $2;
        networksetup -setwebproxy "Wi-Fi" $1 $2;
    else
        networksetup -setsecurewebproxy "Wi-Fi" $1 $2 on $3 $4;
        networksetup -setwebproxy "Wi-Fi" $1 $2 on $3 $4;
    fi
}
# Checking what proxy is in place.
check_proxy;
# Loding presets from the proxy.presets file.
# If you change the location of the presets file, change the command accordingly.
source ~/proxy.presets;
# List of things to choose from
echo -e "\nChoose an option number below\n";
echo "1 Enable Proxy"
echo "2 Disable Proxy"
echo "3 Change Proxy"
# Declare an array to store all the preset names.
declare -a ARRAY_OF_PRESETS
# Reading the file and storing all the preset names and printing options.
#If you change the location of the presets file, change the here too.
COUNT=0;
while read line
do
    IFS='='
    read -ra ARRAY <<< "$line"
    echo "$((COUNT+4)). Set Proxy=$ARRAY"
    ARRAY_OF_PRESETS[$COUNT]=$ARRAY;
    COUNT=$((COUNT+1));
done < ~/proxy.presets
#Taking input from the user
read choice;
#Action based on the user input
if [ $choice == 1 ]; then
#Switching the proxy 'ON'
	networksetup -setsecurewebproxystate "Wi-Fi" on;
	networksetup -setwebproxystate "Wi-fi" on;
	check_proxy;
elif [ $choice ==  2 ]; then
#Switching the proxy 'OFF'
	networksetup -setwebproxystate "Wi-fi" off;
	networksetup -setsecurewebproxystate "Wi-Fi" off;
	check_proxy;
elif [ $choice ==  3 ]; then
#Taking proxy details from the user.
#If not authenticated leave username and password fields empty.
	echo "Enter server address";
	read SERVER;
	echo "Enter port number";
	read PORT;
	echo "Enter the username if authenticated"
	read USERNAME;
	echo "Enter the password if authenticated"
	read PASSWORD;
    set_proxy $SERVER $PORT $USERNAME $PASSWORD;
    check_proxy;
elif [ $choice >  3 ]; then
    CONFIG_STRING=${!ARRAY_OF_PRESETS[$((choice-4))]}
    eval set_proxy $CONFIG_STRING
    check_proxy;
fi
