---@diagnostic disable: undefined-global
pcall(require, "luarocks.loader")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
require("functions")


-- {{{ MOUSE BINDINGS

awful.mouse.append_global_mousebindings({
  awful.button({ }, 3, function () mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewprev),
  awful.button({ }, 5, awful.tag.viewnext),
})


-- {{{ KEY BINDINGS

awful.keyboard.append_global_keybindings({

  --[[  GENERAL KEYBINDS  ]]

  -- MOD S  { show help }
  awful.key({ my.mod }, "s",
    hotkeys_popup.show_help,
  {description = "show help", group = "awesome"}),
  -- MOD SHIFT R  { reload rc.lua }
  awful.key({ my.mod, "Shift" }, "r",
    awesome.restart,
  {description = "reload awesome", group = "awesome"}),
  -- MOD SHIFT Q  { quit awesome }
  awful.key({ my.mod, "Shift" }, "q",
    awesome.quit,
  {description = "quit awesome", group = "awesome"}),
  -- MOD SHIFT L  { lock }
  awful.key({ my.mod, "Shift" }, "l", function()
    fun.launch(my.lock) end,
  {description = "lock", group = "awesome"}),
  awful.key({ my.mod, "Control" }, "t", function()
    fun.launch("switch") end,
  {description = "switch theme", group = "awesome"}),
  -- MOD P  { run launcher (dmenu/rofi) }
  awful.key({ my.mod }, "p", function()
    fun.launch(my.dmenu) end,
  {description = "run launcher", group = "launcher"}),
  -- MOD SHIFT P  { pdf menu }
  awful.key({ my.mod, "Shift" }, "p", function()
    fun.launch(my.pdfind) end,
  {description = "pdf dmenu script", group = "launcher"}),
  -- MOD X  { power menu (logout/reboot/shutdown/lock) }
  awful.key({ my.mod }, "x", function()
    fun.launch(my.pmenu) end,
  {description = "logout menu", group = "launcher"}),
  -- MOD ENTER  { launch terminal (kitty/alacritty/st) }
  awful.key({ my.mod }, "Return", function()
    fun.launch(my.term) end,
  {description = "open my terminal", group = "launcher"}),
  -- MOD B  { launch browser }
  awful.key({ my.mod }, "b", function()
    fun.launch(my.browser) end,
  {description = "open my browser", group = "launcher"}),
  -- MOD PRINT  { screenshot menu }
  awful.key({ my.mod }, "Print", function()
    fun.launch(my.ssdmenu) end,
  {description = "screenshot menu", group = "launcher"}),
  -- PRINT  { screenshot }
  awful.key( {} ,"Print", function()
    fun.launch(my.shot) end,
  {description = "take a screenshot", group = "launcher"}),

  --[[  TAG RELATED KEYBINDS  ]]

  -- MOD LEFT  { goto: tag to the left }
  awful.key({ my.mod }, "Left",
    awful.tag.viewprev,
  {description = "goto: tag to the left", group = "tag"}),
  -- MOD RIGHT  { goto: tag to the right }
  awful.key({ my.mod }, "Right",
    awful.tag.viewnext,
  {description = "goto: tag to the right", group = "tag"}),
  -- MOD ESCAPE  { goto: last tag }
  awful.key({ my.mod }, "Escape",
    awful.tag.history.restore,
  {description = "goto: last recent tag", group = "tag"}),


  --[[  LAYOUT KEYBINDS  ]]

  -- MOD SHIFT J  { swap client: next }
  awful.key({ my.mod, "Shift" }, "j",
    function () awful.client.swap.byidx(  1) end,
  {description = "swap client: next", group = "client"}),
  -- MOD SHIFT K  { swap client: prev }
  awful.key({ my.mod, "Shift"   }, "k",
    function () awful.client.swap.byidx( -1) end,
  {description = "swap client: prev", group = "client"}),
  -- MOD L  { increase master width }
  awful.key({ my.mod }, "l",
    function () awful.tag.incmwfact( 0.05) end,
  {description = "increase master width", group = "layout"}),
  -- MOD L  { decrease master width }
  awful.key({ my.mod }, "h",
    function () awful.tag.incmwfact(-0.05) end,
  {description = "decrease master width", group = "layout"}),
  -- MOD SPACE  { next layout }
  awful.key({ my.mod, }, "space",
    function () awful.layout.inc( 1) end,
  {description = "next layout", group = "layout"}),


  --[[  FOCUS KEYBINDS  ]]

  -- MOD J  { swap focus: next }
  awful.key({ my.mod }, "j", function()
    awful.client.focus.byidx( 1) end,
  {description = "swap focus: next", group = "client"}),
  -- MOD K  { swap focus: prev }
  awful.key({ my.mod }, "k", function()
    awful.client.focus.byidx(-1) end,
  {description = "swap focus: prev", group = "client"}),
  -- MOD TAB  { swap focus: last }
  awful.key({ my.mod }, "Tab", function()
    awful.client.focus.history.previous()
    if client.focus then client.focus:raise() end end,
  {description = "swap focus: last", group = "client"}),


  awful.key {
    modifiers   = { my.mod },
    keygroup    = "numrow",
    description = "only view tag",
    group       = "tag",
    on_press    = function (index)
      local screen = awful.screen.focused()
      local tag    = screen.tags[index]
        if tag then tag:view_only() end
    end,
  },

  awful.key {
    modifiers   = { my.mod, "Control" },
    keygroup    = "numrow",
    description = "toggle tag",
    group       = "tag",
    on_press    = function (index)
      local screen = awful.screen.focused()
      local tag    = screen.tags[index]
        if tag then awful.tag.viewtoggle(tag) end
    end,
  },

  awful.key {
    modifiers   = { my.mod, "Shift" },
    keygroup    = "numrow",
    description = "move focused client to tag",
    group       = "tag",
    on_press    = function (index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },

  awful.key {
    modifiers   = { my.mod, "Control", "Shift" },
    keygroup    = "numrow",
    description = "toggle focused client on tag",
    group       = "tag",
    on_press    = function (index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
  },

  awful.key {
    modifiers   = { my.mod },
    keygroup    = "numpad",
    description = "select layout directly",
    group       = "layout",
    on_press    = function (index)
      local t = awful.screen.focused().selected_tag
      if t then
        t.layout = t.layouts[index] or t.layout
      end
    end,
  }

})

client.connect_signal("request::default_mousebindings", function()
  awful.mouse.append_client_mousebindings({
    --
    awful.button({ }, 1, function(c)
      c:activate { context = "mouse_click" } end),
    --
    awful.button({ my.mod }, 1, function(c)
      c:activate { context = "mouse_click", action = "mouse_move" } end),
    -- 
    awful.button({ my.mod },    3, function(c)
      c:activate { context = "mouse_click", action = "mouse_resize"} end),
    })

end)

client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings({
    -- MOD F  { toggle fullscreen }
    awful.key({ my.mod }, "f", function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end, {description = "toggle fullscreen", group = "client"}),
    -- MOD SHIFT C  { close window }
    awful.key({ my.mod, "Shift" }, "c", function(c)
      c:kill()
    end, {description = "close window", group = "client"}),
    -- MOD CTRL ENTER  { move to master }
    awful.key({ my.mod, "Control" }, "Return", function(c)
      c:swap(awful.client.getmaster())
    end, {description = "move to master", group = "client"}),
    -- MOD M  { maximize/unmaximize }
    awful.key({ my.mod }, "m", function (c)
      c.maximized = not c.maximized
      c:raise()
    end, {description = "(un)maximize", group = "client"}),
    -- MOD CTRL SPACE  { toggle float }
    awful.key({ my.mod, "Control" }, "space",
      awful.client.floating.toggle,
    {description = "toggle floating", group = "client"}),

  })
end)
