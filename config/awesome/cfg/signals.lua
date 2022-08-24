-- vim:filetype=lua:expandtab:shiftwidth=2:tabstop=4:softtabstop=2:textwidth=100
-- Will Reed | wreedb@yandex.com | https://github.com/wreedb/wbr-linux
----------------------------------------------------------------------
-- AwesomeWM Configuration | SIGNALS |

local awful = require "awful"
local gears = require "gears"

require "awful.autofocus"
require "wbr.variables"

-- focus follows mouse
client.connect_signal("mouse::enter", function(c)
  c:activate { context = "mouse_enter", raise = false }
end)

-- rounded borders
-- client.connect_signal("request::manage", function(c)
--   c.shape = gears.shape.square
-- end)

-- tick sound when swapping windows
client.connect_signal("swapped", function(c)
  awful.spawn.easy_async(audio_cmd .. audio_dir .. "tick.ogx");
end)