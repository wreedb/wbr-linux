-- vim:filetype=lua:expandtab:shiftwidth=2:tabstop=4:softtabstop=2:textwidth=100
-- Will Reed | wreedb@yandex.com | https://github.com/wreedb/wbr-linux
----------------------------------------------------------------------
-- AwesomeWM Configuration | THEME |

local awful    = require "awful"
local gears    = require "gears"
local pretty   = require "beautiful"
local colors   = require "wbr.pallette"

local dpi = pretty.xresources.apply_dpi

require "wbr.variables"

local theme = {

  -- wallpaper = gears.filesystem.get_random_file_from_dir(bg_dir, { "png", "jpg" }, true),
  -- wallpaper = theme_dir .. "wall.png",

    -- {{  GENERAL
  font          = ui_font(14),
  fg_normal     = colors.fg,
  fg_focus      = colors.fg,  
  fg_urgent     = colors.red,  
  bg_normal     = colors.bg,
  bg_focus      = colors.darkgrey,
  bg_urgent     = colors.bg,

  useless_gap   = dpi(5),
  border_width  = dpi(2),
  border_normal = colors.zero,
  border_focus  = colors.darkgrey,
  border_marked = colors.green,

  bg_systray    = colors.bgaccent,
  fg_systray    = fg_normal,
  systray_icon_spacing = 5,

  -- {{  TAGLIST
  taglist_shape       = gears.shape.rounded_rect,
  taglist_font        = ui_font(16),
  taglist_bg_focus    = colors.lightgrey,
  taglist_fg_focus    = colors.bg,
  taglist_bg_urgent   = colors.red,
  taglist_fg_urgent   = colors.zero,
  taglist_bg_normal   = colors.bgaccent,
  taglist_fg_normal   = colors.fg,
  taglist_bg_occupied = colors.bgaccent,
  taglist_fg_occupied = colors.fg,
  taglist_bg_empty    = colors.bgaccent,
  taglist_fg_empty    = colors.darkgrey,

  -- {{  TASKLIST
  tasklist_font = ui_font(14),
  tasklist_shape = gears.shape.rounded_rect,
  --tasklist_bg_focus = colors.bg,
  --tasklist_fg_focus = colors.fg,


  titlebar_bg_focus  = "#3F3F3F",
  titlebar_bg_normal = "#3F3F3F",

  mouse_finder_color = "#CC9393",

  -- {{  RIGHT-CLICK MENU
  menu_height = dpi(20),
  menu_width  = dpi(125),

  -- {{  MENUBAR (MOD+SHIFT+P)
  menubar_font         = ui_font(16),
  menubar_bg_normal    = colors.bgaccent,
  menubar_fg_normal    = colors.fg,
  menubar_bg_focus     = colors.darkgrey,
  menubar_fg_focus     = colors.fg,
  menubar_border_width = dpi(2),
  menubar_border_color = colors.zero,

  -- {{  WIBAR
  wibar_bg = colors.bg,
  wibar_fg = colors.fg,

  awesome_icon          = theme_dir .. "awesome-icon.png",
  menu_submenu_icon     = theme_dir .. "submenu.png",

  layout_tile       = theme_dir .. "layouts/tile.png",
  layout_max        = theme_dir .. "layouts/max.png",
  layout_fullscreen = theme_dir .. "layouts/fullscreen.png",
  layout_magnifier  = theme_dir .. "layouts/magnifier.png",
  layout_floating   = theme_dir .. "layouts/floating.png",
  -- tile[left/bottom/top],fair[v/h],spiral,dwindle,corner[nw/ne/sw/se]

}

return theme

  -- {{  TITLEBARS
  --[[
  titlebar_close_button_focus               = theme_dir .. "titlebar/close_focus.png",
  titlebar_close_button_normal              = theme_dir .. "titlebar/close_normal.png",
  titlebar_minimize_button_normal           = theme_dir .. "titlebar/minimize_normal.png",
  titlebar_minimize_button_focus            = theme_dir .. "titlebar/minimize_focus.png",
  titlebar_ontop_button_focus_active        = theme_dir .. "titlebar/ontop_focus_active.png",
  titlebar_ontop_button_normal_active       = theme_dir .. "titlebar/ontop_normal_active.png",
  titlebar_ontop_button_focus_inactive      = theme_dir .. "titlebar/ontop_focus_inactive.png",
  titlebar_ontop_button_normal_inactive     = theme_dir .. "titlebar/ontop_normal_inactive.png",
  titlebar_sticky_button_focus_active       = theme_dir .. "titlebar/sticky_focus_active.png",
  titlebar_sticky_button_normal_active      = theme_dir .. "titlebar/sticky_normal_active.png",
  titlebar_sticky_button_focus_inactive     = theme_dir .. "titlebar/sticky_focus_inactive.png",
  titlebar_sticky_button_normal_inactive    = theme_dir .. "titlebar/sticky_normal_inactive.png",
  titlebar_floating_button_focus_active     = theme_dir .. "titlebar/floating_focus_active.png",
  titlebar_floating_button_normal_active    = theme_dir .. "titlebar/floating_normal_active.png",
  titlebar_floating_button_focus_inactive   = theme_dir .. "titlebar/floating_focus_inactive.png",
  titlebar_floating_button_normal_inactive  = theme_dir .. "titlebar/floating_normal_inactive.png",
  titlebar_maximized_button_focus_active    = theme_dir .. "titlebar/maximized_focus_active.png",
  titlebar_maximized_button_normal_active   = theme_dir .. "titlebar/maximized_normal_active.png",
  titlebar_maximized_button_focus_inactive  = theme_dir .. "titlebar/maximized_focus_inactive.png",
  titlebar_maximized_button_normal_inactive = theme_dir .. "titlebar/maximized_normal_inactive.png",
  ]]