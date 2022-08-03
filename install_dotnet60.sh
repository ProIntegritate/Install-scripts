#!/bin/bash
# Chmod and run as SU
#
# Package paths for 6.0:
# "https://dotnetcli.azureedge.net/dotnet/Sdk/6.0.101/dotnet-sdk-6.0.101-linux-x64.tar.gz"
# "https://download.visualstudio.microsoft.com/download/pr/ede8a287-3d61-4988-a356-32ff9129079e/bdb47b6b510ed0c4f0b132f7f4ad9d5a/dotnet-sdk-6.0.101-linux-x64.tar.gz"
# "https://download.visualstudio.microsoft.com/download/pr/d43345e2-f0d7-4866-b56e-419071f30ebe/68debcece0276e9b25a65ec5798cf07b/dotnet-sdk-6.0.101-linux-arm64.tar.gz"
#
# Package paths for 6.0.9 (July 12, 2022)
# "https://download.visualstudio.microsoft.com/download/pr/f9706e92-c7a1-4dc8-806a-0e95827c5b02/23be52946e4e2425c798208c5f16bb64/dotnet-runtime-6.0.7-linux-arm64.tar.gz"
# "https://download.visualstudio.microsoft.com/download/pr/bd828687-1706-4041-a804-5e93631fe256/d4ec75936459a7e8c772c929edcbfeda/dotnet-runtime-6.0.7-linux-x64.tar.gz"

mkdir -p /.netRuntime
mkdir -p /.netRuntime/dotnet60
cd /.netRuntime/dotnet60
curl -L -o dotnet-sdk-6.0.101-linux-x64.tar.gz "https://dotnetcli.azureedge.net/dotnet/Sdk/6.0.101/dotnet-sdk-6.0.101-linux-x64.tar.gz"
tar zxf dotnet-sdk-6.0.101-linux-x64.tar.gz -C /.netRuntime/dotnet60
echo export DOTNET_ROOT=/.netRuntime/dotnet60 >> /etc/bash.bashrc
echo export PATH=\$PATH:/.netRuntime/dotnet60 >> /etc/bash.bashrc
