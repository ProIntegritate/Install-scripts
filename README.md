# Install-scripts
Installation scripts for Linux .NET runtime

- install_dotnet50.sh = Install .NET 5 on Linux (Custom script, quick and dirty)   Fetches version 5.0.404
- install_dotnet60.sh = Install .NET 6 on Linux (Custom script, quick and dirty)   Fetches version 6.0.24
- install_dotnet80.sh = Currently just a placeholder.

The Linux install scripts for .NET (5,6,8) allow you to install and setup path +  Export variables to be able to run binaries compiled under one or the other.
Each runtime version is installed in it's separate folder allowing you to switch between version just by editing the config files.

#Config files
Change these if you want to switch versions, Change DOTNET_ROOT and PATH in these files respectively:

##Ubuntu flavour
  /etc/bash.bashrc

##Fedora/Redhat flavour
  /etc/bashrc 

##Finally, set Root Environment variables
  /etc/skel/.bashrc

