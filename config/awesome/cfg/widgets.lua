-- vim:filetype=lua:expandtab:shiftwidth=2:tabstop=4:softtabstop=2:textwidth=100
-- Will Reed | wreedb@yandex.com | https://github.com/wreedb/wbr-linux
----------------------------------------------------------------------
-- AwesomeWM Configuration | WIDGETS |

local awful     = require "awful"
local pretty    = require "beautiful"
local gears     = require "gears"
local menubar   = require "menubar"
local wibox     = require "wibox"
local naughty   = require "naughty"
local key_popup = require "awful.hotkeys_popup"
local colors    = require "wbr.pallette"

require "wbr.variables"

menubar.utils.terminal = terminal -- Set the terminal for applications that require it
menubar.geometry = { width = 1536, height = 35, x = 192 }

myawesomemenu = {
  { "hotkeys",     function() key_popup.show_help(nil, awful.screen.focused()) end },
  { "manual",      terminal .. " -e man awesome"                                       },
  { "edit config", editor_cmd .. awesome.conffile                                      },
  { "restart",     awesome.restart                                                     },
  { "quit",        function() awesome.quit() end                                       },
}

mymainmenu = awful.menu({
  items = {
    { "awesome", myawesomemenu, pretty.awesome_icon },
    { "open terminal", terminal },
    { "open browser",  browser  },
  }
})

mylauncher = awful.widget.launcher({
  image  = pretty.awesome_icon,
  menu   = mymainmenu,
})

screen.connect_signal("request::wallpaper", function(s)
  awful.wallpaper {
    screen = s,
    widget = {
      {
        image     = wallpaper_dir .. "tokyo-night10.png",
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



updates = wibox.widget { markup = "Loading...",widget = wibox.widget.textbox }

updates_container = wibox.widget {
  wibox.widget { updates, margins = { left = 10, right = 10, top = 5, bottom = 5}, widget = wibox.container.margin, },
  bg = colors.bgaccent,
  shape = gears.shape.rounded_rect,
  widget = wibox.container.background,
  buttons = { awful.button({}, 1, function() checkupdates() end), awful.button({}, 3, function() awful.spawn.with_shell('dunstify "$(checkupdates)"') end) },
}

clock = wibox.widget {
  format = normal_clock,
  widget = wibox.widget.textclock,
}

clock_container = wibox.widget {
  wibox.widget { clock, margins = { left = 10, right = 10, top = 5, bottom = 5}, widget = wibox.container.margin, },
  bg = colors.bgaccent,
  shape = gears.shape.rounded_rect,
  buttons = {awful.button({}, 1, function()
    if clock.format == normal_clock then
     clock.format = verbose_clock
     clock:force_update()
    else
      clock.format = normal_clock
      clock:force_update()
    end
  end)},
  widget = wibox.container.background,
}

tray = wibox.widget { widget = wibox.widget.systray, base_size = 27 }

tray_container = wibox.widget {
  wibox.widget { tray, margins = { left = 10, right = 10, top = 5, bottom = 5}, widget = wibox.container.margin, },
  bg = colors.bgaccent,
  shape = gears.shape.rounded_rect,
  widget = wibox.container.background,
}

splitter = wibox.widget {
  color = colors.bgaccent,
  opacity = 0,
  forced_width = 10,
  widget = wibox.widget.separator,
}

accent_separator = wibox.widget {
  color = colors.bgaccent,
  opacity = 0,
  forced_width = 20,
  widget = wibox.widget.separator,
}

spacer = wibox.widget { 
  wibox.widget { widget = wibox.widget.separator },
  margins = { left = 10, right = 10, top = 5, bottom = 5},
  visible = false,
  shape = gears.shape.rounded_rect,
  widget = wibox.container.margin,
}

screen.connect_signal("request::desktop_decoration", function(s)
  -- Each screen has its own tag table.
  awful.tag({ "  1  ", "  2  ", "  3  ", "  4  ", "  5  ", "  6  ", "  7  ", "  8  ", "  9  " }, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.promptbox = awful.widget.prompt {
    screen = s,
    shape = gears.shape.rounded_rect,
    bg = colors.bgaccent,
    fg = colors.fg,
    with_shell = true,
  }

  s.promptbox_container = wibox.widget {
    wibox.widget { s.promptbox, margins = { left = 20, right = 20}, widget = wibox.container.margin, },
    bg = colors.bgaccent,
    visible = false,
    margins = { left = 20, right = 20},
    shape = gears.shape.rounded_rect,
    widget = wibox.container.background,
  }

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  s.layouticon = awful.widget.layoutbox {
    screen  = s,
    buttons = { awful.button({ }, 1, function() awful.layout.inc(1); nogapfullscreen() end), }
  }

  s.layouticon_container = wibox.widget {
    wibox.widget { s.layouticon, margins = { left = 10, right = 10, top = 8, bottom = 8}, widget = wibox.container.margin, },
    bg = colors.bgaccent,
    shape = gears.shape.rounded_rect,
    widget = wibox.container.background,
  }


  -- Create a taglist widget
  s.taglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = { awful.button( {}, 1, function(t) t:view_only() end), }
  }
  
  s.taglist_container = wibox.widget {
    s.taglist,
    bg = colors.bgaccent,
    shape = gears.shape.rounded_rect,
    widget = wibox.container.background,
  }


  -- Create a tasklist widget
  s.tasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.focused,
    buttons = { awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end), },
    widget_template = {
      accent_separator, {
        id = "text_role",
        widget  = wibox.widget.textbox,
      }, accent_separator,
      layout = wibox.layout.align.horizontal,
    },
  }

  s.tasklist_container = wibox.widget {
    s.tasklist,
    bg = colors.bgaccent,
    shape = gears.shape.rounded_rect,
    widget = wibox.container.background,
  }


  --
  -- {{ MAIN WIDGET CONTAINERS

  s.left_widgets = wibox.widget {
    s.taglist_container,
    s.promptbox_container,
    s.tasklist_container,
    spacing = 15,
    spacing_widget = splitter,
    layout  = wibox.layout.fixed.horizontal,
  }

  s.right_widgets = wibox.widget {
    updates_container,
    tray_container,
    clock_container,
    s.layouticon_container,
    spacing = 10,
    spacing_widget = splitter,
    layout = wibox.layout.fixed.horizontal,
  }
  

  -- Create the wibox
  s.bar = awful.wibar {
    position = "top",
    height   = 35,
    screen   = s,
    align    = "left",
    margins = { top = 10, bottom = 0, left = 10, right = 10 },
    shape    = gears.shape.rounded_rect,
    widget = {
      -- left
      {
        s.left_widgets,
        layout = wibox.layout.fixed.horizontal,
      },

      -- middle
      spacer,

      --right
      {
        s.right_widgets,
        layout = wibox.layout.fixed.horizontal,
        widget = wibox.container.background,
      },


      layout = wibox.layout.align.horizontal,
      widget = wibox.container.background,
    }
      
  }

end)