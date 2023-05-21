module Modules.Defaults where

import XMonad
import Colors.Solarized
import qualified Data.Map        as M
import Data.Maybe (fromJust)

myTerminal      = "kitty"
myBrowser = "google-chrome"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myClickJustFocuses :: Bool
myClickJustFocuses = False
myModMask       = mod4Mask
myFont = "xft:GE Inspira:wight=bold:pixelsize=13:antialias=true:hinting=true"
myWorkspaces = [" 1 ",
                " 2 ",
                " 3 ",
                " 4 ",
                " 5 ",
                " 6 ",
                " 7 ",
                " 8 ",
                " 9 "]
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..]
clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>" 
    where i = fromJust $ M.lookup ws myWorkspaceIndices
myNormalBorderColor  = colorBack 
myFocusedBorderColor = colorFore
