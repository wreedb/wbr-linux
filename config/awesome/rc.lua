---@diagnostic disable: undefined-global, lowercase-global
-- awesome_my.mode: api-level=4:screen=on

pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local ruled = require("ruled")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
require("awful.remote")
local lgi = require("lgi")
require("functions")
local vicious = require("vicious")


naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    urgency = "critical",
    title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
    message = message
  }
end)

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")

-- This is used later as the default term and editor to run.

homedir = os.getenv("HOME")
confdir = homedir .. "/.config/awesome/"

my = {
  mod      = "Mod4",
  term     = "kitty",
  editor   = "nvim",
  browser  = "firefox",
  tuifm    = "kitty -e fish -c 'nnn'",
  guifm    = "thunar",
  dmenu    = "def-dmenu",
  pmenu    = "powermenu",
  pdfind   = "pdfind",
  lock     = "lock",
  shot     = "takeshot --now",
  ssdmenu  = "def-ssdmenu",
}


mymainmenu = awful.menu({
  theme = {
    height = 20,
    width = 150,
  },

  items = {
    { "Awesome",
      {
        { "hotkeys", function() hotkeys_popup.show_help() end },
        { "screenshot", my.shot },
        { "manual",  my.term .. " -e fish -c 'man awesome'" },
        { "restart", awesome.restart },
        { "quit", function() awesome.quit() end },
      },
    },
    { "File Manager",
      {
        { "Thunar", my.guifm },
        { "NNN", my.tuifm },
      }
    },

    { "Terminal", my.term },
    { "Browser", my.browser },
    { "Discord", function() fun.launch("discord") end },
    { "PDF Menu", my.pdfind },
    { "Power Menu", my.pmenu },
    { "Lock", my.lock },

  }
})


mylauncher = awful.widget.launcher({ menu = mymainmenu })

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max.fullscreen,
  })
end)

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
  awful.wallpaper {
    screen = s,
    widget = {

      {
        image     = beautiful.wallpaper,
        upscale   = true,
        downscale = true,
        widget    = wibox.widget.imagebox,
      },

      valign = "center",
      halign = "center",
      tiled  = false,
      widget = wibox.container.tile,

    }
  }
end)

-- {{{ Wibar

-- Create a textclock widget
newclock = wibox.widget.textclock()
  newclock.format = "  %I:%M %p  "
  newclock.refresh = 30
--
screen.connect_signal("request::desktop_decoration", function(s)
  -- Each screen has its own tag table.
  -- awful.tag({ " 𝟭 "," 𝟮 "," 𝟯 "," 𝟰 "," 𝟱 "," 𝟲 "," 𝟳 "," 𝟴 "," 𝟵 " }, s, awful.layout.layouts[1])
  awful.tag({ " 1 "," 2 "," 3 "," 4 "," 5 "," 6 "," 7 "," 8 "," 9 " }, s, awful.layout.layouts[1])
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox {
    screen  = s,
    buttons = {
      awful.button({ }, 1, function () awful.layout.inc( 1) end),
      awful.button({ }, 3, function () awful.layout.inc(-1) end),
      awful.button({ }, 4, function () awful.layout.inc(-1) end),
      awful.button({ }, 5, function () awful.layout.inc( 1) end),
    }
  }

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = {

      awful.button({ }, 1, function(t) t:view_only() end),
      awful.button({ my.mod }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({ }, 3, awful.tag.viewtoggle),
      awful.button({ my.mod }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
      awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
      awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),

    }
  }



  -- Create the wibox
  s.mywibox = awful.wibar {
    position = "top",
    screen   = s,
    widget   = {
      layout = wibox.layout.align.horizontal,

      -- Left widgets
      { layout = wibox.layout.fixed.horizontal,
        s.mytaglist,

      },

      -- Middle widget
      separator,

      -- Right widgets
      { layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        newclock,
        -- mytextclock,
        -- s.mylayoutbox,
        -- mykeyboardlayout,
      },

      bgimage = img

    }
  }

end)


require("keys")

-- {{{ Rules
-- Rules to apply to new clients.
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
    rule_any = {
      instance = { "copyq", "pinentry" },
      class    = { "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv", "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer" },
      name     = { "Event Tester" },
      role     = { "AlarmWindow", "ConfigManager", "pop-up" }
    },
    properties = { floating = true }
  }
  -- Add titlebars to normal clients and dialogs
  ruled.client.append_rule {
    id         = "titlebars",
    rule_any   = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = false }
  }

end)


-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
  -- All notifications will match this rule.
  ruled.notification.append_rule {
    rule      = { },
    roperties = { screen = awful.screen.preferred, implicit_timeout = 5 }
  }
end)

naughty.connect_signal("request::display", function(n)
  naughty.layout.box { notification = n }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:activate { context = "mouse_enter", raise = false }
end)





--{{{ STARTUP PROGRAMS

awful.spawn.with_shell(confdir .. "assets/startup")

--}}}
