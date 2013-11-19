with VirtualMachine;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;
with VirtualMachine.MemoryStack;
with VirtualMachine.BooleanStack;
with VirtualMachine.IntegerStack;
with VirtualMachine.FloatStack;

package VirtualMachine.MemoryManager is

   type CMemoryManager is new Ada.Finalization.Controlled with private;
   type pCMemoryManager is access CMemoryManager;

   procedure Free(pxMemoryManagerToDeallocate : in out pCMemoryManager);

   procedure Push_Bool(this : in CMemoryManager; bValue : in boolean);
   procedure Push_Int(this : in CMemoryManager; iValue : in integer);
   procedure Push_Float(this : in CMemoryManager; fValue : in float);


private


   type CMemoryManager is new Ada.Finalization.Controlled with
      record
         iStackPointer : integer;
         iFramePointer : integer;
         iProgramCounter : integer;
         iOffsetRegister : integer;

         pxMemoryStack : VirtualMachine.MemoryStack.pCMemoryStack;
      end record;


   procedure Finalize(this : in out CMemoryManager);


end VirtualMachine.MemoryManager;
