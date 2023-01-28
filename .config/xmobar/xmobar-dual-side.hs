import Xmobar
import qualified XMonad.Hooks.StatusBar.PP as H

import Data.List
import System.Process


data AlsaPlus = AlsaPlus deriving (Read, Show)
instance Exec AlsaPlus where
  alias AlsaPlus = "alsaplus"
  start AlsaPlus callback = start baseAlsa (callback . volumeActions . reformat)
    where baseAlsa = Alsa "default" "Master"
                          [ "--template", "<volume> <status>"
                          , "--"
                          , "--off", "muted"
                          ]
          volumeActions = H.xmobarAction "pactl set-sink-mute 0 toggle" "1"
                          . H.xmobarAction "pactl set-sink-volume 0 +2%" "4"
                          . H.xmobarAction "pactl set-sink-volume 0 -2%" "5"
          reformat str = let vol:status:_ = words (H.xmobarStrip str)
                             _:status' = words str in
                             if status == "muted"
                                then "V: " <> unwords status'
                                else "V: " <> vol <> "%"

data Spotify = Spotify deriving (Read, Show)
instance Exec Spotify where
  alias Spotify = "spotify"
  start Spotify callback = start baseMpris (callback' . actions)
      where baseMpris = Mpris2 "spotify" ["-t", "<artist> - <title>"] 5
            spotifyCommand cmd = unwords
              [ "dbus-send"
              , "--print-reply"
              , "--dest=org.mpris.MediaPlayer2.spotify" -- client
              , "/org/mpris/MediaPlayer2"
              , cmd
              ]
            playerCommand action = spotifyCommand $
              "org.mpris.MediaPlayer2.Player." <> action
            actions =
              H.xmobarAction (playerCommand "PlayPause") "2"
              . H.xmobarAction (playerCommand "Previous") "1"
              . H.xmobarAction (playerCommand "Next") "3"
            runningCommand = "qdbus | grep -q spotify"
            playbackStatusVerboseCommand = unwords
              [ spotifyCommand "org.freedesktop.DBus.Properties.Get"
              , "string:'org.mpris.MediaPlayer2.Player'"
              , "string:'PlaybackStatus'"
              ]
            playbackStatusCommand = unwords
              [ playbackStatusVerboseCommand
              , "|" , "grep -A 1 -E \"string\""
              , "|" , "cut -b 26-"
              , "|" , "cut -d '\"' -f 1"
              ]
            statusCommand = unwords
              [ runningCommand
              , "&&", playbackStatusCommand
              -- , "||", "echo \"spotify closed\""
              ]
            callback' str = do
              status <- readCreateProcess (shell statusCommand) []
              case status of
                "Playing\n" -> callback $ H.xmobarColor "#99ff99" "" str'
                _ -> callback $ H.xmobarColor "#ff9999" "" str'
               where str' = if H.xmobarStrip str == "N/A" then "" else str


main :: IO ()
main = xmobar config

config :: Config
config = defaultConfig
  { font = "Source Code Pro 9"
  -- { font = "xft:Source Code Pro-10:antialias=true"
  , additionalFonts = []
  , bgColor = "black"
  , fgColor = "grey"
  , alpha = 255
  , position = Static { xpos = 0, ypos = 0, width = 1920, height = 15 }
  , textOffset = -1
  , iconOffset = -1
  , iconRoot = "."
  , allDesktops = False
  , commands = [ Run $ DynNetwork [ "-L", "0"
                                  , "-H", "100"
                                  , "--normal", "green"
                                  , "--high", "red"
                                  , "--template", "<dev>"
                                  ] 10
               , Run $ Cpu [ "-L", "3"
                           , "-H", "50"
                           , "-p", "2"
                           , "--align", "l"
                           , "--normal", "green"
                           , "--high", "red"
                           , "--template", "C <total>%"
                           ] 10
               , Run $ Memory [ "-t", "M <usedratio>%"
                              , "-p", "2"
                              , "--align", "l"
                              ] 10
               , Run $ Date "%a %b %d %H:%M:%S" "date" 10
               , Run $ Battery [ "-t", "B: <left>% <timeleft><acstatus>"
                               , "--"
                               , "-o", "-"
                               , "-i", ""
                               , "-O", "+"
                               , "-a", "notify-send -u critical 'Battery running out!'"
                               ] 60
               , Run Spotify
               , Run AlsaPlus
               , Run $ UnsafeXPropertyLog "_UNSAFE_XMONAD_LOG_0"
               ]
  , template = left <> "}" <> mid <> "{" <> right
  }
  where
    left  = "%_UNSAFE_XMONAD_LOG_0%"
    mid   = ""
    right = intercalate " | " [ "%spotify%"
                              , "%alsaplus%"
                              , "%battery%"
                              , "%cpu%"
                              , "%memory%"
                              , "%dynnetwork%"
                              , "<fc=#ee9a00>%date%</fc>"
                              ]
