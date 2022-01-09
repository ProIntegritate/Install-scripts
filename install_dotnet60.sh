#!/bin/bash
# Chmod and run as SU
#
# Package paths for 6.0:
# "https://dotnetcli.azureedge.net/dotnet/Sdk/6.0.101/dotnet-sdk-6.0.101-linux-x64.tar.gz"
# "https://download.visualstudio.microsoft.com/download/pr/ede8a287-3d61-4988-a356-32ff9129079e/bdb47b6b510ed0c4f0b132f7f4ad9d5a/dotnet-sdk-6.0.101-linux-x64.tar.gz"
# "https://download.visualstudio.microsoft.com/download/pr/d43345e2-f0d7-4866-b56e-419071f30ebe/68debcece0276e9b25a65ec5798cf07b/dotnet-sdk-6.0.101-linux-arm64.tar.gz"

mkdir -p /.netRuntime
mkdir -p /.netRuntime/dotnet60
cd /.netRuntime/dotnet60
curl -L -o dotnet-sdk-6.0.101-linux-x64.tar.gz "https://dotnetcli.azureedge.net/dotnet/Sdk/6.0.101/dotnet-sdk-6.0.101-linux-x64.tar.gz"
tar zxf dotnet-sdk-6.0.101-linux-x64.tar.gz -C /.netRuntime/dotnet60
echo export DOTNET_ROOT=/.netRuntime/dotnet60 >> /etc/bash.bashrc
echo export PATH=\$PATH:/.netRuntime/dotnet60 >> /etc/bash.bashrc
