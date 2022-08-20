-- vim:ft=haskell

Config { overrideRedirect = False
       , font     = "xft:Play Nerd Font:size=14:antialias=true"
      -- , additionalFonts = ["xft:Symbols Nerd Font:size=20:antialias=true"]
       , bgColor  = "#272935"
       , fgColor  = "#EEEEEC"
       , position = TopW L 100
       , commands = 
         [ Run Weather "KCIU"
           [ "--template", "<weather> <tempF>°F"
           , "-L", "40"
           , "-H", "80"
           , "--low"   , "#6DE4FD"
           , "--normal", "#6BF1BE"
           , "--high"  , "#F47375"
           ] 36000
         , Run Cpu
           [ "-L", "3"
           , "-H", "50"
           , "--high"  , "red"
           , "--normal", "green"
           ] 10
         , Run Memory ["--template", "Mem: <usedratio>%"] 10
         , Run Date "%A %D <fc=#8be9fd>%I:%M %p</fc> " "date" 10
         , Run UnsafeXMonadLog
         ]
       , sepChar  = "%"
       , alignSep = "}{"
       , template = " <action=`launcher`>Menu</action> | %UnsafeXMonadLog%}{<action=`terminal htop`>%cpu%</action> | %memory% | %KCIU% | %date%"
       }

