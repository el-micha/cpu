
import Memory
import Data.Maybe

--main :: IO ()
--main = putStrLn "testing"
main = sequence $ map (putStr . (++"\n\n") . show) [t1, t2]


t1 = writeWord emptyMemory (fromJust (mkAddress 3)) (fromJust (mkDataWord [1,2,2,3]))

t2 = fromJust $ mkMemory $ map (fromJust . mkDataWord) [[1,2,3,4],[2,4,6,8],[9,8,7,6],[0,1,0,1]]

