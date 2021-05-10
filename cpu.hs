
import qualified Data.Vector as V

type Vector = V.Vector

data Bit = Zero | One
type Word' = Vector Bit
type RAM = Vector Word'
type Register = Word'
type DataRegisters = [Register]
type PC = Register
type StackPointer = Register
type StatusRegister = Register


split1 :: Char -> String -> [String]
--        a    -> b      -> m b
split1 = undefined

split :: [Char] -> String -> [String]
--       m a    -> b      -> m b
split = undefined



