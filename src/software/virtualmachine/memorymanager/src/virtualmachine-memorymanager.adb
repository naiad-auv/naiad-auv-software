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

   procedure Push_Bool(this : in out CMemoryManager; bValue : in boolean) is
   begin
      this.pxMemoryStack.Push(xStackData => VirtualMachine.BooleanStack.xCreate(bValue => bValue));
      this.iStackPointer := this.iStackPointer - 1;
   end Push_Bool;

   procedure Push_Int(this : in out CMemoryManager; iValue : in integer) is
   begin
      this.pxMemoryStack.Push(xStackData => VirtualMachine.IntegerStack.xCreate(iValue => iValue));
      this.iStackPointer := this.iStackPointer - 1;
   end Push_Int;

   procedure Push_Float(this : in out CMemoryManager; fValue : in float) is
   begin
      this.pxMemoryStack.Push(xStackData => VirtualMachine.FloatStack.xCreate(fValue => fValue));
      this.iStackPointer := this.iStackPointer - 1;
   end Push_Float;

   procedure Push_Vector(this : in out CMemoryManager; xValue : in Math.Vectors.CVector) is
   begin
      this.pxMemoryStack.Push(xStackData => VirtualMachine.VectorStack.xCreate(xValue => xValue));
      this.iStackPointer := this.iStackPointer - 1;
   end Push_Vector;

   procedure Push_Matrix(this : in out CMemoryManager; xValue : in Math.Matrices.CMatrix) is
   begin
      this.pxMemoryStack.Push(xStackData => VirtualMachine.MatrixStack.xCreate(xValue => xValue));
      this.iStackPointer := this.iStackPointer - 1;
   end Push_Matrix;



end VirtualMachine.MemoryManager;
