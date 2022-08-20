#!/usr/bin/env luajit

function env(var)
  return os.getenv(var)
end

function x(name)
  os.execute(name)
end
function slash(inp)
  return inp.."/"
end

wm         = env("DESKTOP_SESSION")
xdgch      = env("XDG_CONFIG_HOME")
comp       = env("COMPOSITOR")
wmname     = "wmname "..wm
compositor = "pkill "..comp.."; "..comp.." --daemon --config "..slash(xdgch)..slash(comp)..wm..".conf;"
unclutter  = "unclutter --jitter 50 --timeout 5 --fork;"
numlock    = "numlockx;"
lxsession  = "pkill lxsession; lxsession &"
killdunst  = "pkill dunst;"

autostarts = {
  wmname,
  compositor,
  unclutter,
  numlock,
  lxsession,
  killdunst,
}

for nCount = 1, #autostarts do
  x(autostarts[nCount])
end
