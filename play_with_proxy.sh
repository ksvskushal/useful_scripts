#!/bin/bash
#script to change the proxy settings in command line in macos
#takes user input and then changes the proxy state.

# Function to check the proxy settings
function check_proxy(){
	echo -e "HTTP Proxy State";
	echo "$(networksetup -getwebproxy "Wi-Fi")";
	echo -e "\nHTTPS Proxy State";
	echo "$(networksetup -getsecurewebproxy "Wi-Fi")";
}
# Checking what proxy is in place
check_proxy;
#List of things to choose from
echo -e "\nChoose an option number below\n";
echo "1 Enable Proxy"
echo "2 Disable Proxy"
echo "3 Change Proxy"
echo "4 Change proxy=PRESET_AUTH"
echo "5 Change proxy=PRESET_NO_AUTH"
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
#Checking if username is empty
	if [ -z s$USERNAME ]; then
		networksetup -setsecurewebproxy "Wi-Fi" $SERVER $PORT;
		networksetup -setwebproxy "Wi-Fi" $SERVER $PORT;
		check_proxy;
	else
		networksetup -setsecurewebproxy "Wi-Fi" $SERVER $PORT on $USERNAME $PASSWORD;
		networksetup -setwebproxy "Wi-Fi" $SERVER $PORT on $USERNAME $PASSWORD;
		check_proxy;
	fi
elif [ $choice ==  4 ]; then
#Switch on PRESET_AUTH proxy. ( Proxy with Authentication )
#Change the proxy details below.
	SERVER="202.141.80.24"
	PORT=3128
	USERNAME="username"
	PASSWORD="password"
	networksetup -setsecurewebproxy "Wi-Fi" $SERVER $PORT on $USERNAME $PASSWORD;
	networksetup -setwebproxy "Wi-Fi" $SERVER $PORT on $USERNAME $PASSWORD;
	check_proxy;
elif [ $choice ==  5 ]; then
#Switch on PRESET_NO_AUTH proxy. ( Proxy without Authentication )
#Change the proxy details below.
    SERVER="202.141.80.24"
    PORT=3128
    networksetup -setsecurewebproxy "Wi-Fi" $SERVER $PORT;
    networksetup -setwebproxy "Wi-Fi" $SERVER $PORT;
    check_proxy;
fi




