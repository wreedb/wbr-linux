-- vim:filetype=lua:expandtab:shiftwidth=2:tabstop=4:softtabstop=2:textwidth=100
-- Will Reed | wreedb@yandex.com | https://github.com/wreedb/wbr-linux
----------------------------------------------------------------------
-- AwesomeWM Configuration | LAYOUTS |

local awful = require "awful"

tag.connect_signal("request::default_layouts",
  function()
    awful.layout.append_default_layouts({
      awful.layout.suit.tile,
      awful.layout.suit.floating,
      awful.layout.suit.max.fullscreen,
      awful.layout.suit.magnifier,
      -- tile[left/bottom/top]
      -- fair(.horizontal)
      -- spiral(.dwindle)
      -- max,corner.nw,
    })
end)