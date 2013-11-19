with VirtualMachine;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;
with VirtualMachine.MemoryStack;

package VirtualMachine.MemoryManager is

   type CMemoryManager is new Ada.Finalization.Controlled with private;
   type pCMemoryManager is access CMemoryManager;

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
