with VirtualMachine;
with VirtualMachine.InstructionFeeder;
with VirtualMachine.MemoryManager;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;

package VirtualMachine.Interpreter is


   type CInterpreter is new Ada.Finalization.Controlled with private;
   type pCInterpreter is access CInterpreter;

   procedure Free(pxInterpreterToDeallocate : in out pCInterpreter);


private
   type CInterpreter is new Ada.Finalization.Controlled with
      record
         pxInstructionFeeder : VirtualMachine.InstructionFeeder.pCInstructionFeeder;
         pxMemoryManager : VirtualMachine.MemoryManager.pCMemoryManager;
      end record;

   procedure Finalize(this : in out CInterpreter);

end VirtualMachine.Interpreter;
