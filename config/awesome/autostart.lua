-- vim:filetype=lua:expandtab:shiftwidth=2:tabstop=4:softtabstop=2:textwidth=100
-- Will Reed | wreedb@yandex.com | https://github.com/wreedb/wbr-linux
----------------------------------------------------------------------
-- AwesomeWM Configuration | AUTOSTART |

local awful = require "awful"
require "wbr.variables"
require "cfg.widgets"

awful.spawn.single_instance("wmname awesome")
awful.spawn.single_instance("numlockx")
awful.spawn.single_instance("unclutter --timeout 5 --jitter 50")
awful.spawn.single_instance("lxsession")
awful.spawn.single_instance("picom --daemon --config " .. xdg_configdir .. "picom/awesome.conf")

awful.spawn.easy_async_with_shell(pacman_cmd, function()
  awful.spawn.easy_async_with_shell(pacman_callback, function(out) 
    updates.markup = "Updates: " .. out
  end)
end)