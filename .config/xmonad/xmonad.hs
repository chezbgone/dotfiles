{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE TypeApplications #-}
{-# OPTIONS_GHC -Wno-partial-type-signatures #-}

import XMonad
import XMonad.Actions.CycleWS
  ( prevScreen, nextScreen, shiftPrevScreen, shiftNextScreen
  , moveTo, Direction1D(Next, Prev), WSType(..))
import XMonad.Hooks.EwmhDesktops
  (ewmh, ewmhFullscreen)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
  (avoidStruts, docks)
import XMonad.Hooks.ManageHelpers
  (doCenterFloat)
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
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
  (lessBorders, Ambiguity(..), With(..), noBorders)
import XMonad.Layout.Renamed
  (renamed, Rename(CutWordsLeft))
import XMonad.Layout.Spacing
  (spacingRaw, Border(Border))
import XMonad.Util.EZConfig (mkKeymap)
import XMonad.Util.Loggers (logTitles)
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.WorkspaceCompare (getSortByIndex, mkWsSort)
import qualified XMonad.Actions.FlexibleResize as Flex
import qualified XMonad.StackSet as W

import Control.Monad
import Data.Function
import Data.Functor
import Data.Maybe
import Data.Monoid (All(..))
import Data.Map (Map)
import qualified Data.Map as Map
import Data.List
import System.IO
import XMonad.Layout.Tabbed

data MonitorSetup = Laptop | Dual ScreenId

main :: IO ()
main = do
  nScreens <- countScreens
  let mySB =
        if nScreens == 1
           then statusBarPropTo "_UNSAFE_XMONAD_LOG"
                  "xmobar ~/.config/xmobar/xmobar-laptop.hs"
                  ((clickablePP >=> scrollablePP) (marshallPP 0 myXMobarPP))
           else statusBarPropTo "_UNSAFE_XMONAD_LOG_1"
                  "xmobar ~/.config/xmobar/xmobar-dual-main.hs"
                  ((clickablePP >=> scrollablePP) (marshallPP 0 myXMobarPP))
                <> statusBarPropTo "_UNSAFE_XMONAD_LOG_0"
                  "xmobar ~/.config/xmobar/xmobar-dual-side.hs"
                  ((clickablePP >=> scrollablePP) (marshallPP 1 myXMobarPP))
      config = myConfig { workspaces = withScreens nScreens myWorkspaces }
  xmonad $ withSB mySB $ docks $ ewmh $ xmobarProp config

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

layouts = (borderSpacing mouseResizable & lessBorders Screen)
      ||| noBorders (tabbed shrinkText myTabConfig)
      ||| (spacing (Grid False) & lessBorders Screen)
      ||| (spacing Full & lessBorders Screen)
  where
    myTabConfig = def { activeColor = "#273450"
                      , activeBorderColor = "#273450"
                      , inactiveColor = "#333333"
                      , inactiveBorderColor = "#333333"
                      , urgentColor = "#FDF6E3"
                      , urgentBorderColor = "#268BD2"
                      , activeTextColor = "#80FFF9"
                      , inactiveTextColor = "#1ACCCC"
                      , urgentTextColor = "#1ABC9C"
                      , fontName = "xft:Source Code Pro:size=9:antialias=true"
                      }
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

myLayoutHook =
  layouts &
    avoidStruts -- reserve space for statusbar

myManageHook :: ManageHook
myManageHook =
  manageZoomHook <>
    mconcat
      [ className =? "floating_term" --> doCenterFloat
      , className =? "mpv" --> doCenterFloat
      , className =? "Sxiv" --> doCenterFloat
      , className =? "feh" --> doCenterFloat
      ]

-- from https://www.peterstuart.org/posts/2021-09-06-xmonad-zoom/
manageZoomHook =
  composeAll
    [ (className =? zoomClassName) <&&> shouldFloat <$> title --> doFloat,
      (className =? zoomClassName) <&&> shouldSink <$> title --> doSink
    ]
  where
    zoomClassName = "zoom"
    tileTitles =
      [ "Zoom - Free Account", -- main window
        "Zoom - Licensed Account", -- main window
        "Zoom", -- meeting window on creation
        "Zoom Meeting" -- meeting window shortly after creation
      ]
    shouldFloat title = title `notElem` tileTitles
    shouldSink title = title `elem` tileTitles
    doSink = (ask >>= doF . W.sink) <+> doF W.swapDown


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
myHandleEventHook = floatClickFocusHandler

myLogHook :: MonitorSetup -> Handle -> X ()
myLogHook scr xmproc =
  let screenId = case scr of Laptop -> 0
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
     , ppTitle           = xmobarColor "green" "" .
                             xmobarRaw .
                             shorten 80 .
                             filter (/='`')
     , ppVisible         = ppVisible
     , ppUrgent          = xmobarColor "red" "yellow"
     , ppSort            = mkWsSort $ pure (compare `on` read @Int)
     }

myXMobarPP :: PP
myXMobarPP = def
    { ppSep             = magenta " | "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9dd" 2
    , ppVisible         = wrap " " "" . xmobarBorder "Top" "#bd93f9" 1
    , ppHidden          = wrap " " ""
    , ppHiddenNoWindows = const ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white "[") (white "]") . magenta . ppWindow
    formatUnfocused = wrap (white "[") (white "]") . purple  . ppWindow
    ppWindow :: String -> String
    ppWindow = xmobarRaw .
                 (\w -> if null w then "untitled" else w) .
                 shorten 30 .
                 filter (/='`')
    purple, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    purple   = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""

-- | Apply clickable wrapping to the given PP.
-- copied from XMonad.Util.ClickableWorkspaces
clickablePP :: PP -> X PP
clickablePP = scriptOnActionPP "~/scripts/change_ws.sh" "1"

scrollablePP :: PP -> X PP
scrollablePP = scriptOnActionPP "~/scripts/move_next_ws.sh left" "4"
           >=> scriptOnActionPP "~/scripts/move_next_ws.sh right" "5"

scriptOnActionPP :: String -> String -> PP -> X PP
scriptOnActionPP script button pp =
  getScripted <&> \ren -> pp{ ppRename = ppRename pp >=> ren }
    where
      getScripted :: X (String -> WindowSpace -> String)
      getScripted = getWsIndex <&> \idx s w -> maybe id scriptWrap (idx (W.tag w)) s
      scriptWrap :: Int -> String -> String
      scriptWrap i = xmobarAction (script ++ " " ++ show i) button

getWsIndex :: X (WorkspaceId -> Maybe Int)
getWsIndex = do
  wSort <- getSortByIndex
  spaces <- gets (map W.tag . wSort . W.workspaces . windowset)
  return $ flip elemIndex spaces

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "redshift"
  spawnOnce "dunst"
  spawnOnce $
    unwords
      [ "trayer"
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
  , ("M-e",          spawn "emacs")
  -- , ("M-o",          spawn "emacs ~/org/main.org")
  , ("M-v",          spawn "kitty nvim")
  , ("M-S-v",        spawn "kitty --class floating_term nvim")
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
