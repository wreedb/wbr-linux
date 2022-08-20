#!/usr/bin/lua

user     = os.getenv("USER")
homedir  = os.getenv("HOME")            or "/home/"..use.."/"
confdir  = os.getenv("XDG_CONFIG_HOME") or "/home/"..user.."/.config/"

terminal = "terminal" or "xterm" 
editor   = "editor"   or "vim"
browser  = "browser"  or "firefox"
runner   = "launcher" or "dmenu_run"

screenshot     = "screenshot-xorg"
sel_screenshot = "screenshot-select-xorg"

volume_up   = "volume-up"
volume_down = "volume-down"
volume_mute = "volume-mute"

bright_up   = "brightness-up"
bright_down = "brightness-down"

mod         = "Mod4"
reconfigure = "editwmconfig"
powermenu   = "powermenu"
awesomedir  = confdir .. "/awesome/"
themedir    = awesomedir .. "theme/"
