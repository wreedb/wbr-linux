#!/usr/bin/luajit


env =
{ 
  wmname     = os.getenv("DESKTOP_SESSION"),
  confighome = os.getenv("XDG_CONFIG_HOME"),
  browser    = os.getenv("BROWSER"),
  terminal   = os.getenv("TERMINAL"),
  launcher   = os.getenv("LAUNCHER"),
  wallpapers = os.getenv("WALLPAPERS_DIR"),
  screen     = os.getenv("DISPLAY"),
}

print(env.wmname)
print(env.terminal)
print(env.browser)
print(env.launcher)
print(env.wallpapers)
print(env.confighome)
print(env.screen)




unclutteropts = " --jitter 50 --timeout 4 --fork"

--os.execute("numlockx")
--os.execute("unclutter" .. unclutteropts)
--os.execute("")
