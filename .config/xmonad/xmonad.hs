{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE PartialTypeSignatures #-}

import XMonad
import XMonad.Actions.CycleWS
  (prevScreen, nextScreen, shiftPrevScreen, shiftNextScreen)
import XMonad.Hooks.EwmhDesktops
  (ewmh, fullscreenEventHook)
import XMonad.Hooks.ManageDocks
  (avoidStruts, docks)
import XMonad.Hooks.ManageHelpers
  (doCenterFloat)
import XMonad.Layout.IndependentScreens
import XMonad.Layout.NoBorders
  (lessBorders, Ambiguity (Screen))
import XMonad.Layout.Spacing
  (spacingRaw, Border (Border))
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce (spawnOnce)
import qualified XMonad.Actions.FlexibleResize as Flex
import qualified XMonad.StackSet as W

import Data.Function ((&))
import Data.Monoid (All)
import Data.Map (Map)
import qualified Data.Map as Map

main :: IO ()
main = do
  nScreens <- countScreens
  let config = myConfig { workspaces = withScreens nScreens myWorkspaces }
  xmonad $ docks $ ewmh config

myConfig :: XConfig _
myConfig = def
  { terminal           = myTerminal
  , focusFollowsMouse  = False
  , clickJustFocuses   = False
  , borderWidth        = 1
  , modMask            = mod1Mask
  , normalBorderColor  = "#333333"
  , focusedBorderColor = "#4c7899"
  , workspaces         = myWorkspaces

  -- key bindings
  , keys               = myKeys
  , mouseBindings      = myMouseBindings

  -- hooks, layouts
  , layoutHook         = myLayoutHook
  , manageHook         = myManageHook
  , handleEventHook    = myHandleEventHook
  , logHook            = myLogHook
  , startupHook        = myStartupHook
  }

myTerminal = "kitty"

myWorkspaces, myWorkspaceKeys :: [String]
myWorkspaces = show <$> [1..10]
myWorkspaceKeys = show <$> [1..9] <> pure 0

layouts = tiled ||| Mirror tiled ||| Full
  where
    tiled = Tall nmaster delta ratio
    -- number of windows in master pane
    nmaster = 1
    -- proportion of screen occupied by master pane
    ratio = 1/2
    -- proportion of screen changed when resizing
    delta = 3/100


myLayoutHook =
  layouts
  -- gaps
  & spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True
  -- don't draw border when only one window on the screen
  & lessBorders Screen
  -- reserve space for statusbar
  & avoidStruts

myManageHook :: ManageHook
myManageHook = composeAll
  [ className =? "floating_term" --> doCenterFloat
  ]

myHandleEventHook :: Event -> X All
myHandleEventHook = handleEventHook def <> fullscreenEventHook

myLogHook :: X ()
myLogHook = logHook def

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "redshift"
  spawnOnce "xmobar -x 0"
  spawn "notify-send \"restarted xmonad\""

toggleFloat :: Window -> X ()
toggleFloat w = do
  (_, windowRect) <- floatLocation w
  windows $ \s -> if w `Map.member` W.floating s
                    then W.sink w s
                    else W.float w windowRect s

myKeys :: XConfig Layout -> Map (ButtonMask, KeySym) (X ())
myKeys conf = mkKeymap conf $
  [ ("M-<Return>",   spawn $ terminal conf)
  , ("M-S-<Return>", spawn "kitty --class floating_term")
  , ("M-S-q",        kill)
  , ("M-d",          spawn "rofi -show run")
  , ("M-<Tab>",      sendMessage NextLayout)
  , ("M-S-<Space>",  withFocused toggleFloat)
  , ("M-r",          spawn "xmonad --recompile && xmonad --restart")
  , ("M-j",          windows W.focusDown)
  , ("M-k",          windows W.focusUp)
  , ("M-m",          windows W.focusMaster)
  , ("M-S-j",        windows W.swapDown)
  , ("M-S-k",        windows W.swapUp)
  , ("M-S-m",        windows W.swapMaster)
  , ("M-h",          sendMessage Shrink)
  , ("M-l",          sendMessage Expand)
  , ("M-<Left>",     prevScreen)
  , ("M-<Right>",    nextScreen)
  , ("M-S-<Left>",   shiftPrevScreen >> prevScreen)
  , ("M-S-<Right>",  shiftNextScreen >> nextScreen)
  ]
  <> -- Meta-n goes to workspace n on current screen
  [ ("M-" <> k, windows (onCurrentScreen W.greedyView w)) |
    (k, w) <- zip myWorkspaceKeys (workspaces' conf) ]
  <> -- Meta-Shift-n moves current window to workspace n on current screen
  [ ("M-S-" <> k, windows (onCurrentScreen W.shift w)) |
    (k, w) <- zip myWorkspaceKeys (workspaces' conf) ]

myMouseBindings :: XConfig Layout -> Map (KeyMask, Button) (Window -> X ())
myMouseBindings XConfig {modMask = modMask} = Map.fromList
  -- mod-button1 %! Set the window to floating mode and move by dragging
  [ ((modMask, button1), \w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster)
  -- mod-button2 %! Raise the window to the top of the stack
  , ((modMask, button2), windows . (W.shiftMaster .) . W.focusWindow)
  -- mod-button3 %! Set the window to floating mode and resize by dragging
  , ((modMask, button3), \w -> focus w >> Flex.mouseResizeWindow w)
  -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]
