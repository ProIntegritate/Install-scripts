#!/bin/bash
# Chmod and then start script with sudo
# Packages can be found at: https://dotnet.microsoft.com/en-us/download/dotnet/6.0

if [ "$EUID" -ne 0 ]
	then echo "Please run as root, i.e. sudo ./scriptname"
	exit 1
fi

clear


# ---- Set installation Environment variables for dotnet ----

DOTNET=dotnet60
echo "* Setting dotnet version: $DOTNET"

DOWNLOADURL="https://download.visualstudio.microsoft.com/download/pr/d0d7fabb-4221-441a-84ae-e94f59c8ab42/a7cd6251bd8ce5fac4baa1c057e4c5ed/dotnet-runtime-6.0.36-linux-x64.tar.gz"

# ---- Set up installation path ----
mkdir -p /.netRuntime
mkdir -p /.netRuntime/$DOTNET
cd /.netRuntime/$DOTNET


# ---- Check for tool(s) to download installation package ----

# WGet
FILE=/usr/bin/wget
if test -f "$FILE"; then
	TOOL=$FILE
fi

# Curl
FILE=/usr/bin/curl
if test -f "$FILE"; then
	if [ -z "$TOOL" ]; then
		TOOL=$FILE
	fi
fi


# ---- Download ----
echo "Using $TOOL to download installation package."

case $TOOL in

	/usr/bin/wget)
		wget $DOWNLOADURL -O download.tar.gz
		;;
	/usr/bin/curl)
		curl -L $DOWNLOADURL -o download.tar.gz 
		;;
	*)
		echo "No tool capable of downloads found"
		exit 1
esac


# ---- Unpack ----
tar zxf download.tar.gz -C /.netRuntime/$DOTNET
rm download.tar.gz


# ---- Function for processing config files ----
function processfile() {
	if test -f "$FILE"; then
		echo "* Modifying $FILE"
		cp $FILE $FILE.bak
		cat $FILE | grep -v "netRuntime" > $FILE.new
		mv $FILE.new $FILE
		echo export DOTNET_ROOT=/.netRuntime/$DOTNET >> $FILE
		echo export PATH=\$PATH:/.netRuntime/$DOTNET >> $FILE
	fi
}


# ---- Set user Environment variables ----
echo "Processing configuration files:"

	# Set Root (Common) Environment variables
	FILE=/etc/skel/.bashrc
	echo "$FILE"
	processfile

	# Ubuntu flavour
	FILE=/etc/bash.bashrc
	echo "$FILE"
	processfile

	# Fedora/Redhat flavour
	FILE=/etc/bashrc 
	echo "$FILE"
	processfile

