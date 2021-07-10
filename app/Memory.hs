module Memory
( mkMemory
, readWord
, writeWord
) where

import Data.List

data Memory = Memory [[Int]]

instance Show Memory where
  show (Memory words) = intercalate "\n" (map show words)

emptyWord = [0,0,0,0]

mkMemory :: Int -> Memory
mkMemory n = Memory $ replicate n emptyWord


readWord = undefined

writeWord = undefined
