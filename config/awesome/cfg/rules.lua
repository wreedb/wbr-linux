-- vim:filetype=lua:expandtab:shiftwidth=2:tabstop=4:softtabstop=2:textwidth=100
-- Will Reed | wreedb@yandex.com | https://github.com/wreedb/wbr-linux
----------------------------------------------------------------------
-- AwesomeWM Configuration | RULES |

local ruled = require "ruled"
local awful = require "awful"

ruled.client.connect_signal("request::rules", function()

  ruled.client.append_rule {
    id         = "global",
    rule       = {},
    properties = {
      focus     = awful.client.focus.filter,
      raise     = true,
      screen    = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  }

  -- Floating clients.
  ruled.client.append_rule {
    id       = "floating",
    rule_any = {
      instance = { "copyq", "pinentry" },
      class    = { "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv", "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer" },
      name     = { "Event Tester", },
      role     = { "AlarmWindow", "ConfigManager", "pop-up" }
    },
    properties = { floating = true }
  }

  -- Add titlebars to normal clients and dialogs
  ruled.client.append_rule {
    id         = "titlebars",
    rule_any   = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = false     }
  }

  ruled.client.append_rule {
    rule_any = { class = { "Pavucontrol", "feh" } },
    properties = {
      floating  = true,
      placement = awful.placement.centered,
      width     = 640,
      height    = 480,
    },
  }

  ruled.client.append_rule {
    rule_any = { class = { "Xfce4-terminal" } },
    properties = {
      floating  = true,
      placement = awful.placement.centered,
      width     = 495,
      height    = 285,
    },
  }

  ruled.client.append_rule {
    rule = { class = "Powernim" },
    properties = {
      floating = true,
      --placement = awful.placement.centered,
    },
  }

end)