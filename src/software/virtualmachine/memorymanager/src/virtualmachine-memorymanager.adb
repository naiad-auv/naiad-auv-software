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

   procedure Push_Bool(this : in CMemoryManager; bValue : in boolean) is
   begin
      this.pxMemoryStack.Push(xStackData => VirtualMachine.BooleanStack.xCreate(bValue => bValue));
   end Push_Bool;

   procedure Push_Int(this : in CMemoryManager; iValue : in integer) is
   begin
      this.pxMemoryStack.Push(xStackData => VirtualMachine.IntegerStack.xCreate(iValue => iValue));
   end Push_Int;

   procedure Push_Float(this : in CMemoryManager; fValue : in float) is
   begin
      this.pxMemoryStack.Push(xStackData => VirtualMachine.FloatStack.xCreate(fValue => fValue));
   end Push_Float;

end VirtualMachine.MemoryManager;
