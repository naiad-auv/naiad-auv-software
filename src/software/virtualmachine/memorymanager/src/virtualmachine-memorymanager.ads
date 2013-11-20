with VirtualMachine;

with Ada.Finalization;
with Ada.Unchecked_Deallocation;

with VirtualMachine.MemoryStack;
with VirtualMachine.BooleanStack;
with VirtualMachine.IntegerStack;
with VirtualMachine.FloatStack;
with VirtualMachine.VectorStack;
with VirtualMachine.MatrixStack;

with Math.Vectors;
with Math.Matrices;

package VirtualMachine.MemoryManager is

   type CMemoryManager is new Ada.Finalization.Controlled with private;
   type pCMemoryManager is access CMemoryManager;

   procedure Free(pxMemoryManagerToDeallocate : in out pCMemoryManager);

   procedure Push_Bool(this : in out CMemoryManager; bValue : in boolean);
   procedure Push_Int(this : in out CMemoryManager; iValue : in integer);
   procedure Push_Float(this : in out CMemoryManager; fValue : in float);
   procedure Push_Vector(this : in out CMemoryManager; xValue : in Math.Vectors.CVector);
   procedure Push_Matrix(this : in out CMemoryManager; xValue : in Math.Matrices.CMatrix);


private


   type CMemoryManager is new Ada.Finalization.Controlled with
      record
         iStackPointer : integer := 0;
         iFramePointer : integer := 0;
         iOffsetRegister : integer := 0;

         pxMemoryStack : VirtualMachine.MemoryStack.pCMemoryStack;
      end record;


   procedure Finalize(this : in out CMemoryManager);


end VirtualMachine.MemoryManager;
