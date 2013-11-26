with VirtualMachine;

with Ada.Finalization;
with Ada.Unchecked_Deallocation;

with VirtualMachine.MemoryStack;
with VirtualMachine.BooleanStack;
with VirtualMachine.IntegerStack;
with VirtualMachine.FloatStack;
with VirtualMachine.VectorStack;
with VirtualMachine.MatrixStack;
with VirtualMachine.AddressStack;

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
   procedure Push_Address(this : in out CMemoryManager; iAddress : in integer);

   procedure Pop_Bool(this : in out CMemoryManager; bValue : out boolean);
   procedure Pop_Int(this : in out CMemoryManager; iValue : out integer);
   procedure Pop_Float(this : in out CMemoryManager; fValue : out float);
   procedure Pop_Vector(this : in out CMemoryManager; xValue : out Math.Vectors.CVector);
   procedure Pop_Matrix(this : in out CMemoryManager; xValue : out Math.Matrices.CMatrix);
   procedure Pop_Address(this : in out CMemoryManager; iAddress : out integer);
   procedure Pop(this : in out CMemoryManager);

   procedure Peek_Bool(this : in out CMemoryManager; bValue : out boolean; iOffset : in integer);
   procedure Peek_Int(this : in out CMemoryManager; iValue : out integer; iOffset : in integer);
   procedure Peek_Float(this : in out CMemoryManager; fValue : out float; iOffset : in integer);
   procedure Peek_Vector(this : in out CMemoryManager; xValue : out Math.Vectors.CVector; iOffset : in integer);
   procedure Peek_Matrix(this : in out CMemoryManager; xValue : out Math.Matrices.CMatrix; iOffset : in integer);

   procedure Change_Bool(this : in out CMemoryManager; bValue : in boolean; iOffset : in integer);
   procedure Change_Int(this : in out CMemoryManager; iValue : in integer; iOffset : in integer);
   procedure Change_Float(this : in out CMemoryManager; fValue : in float; iOffset : in integer);
   procedure Change_Vector(this : in out CMemoryManager; xValue : in Math.Vectors.CVector; iOffset : in integer);
   procedure Change_Matrix(this : in out CMemoryManager; xValue : in Math.Matrices.CMatrix; iOffset : in integer);

   procedure Update_Frame_Pointer(this : in out CMemoryManager);
   procedure Push_Frame_Pointer(this : in out CMemoryManager);
   procedure Reset_Previous_Frame_Pointer(this : in out CMemoryManager);
private


   type CMemoryManager is new Ada.Finalization.Controlled with
      record
         iStackPointer : integer := 0;
         iFramePointer : integer := 0;
         --iOffsetRegister : integer := 0;

         pxMemoryStack : VirtualMachine.MemoryStack.pCMemoryStack;
      end record;


   procedure Finalize(this : in out CMemoryManager);
   procedure Initialize(this : in out CMemoryManager);


end VirtualMachine.MemoryManager;
