#!/bin/bash
# Chmod + SU, then start script
#
# Package paths for 6.0.12 (2022-Dec-15), source: https://dotnet.microsoft.com/en-us/download/dotnet/6.0
#
# X64 (Default in script)
#    https://download.visualstudio.microsoft.com/download/pr/7d543956-0b80-4c08-910e-c8c388f5fab8/01d45a3686e72f70be51b3f98569c6b1/dotnet-runtime-6.0.12-linux-x64.tar.gz
#
# ARM64
#    https://download.visualstudio.microsoft.com/download/pr/cbcfbaa2-781b-4782-9994-9a9289ca724d/bc2fe2ee1a1842ea6d1151e5e0a410f9/dotnet-runtime-6.0.12-linux-arm64.tar.gz
#
# Script successfully tested on 2022-Dec-15 with version 6.0.12 on:
#   - Ubuntu Linux 22.04 (Workstation)
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
mkdir -p /.netRuntime/dotnet60
cd /.netRuntime/dotnet60
curl -L -o dotnet-runtime-6.0.12-linux-x64.tar.gz "https://download.visualstudio.microsoft.com/download/pr/7d543956-0b80-4c08-910e-c8c388f5fab8/01d45a3686e72f70be51b3f98569c6b1/dotnet-runtime-6.0.12-linux-x64.tar.gz"
tar zxf dotnet-runtime-6.0.12-linux-x64.tar.gz -C /.netRuntime/dotnet60

# Set user Environment variables

# Ubuntu flavour
FILE=/etc/bash.bashrc
if test -f "$FILE"; then
    echo export DOTNET_ROOT=/.netRuntime/dotnet60 >> /etc/bash.bashrc
    echo export PATH=\$PATH:/.netRuntime/dotnet60 >> /etc/bash.bashrc
fi

# Fedora/Redhat flavour
FILE=/etc/bashrc 
if test -f "$FILE"; then
    echo export DOTNET_ROOT=/.netRuntime/dotnet60 >> /etc/bashrc
    echo export PATH=\$PATH:/.netRuntime/dotnet60 >> /etc/bashrc
fi

# Set Root Environment variables
echo export DOTNET_ROOT=/.netRuntime/dotnet60 >> /etc/skel/.bashrc
echo export PATH=\$PATH:/.netRuntime/dotnet60 >> /etc/skel/.bashrc
