import Control.Monad
import System.Exit
import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Util.Dmenu
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/phuoc/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
				, terminal = "urxvt"
        , modMask = mod1Mask     
	, handleEventHook    = fullscreenEventHook
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        -- , ((mod4Mask .|. shiftMask, xK_q), quitWithWarning)
        , ((0, xK_Print), spawn "scrot")
        ]

-- quitWithWarning :: X ()
-- quitWithWarning = do
--     let m = "confirm quit"
-- 		    s <- dmenu [m]
-- 				    when (m == s) (io exitSuccess)

