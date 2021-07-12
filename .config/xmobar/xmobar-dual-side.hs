import Xmobar
import qualified XMonad.Hooks.DynamicLog as H

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
  start   Spotify callback = start baseMpris (callback' . spotifyActions)
      where baseMpris = Mpris2 "spotify" ["-t", "<artist> - <title>"] 5
            spotifyCommand cmd = unwords
              [ "dbus-send"
              , "--print-reply"
              , "--dest=org.mpris.MediaPlayer2.spotify" -- client
              , "/org/mpris/MediaPlayer2"
              , "org.mpris.MediaPlayer2.Player." <> cmd
              ]
            spotifyActions = H.xmobarAction (spotifyCommand "PlayPause") "2"
                             . H.xmobarAction (spotifyCommand "Previous") "1"
                             . H.xmobarAction (spotifyCommand "Next") "3"
            spotifyStatusCommand = readCreateProcess $
              shell (unwords ["dbus-send"
                             , "--print-reply"
                             , "--dest=org.mpris.MediaPlayer2.spotify" -- client
                             , "/org/mpris/MediaPlayer2"
                             , "org.freedesktop.DBus.Properties.Get"
                             , "string:'org.mpris.MediaPlayer2.Player'"
                             , "string:'PlaybackStatus'"
                       , "|" , "egrep -A 1 \"string\""
                       , "|" , "cut -b 26-"
                       , "|" , "cut -d '\"' -f 1"
                             ])
            callback' str = do
              status <- spotifyStatusCommand []
              if status == "Playing\n"
                 then callback $ H.xmobarColor "#99ff99" "" str'
                 else callback $ H.xmobarColor "#ff9999" "" str'
                   where str' = if H.xmobarStrip str == "N/A" then "" else str


main :: IO ()
main = xmobar config

config :: Config
config = defaultConfig
  { font = "xft:Source Code Pro-9"
  , additionalFonts = []
  , bgColor = "black"
  , fgColor = "grey"
  , alpha = 255
  , position = Top
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
               , Run $ Date "%a %b %_d %H:%M:%S" "date" 10
               , Run Spotify
               , Run AlsaPlus
               , Run UnsafeStdinReader
               ]
  , template = left <> "}" <> mid <> "{" <> right
  }
  where
    left  = "%UnsafeStdinReader%"
    mid   = ""
    right = intercalate " | " [ "%spotify%"
                              , "%alsaplus%"
                              , "%cpu%"
                              , "%memory%"
                              , "%dynnetwork%"
                              , "<fc=#ee9a00>%date%</fc>"
                              ]
