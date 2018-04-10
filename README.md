# useful_scripts
Some scripts I use to make my life easier.

## 1. play_with_proxy.sh
Script to toggle / change proxy settings in macOS from the command line.


#### Features
- Enable / Disable proxy.
- Change proxy settings by entering manually.
- Set proxy directly using presets.

#### How to use for macOS
1. Add/Edit presets in the `proxy.presets` file.
2. Move the `proxy.presets` file to `$HOME` folder.
3. Change the `play_with_proxy.sh` file extension to `.command` (For macOS)
4. Enable execution by running this command. `chmod a+x play_with_proxy.command`
5. Double click on `.command` file to execute.

#### How to use for Linux
1. Add/Edit presets in the `proxy.presets` file.
2. Move the `proxy.presets` file to `$HOME` folder.
3. Change the `networksetup` commands.

  For many linux distros you change the commands to 

  `export http_proxy="http://user:password@proxy_server:port"`
  
  `export https_proxy="https://user:password@proxy_server:port"`
 
  To enable / disable proxy, these environemt variables can be set / unset respectively.
  
4. Enable execution by running this command.`chmod a+x play_with_proxy.sh`
5. Execute the `play_with_proxy.sh` file.

### Format of `proxy.presets` file

Each *line* should be of the following type.

```<Preset_name>="<server> <port> <username> <password> "```

Note: Leave the username, password fields empty if not required.

Go through the script to know how to customize it for your needs.

Checked on macos High Sierra.

Any imrovements are welcome.

Note: Works on all systems with bash. Change the `networksetup` commands accordingly for your OS.

## If you liked this, please 'Star' the repo.
More scripts on the way.

<img src="https://media.giphy.com/media/3otPora2GgtfqRX7Xy/giphy.gif" width="400" height="300" />
