# useful_scripts
Some scripts I use to make my life easier.

# 1. play_with_proxy.sh
Script to toggle / change proxy settings in macOS from the command line.
Go through the script to know how to customize it for your needs.

1. Customize it for your needs.
2. Change the file extension to `.command`
3. Enable execution `chmod a+x play_with_proxy.command`
4. Double click on file to execute.

Features
- Interactive shell
- Preset options available

Checked on macos High Sierra.

Note: Works on all systems with bash. Change the `networksetup` commands accordingly.

Example: For many linux distros you change the commands to 

`export http_proxy="http://user:password@proxy_server:port"`

`export https_proxy="https://user:password@proxy_server:port"`


