--Base
import XMonad
import System.Exit
import qualified Data.Map        as M
-- Hooks
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog 
import XMonad.Hooks.EwmhDesktops

-- Utilities
import XMonad.Util.Run
-- Modules
import Modules.Keys (myKeys)
import Modules.MouseKeys (myMouseBindings)
import Modules.Layout (myLayout)
import Modules.Defaults
import Modules.Startup (myStartupHook)
import Modules.Manage (myManageHook)

myEventHook = mempty
myBorderWidth   = 2

main = do
  xmproc1 <- spawnPipe ("killall polybar; ~/.xmonad/polybar/launch-polybar.sh ")
  xmonad $ ewmh $ docks def
    { terminal           = myTerminal
    , focusFollowsMouse  = myFocusFollowsMouse
    , clickJustFocuses   = myClickJustFocuses
    , borderWidth        = myBorderWidth
    , modMask            = myModMask
    , workspaces         = myWorkspaces
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , keys               = \c -> myKeys c `M.union` keys def c
    , mouseBindings      = myMouseBindings
    , layoutHook         = myLayout
    , manageHook         = myManageHook
    , handleEventHook    = myEventHook
    , startupHook        = myStartupHook
    }

