#!/usr/bin/lua

local awful = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"

local bind  = awful.key
local spawn = awful.spawn


awful.keyboard.append_global_keybindings({
  --[[ GENERAL KEYS ]]
  bind({ mod }, "x",
    function() spawn(powermenu) end,
  {description = "Power menu", group = "Awesome"} ),

  bind({ mod }, "e",
    function() spawn(reconfigure) end,
  {description = "Edit configuration", group = "Awesome"} ),

  bind({ mod }, "p",
    function() spawn(runner) end,
  {description = "Run launcher", group = "Programs"} ),

  bind({ mod, "Shift" }, "b",
    function() spawn(browser) end,
  {description = "Open a browser", group = "Programs"} ),
  
  bind({ mod }, "Return",
    function() spawn(terminal) end,
  {description = "Open a terminal", group = "Programs"}),
  
  bind({ mod }, "s",
    hotkeys_popup.show_help,
  {description = "Show Help", group = "Awesome"}),
  
  bind({ mod, "Shift" }, "r",
    awesome.restart,
  {description = "Reload", group = "Awesome"}),
  
  bind({ mod, "Shift" }, "q",
    awesome.quit,
  {description = "Quit Awesome", group = "Awesome"}),
  
  --[[ FUNCTION KEYS ]]
  bind({ }, "XF86AudioRaiseVolume",
    function() spawn(volume_up) end,
  {description = "Increase volume", group = "FN Keys"}),

  bind({ }, "XF86AudioLowerVolume",
    function() spawn(volume_down) end,
  {description = "Decrease volume", group = "FN Keys"}),

  bind({ }, "XF86AudioMute",
    function() spawn(volume_mute) end,
  {description = "Mute volume", group = "FN Keys"}),
  
  bind({ }, "XF86MonBrightnessUp",
    function() spawn(bright_up) end,
  {description = "Increase brightness", group = "FN Keys"}),

  bind({ }, "XF86MonBrightnessDown",
    function() spawn(bright_down) end,
  {description = "Decrease brightness", group = "FN Keys"}),

  bind({ }, "Print",
    function() spawn(screenshot) end,
  {description = "Take a screenshot", group = "FN Keys"}),
  
  bind({ mod }, "Print",
    function() spawn(sel_screenshot) end,
  {description = "Take a selective screenshot", group = "FN Keys"}),
  
  --[[ WINDOW CONTROL ]]
  bind({ mod }, "j",
    function() awful.client.focus.byidx(1) end,
  {description = "Focus next client", group = "Client"}),

  bind({ mod }, "k",
    function() awful.client.focus.byidx(-1) end,
  {description = "focus previous by index", group = "Client"}),

  bind({ mod }, "Tab",
    function() awful.client.focus.byidx(1) end,
  {description = "Cycle through clients", group = "Client"}),
  
  bind({ mod, "Shift" }, "j",
    function() awful.client.swap.byidx(1) end,
  {description = "Swap with next client", group = "Client"}),

  bind({ mod, "Shift" }, "k",
    function() awful.client.swap.byidx(-1) end,
  {description = "Swap with previous client", group = "Client"}),
  
  bind({ mod }, "l",
    function() awful.tag.incmwfact(0.025) end,
  {description = "Increase master client width", group = "Layout"}),
  
  bind({ mod }, "h",
    function() awful.tag.incmwfact(-0.025) end,
  {description = "Decrease master client width", group = "Layout"}),
  
  bind({ mod, "Shift" }, "h",
    function() awful.tag.incnmaster(1, nil, true) end,
  {description = "Increase # of master clients", group = "Layout"}),
  
  bind({ mod, "Shift" }, "l",
    function() awful.tag.incnmaster(-1, nil, true) end,
  {description = "Decrease # of master clients", group = "Layout"}),
  
  bind({ mod, "Control" }, "h",
    function() awful.tag.incncol(1, nil, true) end,
  {description = "Increase # of columns", group = "Layout"}),
  
  bind({ mod, "Control" }, "l",
    function() awful.tag.incncol(-1, nil, true) end,
  {description = "Decrease # of columns", group = "Layout"}),
  
  bind({ mod }, "space",
    function() awful.layout.inc(1) end,
  {description = "Cycle layouts", group = "Layout"}),
  
  --[[ TAG RELATED KEYS ]]
  bind({ mod }, "Escape",
    awful.tag.history.restore,
  {description = "Switch to: last tag", group = "Tag"}),

  bind {
    modifiers   = { mod },
    keygroup    = "numrow",
    description = "Go to tag",
    group       = "Tag",
    on_press    = function (index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },

  bind {
    modifiers = { mod, "Shift" },
    keygroup    = "numrow",
    description = "Send to tag",
    group       = "Tag",
    on_press    = function (index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },

})


--[[ MOUSE BINDINGS ]]
awful.mouse.append_global_mousebindings({
  awful.button({ }, 3, function () mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewprev),
  awful.button({ }, 5, awful.tag.viewnext),
})


client.connect_signal("request::default_mousebindings", function()
  awful.mouse.append_client_mousebindings({
    awful.button({ }, 1, function (c)
      c:activate { context = "mouse_click" }
    end),
    awful.button({ mod }, 1, function (c)
      c:activate { context = "mouse_click", action = "mouse_move"  }
    end),
    awful.button({ mod }, 3, function (c)
      c:activate { context = "mouse_click", action = "mouse_resize"}
    end),
    })
end)

client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings({
    bind({ mod, "Shift" }, "f",
      function (c) c.fullscreen = not c.fullscreen c:raise() end,
    {description = "Toggle fullscreen", group = "Client"}),

    bind({ mod, "Shift" }, "c",
      function (c) c:kill() end,
    {description = "Close client", group = "Client"}),

    bind({ mod }, "f",
      awful.client.floating.toggle,
    {description = "Toggle floating", group = "Client"}),
    
    bind({ mod, "Control" }, "Return",
      function (c) c:swap(awful.client.getmaster()) end,
    {description = "Move to master", group = "Client"}),
  })
end)


