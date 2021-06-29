import Control.Monad
import Data.Map as M
import System.Environment
import System.Process

wsId, wsName :: String -> String
wsId = head . words
wsName = last . words

main :: IO ()
main = do
  screen:direction:output:_ <- getArgs
  wsLines <- lines <$> readCreateProcess (shell "wmctrl -d") ""
  let wsMap = M.fromList [(wsName w, wsId w) | w <- wsLines]
      screenWSs = words $ takeWhile (/=':') output
      dirMap = if direction == "prev"
                  then M.fromList $ zip (tail screenWSs) screenWSs
                  else M.fromList $ zip screenWSs (tail screenWSs)
  print screenWSs
  let visible:_ = Prelude.filter (\ws -> elem '(' ws || elem '[' ws) screenWSs
      _:visible' = init visible
      target = M.findWithDefault visible' visible dirMap
  when (head visible == '(') $
    -- go to correct screen
    -- assumes there are only two screens total
    callCommand "xdotool key alt+Left"
  callCommand $ "wmctrl -s " <> (wsMap M.! (screen <> "_" <> target))
