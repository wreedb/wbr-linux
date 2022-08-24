-- awesome_mode: api-level=4:screen=on

-- vim:filetype=lua:expandtab:shiftwidth=2:tabstop=4:softtabstop=2:textwidth=100
-- Will Reed | wreedb@yandex.com | https://github.com/wreedb/wbr-linux
----------------------------------------------------------------------
-- AwesomeWM Configuration | MAIN |

pcall(require, "luarocks.loader")

local beautiful     = require "beautiful"
local naughty       = require "naughty"

require "wbr.variables"

naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    urgency = "critical",
    title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
    message = message
  }
end)

beautiful.init(awm_configdir .. "theme.lua")

require "cfg.keys"

require "cfg.layouts"

require "cfg.widgets"

require "cfg.rules"

require "cfg.titlebars"

require "cfg.notifications"

require "cfg.signals"

require "autostart"