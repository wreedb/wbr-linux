#!/usr/bin/luajit

local awful = require("awful")
local layout = awful.layout.suit

awful.layout.layouts =
{
  layout.tile,
  layout.max.fullscreen,
  layout.magnifier,
  layout.floating,
}

--[[

AVAILABLE LAYOUTS:
  tile,tile.left,tile.bottom,tile.top
  fair,fair.horizontal
  spiral,spiral.dwindle
  max,max.fullscreen
  magnifier,corner.nw,floating

--]]
