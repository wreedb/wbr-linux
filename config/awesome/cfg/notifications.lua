-- vim:filetype=lua:expandtab:shiftwidth=2:tabstop=4:softtabstop=2:textwidth=100
-- Will Reed | wreedb@yandex.com | https://github.com/wreedb/wbr-linux
----------------------------------------------------------------------
-- AwesomeWM Configuration | NOTIFICATIONS |

local ruled   = require "ruled"
local awful   = require "awful"
local naughty = require "naughty"
local gears   = require "gears"
local wibox   = require "wibox"
local pretty  = require "beautiful"
local colors  = require "wbr.pallette"

notif = wibox()

notif.visible = false
notif.screen  = awful.screen.focused()
notif.width   = 300
notif.height  = 150
notif.ontop   = true
notif.x       = 100
notif.y       = 100
notif.type    = "normal"
notif.shape   = gears.shape.rounded_rect
notif.border_width = 2
notif.border_color = colors.bg



ruled.notification.connect_signal('request::rules', function()
  -- All notifications will match this rule.
  ruled.notification.append_rule {
    rule       = {},
    properties = {
      screen = awful.screen.preferred,
      implicit_timeout = 4,
    }
  }
end)

naughty.connect_signal("request::display", function(n)
  naughty.layout.box { notification = n }
end)
