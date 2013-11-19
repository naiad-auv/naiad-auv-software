with VirtualMachine;
with VirtualMachine.InstructionFeeder;
with VirtualMachine.MemoryManager;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;

package VirtualMachine.Interpreter is


   type EInstructions is
     (
      INSTR_PUSHINT,		-- Bytecode: 1
      INSTR_PUSHBOOL,		-- Bytecode: 2
      INSTR_PUSHFLOAT,		-- Bytecode: 3
      INSTR_PUSHMATRIX,		-- Bytecode: 4
      INSTR_PUSHVECTOR		-- Bytecode: 5
--        INSTR_PUSHINT,		-- Bytecode: 6
--        INSTR_PUSHINT,		-- Bytecode: 7
--        INSTR_PUSHINT,		-- Bytecode: 8
--        INSTR_PUSHINT,		-- Bytecode: 9
--        INSTR_PUSHINT,		-- Bytecode: 10
--        INSTR_PUSHINT,		-- Bytecode: 11
--        INSTR_PUSHINT,		-- Bytecode: 12
--        INSTR_PUSHINT,		-- Bytecode: 13
--        INSTR_PUSHINT,		-- Bytecode: 14
--        INSTR_PUSHINT,		-- Bytecode: 15
--        INSTR_PUSHINT,		-- Bytecode: 16
--        INSTR_PUSHINT,		-- Bytecode: 17
--        INSTR_PUSHINT,		-- Bytecode: 18
--        INSTR_PUSHINT,		-- Bytecode: 19
--        INSTR_PUSHINT,		-- Bytecode: 20
--        INSTR_PUSHINT,		-- Bytecode: 21
--        INSTR_PUSHINT,		-- Bytecode: 22
--        INSTR_PUSHINT,		-- Bytecode: 23
--        INSTR_PUSHINT,		-- Bytecode: 24
--        INSTR_PUSHINT,		-- Bytecode: 25
--        INSTR_PUSHINT,		-- Bytecode: 26
--        INSTR_PUSHINT,		-- Bytecode: 27
     );



   type CInterpreter is new Ada.Finalization.Controlled with private;
   type pCInterpreter is access CInterpreter;


private
   type CInterpreter is new Ada.Finalization.Controlled with
      record
         pxInstructionFeeder : VirtualMachine.InstructionFeeder.pCInstructionFeeder;
         pxMemoryManager : VirtualMachine.MemoryManager.pCMemoryManager;
      end record;

   procedure Finalize(this : in out CInterpreter);

end VirtualMachine.Interpreter;
