#!/usr/bin/env luajit
-- awesome_mode: api-level=4:screen=on
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type
pcall(require, "luarocks.loader")

local gears         = require "gears"
local awful         = require "awful"
                      require "awful.autofocus"
local wibox         = require "wibox"
local beautiful     = require "beautiful"
local naughty       = require "naughty"
local ruled         = require "ruled"
local menubar       = require "menubar"
local hotkeys_popup = require "awful.hotkeys_popup"
require "variables"
require "keys"

naughty.connect_signal("request::display_error", function(message, startup) naughty.notification
  {
    urgency = "critical",
    title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
    message = message
  }
end)

beautiful.init(themedir.."theme.lua")

hotkeys = function() hotkeys_popup.show_help(nil, awful.screen.focused()) end

myawesomemenu =
{
  { "hotkeys",     function() hotkeys()         end },
  { "manual",      terminal .. " -e man awesome"    },
  { "edit config", reconfigure                      },
  { "restart",     function() awesome.restart() end },
  { "quit",        function() awesome.quit()    end },
}

mymainmenu = awful.menu({ items = { 
  { "awesome"    , myawesomemenu  },
  { "screenshot" , screenshot     },
  { "terminal"   , terminal       },
  { "launcher"   , runner         },
  { "browser"    , browser        },
  { "discord"    , "discord"      },
  { "power menu" , powermenu      },
}})

require "layouts"
require "widgets"

ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  ruled.client.append_rule {
    id         = "global",
    rule       = { },
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
    rule_any =
    {
      instance = { "copyq", "pinentry" },
      class    = 
      {
        "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
        "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = { "Event Tester", }, -- xev
      role =
      {
        "AlarmWindow",    -- Thunderbird's calendar.
        "ConfigManager",  -- Thunderbird's about:config.
        "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { floating = true }
  }

  -- Add titlebars to normal clients and dialogs
  ruled.client.append_rule {
    id         = "titlebars",
    rule_any   = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = false },
  }

  -- Set Firefox to always map on the tag named "2" on screen 1.
  -- ruled.client.append_rule {
  --     rule       = { class = "Firefox"     },
  --     properties = { screen = 1, tag = "2" }
  -- }
end)
-- }}}


ruled.notification.connect_signal('request::rules', function()
  -- All notifications will match this rule.
  ruled.notification.append_rule {
    rule = {},
    properties = 
    {
      screen = awful.screen.preferred,
      implicit_timeout = 5,
    }
  }
end)

naughty.connect_signal("request::display", function(n)
  naughty.layout.box { notification = n }
end)

client.connect_signal("mouse::enter", function(c)
  c:activate { context = "mouse_enter", raise = false }
end)

awful.spawn.once("wmname awesome")
awful.spawn.once("picom -b --config "..confdir.."picom/awesome.conf")
awful.spawn.once("numlockx")
awful.spawn.single_instance("unclutter --timeout 5 --jitter 50")
awful.spawn.single_instance("lxsession")
