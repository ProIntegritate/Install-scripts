# Install-scripts
Minimal Installation scripts for Linux (X64) .NET runtime

**Note: Currently requires CURL**
You can change the scripts to use wget if you prefer that.

- install_dotnet50.sh = Install .NET 5 on Linux (Custom script, quick and dirty)   Fetches version 5.0.404
- install_dotnet60.sh = Install .NET 6 on Linux (Custom script, quick and dirty)   Fetches version 6.0.24
- install_dotnet80.sh = Install .NET 8 on Linux (Custom script, quick and dirty)   Fetches version 8.0.0
- dotv.sh = Script to change between versions, sets all environmental variables automagically.

The Linux install scripts for .NET (5,6,8) allow you to install and setup path +  Export variables to be able to run binaries compiled under one or the other.
Each runtime version is installed in it's separate folder allowing you to switch between version just by editing the config files.

The install scripts are not always current, i only update these script ocasionally so if you want the latest version, make sure to modify the script get the most current URL.


# Config files
Change these if you manually want to switch versions, Change **DOTNET_ROOT** and **PATH** in these files respectively:

### Root Environment variables (must always be updated)
/etc/skel/.bashrc

### Ubuntu flavour (optional)
/etc/bash.bashrc

### Fedora/Redhat flavour (optional)
/etc/bashrc 
