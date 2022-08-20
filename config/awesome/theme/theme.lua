local fs = require("gears.filesystem")
local colors = require("colors")
local theme_path = fs.get_configuration_dir() .. "theme/"
local rnotification = require("ruled.notification")
local dpi = require("beautiful.xresources").apply_dpi

local theme = {}

theme.wallpaper         = theme_path .. "background.png"
theme.awesome_icon      = theme_path .. "awesome-icon.png"
theme.menu_submenu_icon = theme_path .. "submenu.png"

theme.useless_gap   = dpi(6)
theme.border_width  = dpi(2)

theme.font = "Play 12"

theme.fg_normal  = foreground
theme.fg_focus   = foreground
theme.fg_urgent  = red
theme.bg_normal  = background
theme.bg_focus   = darkgrey
theme.bg_urgent  = background
theme.border_color_normal = darkgrey
theme.border_color_active = lightgrey

theme.bg_systray = background
theme.systray_max_rows = 1
theme.systray_icon_spacing = 1

theme.fg_widget           = foreground
theme.fg_center_widget    = foreground
theme.fg_end_widget       = foreground
theme.bg_widget           = background

theme.taglist_font        = "Play Nerd Font 14"
theme.taglist_fg_focus    = background
theme.taglist_bg_focus    = lightgrey
theme.taglist_fg_empty    = lightgrey
theme.taglist_bg_empty    = background
theme.taglist_fg_occupied = foreground
theme.taglist_bg_occupied = background
theme.taglist_spacing     = 0

theme.tasklist_disable_icon = true
theme.tasklist_disable_task_name = false
theme.tasklist_plain_task_name = true
theme.tasklist_bg_focus = background

theme.menu_height       = dpi(25)
theme.menu_width        = dpi(150)
theme.menu_border_color = zero
theme.menu_border_width = 2
theme.menu_font         = "Play 12"

theme.layout_tile       = theme_path .. "layouts/tile-small.png"
theme.layout_fullscreen = theme_path .. "layouts/fullscreen-small.png"
theme.layout_magnifier  = theme_path .. "layouts/magnifier-small.png"
theme.layout_floating   = theme_path .. "layouts/floating-small.png" --[[ tileleft,tilebottom,tiletop,fairv,fairh,spiral,dwindle,max,cornernw,cornerne,cornersw,cornerse ]]

theme.hotkeys_font = "Exo2 Bold 16"
theme.hotkeys_border_color = lightgrey
theme.hotkeys_border_width = 3
theme.hotkeys_fg = foreground
theme.hotkeys_bg = background
theme.hotkeys_modifiers_fg = blue
theme.hotkeys_label_bg = fff
theme.hotkeys_label_fg = zero
theme.hotkeys_description_font = "Exo2 14"
theme.hotkeys_group_margin = 35

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
  rnotification.append_rule {
    rule       = { urgency = 'critical' },
    properties = { bg = '#ff0000', fg = '#ffffff' }
  }
end)

return theme

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
