import Control.Monad
import System.Environment
import System.Process

wsToKey :: String -> String
wsToKey "10" = "0"
wsToKey w = w

main :: IO ()
main = do
  (targetScreen:_) : targetWs : _ <- getArgs
  workspaces <- lines <$> readCreateProcess (shell "wmctrl -d") ""
  let currentWsLine:_ = filter (elem '*') workspaces
      currentScreen:_ = last $ words currentWsLine
  when (targetScreen /= currentScreen) $
    if targetScreen == '0'
       then callCommand "xdotool key super+F11"
       else callCommand "xdotool key super+F12"
  callCommand $ "xdotool key super+" <> wsToKey targetWs

