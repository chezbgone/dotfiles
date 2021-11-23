{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE TypeApplications #-}
{-# OPTIONS_GHC -Wno-partial-type-signatures #-}

import XMonad
import XMonad.Actions.CycleWS
  (prevScreen, nextScreen, shiftPrevScreen, shiftNextScreen
  , moveTo, Direction1D(Next, Prev), WSType(..))
import XMonad.Hooks.EwmhDesktops
  (ewmh, fullscreenEventHook)
import XMonad.Hooks.DynamicLog
  ( dynamicLogWithPP
  , shorten
  , wrap
  , xmobarAction
  , xmobarColor
  , xmobarPP
  , xmobarRaw
  , xmobarStrip
  , PP(ppOutput, ppCurrent, ppHiddenNoWindows, ppHidden, ppTitle,
       ppVisible, ppUrgent, ppSort) )
import XMonad.Hooks.ManageDocks
  (avoidStruts, docks)
import XMonad.Hooks.ManageHelpers
  (doCenterFloat)
import XMonad.Layout.HintedGrid ( Grid(Grid) )
import XMonad.Layout.IndependentScreens
  ( countScreens
  , marshallPP
  , onCurrentScreen
  , unmarshallS
  , withScreens
  , workspaces' )
import XMonad.Layout.MouseResizableTile
  ( mouseResizableTile
  , MouseResizableTile (draggerType)
  , DraggerType(..) )
import XMonad.Layout.NoBorders
  (lessBorders, Ambiguity(..), With(..))
import XMonad.Layout.Renamed
  (renamed, Rename(CutWordsLeft))
import XMonad.Layout.Spacing
  (spacingRaw, Border(Border))
import XMonad.Util.EZConfig (mkKeymap)
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.WorkspaceCompare (mkWsSort)
import qualified XMonad.Actions.FlexibleResize as Flex
import qualified XMonad.StackSet as W

import Control.Monad ( when )
import Data.Function ((&), on)
import Data.Maybe (isJust)
import Data.Monoid (All(..))
import Data.Map (Map)
import qualified Data.Map as Map
import System.IO (Handle)

data MonitorSetup = Laptop | Dual ScreenId

main :: IO ()
main = do
  nScreens <- countScreens
  logHook' <- if nScreens == 1
              then myLogHook Laptop <$>
                spawnPipe "xmobar ~/.config/xmobar/xmobar-laptop.hs"
              else (myLogHook (Dual 0) <$>
                spawnPipe "xmobar ~/.config/xmobar/xmobar-dual-main.hs")
                <> (myLogHook (Dual 1) <$>
                  spawnPipe "xmobar ~/.config/xmobar/xmobar-dual-side.hs")
  let config = myConfig { workspaces = withScreens nScreens myWorkspaces
                        , logHook = logHook'
                        }
  xmonad $ docks $ ewmh config

myConfig :: XConfig _
myConfig = def
  { terminal           = myTerminal
  , focusFollowsMouse  = False
  , clickJustFocuses   = False
  , borderWidth        = 1
  , modMask            = mod4Mask
  , normalBorderColor  = "#333333"
  , focusedBorderColor = "#4c7899"

  -- key bindings
  , keys               = myKeys
  , mouseBindings      = myMouseBindings

  -- hooks, layouts
  , layoutHook         = myLayoutHook
  , manageHook         = myManageHook
  , handleEventHook    = myHandleEventHook
  , startupHook        = myStartupHook
  }

myTerminal = "kitty"

myWorkspaces, myWorkspaceKeys :: [String]
myWorkspaces = show <$> [1..10]
myWorkspaceKeys = show <$> [1..9] <> pure 0

wsToKey :: String -> String
wsToKey "10" = "0"
wsToKey ws = ws

layouts = borderSpacing mouseResizable
      ||| spacing (Grid False)
      ||| spacing Full
  where
    tiled = Tall nmaster delta ratio
    mouseResizable = mouseResizableTile { draggerType = FixedDragger 10 10 }
    -- number of windows in master pane
    nmaster = 1
    -- proportion of screen occupied by master pane
    ratio = 1/2
    -- proportion of screen changed when resizing
    delta = 3/100
    -- don't draw border when there's only one window on the screen
    spacing = renamed [CutWordsLeft 1]
      . spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True
    borderSpacing = renamed [CutWordsLeft 1]
      . spacingRaw True (Border 10 10 10 10) True (Border 0 0 0 0) True

myLayoutHook = layouts
             & lessBorders Screen -- gaps
             & avoidStruts -- reserve space for statusbar

myManageHook :: ManageHook
myManageHook = composeAll
  [ className =? "floating_term" --> doCenterFloat
  , className =? "mpv" --> doCenterFloat
  , className =? "Sxiv" --> doCenterFloat
  , className =? "feh" --> doCenterFloat
  ]

bringFocusedToTop :: X ()
bringFocusedToTop = windows $ W.modify' $
  \(W.Stack t ls rs) -> W.Stack t [] (reverse ls <> rs)

floatClickFocusHandler :: Event -> X All
floatClickFocusHandler ButtonEvent { ev_window=w } = do
  s <- gets windowset
  when (w `Map.member` W.floating s) $
    focus w >> bringFocusedToTop
  pure mempty
floatClickFocusHandler _ = pure mempty

myHandleEventHook :: Event -> X All
myHandleEventHook = floatClickFocusHandler <> fullscreenEventHook

myLogHook :: MonitorSetup -> Handle -> X ()
myLogHook scr xmproc =
  let screenId = case scr of
                   Laptop -> 0
                   Dual n -> n
      screenId' = show $ case screenId of S m -> m
      switchToWS ws = unwords [ "~/scripts/change_ws", screenId', ws ]
      clickable ws = xmobarAction (switchToWS ws) "1"
      ppCurrent ws = xmobarColor "yellow" "" $ wrap "[" "]" ws
      ppVisible ws = clickable ws $ wrap "(" ")" ws
      ppHidden ws = clickable ws ws
      scrollable :: String -> String
      scrollable out =
        let (ws, rest) = span (/=':') out
            scrollMove dir = xmobarAction $
              unwords [ "~/scripts/move_next_ws"
                      , screenId'
                      , dir
                      , show $ xmobarStrip out
                      ]
            prevScroll = scrollMove "prev" "4"
            nextScroll = scrollMove "next" "5"
         in prevScroll (nextScroll ws) <> rest
   in dynamicLogWithPP $ marshallPP screenId $ xmobarPP
     { ppOutput          = hPutStrLn xmproc . scrollable
     , ppCurrent         = ppCurrent
     , ppHiddenNoWindows = const ""
     , ppHidden          = ppHidden
     , ppTitle           = xmobarColor "green" "" . xmobarRaw
                                                  . shorten 80
                                                  . filter (/='`')
     , ppVisible         = ppVisible
     , ppUrgent          = xmobarColor "red" "yellow"
     , ppSort            = mkWsSort $ pure (compare `on` read @Int)
     }

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "redshift"
  spawnOnce "dunst"
  spawnOnce $ unwords [ "trayer"
                      , "--edge", "top"
                      , "--height", show 15
                      , "--widthtype", "request"
                      , "--distancefrom", "right"
                      , "--distance", show 0
                      , "--align", "right"
                      , "--transparent", "true"
                      , "--alpha", show 0
                      , "--tint", "0x000000"
                      ]
  spawnOnce "dropbox start"
  spawnOnce "blueman-applet"
  spawnOnce "xfce4-clipman"
  -- spawnOnce "node ~/Documents/auto-attest/index.js"
  spawn "notify-send \"(re)started xmonad\""

toggleFloat :: Window -> X ()
toggleFloat w = do
  (_, windowRect) <- floatLocation w
  windows $ \s -> if w `Map.member` W.floating s
                    then W.sink w s
                    else W.float w windowRect s

onScreen :: WindowSpace -> ScreenId -> Bool
onScreen ws s = unmarshallS (W.tag ws) == s

nonEmptyOnCurrentScreen :: WSType
nonEmptyOnCurrentScreen = WSIs $ do
  cur <- groupName . W.workspace . W.current <$> gets windowset
  pure $ \w -> cur == groupName w && isJust (W.stack w)
    where groupName = takeWhile (/= '_') . W.tag


myKeys :: XConfig Layout -> Map (ButtonMask, KeySym) (X ())
myKeys conf = mkKeymap conf $
  [ ("M-<Return>",   spawn "kitty & disown")
  , ("M-S-<Return>", spawn "kitty --class floating_term & disown")
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
  , ("M-<F11>",      screenWorkspace 0 >>= mapM_ (windows . W.view))
  , ("M-<F12>",      screenWorkspace 1 >>= mapM_ (windows . W.view))
  , ("M-S-<F11>",    moveTo Prev nonEmptyOnCurrentScreen)
  , ("M-S-<F12>",    moveTo Next nonEmptyOnCurrentScreen)
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
