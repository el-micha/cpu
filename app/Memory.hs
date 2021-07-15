module Memory
( dataWordLength
, emptyDataWord
, mkDataWord
, memorySize
, mkAddress
, emptyMemory
, mkMemory
, readWord
, writeWord
) where

import Data.List

-------------------------------------------------------------------------------
-- DataWords

dataWordLength :: Int
dataWordLength = 4

-- newtype to be able to enforce constraints: length
newtype DataWord = DataWord [Int] 

instance Show DataWord where
  show (DataWord x) = show x

emptyDataWord :: DataWord
emptyDataWord = DataWord $ replicate dataWordLength 0

mkDataWord :: [Int] -> Maybe DataWord
mkDataWord xs = if length xs /= dataWordLength then Nothing else Just (DataWord xs)

-------------------------------------------------------------------------------
-- Addresses

memorySize :: Int
memorySize = 8

-- check positive and bounded at construction
newtype Address = Address Int

mkAddress :: Int -> Maybe Address
mkAddress x = if x < 0 || x >= memorySize then Nothing else Just (Address x)

-------------------------------------------------------------------------------
-- Memory

data Memory = Memory [DataWord]

instance Show Memory where
  show (Memory words) = intercalate "\n" (map show words)

emptyMemory :: Memory
emptyMemory = Memory $ replicate memorySize emptyDataWord

mkMemory :: [DataWord] -> Maybe Memory
mkMemory words = if len > memorySize then Nothing else Just (Memory $ words ++ rest)
  where len = length words
        rest = replicate (memorySize - len) emptyDataWord

readWord :: Memory -> Address -> DataWord
readWord (Memory words) (Address n) = words !! n

writeWord :: Memory -> Address -> DataWord -> Memory
writeWord (Memory words) (Address n) dataWord = Memory $ replace words n dataWord
  where replace :: [a] -> Int -> a -> [a]
        replace (xx:xs) 0 x = x : xs
        replace (xx:xs) n x = xx : (replace xs (n-1) x)
        
-------------------------------------------------------------------------------
-- Registers are datawords, but addressed with a name. 

data Register = Register DataWord
  deriving  Show

-- map register names to  registers
newtype RegisterSet = RegisterSet [(String, Register)]
  deriving  Show

type Name = String

mkRegisterSet :: [Name] -> RegisterSet
mkRegisterSet names = RegisterSet $ [(name, Register emptyDataWord) | name <- names]

getRegister = undefined

modifyRegister = undefined







