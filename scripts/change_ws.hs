import Control.Monad
import System.Environment
import System.Process

main :: IO ()
main = do
  args <- getArgs
  workspaces <- lines <$> readCreateProcess (shell "wmctrl -d") ""
  let targetWsName = head args
      targetScreen:_  = takeWhile (/='_') targetWsName
  let targetWsLine:_ = filter (\ws -> last (words ws) == targetWsName) workspaces
      targetWsId = head $ words targetWsLine
      currentWsLine:_ = filter (elem '*') workspaces
      currentScreen:_ = last $ words currentWsLine
  when (targetScreen /= currentScreen) $
    -- go to correct screen
    -- assumes there are only two screens total
    callCommand "xdotool key alt+Left"
  callCommand $ "wmctrl -s" <> targetWsId




