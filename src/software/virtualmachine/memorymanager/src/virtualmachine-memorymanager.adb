with Ada.Text_IO;
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
      this.iStackPointer := this.iStackPointer - 1;
      this.pxMemoryStack.Push(xStackData => VirtualMachine.BooleanStack.xCreate(bValue => bValue));
   end Push_Bool;

   procedure Push_Int(this : in out CMemoryManager; iValue : in integer) is
   begin
      this.iStackPointer := this.iStackPointer - 1;
      this.pxMemoryStack.Push(xStackData => VirtualMachine.IntegerStack.xCreate(iValue => iValue));
   end Push_Int;

   procedure Push_Float(this : in out CMemoryManager; fValue : in float) is
   begin
      this.iStackPointer := this.iStackPointer - 1;
      this.pxMemoryStack.Push(xStackData => VirtualMachine.FloatStack.xCreate(fValue => fValue));
--      Ada.Text_IO.Put_Line("Pushed float to address: " & this.iStackPointer'Img);
   end Push_Float;

   procedure Push_Vector(this : in out CMemoryManager; xValue : in Math.Vectors.CVector) is
   begin
      this.iStackPointer := this.iStackPointer - 1;
      this.pxMemoryStack.Push(xStackData => VirtualMachine.VectorStack.xCreate(xValue => xValue));
   end Push_Vector;

   procedure Push_Matrix(this : in out CMemoryManager; xValue : in Math.Matrices.CMatrix) is
   begin
      this.iStackPointer := this.iStackPointer - 1;
--      Ada.Text_IO.Put_Line("Mat pushed at: " & this.iStackPointer'Img);
      this.pxMemoryStack.Push(xStackData => VirtualMachine.MatrixStack.xCreate(xValue => xValue));
   end Push_Matrix;



   procedure Pop_Bool(this : in out CMemoryManager; bValue : out boolean) is
      xBoolStackData : VirtualMachine.BooleanStack.TBooleanStackData;
   begin
      this.pxMemoryStack.Pop(xStackData => xBoolStackData);
      bValue := xBoolStackData.bGet_Value;
      this.iStackPointer := this.iStackPointer + 1;
   end Pop_Bool;

   procedure Pop_Int(this : in out CMemoryManager; iValue : out integer) is
      xIntStackData : VirtualMachine.IntegerStack.TIntegerStackData;
   begin
      this.pxMemoryStack.Pop(xStackData => xIntStackData);
      iValue := xIntStackData.iGet_Value;
      this.iStackPointer := this.iStackPointer + 1;
   end Pop_Int;

   procedure Pop_Float(this : in out CMemoryManager; fValue : out float) is
      xFloatStackData : VirtualMachine.FloatStack.TFloatStackData;
   begin
      this.pxMemoryStack.Pop(xStackData => xFloatStackData);
      fValue := xFloatStackData.fGet_Value;
      this.iStackPointer := this.iStackPointer + 1;
   end Pop_Float;

   procedure Pop_Vector(this : in out CMemoryManager; xValue : out Math.Vectors.CVector) is
      xVectorStackData : VirtualMachine.VectorStack.TVectorStackData;
   begin
      this.pxMemoryStack.Pop(xStackData => xVectorStackData);
      xValue := xVectorStackData.xGet_Value;
      this.iStackPointer := this.iStackPointer + 1;
   end Pop_Vector;

   procedure Pop_Matrix(this : in out CMemoryManager; xValue : out Math.Matrices.CMatrix) is
      xMatrixStackData : VirtualMachine.MatrixStack.TMatrixStackData;
   begin
      this.pxMemoryStack.Pop(xStackData => xMatrixStackData);
      xValue := xMatrixStackData.xGet_Value;
      this.iStackPointer := this.iStackPointer + 1;
   end Pop_Matrix;


--     procedure Pop(this : in out CMemoryManager) is
--        --      xStackData : VirtualMachine.MemoryStack.TStackData;
--        xStackData : VirtualMachine.VectorStack.TVectorStackData;
--     begin
--        Ada.Text_IO.Put_Line("Generic pop: " & this.iStackPointer'Img);
--        this.pxMemoryStack.Pop(xStackData => xStackData);
--        this.iStackPointer := this.iStackPointer + 1;
--     end Pop;


   procedure Peek_Bool(this : in out CMemoryManager; bValue : out boolean; iOffset : in integer) is
      xBoolStackData : VirtualMachine.BooleanStack.TBooleanStackData;
      iIndex : integer := iOffset - this.iStackPointer;
   begin
      this.pxMemoryStack.Peek(xStackData => xBoolStackData,
                              iIndex     => iIndex);
      bValue := xBoolStackData.bGet_Value;
   end Peek_Bool;
   procedure Peek_Int(this : in out CMemoryManager; iValue : out integer; iOffset : in integer) is
      xIntStackData : VirtualMachine.IntegerStack.TIntegerStackData;
      iIndex : integer := iOffset - this.iStackPointer;
   begin
      this.pxMemoryStack.Peek(xStackData => xIntStackData,
                              iIndex     => iIndex);
      iValue := xIntStackData.iGet_Value;
   end Peek_Int;
   procedure Peek_Float(this : in out CMemoryManager; fValue : out float; iOffset : in integer) is
      xFloatStackData : VirtualMachine.FloatStack.TFloatStackData;
      iIndex : integer := iOffset - this.iStackPointer;
   begin
      this.pxMemoryStack.Peek(xStackData => xFloatStackData,
                              iIndex     => iIndex);
      fValue := xFloatStackData.fGet_Value;
   end Peek_Float;
   procedure Peek_Vector(this : in out CMemoryManager; xValue : out Math.Vectors.CVector; iOffset : in integer) is
      xVectorStackData : VirtualMachine.VectorStack.TVectorStackData;
      iIndex : integer := iOffset - this.iStackPointer;
   begin
      this.pxMemoryStack.Peek(xStackData => xVectorStackData,
                              iIndex     => iIndex);
      xValue := xVectorStackData.xGet_Value;
   end Peek_Vector;
   procedure Peek_Matrix(this : in out CMemoryManager; xValue : out Math.Matrices.CMatrix; iOffset : in integer) is
      xMatrixStackData : VirtualMachine.MatrixStack.TMatrixStackData;
      iIndex : integer := iOffset - this.iStackPointer;
   begin
      this.pxMemoryStack.Peek(xStackData => xMatrixStackData,
                              iIndex     => iIndex);
      xValue := xMatrixStackData.xGet_Value;
   end Peek_Matrix;

   procedure Change_Bool(this : in out CMemoryManager; bValue : in boolean; iOffset : in integer) is
      xBoolStackData : VirtualMachine.BooleanStack.TBooleanStackData := VirtualMachine.BooleanStack.xCreate(bValue => bValue);
      iIndex : integer := iOffset - this.iStackPointer;
   begin
      this.pxMemoryStack.Change(xStackData => xBoolStackData,
                                iIndex     => iIndex);
   end Change_Bool;
   procedure Change_Int(this : in out CMemoryManager; iValue : in integer; iOffset : in integer) is
      xIntStackData : VirtualMachine.IntegerStack.TIntegerStackData := VirtualMachine.IntegerStack.xCreate(iValue => iValue);
      iIndex : integer := iOffset - this.iStackPointer;
   begin
      this.pxMemoryStack.Change(xStackData => xIntStackData,
                                iIndex     => iIndex);
   end Change_Int;
   procedure Change_Float(this : in out CMemoryManager; fValue : in float; iOffset : in integer) is
      xFloatStackData : VirtualMachine.FloatStack.TFloatStackData := VirtualMachine.FloatStack.xCreate(fValue => fValue);
      iIndex : integer := iOffset - this.iStackPointer;
   begin
      this.pxMemoryStack.Change(xStackData => xFloatStackData,
                                iIndex     => iIndex);
   end Change_Float;
   procedure Change_Vector(this : in out CMemoryManager; xValue : in Math.Vectors.CVector; iOffset : in integer) is
      xVectorStackData : VirtualMachine.VectorStack.TVectorStackData := VirtualMachine.VectorStack.xCreate(xValue => xValue);
      iIndex : integer := iOffset - this.iStackPointer;
   begin
      this.pxMemoryStack.Change(xStackData => xVectorStackData,
                                iIndex     => iIndex);
   end Change_Vector;
   procedure Change_Matrix(this : in out CMemoryManager; xValue : in Math.Matrices.CMatrix; iOffset : in integer) is
      xMatrixStackData : VirtualMachine.MatrixStack.TMatrixStackData := VirtualMachine.MatrixStack.xCreate(xValue => xValue);
      iIndex : integer := iOffset - this.iStackPointer;
   begin
--      Ada.Text_IO.Put_Line("FP: " & this.iFramePointer'Img);
--      Ada.Text_IO.Put_Line("Changing matrix at: " & integer(iOffset + this.iFramePointer)'Img);
      this.pxMemoryStack.Change(xStackData => xMatrixStackData,
                                iIndex     => iIndex);
   end Change_Matrix;


   procedure Update_Frame_Pointer(this : in out CMemoryManager) is
   begin
      this.iFramePointer := this.iStackPointer;
   end Update_Frame_Pointer;

   procedure Push_Frame_Pointer(this : in out CMemoryManager) is
   begin
      this.Push_Int(iValue => this.iFramePointer);
   end Push_Frame_Pointer;

   procedure Push_Stack_Pointer(this : in out CMemoryManager) is
   begin
      this.Push_Int(iValue => this.iStackPointer);
   end Push_Stack_Pointer;


   procedure Reset_Previous_Frame_Pointer(this : in out CMemoryManager) is
   begin
      this.Pop_Int(iValue => this.iFramePointer);
   end Reset_Previous_Frame_Pointer;


   procedure Initialize(this : in out CMemoryManager) is
   begin
      this.pxMemoryStack := new VirtualMachine.MemoryStack.CMemoryStack;
   end Initialize;

   procedure Print_Info(this : in CMemoryManager) is
   begin
      Ada.Text_IO.Put_Line("SP: " & this.iStackPointer'Img & ", FP: " & this.iFramePointer'Img);
   end Print_Info;


end VirtualMachine.MemoryManager;
