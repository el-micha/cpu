
import Memory
import Data.Maybe

main :: IO ()
--main = putStrLn "testing"
main = do putStr $ show t1


t1 = writeWord emptyMemory (fromJust (mkAddress 3)) (fromJust (mkDataWord [1,2,2,3]))
