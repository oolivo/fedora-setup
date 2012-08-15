import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.ManageHelpers



myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    --, composeOne [ isFullscreen -?> doFullFloat ]


--, maybeToDefinite (isFullscreen -?> doFullFloat)
    ]




main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/oz/.xmobarrc"
    xmonad $ defaultConfig
        {terminal           = "gnome-terminal"
        , normalBorderColor  = "#000000"
        , focusedBorderColor = "#068c00" 
--	, manageHook =  manageDocks <+> manageHook defaultConfig 

	, manageHook = composeOne [
	 isFullscreen -?> doFullFloat] <+> manageHook defaultConfig <+> manageDocks
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
	, logHook = dynamicLogWithPP $ xmobarPP
			{ ppOutput = hPutStrLn xmproc
			, ppTitle = xmobarColor "green" "" . shorten 50
			}
	--, modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [
	((mod2Mask .|. controlMask, xK_l), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
