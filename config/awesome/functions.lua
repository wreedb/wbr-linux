---@diagnostic disable: lowercase-global

local awful = require("awful")

fun = {

  launch = function (prog) awful.spawn(prog) end,


}