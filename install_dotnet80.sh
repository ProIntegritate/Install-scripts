#!/bin/bash
# Chmod + SU, then start script
#
# Package paths for 8.0 (2023-Nove-14), source: https://dotnet.microsoft.com/en-us/download/dotnet/8.0
#
# Script tested earlier (6.0.8) with:
#   - OpenSuse Leap 15.3 x64
#   - SUSE Enterprise Linux 15
#   - Ubuntu Linux 20.04 (Workstation)
#   - Ubuntu Linux 22.04 (Server)
#   - Linux Mint 20.2 x64
#   - Redhat Enterprise Linux 9 (Server)
#   - Fedora Linux 35 x64 (Workstation)
#   - Amazon Linux 2

mkdir -p /.netRuntime
mkdir -p /.netRuntime/dotnet80
cd /.netRuntime/dotnet80
curl -L -o dotnet-runtime-8.0.0-linux-x64.tar.gz "https://download.visualstudio.microsoft.com/download/pr/fc4b4447-45f2-4fd2-899a-77eb1aed7792/6fd52c0c61f064ddc7fe7684e841f491/dotnet-runtime-8.0.0-linux-x64.tar.gz"
tar zxf dotnet-runtime-8.0.0-linux-x64.tar.gz -C /.netRuntime/dotnet80

# Set user Environment variables

# Ubuntu flavour
FILE=/etc/bash.bashrc
if test -f "$FILE"; then
    echo export DOTNET_ROOT=/.netRuntime/dotnet80 >> /etc/bash.bashrc
    echo export PATH=\$PATH:/.netRuntime/dotnet80 >> /etc/bash.bashrc
fi

# Fedora/Redhat flavour
FILE=/etc/bashrc 
if test -f "$FILE"; then
    echo export DOTNET_ROOT=/.netRuntime/dotnet80 >> /etc/bashrc
    echo export PATH=\$PATH:/.netRuntime/dotnet80 >> /etc/bashrc
fi

# Set Root Environment variables
echo export DOTNET_ROOT=/.netRuntime/dotnet80 >> /etc/skel/.bashrc
echo export PATH=\$PATH:/.netRuntime/dotnet80 >> /etc/skel/.bashrc
