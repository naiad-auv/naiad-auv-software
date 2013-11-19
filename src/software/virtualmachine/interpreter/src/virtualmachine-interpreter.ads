with VirtualMachine;
with VirtualMachine.InstructionFeeder;
with VirtualMachine.MemoryManager;

with Math.Vectors;
with Math.Matrices;

with Text_Handling;

with Ada.Finalization;
with Ada.Unchecked_Deallocation;

package VirtualMachine.Interpreter is


   type CInterpreter is new Ada.Finalization.Controlled with private;
   type pCInterpreter is access CInterpreter;

   procedure Free(pxInterpreterToDeallocate : in out pCInterpreter);
   procedure Step(this : in CInterpreter; fDeltaTime : in float);


private
   type CInterpreter is new Ada.Finalization.Controlled with
      record
         pxInstructionFeeder : VirtualMachine.InstructionFeeder.pCInstructionFeeder;
         pxMemoryManager : VirtualMachine.MemoryManager.pCMemoryManager;
         iProgramCounter : integer;
      end record;

   procedure Finalize(this : in out CInterpreter);

   procedure Instr_Push_Bool(this : in CInterpreter; bArgument : in boolean);
   procedure Instr_Push_Int(this : in CInterpreter; iArgument : in integer);
   procedure Instr_Push_Float(this : in CInterpreter; fArgument : in float);
   procedure Instr_Push_Vector(this : in CInterpreter; xArgument : in Math.Vectors.CVector);
   procedure Instr_Push_Matrix(this : in CInterpreter; xArgument : in Math.Matrices.CMatrix);

end VirtualMachine.Interpreter;
