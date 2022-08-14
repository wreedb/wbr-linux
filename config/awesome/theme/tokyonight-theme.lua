-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------
local gears = require("gears")

local themes_path = gears.filesystem.get_configuration_dir() .. "theme/"
local rnotification = require("ruled.notification")
local dpi = require("beautiful.xresources").apply_dpi

-- helpers.rrect = function(radius)
--     return function(cr, width, height)
--         gears.shape.rounded_rect(cr, width, height, radius)
--     end
-- end


-- local new_shape = function(cr, width, height)
--     gears.shape.rounded_rect(cr, 70, 70, 2)
-- end

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "wall/tokyonight-wallpaper.png"
-- }}}

-- {{{ Styles
theme.font = "Iosevka Semi-Bold 11"

-- {{{ Colors
c = {

    zero   = "#000000",

    dblack   = "#1a1b26",
    lblack   = "#4e5173",
    dred     = "#F7768E",
    lred     = "#F7768E",
    dgreen   = "#9ECE6A",
    lgreen   = "#9ECE6A",
    dyellow  = "#E0AF68",
    lyellow  = "#E0AF68",
    dblue    = "#7AA2F7",
    lblue    = "#7AA2F7",
    dmagenta = "#9a7ecc",
    lmagenta = "#9a7ecc",
    dcyan    = "#4abaaf",
    lcyan    = "#4abaaf",
    dwhite   = "#acb0d0",
    lwhite   = "#acb0d0",
  
  }

-- theme.fg_normal  = colo.rs.dred
theme.fg_normal  = c.lwhite
theme.fg_focus   = c.zero
theme.fg_urgent  = c.dred
theme.bg_normal  = c.dblack
theme.bg_focus   = c.lblack
theme.bg_urgent  = c.zero
theme.bg_systray = c.dblack

theme.taglist_bg_empty = c.dblack
theme.taglist_fg_empty = c.lblack
-- theme.taglist_shape = function() new_shape() end
-- theme.taglist_shape = gears.shape.rounded_rect(cr, 70, 70, 10)


-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(4)
theme.border_width  = dpi(1)
theme.border_color_normal = c.dblack
theme.border_color_active = c.lblack
theme.border_color_marked = c.lred
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(25)
theme.menu_width  = dpi(100)
-- }}}

-- {{{ Icons
-- {{{ Taglist
-- theme.taglist_squares_sel   = themes_path .. "taglist/squarefz.png"
-- theme.taglist_squares_unsel = themes_path .. "taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
-- theme.awesome_icon           = themes_path .. "awesome-icon.png"
-- theme.menu_submenu_icon      = themes_path .. "submenu.png"
-- }}}

-- {{{ Layout
-- theme.layout_tile       = themes_path .. "layouts/tile.png"
-- theme.layout_tileleft   = themes_path .. "layouts/tileleft.png"
-- theme.layout_tilebottom = themes_path .. "layouts/tilebottom.png"
-- theme.layout_tiletop    = themes_path .. "layouts/tiletop.png"
-- theme.layout_fairv      = themes_path .. "layouts/fairv.png"
-- theme.layout_fairh      = themes_path .. "layouts/fairh.png"
-- theme.layout_spiral     = themes_path .. "layouts/spiral.png"
-- theme.layout_dwindle    = themes_path .. "layouts/dwindle.png"
-- theme.layout_max        = themes_path .. "layouts/max.png"
-- theme.layout_fullscreen = themes_path .. "layouts/fullscreen.png"
-- theme.layout_magnifier  = themes_path .. "layouts/magnifier.png"
-- theme.layout_floating   = themes_path .. "layouts/floating.png"
-- theme.layout_cornernw   = themes_path .. "layouts/cornernw.png"
-- theme.layout_cornerne   = themes_path .. "layouts/cornerne.png"
-- theme.layout_cornersw   = themes_path .. "layouts/cornersw.png"
-- theme.layout_cornerse   = themes_path .. "layouts/cornerse.png"
-- }}}



-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = c.dred, fg = c.lwhite }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
