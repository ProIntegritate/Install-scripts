#!/bin/bash
# Chmod + SU, then start script
#
# Package paths for 6.0.16 (2023-May-27), source: https://dotnet.microsoft.com/en-us/download/dotnet/6.0
#
# X64 (Default in script)
#    https://download.visualstudio.microsoft.com/download/pr/45395f1b-8928-41c5-9585-f01d949b2afb/0911c4025fffc0f51c3ab535695c6ca6/dotnet-runtime-6.0.16-linux-x64.tar.gz
#
# ARM64
#    https://download.visualstudio.microsoft.com/download/pr/e7866e12-a380-4994-9c56-1bd3a1e0a546/22a5e54cb4e637c5aac7ec6dcab0d739/dotnet-runtime-6.0.16-linux-arm64.tar.gz
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
curl -L -o dotnet-runtime-6.0.12-linux-x64.tar.gz "https://download.visualstudio.microsoft.com/download/pr/45395f1b-8928-41c5-9585-f01d949b2afb/0911c4025fffc0f51c3ab535695c6ca6/dotnet-runtime-6.0.16-linux-x64.tar.gz"
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
