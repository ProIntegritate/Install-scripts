# Install-scripts
Minimal Installation scripts for Linux (X64) .NET runtime

Uses WGET or CURL to fetch install packages. Requires an elevated prompt, use sudo when installing.

- install_dotnet50.sh = Install .NET 5 on Linux  <- Fetches version 5.0.17 (END OF LIFE)
- install_dotnet60.sh = Install .NET 6 on Linux  <- Fetches version 6.0.27
- install_dotnet70.sh = Install .NET 7 on Linux  <- Fetches version 7.0.16
- install_dotnet80.sh = Install .NET 8 on Linux  <- Fetches version 8.0.2
- dotv.sh = Script to change between versions, sets all environmental variables automagically.

Install path will be /.netRuntime/dotnetXX where XX is the version number. You can edit this in the script if you want before running it.

The Linux install scripts for .NET (5,6,7,8) allow you to install and setup path +  Export variables to be able to run binaries compiled under one or the other.
Each runtime version is installed in it's separate folder allowing you to switch between version just by editing the config files.

The install scripts are not always current, i only update these script ocasionally so if you want the latest version, make sure to modify the script get the most current URL.


# Change version (dotv.sh)
Use the dotv.sh script to set current dotnet runtime version, examples:

_sudo ./dotv.sh 80   = will set paths to /.netRuntime/dotnet80<br>
sudo ./dotv.sh 60   = will set paths to /.netRuntime/dotnet60_

Once you have changed paths, you should restart your shell to reflect the changes in environment variables.
One tips to save time is to run a shell in a shell, like bash -> bash, and then just exit that shell and restart a new one.


# Manually change config files
Change these if you manually want to switch versions, Change **DOTNET_ROOT** and **PATH** in these files respectively:

### Root Environment variables (must always be updated)
/etc/skel/.bashrc

### Ubuntu flavour (optional)
/etc/bash.bashrc

### Fedora/Redhat flavour (optional)
/etc/bashrc 
