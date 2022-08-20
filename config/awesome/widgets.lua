#!/usr/bin/luajit

local awful     = require "awful"
local wibox     = require "wibox"
local gears     = require "gears"
local beautiful = require "beautiful"

require "theme/colors"

screen.connect_signal("request::wallpaper", function(s) awful.wallpaper
  {
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



spacer = wibox.widget {
  color = background,
  widget = wibox.widget.separator
}


clock = wibox.widget {
  format = "%I:%M %p",
  widget = wibox.widget.textclock,
}

tray = wibox.widget {
  base_size = 27,
  widget = wibox.widget.systray,
}

splitter = wibox.widget {
  color = darkgrey,
  forced_width = 20,
  widget = wibox.widget.separator,
}

sep = wibox.widget {
  color = background, 
  forced_width = 10,
  widget = wibox.widget.separator,
}

screen.connect_signal("request::desktop_decoration", function(s)
  -- Each screen has its own tag table.
  awful.tag({ " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " }, s, awful.layout.layouts[1])

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.layouts = awful.widget.layoutbox
  {
    screen = s,
    buttons = { awful.button({ }, 1, function() awful.layout.inc( 1) end) },
  }
--[[
  s.tasks = wibox.widget {
    filter = awful.widget.tasklist.filter.focused,
    layout = wibox.layout.grid.horizontal,
    widget = wibox.widget.tasklist,

  }]]

  s.taglist = awful.widget.taglist
  {
    screen  = s,
    buttons = { awful.button({ }, 1, function(t) t:view_only() end), },
    filter  = awful.widget.taglist.filter.all,
    spacing_widget = splitter,
  }
  -- Create a taglist widget
  s.tags = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({ }, 1, function(t) t:view_only() end),
      awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
      awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
    }
  }

  s.mytasklist = awful.widget.tasklist {
      screen   = s,
      filter   = awful.widget.tasklist.filter.focused,
      spacing_widget = splitter,
      buttons  = tasklist_buttons,
      style    = { font = "Play 13" },
      widget_template = {
        {
          wibox.widget.base.make_widget(),
          forced_height = 5,
          id            = "background_role",
          widget        = wibox.container.background,
        },
        {
          id = "text_role",
          margins = 5,
          widget  = wibox.widget.textbox,
        },
        nil,
        layout = wibox.layout.align.horizontal,
      },
  }

  -- Create the wibox
  s.bar = awful.wibar {
    position = "top",
    screen   = s,
    widget   = {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        s.taglist,
        sep, s.mytasklist, -- Middle widget
      },
      -- middle
      spacer,
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        tray,
        sep,
        clock,
        sep,
        s.layouts,
        sep,
      },
    }
  }
end)

-- }}}
