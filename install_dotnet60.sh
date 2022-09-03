#!/bin/bash
# Chmod + SU, then start script
#
# Package paths for 6.0.8 (August 9, 2022), source: https://dotnet.microsoft.com/en-us/download/dotnet/6.0
#
# X64 (Default in script)
#    https://download.visualstudio.microsoft.com/download/pr/5596ef6f-a174-4fba-aef1-99173e3f3c67/77edd755d605688885ca7114bc4f9ae9/dotnet-runtime-6.0.8-linux-x64.tar.gz
#
# ARM64
#    https://download.visualstudio.microsoft.com/download/pr/866ce4df-8aaa-417d-ad81-26131a2b8734/7ba8391188bc194156ee7d82f494ee00/dotnet-runtime-6.0.8-linux-arm64.tar.gz
#
# Script successfully tested on:
#   - OpenSuse Leap 15.3 x64
#   - Ubuntu Linux 20.04 (Workstation)
#   - Ubuntu Linux 22.04 (Workstation)
#   - Ubuntu Linux 22.04 (Server)
#   - Linux Mint 20.2 x64
#   - Redhat Enterprise Linux 9 (Server)
#   - Fedora Linux 35 x64 (Workstation)


mkdir -p /.netRuntime
mkdir -p /.netRuntime/dotnet60
cd /.netRuntime/dotnet60
curl -L -o dotnet-runtime-6.0.8-linux-x64.tar.gz "https://download.visualstudio.microsoft.com/download/pr/5596ef6f-a174-4fba-aef1-99173e3f3c67/77edd755d605688885ca7114bc4f9ae9/dotnet-runtime-6.0.8-linux-x64.tar.gz"
tar zxf dotnet-runtime-6.0.8-linux-x64.tar.gz -C /.netRuntime/dotnet60

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

