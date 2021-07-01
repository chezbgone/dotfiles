import Control.Monad
import Data.Map as M
import System.Environment
import System.Process

wsToKey :: String -> String
wsToKey "10" = "0"
wsToKey w = w

main :: IO ()
main = do
  screen:direction:output:_ <- getArgs
  let screenWSs = words $ takeWhile (/=':') output
      dirMap = if direction == "prev"
                  then M.fromList $ zip (tail screenWSs) screenWSs
                  else M.fromList $ zip screenWSs (tail screenWSs)
  let visible:_ = Prelude.filter (\ws -> elem '(' ws || elem '[' ws) screenWSs
      _:visible' = init visible
      target = M.findWithDefault visible' visible dirMap
  when (head visible == '(') $
    -- go to correct screen
    if screen == "0"
       then callCommand "xdotool key alt+F11"
       else callCommand "xdotool key alt+F12"
  callCommand $ "xdotool key alt+" <> show (wsToKey target)
