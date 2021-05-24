
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

-- R opcode 6, rs 5, rt 5 rd 5, shamt 5, funct 6
-- I opcode 6, rs 5, rt 5, immediate 16
-- J opcode 6, address 26
-- addressing mode: base + displacement 






