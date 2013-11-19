package body VirtualMachine.MemoryManager is

   procedure Free(pxMemoryManagerToDeallocate : in out pCMemoryManager) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CMemoryManager, pCMemoryManager);
   begin
      Dealloc(pxMemoryManagerToDeallocate);
   end Free;

   procedure Finalize (this : in out CMemoryManager) is
      use VirtualMachine.MemoryStack;

   begin

      if this.pxMemoryStack /= null then
         VirtualMachine.MemoryStack.Free(this.pxMemoryStack);
      end if;

   end Finalize;

end VirtualMachine.MemoryManager;
