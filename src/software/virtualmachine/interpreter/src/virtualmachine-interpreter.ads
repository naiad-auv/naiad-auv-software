with VirtualMachine;
with VirtualMachine.InstructionFeeder;
with VirtualMachine.MemoryManager;

with Math.Vectors;
with Math.Matrices;

with Text_Handling;

with Ada.Finalization;
with Ada.Unchecked_Deallocation;
with Ada.Numerics.Elementary_Functions;

package VirtualMachine.Interpreter is


   type CInterpreter is new Ada.Finalization.Controlled with private;
   type pCInterpreter is access CInterpreter;

   procedure Free(pxInterpreterToDeallocate : in out pCInterpreter);
   procedure Step (this : in out CInterpreter; fDeltaTime : in float);

   procedure Test_Print_Vector(this : in out CInterpreter);
   procedure Test_Print_Float(this : in out CInterpreter);

private
   type CInterpreter is new Ada.Finalization.Controlled with
      record
         pxInstructionFeeder : VirtualMachine.InstructionFeeder.pCInstructionFeeder;
         pxMemoryManager : VirtualMachine.MemoryManager.pCMemoryManager;
         iProgramCounter : integer;
         fTimer : float;

         fFloatPrecision : float := 0.0;
         fVectorPrecision : float := Math.Vectors.fVECTOR_PRECISION;
         fMatrixPrecision : float := Math.Matrices.fMATRIX_PRECISION;
      end record;

   procedure Finalize(this : in out CInterpreter);
   procedure Initialize(this : in out CInterpreter);

   procedure Instr_Push_Bool (this : in out CInterpreter; bArgument : in boolean);
   procedure Instr_Push_Int (this : in out CInterpreter; iArgument : in integer);
   procedure Instr_Push_Float (this : in out CInterpreter; fArgument : in float);
   procedure Instr_Push_Vector (this : in out CInterpreter; xArgument : in Math.Vectors.CVector);
   procedure Instr_Push_Matrix (this : in out CInterpreter; xArgument : in Math.Matrices.CMatrix);

   procedure Instr_Branch_False (this : in out CInterpreter; iArgument : in integer);
   procedure Instr_Branch_Always (this : in out CInterpreter; iArgument : in integer);
   procedure Instr_Branch_Subroutine (this : in out CInterpreter; iArgument : in integer);

   procedure Instr_Pop (this : in out CInterpreter; iArgument : in integer);

   procedure Instr_Right_Value_Integer (this : in out CInterpreter; iArgument : in integer);
   procedure Instr_Right_Value_Boolean (this : in out CInterpreter; iArgument : in integer);
   procedure Instr_Right_Value_Float (this : in out CInterpreter; iArgument : in integer);
   procedure Instr_Right_Value_Matrix (this : in out CInterpreter; iArgument : in integer);
   procedure Instr_Right_Value_Vector (this : in out CInterpreter; iArgument : in integer);

   procedure Instr_Left_Value (this : in out CInterpreter; iArgument : in integer);

   procedure Instr_Vector_Component (this : in out CInterpreter; iArgument : in integer);

   procedure Instr_Link (this : in out CInterpreter);
   procedure Instr_Unlink (this : in out CInterpreter);

   procedure Instr_Return_To_Subroutine (this : in out CInterpreter);

   procedure Instr_Declare_Integer (this : in out CInterpreter);
   procedure Instr_Declare_Boolean (this : in out CInterpreter);
   procedure Instr_Declare_Float (this : in out CInterpreter);
   procedure Instr_Declare_Matrix (this : in out CInterpreter);
   procedure Instr_Declare_Vector (this : in out CInterpreter);

   procedure Instr_Assign_Integer (this : in out CInterpreter);
   procedure Instr_Assign_Boolean (this : in out CInterpreter);
   procedure Instr_Assign_Float (this : in out CInterpreter);
   procedure Instr_Assign_Matrix (this : in out CInterpreter);
   procedure Instr_Assign_Vector (this : in out CInterpreter);

   procedure Instr_Timer_Reset (this : in out CInterpreter);
   procedure Instr_Timer (this : in out CInterpreter);

   procedure Instr_Equals_Integer (this : in out CInterpreter);
   procedure Instr_Less_Than_Integer (this : in out CInterpreter);
   procedure Instr_Less_Than_Or_Equal_Integer (this : in out CInterpreter);

   procedure Instr_Equals_Float (this : in out CInterpreter);
   procedure Instr_Less_Than_Float (this : in out CInterpreter);
   procedure Instr_Less_Than_Or_Equal_Float (this : in out CInterpreter);

   procedure Instr_Not (this : in out CInterpreter);
   procedure Instr_Or (this : in out CInterpreter);
   procedure Instr_And (this : in out CInterpreter);

   procedure Instr_Equals_Boolean (this : in out CInterpreter);
   procedure Instr_Equals_Matrix (this : in out CInterpreter);
   procedure Instr_Equals_Vector (this : in out CInterpreter);

   procedure Instr_Negate_Integer (this : in out CInterpreter);
   procedure Instr_Add_Integer (this : in out CInterpreter);
   procedure Instr_Multiply_Integer (this : in out CInterpreter);

   procedure Instr_Negate_Float (this : in out CInterpreter);
   procedure Instr_Add_Float (this : in out CInterpreter);
   procedure Instr_Multiply_Float (this : in out CInterpreter);

   procedure Instr_Negate_Vector (this : in out CInterpreter);
   procedure Instr_Add_Vector (this : in out CInterpreter);
   procedure Instr_Multiply_Vector (this : in out CInterpreter);

   procedure Instr_Multiply_Matrix (this : in out CInterpreter);

   procedure Instr_Sin (this : in out CInterpreter);
   procedure Instr_Cos (this : in out CInterpreter);
   procedure Instr_ArcSin (this : in out CInterpreter);
   procedure Instr_ArcCos (this : in out CInterpreter);

   procedure Instr_Null (this : in out CInterpreter);

end VirtualMachine.Interpreter;
