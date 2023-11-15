# dotv.sh - script to change between dotnet versions.
# Check usage example below or by running the script without parameters.
# Will create backups of bash config files before modifying them.
# Requires root/sudo privileges.

if [ -z "$1" ]
  then
    echo "Usage examples:"
    echo "sudo dotv.sh 80 = will set paths to /.netRuntime/dotnet80"
    echo "sudo dotv.sh 60 = will set paths to /.netRuntime/dotnet60"
    exit 0
fi


# Set user Environment variables for dotnet
DOTNET=dotnet$1
echo "Setting dotnet version: $DOTNET"


# Ubuntu flavour
FILE=/etc/bash.bashrc
if test -f "$FILE"; then
	echo Modifying $FILE
	cp $FILE $FILE.bak
	cat $FILE | grep -v "netRuntime" > $FILE.new
	mv $FILE.new $FILE
	echo export DOTNET_ROOT=/.netRuntime/$DOTNET >> $FILE
	echo export PATH=\$PATH:/.netRuntime/$DOTNET >> $FILE
fi


# Fedora/Redhat flavour
FILE=/etc/bashrc 
if test -f "$FILE"; then
	echo Modifying $FILE
	cp $FILE $FILE.bak
	cat $FILE | grep -v "netRuntime" > $FILE.new
	mv $FILE.new $FILE
	echo export DOTNET_ROOT=/.netRuntime/$DOTNET >> $FILE
	echo export PATH=\$PATH:/.netRuntime/$DOTNET >> $FILE
fi


# Set Root Environment variables
FILE=/etc/skel/.bashrc
if test -f "$FILE"; then
	echo Modifying $FILE
	cp $FILE $FILE.bak
	cat $FILE | grep -v "netRuntime" > $FILE.new
	mv $FILE.new $FILE
	echo export DOTNET_ROOT=/.netRuntime/$DOTNET >> $FILE
	echo export PATH=\$PATH:/.netRuntime/$DOTNET >> $FILE
fi

echo "Done. Please restart any terminal/shell to update your environmental variables."
