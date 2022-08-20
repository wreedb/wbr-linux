import XMonad
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName

import Data.Monoid
import System.Exit

import qualified XMonad.StackSet   as W
import qualified Data.Map          as M
import qualified XMonad.Util.Hacks as Hacks

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal     = "launch-terminal"
browser        = "launch-browser"
editor         = "launch-editor"
launcher       = "launch-launcher"
screenlock     = "blurlock"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth = 2

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces = [" 1 "," 2 "," 3 "," 4 "," 5 "," 6 "," 7 "," 8 "," 9 "]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#C481FF"
myFocusedBorderColor = "#6BF1BE"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--

mySpacing =
  spacingRaw False     -- False=Apply even when single window
  (Border 34 7 7 7)    -- Screen border size top bot rght lft
  True                 -- Enable screen border
  (Border 7 7 7 7)     -- Window border size
  True                 -- Enable window borders


myLayout = mySpacing $ avoidStruts tiled ||| Mirror tiled ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = handleEventHook def <> Hacks.windowedFullscreenFixEventHook

------------------------------------------------------------------------

myLogHook h = dynamicLogWithPP $ xmobarPP
 { ppOutput = hPutStrLn h
 , ppCurrent = xmobarColor "#6BF1BE" "" . wrap "[""]"
 , ppHidden = xmobarColor "#C481FF" ""
 , ppSep = " <fn=2>|</fn> "
 , ppHiddenNoWindows = xmobarColor "#555753" ""
 }

------------------------------------------------------------------------
myStartupHook = do
  spawnOnce "wallpaper"
  spawnOnce "start-compositor"
  spawnOnce "start-polkitd"
  spawnOnce "start-notificationd"
  spawnOnce "numlockx"
  spawnOnce "unclutter --jitter 75 --timeout 4 --fork"
  setWMName "xmonad"
------------------------------------------------------------------------

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar --recompile --dock"
  xmonad $ docks $ def 
    {

      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook xmproc,
        startupHook        = myStartupHook
    }
    `additionalKeysP`
    [ ("<XF86MonBrightnessUp>"   , spawn "brightness-up"    )
    , ("<XF86MonBrightnessDown>" , spawn "brightness-down"  )
    , ("<XF86AudioMute>"         , spawn "volume-mute"      )
    , ("<XF86AudioRaiseVolume>"  , spawn "volume-up"        )
    , ("<XF86AudioLowerVolume>"  , spawn "volume-down"      )
    -- normal stuff
    , ("M-<Return>"   , spawn "launch-terminal"             )
    , ("M-S-b"        , spawn "launch-browser"              )
    , ("M-p"          , spawn "launch-launcher"             )
    , ("M-e"          , spawn "editwmconfig"                )
    , ("<Print>"      , spawn "screenshot-xorg"             )
    , ("M-<Print>"    , spawn "screenshot-select-xorg"      )
    , ("M-S-c"        , kill                                )
    , ("M-S-l"        , spawn "blurlock"                    )
    , ("M-x"          , spawn "powermenu"                   )
    , ("M-<Space>"    , sendMessage NextLayout              )
    , ("M-S-<Space>"  , setLayout $ XMonad.layoutHook conf  )
    , ("M-n"          , refresh                             )
    , ("M-<Tab>"      , windows W.focusDown                 )
    , ("M-j"          , windows W.focusDown                 )
    , ("M-k"          , windows W.focusUp                   )
    , ("M-m"          , windows W.focusMaster               )
    , ("M-S-<Return>" , windows W.swapMaster                )
    , ("M-S-j"        , windows W.swapDown                  )
    , ("M-S-k"        , windows W.swapUp                    )
    , ("M-h"          , sendMessage Shrink                  )
    , ("M-l"          , sendMessage Expand                  )
    , ("M-t"          , withFocused $ windows . W.sink      )
    , ("M-,"          , sendMessage (IncMasterN  1)         )
    , ("M-."          , sendMessage (IncMasterN -1)         )
    , ("M-b"          , sendMessage ToggleStruts            )
    , ("M-S-q"        , io (exitWith ExitSuccess)           )
    , ("M-S-r"        , spawn "xmonad-reload"               )
    ]
