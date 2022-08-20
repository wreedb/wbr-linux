#!/usr/bin/luajit

confighome = os.getenv("XDG_CONFIG_HOME")
wmname     = os.getenv("DESKTOP_SESSION")
compositor = os.getenv("COMPOSITOR")

unclutteropts  = " --jitter 50 --timeout 4 --fork"
compositoropts = " --daemon --config "..confighome.."/"..compositor.."/"..wmname..".conf"

os.execute("wmname "..wmname)
os.execute("numlockx")
os.execute("unclutter"..unclutteropts)
os.execute(compositor..compositoropts)
os.execute("pkill lxpolkit; lxpolkit &>/dev/null &")
os.execute("pkill dunst; dunst &>/dev/null &")
