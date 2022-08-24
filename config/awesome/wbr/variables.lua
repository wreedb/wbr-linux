-- vim:filetype=lua:expandtab:shiftwidth=2:tabstop=4:softtabstop=2:textwidth=100
-- Will Reed | wreedb@yandex.com | https://github.com/wreedb/wbr-linux
----------------------------------------------------------------------
-- AwesomeWM Configuration | VARIABLES |

local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local os, ipairs, string, table, tostring, tonumber, type = os, ipairs, string, table, tostring, tonumber, type

local awful = require "awful"
local gears = require "gears"
local pretty = require "beautiful"
local naughty = require "naughty"

modkey = "Mod4"
altkey = "Mod1"
shiftkey = "Shift"
ctrlkey = "Control"

username = os.getenv("USER")

xdg_configdir = gears.filesystem.get_xdg_config_home()
xdg_cachedir  = gears.filesystem.get_xdg_cache_home()
awm_configdir = gears.filesystem.get_configuration_dir()
theme_dir     = awm_configdir .. "theme/"

wallpaper_dir = os.getenv("WALLPAPERS_DIR") .. "/"

terminal = os.getenv("TERMINAL") or "kitty"      or "alacritty" or "xterm"
editor   = os.getenv("EDITOR")   or "nvim"       or "vim"       or "nano"
browser  = os.getenv("BROWSER")  or "firefox"    or "brave"     or "chrome"
launcher = os.getenv("LAUNCHER") or "bemenu-run" or "dmenu_run" or "rofi -show run"

terminal_cmd = terminal .. " -e "
editor_cmd   = terminal_cmd .. editor .. " -p "
audio_cmd    = "ffplay -nodisp -autoexit "
audio_dir    = awm_configdir .. "audio/"

function ui_font(pt_size)
  strnum = tostring(pt_size);
  return "Play Nerd Font " .. strnum;
end

verbose_clock = "<b>%B %d, %Y  </b>at  <b>%I:%M %p</b>"
normal_clock = "%I:%M %p"

function toggle_promptbox(yes_no)
  if yes_no == true then
    awful.screen.focused().promptbox_container.visible = true
    awful.screen.focused().tasklist_container.visible = false
  elseif yes_no == false then
    awful.screen.focused().promptbox_container.visible = false
    awful.screen.focused().tasklist_container.visible = true
  end
end

function nogapfullscreen()
  if awful.layout.getname() == "fullscreen" then
    pretty.useless_gap  = 0
    pretty.border_width = 0
  else
    pretty.useless_gap = 5
    pretty.border_width = 2
  end
end

pacman_cmd = "checkupdates | wc -l > " .. xdg_cachedir .. "awesome/updates_widget"
pacman_callback = "cat " .. xdg_cachedir .. "awesome/updates_widget"
pacman_notif_cmd = "checkupdates > " .. xdg_cachedir .. "awesome/updates_widget_notif"
pacman_notif_callback = "cat " .. xdg_cachedir .. "awesome/updates_widget_notif"
pacman_text = "0"
pacman_notif_text = "no available updates"

function checkupdates()
  updates:set_markup_silently("Loading...")
  awful.spawn.easy_async_with_shell(pacman_cmd, function()
    awful.spawn.easy_async_with_shell(pacman_callback, function(out)
      updates:set_markup_silently("Updates: " .. out)
    end)
  end)
end

function checkupdates_notif()
  awful.spawn.easy_async_with_shell(pacman_notif_cmd, function()
    awful.spawn.easy_async_with_shell(pacman_notif_calback, function(out)
--      naughty.notification { title = "Updates", message = out }
      awful.spawn("notify-send '" .. out .. "'")
    end)
  end)
end