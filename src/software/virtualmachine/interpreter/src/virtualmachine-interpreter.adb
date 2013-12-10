with Ada.Text_IO;

package body VirtualMachine.Interpreter is

   procedure Free(pxInterpreterToDeallocate : in out pCInterpreter) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CInterpreter, pCInterpreter);
   begin
      Dealloc(pxInterpreterToDeallocate);
   end Free;


   procedure Step(this : in out CInterpreter; fDeltaTime : in float) is
      use VirtualMachine.InstructionFeeder;

   begin

      --Ada.Text_IO.Put_Line("VM step with delta time: " & fDeltaTime'Img & "."); -- for testing
      --return; -- for testing

      this.fTimer := this.fTimer + fDeltaTime;
      --this.pxMemoryManager.Print_Info;

      case this.pxInstructionFeeder.Feed_Instruction is

         when INSTR_PUSHBOOL =>
            this.Instr_Push_Bool(bArgument => this.pxInstructionFeeder.Feed_Boolean_Argument);

         when INSTR_PUSHINT =>
            this.Instr_Push_Int(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_PUSHFLOAT =>
            this.Instr_Push_Float(fArgument => this.pxInstructionFeeder.Feed_Float_Argument);

         when INSTR_PUSHMAT =>
            this.Instr_Push_Matrix;

         when INSTR_PUSHVEC =>
            this.Instr_Push_Vector;

         when INSTR_PUSHFP =>
            this.Instr_Push_Frame_Pointer;


         when INSTR_BRF =>
            this.Instr_Branch_False(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_BRA =>
            this.Instr_Branch_Always(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_POPINT =>
            this.Instr_Pop_Integer;
         when INSTR_POPBOOL =>
            this.Instr_Pop_Boolean;
         when INSTR_POPFLOAT =>
            this.Instr_Pop_Float;
         when INSTR_POPVEC =>
            this.Instr_Pop_Vector;
         when INSTR_POPMAT =>
            this.Instr_Pop_Matrix;

         when INSTR_RVALINT =>
            this.Instr_Right_Value_Integer;

         when INSTR_RVALBOOL =>
            this.Instr_Right_Value_Boolean;

         when INSTR_RVALFLOAT =>
            this.Instr_Right_Value_Float;

         when INSTR_RVALMAT =>
            this.Instr_Right_Value_Matrix;

         when INSTR_RVALVEC =>
            this.Instr_Right_Value_Vector;


         when INSTR_LINK =>
            this.Instr_Link;

         when INSTR_UNLINK =>
            this.Instr_Unlink;


         when INSTR_RTS =>
            this.Instr_Return_To_Subroutine;


         when INSTR_BSR =>
            this.Instr_Branch_Subroutine;


         when INSTR_DECLINT =>
            this.Instr_Declare_Integer;

         when INSTR_DECLBOOL =>
            this.Instr_Declare_Boolean;

         when INSTR_DECLFLOAT =>
            this.Instr_Declare_Float;

         when INSTR_DECLMAT =>
            this.Instr_Declare_Matrix;

         when INSTR_DECLVEC =>
            this.Instr_Declare_Vector;



         when INSTR_ASSINT =>
            this.Instr_Assign_Integer;

         when INSTR_ASSBOOL =>
            this.Instr_Assign_Boolean;

         when INSTR_ASSFLOAT =>
            this.Instr_Assign_Float;

         when INSTR_ASSMAT =>
            this.Instr_Assign_Matrix;

         when INSTR_ASSVEC =>
            this.Instr_Assign_Vector;



         when INSTR_TIMERST =>
            this.Instr_Timer_Reset;

         when INSTR_TIME =>
            this.Instr_Timer;



         when INSTR_EQINT =>
            this.Instr_Equals_Integer;

         when INSTR_LTINT =>
            this.Instr_Less_Than_Integer;

         when INSTR_LEINT =>
            this.Instr_Less_Than_Or_Equal_Integer;



         when INSTR_EQFLOAT =>
            this.Instr_Equals_Float;

         when INSTR_LTFLOAT =>
            this.Instr_Less_Than_Float;

         when INSTR_LEFLOAT =>
            this.Instr_Less_Than_Or_Equal_Float;



         when INSTR_NOT =>
            this.Instr_Not;

         when INSTR_OR =>
            this.Instr_Or;

         when INSTR_AND =>
            this.Instr_And;



         when INSTR_EQBOOL =>
            this.Instr_Equals_Boolean;

         when INSTR_EQMAT =>
            this.Instr_Equals_Matrix;

         when INSTR_EQVEC =>
            this.Instr_Equals_Vector;



         when INSTR_NEGINT =>
            this.Instr_Negate_Integer;

         when INSTR_ADDINT =>
            this.Instr_Add_Integer;

         when INSTR_MULINT =>
            this.Instr_Multiply_Integer;

         when INSTR_DIVINT =>
            this.Instr_Divide_Integer;



         when INSTR_NEGFLOAT =>
            this.Instr_Negate_Float;

         when INSTR_ADDFLOAT =>
            this.Instr_Add_Float;

         when INSTR_MULFLOAT =>
            this.Instr_Multiply_Float;

         when INSTR_DIVFLOAT =>
            this.Instr_Divide_Float;



         when INSTR_NEGVEC =>
            this.Instr_Negate_Vector;

         when INSTR_ADDVEC =>
            this.Instr_Add_Vector;

         when INSTR_MULVEC =>
            this.Instr_Multiply_Vector;

         when INSTR_SCALEVEC =>
            this.Instr_Scale_Vector;

         when INSTR_VECCOMP =>
            this.Instr_Vector_Component(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);


         when INSTR_MULMAT =>
            this.Instr_Multiply_Matrix;

         when INSTR_MULMATVEC =>
            this.Instr_Multiply_Matrix_Vector;


         when INSTR_SIN =>
            this.Instr_Sin;

         when INSTR_COS =>
            this.Instr_Cos;

         when INSTR_ARCSIN =>
            this.Instr_ArcSin;

         when INSTR_ARCCOS =>
            this.Instr_ArcCos;

         when INSTR_SQRT =>
            this.Instr_Sqrt;

         when INSTR_ABSINT =>
            this.Instr_Abs_Integer;

         when INSTR_ABSFLOAT =>
            this.Instr_Abs_Float;


         when INSTR_ITOF =>
            this.Instr_Integer_To_Float;

         when INSTR_FTOI =>
            this.Instr_Float_To_Integer;


         when INSTR_PRINTINT =>
            this.Instr_Print_Integer;
         when INSTR_PRINTBOOL =>
            this.Instr_Print_Boolean;
         when INSTR_PRINTFLOAT =>
            this.Instr_Print_Float;
         when INSTR_PRINTVEC =>
            this.Instr_Print_Vector;
         when INSTR_PRINTMAT =>
            this.Instr_Print_Matrix;


         when INSTR_NULL ! INSTR_MAIN =>
            this.Instr_Null;

         when INSTR_EOF =>
            this.bFinished := true;

      end case;

   end Step;



   procedure Finalize (this : in out CInterpreter) is
      use VirtualMachine.InstructionFeeder;
      use VirtualMachine.MemoryManager;

   begin

      if this.pxInstructionFeeder /= null then
         VirtualMachine.InstructionFeeder.Free(this.pxInstructionFeeder);
      end if;

      if this.pxMemoryManager /= null then
         VirtualMachine.MemoryManager.Free(this.pxMemoryManager);
      end if;

   end Finalize;

   procedure Initialize(this : in out CInterpreter) is
   begin
      this.pxInstructionFeeder := new VirtualMachine.InstructionFeeder.CInstructionFeeder;
      this.pxInstructionFeeder.Get_Program_Counter(this.iProgramCounter);

      this.pxMemoryManager := new VirtualMachine.MemoryManager.CMemoryManager;
   end Initialize;


   procedure Instr_Push_Frame_Pointer(this : in out CInterpreter) is
   begin
      this.pxMemoryManager.Push_Frame_Pointer;
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Push_Frame_Pointer;

   procedure Instr_Push_Bool(this : in out CInterpreter; bArgument : in boolean) is
   begin
      this.pxMemoryManager.Push_Bool(bValue => bArgument);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Push_Bool;
   procedure Instr_Push_Int(this : in out CInterpreter; iArgument : in integer) is
   begin
      this.pxMemoryManager.Push_Int(iValue => iArgument);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Push_Int;
   procedure Instr_Push_Float(this : in out CInterpreter; fArgument : in float) is
   begin
      this.pxMemoryManager.Push_Float(fValue => fArgument);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Push_Float;
   procedure Instr_Push_Vector(this : in out CInterpreter) is
      fXValue : float;
      fYValue : float;
      fZValue : float;

   begin
      this.pxMemoryManager.Pop_Float(fValue => fZValue);
      this.pxMemoryManager.Pop_Float(fValue => fYValue);
      this.pxMemoryManager.Pop_Float(fValue => fXValue);


      this.pxMemoryManager.Push_Vector(xValue => Math.Vectors.xCreate(fX =>fXValue,
                                                                      fY => fYValue,
                                                                      fZ => fZValue));
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Push_Vector;
   procedure Instr_Push_Matrix(this : in out CInterpreter) is
      fAAValue : float;
      fABValue : float;
      fACValue : float;
      fBAValue : float;
      fBBValue : float;
      fBCValue : float;
      fCAValue : float;
      fCBValue : float;
      fCCValue : float;

   begin
      this.pxMemoryManager.Pop_Float(fValue => fCCValue);
      this.pxMemoryManager.Pop_Float(fValue => fCBValue);
      this.pxMemoryManager.Pop_Float(fValue => fCAValue);

      this.pxMemoryManager.Pop_Float(fValue => fBCValue);
      this.pxMemoryManager.Pop_Float(fValue => fBBValue);
      this.pxMemoryManager.Pop_Float(fValue => fBAValue);

      this.pxMemoryManager.Pop_Float(fValue => fACValue);
      this.pxMemoryManager.Pop_Float(fValue => fABValue);
      this.pxMemoryManager.Pop_Float(fValue => fAAValue);

      this.pxMemoryManager.Push_Matrix(xValue => Math.Matrices.xCreate(tfMatrix => ((fAAValue, fABValue, fACValue),
                                                                                    (fBAValue, fBBValue, fBCValue),
                                                                                    (fCAValue, fCBValue, fCCValue))));
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Push_Matrix;


   procedure Instr_Branch_False (this : in out CInterpreter; iArgument : in integer) is
      bValue : boolean;
   begin
      this.pxMemoryManager.Pop_Bool(bValue);
      if not bValue then
         this.iProgramCounter := iArgument;
      else
         this.iProgramCounter := this.iProgramCounter + 1;
      end if;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Branch_False;
   procedure Instr_Branch_Always (this : in out CInterpreter; iArgument : in integer) is
   begin
      this.iProgramCounter := iArgument;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Branch_Always;
   procedure Instr_Branch_Subroutine (this : in out CInterpreter) is
      iAddress : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Push_Int(iValue => this.iProgramCounter + 1);
      this.iProgramCounter := iAddress;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Branch_Subroutine;


   procedure Instr_Pop_Integer (this : in out CInterpreter) is
      iDummy : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iDummy);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Pop_Integer;
   procedure Instr_Pop_Boolean (this : in out CInterpreter) is
      bDummy : boolean;
   begin
      this.pxMemoryManager.Pop_Bool(bValue => bDummy);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Pop_Boolean;
   procedure Instr_Pop_Float (this : in out CInterpreter) is
      fDummy : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fDummy);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Pop_Float;
   procedure Instr_Pop_Vector (this : in out CInterpreter) is
      xDummy : Math.Vectors.CVector;
   begin
      this.pxMemoryManager.Pop_Vector(xValue => xDummy);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Pop_Vector;
   procedure Instr_Pop_Matrix (this : in out CInterpreter) is
      xDummy : Math.Matrices.CMatrix;
   begin
      this.pxMemoryManager.Pop_Matrix(xValue => xDummy);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Pop_Matrix;

   procedure Instr_Right_Value_Integer (this : in out CInterpreter) is
      iAddress : integer;
      iValue : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Peek_Int(iValue => iValue,
                                    iOffset => iAddress);
      this.pxMemoryManager.Push_Int(iValue => iValue);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Right_Value_Integer;
   procedure Instr_Right_Value_Boolean (this : in out CInterpreter) is
      iAddress : integer;
      bValue : boolean;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Peek_Bool(bValue  => bValue,
                                     iOffset => iAddress);
      this.pxMemoryManager.Push_Bool(bValue => bValue);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Right_Value_Boolean;
   procedure Instr_Right_Value_Float (this : in out CInterpreter) is
      iAddress : integer;
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Peek_Float(fValue  => fValue,
                                      iOffset => iAddress);
      this.pxMemoryManager.Push_Float(fValue => fValue);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Right_Value_Float;
   procedure Instr_Right_Value_Matrix (this : in out CInterpreter) is
      iAddress : integer;
      xValue : Math.Matrices.CMatrix;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Peek_Matrix(xValue  => xValue,
                                       iOffset => iAddress);
      this.pxMemoryManager.Push_Matrix(xValue => xValue);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Right_Value_Matrix;
   procedure Instr_Right_Value_Vector (this : in out CInterpreter) is
      iAddress : integer;
      xValue : Math.Vectors.CVector;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Peek_Vector(xValue  => xValue,
                                       iOffset => iAddress);
      this.pxMemoryManager.Push_Vector(xValue => xValue);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Right_Value_Vector;

   procedure Instr_Link (this : in out CInterpreter) is
   begin
      this.pxMemoryManager.Push_Frame_Pointer;
      this.pxMemoryManager.Update_Frame_Pointer;
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Link;
   procedure Instr_Unlink (this : in out CInterpreter) is
   begin
      this.pxMemoryManager.Reset_Previous_Frame_Pointer;
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Unlink;

   procedure Instr_Return_To_Subroutine (this : in out CInterpreter) is
      iReturnAddress : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iReturnAddress);
      this.iProgramCounter := iReturnAddress;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Return_To_Subroutine;

   procedure Instr_Declare_Integer (this : in out CInterpreter) is
   begin
      this.pxMemoryManager.Push_Int(iValue => 0);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Declare_Integer;
   procedure Instr_Declare_Boolean (this : in out CInterpreter) is
   begin
      this.pxMemoryManager.Push_Bool(bValue => false);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Declare_Boolean;
   procedure Instr_Declare_Float (this : in out CInterpreter) is
   begin
      this.pxMemoryManager.Push_Float(fValue => 0.0);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Declare_Float;
   procedure Instr_Declare_Matrix (this : in out CInterpreter) is
   begin
      this.pxMemoryManager.Push_Matrix(xValue => Math.Matrices.xCreate_Identity);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Declare_Matrix;
   procedure Instr_Declare_Vector (this : in out CInterpreter) is
   begin
      this.pxMemoryManager.Push_Vector(xValue => Math.Vectors.xCreate(fX => 0.0,
                                                                      fY => 0.0,
                                                                      fZ => 0.0));
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Declare_Vector;

   procedure Instr_Assign_Integer (this : in out CInterpreter) is
      iValue : integer;
      iAddress : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iValue);
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Change_Int(iValue  => iValue,
                                      iOffset => iAddress);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Assign_Integer;
   procedure Instr_Assign_Boolean (this : in out CInterpreter) is
      bValue : boolean;
      iAddress : integer;
   begin
      this.pxMemoryManager.Pop_Bool(bValue => bValue);
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Change_Bool(bValue  => bValue,
                                      iOffset => iAddress);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Assign_Boolean;
   procedure Instr_Assign_Float (this : in out CInterpreter) is
      fValue : float;
      iAddress : integer;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Change_Float(fValue  => fValue,
                                      iOffset => iAddress);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Assign_Float;
   procedure Instr_Assign_Matrix (this : in out CInterpreter) is
      xValue : Math.Matrices.CMatrix;
      iAddress : integer;
   begin
      this.pxMemoryManager.Pop_Matrix(xValue => xValue);
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Change_Matrix(xValue  => xValue,
                                         iOffset => iAddress);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Assign_Matrix;
   procedure Instr_Assign_Vector (this : in out CInterpreter) is
      xValue : Math.Vectors.CVector;
      iAddress : integer;
   begin
      this.pxMemoryManager.Pop_Vector(xValue => xValue);
      this.pxMemoryManager.Pop_Int(iValue => iAddress);
      this.pxMemoryManager.Change_Vector(xValue  => xValue,
                                         iOffset => iAddress);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Assign_Vector;

   procedure Instr_Timer_Reset (this : in out CInterpreter) is
   begin
      this.fTimer := 0.0;
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Timer_Reset;
   procedure Instr_Timer (this : in out CInterpreter) is
   begin
      this.pxMemoryManager.Push_Float(fValue => this.fTimer);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Timer;

   procedure Instr_Equals_Integer (this : in out CInterpreter) is
      iLeftOperand, iRightOperand : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iRightOperand);
      this.pxMemoryManager.Pop_Int(iValue => iLeftOperand);
      this.pxMemoryManager.Push_Bool(bValue => iLeftOperand = iRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Equals_Integer;
   procedure Instr_Less_Than_Integer (this : in out CInterpreter) is
      iLeftOperand, iRightOperand : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iRightOperand);
      this.pxMemoryManager.Pop_Int(iValue => iLeftOperand);
      this.pxMemoryManager.Push_Bool(bValue => iLeftOperand < iRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Less_Than_Integer;
   procedure Instr_Less_Than_Or_Equal_Integer (this : in out CInterpreter) is
      iLeftOperand, iRightOperand : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iRightOperand);
      this.pxMemoryManager.Pop_Int(iValue => iLeftOperand);
      this.pxMemoryManager.Push_Bool(bValue => iLeftOperand <= iRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Less_Than_Or_Equal_Integer;

   procedure Instr_Equals_Float (this : in out CInterpreter) is
      fLeftOperand, fRightOperand : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fRightOperand);
      this.pxMemoryManager.Pop_Float(fValue => fLeftOperand);
      this.pxMemoryManager.Push_Bool(bValue => abs(fLeftOperand - fRightOperand) <= this.fFloatPrecision);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Equals_Float;
   procedure Instr_Less_Than_Float (this : in out CInterpreter) is
      fLeftOperand, fRightOperand : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fRightOperand);
      this.pxMemoryManager.Pop_Float(fValue => fLeftOperand);
      this.pxMemoryManager.Push_Bool(bValue => fLeftOperand < fRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Less_Than_Float;
   procedure Instr_Less_Than_Or_Equal_Float (this : in out CInterpreter) is
      fLeftOperand, fRightOperand : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fRightOperand);
      this.pxMemoryManager.Pop_Float(fValue => fLeftOperand);
      this.pxMemoryManager.Push_Bool(bValue => fLeftOperand <= fRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Less_Than_Or_Equal_Float;

   procedure Instr_Not (this : in out CInterpreter) is
      bValue : boolean;
   begin
      this.pxMemoryManager.Pop_Bool(bValue => bValue);
      this.pxMemoryManager.Push_Bool(bValue => not bValue);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Not;
   procedure Instr_Or (this : in out CInterpreter) is
      bLeftOperand, bRightOperand : boolean;
   begin
      this.pxMemoryManager.Pop_Bool(bValue => bRightOperand);
      this.pxMemoryManager.Pop_Bool(bValue => bLeftOperand);
      this.pxMemoryManager.Push_Bool(bValue => bLeftOperand or bRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Or;
   procedure Instr_And (this : in out CInterpreter) is
      bLeftOperand, bRightOperand : boolean;
   begin
      this.pxMemoryManager.Pop_Bool(bValue => bRightOperand);
      this.pxMemoryManager.Pop_Bool(bValue => bLeftOperand);
      this.pxMemoryManager.Push_Bool(bValue => bLeftOperand and bRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_And;

   procedure Instr_Equals_Boolean (this : in out CInterpreter) is
      bLeftOperand, bRightOperand : boolean;
   begin
      this.pxMemoryManager.Pop_Bool(bValue => bRightOperand);
      this.pxMemoryManager.Pop_Bool(bValue => bLeftOperand);
      this.pxMemoryManager.Push_Bool(bValue => bLeftOperand = bRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Equals_Boolean;
   procedure Instr_Equals_Matrix (this : in out CInterpreter) is
      use Math.Matrices;
      xLeftOperand, xRightOperand : CMatrix;
      fSavedPrecision : float;
   begin
      this.pxMemoryManager.Pop_Matrix(xValue => xRightOperand);
      this.pxMemoryManager.Pop_Matrix(xValue => xLeftOperand);

      fSavedPrecision := Math.Matrices.fMATRIX_PRECISION;
      Math.Matrices.fMATRIX_PRECISION := this.fMatrixPrecision;

      this.pxMemoryManager.Push_Bool(bValue => xLeftOperand = xRightOperand);
      Math.Matrices.fMATRIX_PRECISION := fSavedPrecision;

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Equals_Matrix;
   procedure Instr_Equals_Vector (this : in out CInterpreter) is
      use Math.Vectors;
      xLeftOperand, xRightOperand : CVector;
      fSavedPrecision : float;
   begin
      this.pxMemoryManager.Pop_Vector(xValue => xRightOperand);
      this.pxMemoryManager.Pop_Vector(xValue => xLeftOperand);

      fSavedPrecision := Math.Vectors.fVECTOR_PRECISION;
      Math.Vectors.fVECTOR_PRECISION := this.fVectorPrecision;

      this.pxMemoryManager.Push_Bool(bValue => xLeftOperand = xRightOperand);
      Math.Vectors.fVECTOR_PRECISION := fSavedPrecision;

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Equals_Vector;

   procedure Instr_Negate_Integer (this : in out CInterpreter) is
      iValue : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iValue);
      this.pxMemoryManager.Push_Int(iValue => 0 - iValue);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Negate_Integer;
   procedure Instr_Add_Integer (this : in out CInterpreter) is
      iLeftOperand, iRightOperand : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iRightOperand);
      this.pxMemoryManager.Pop_Int(iValue => iLeftOperand);
      this.pxMemoryManager.Push_Int(iValue => iLeftOperand + iRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Add_Integer;
   procedure Instr_Multiply_Integer (this : in out CInterpreter) is
      iLeftOperand, iRightOperand : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iRightOperand);
      this.pxMemoryManager.Pop_Int(iValue => iLeftOperand);
      this.pxMemoryManager.Push_Int(iValue => iLeftOperand * iRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Multiply_Integer;
   procedure Instr_Divide_Integer (this : in out CInterpreter) is
      iLeftOperand, iRightOperand : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iRightOperand);
      this.pxMemoryManager.Pop_Int(iValue => iLeftOperand);

      -- Maybe implement some kind of protection agains division by zero
      this.pxMemoryManager.Push_Int(iValue => iLeftOperand / iRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Divide_Integer;

   procedure Instr_Negate_Float (this : in out CInterpreter) is
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      this.pxMemoryManager.Push_Float(fValue => 0.0 - fValue);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Negate_Float;
   procedure Instr_Add_Float (this : in out CInterpreter) is
      fLeftOperand, fRightOperand : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fRightOperand);
      this.pxMemoryManager.Pop_Float(fValue => fLeftOperand);
      this.pxMemoryManager.Push_Float(fValue => fLeftOperand + fRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Add_Float;
   procedure Instr_Multiply_Float (this : in out CInterpreter) is
      fLeftOperand, fRightOperand : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fRightOperand);
      this.pxMemoryManager.Pop_Float(fValue => fLeftOperand);
      this.pxMemoryManager.Push_Float(fValue => fLeftOperand * fRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Multiply_Float;
   procedure Instr_Divide_Float (this : in out CInterpreter) is
      fLeftOperand, fRightOperand : float;
   begin
      Ada.Text_IO.Put_Line("DIVFLOAT");
      this.pxMemoryManager.Pop_Float(fValue => fRightOperand);
      this.pxMemoryManager.Pop_Float(fValue => fLeftOperand);

      -- Needs protection against div by zero
      this.pxMemoryManager.Push_Float(fValue => fLeftOperand / fRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Divide_Float;

   procedure Instr_Negate_Vector (this : in out CInterpreter) is
      use Math.Vectors;
      xValue : CVector;
   begin
      this.pxMemoryManager.Pop_Vector(xValue => xValue);
      this.pxMemoryManager.Push_Vector(xValue => (-xValue));

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Negate_Vector;
   procedure Instr_Add_Vector (this : in out CInterpreter) is
      use Math.Vectors;
      xLeftOperand, xRightOperand : CVector;
   begin
      this.pxMemoryManager.Pop_Vector(xValue => xRightOperand);
      this.pxMemoryManager.Pop_Vector(xValue => xLeftOperand);
      this.pxMemoryManager.Push_Vector(xValue => xLeftOperand + xRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Add_Vector;
   procedure Instr_Multiply_Vector (this : in out CInterpreter) is
      use Math.Vectors;
      xLeftOperand, xRightOperand : CVector;
   begin
      this.pxMemoryManager.Pop_Vector(xValue => xRightOperand);
      this.pxMemoryManager.Pop_Vector(xValue => xLeftOperand);
      this.pxMemoryManager.Push_Vector(xValue => xLeftOperand * xRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Multiply_Vector;
   procedure Instr_Scale_Vector (this : in out CInterpreter) is
      use Math.Vectors;
      xLeftOperand : CVector;
      fRightOperand : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fRightOperand);
      this.pxMemoryManager.Pop_Vector(xValue => xLeftOperand);
      this.pxMemoryManager.Push_Vector(xValue => xLeftOperand * fRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Scale_Vector;
   procedure Instr_Vector_Component (this : in out CInterpreter; iArgument : in integer) is
      xVector : Math.Vectors.CVector;
   begin
      this.pxMemoryManager.Pop_Vector(xValue => xVector);
      case iArgument is
         when 1 =>
            this.pxMemoryManager.Push_Float(fValue => xVector.fGet_X);
         when 2 =>
            this.pxMemoryManager.Push_Float(fValue => xVector.fGet_Y);
         when 3 =>
            this.pxMemoryManager.Push_Float(fValue => xVector.fGet_Z);
         when others =>
            null;
      end case;

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Vector_Component;


   procedure Instr_Multiply_Matrix (this : in out CInterpreter) is
      use Math.Matrices;
      xLeftOperand, xRightOperand : CMatrix;
   begin
      this.pxMemoryManager.Pop_Matrix(xValue => xRightOperand);
      this.pxMemoryManager.Pop_Matrix(xValue => xLeftOperand);
      this.pxMemoryManager.Push_Matrix(xValue => xLeftOperand * xRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Multiply_Matrix;
   procedure Instr_Multiply_Matrix_Vector (this : in out CInterpreter) is
      use Math.Matrices;
      use Math.Vectors;
      xLeftOperand : CMatrix;
      xRightOperand : CVector;
   begin
      this.pxMemoryManager.Pop_Vector(xValue => xRightOperand);
      this.pxMemoryManager.Pop_Matrix(xValue => xLeftOperand);
      this.pxMemoryManager.Push_Vector(xValue => xLeftOperand * xRightOperand);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Multiply_Matrix_Vector;

   procedure Test_Print_Vector(this : in out CInterpreter) is
      xVector : Math.Vectors.CVector;
   begin
      this.pxMemoryManager.Pop_Vector(xValue => xVector);
      Ada.Text_IO.Put_Line("Vector: " & xVector.fGet_X'Img & xVector.fGet_Y'Img & xVector.fGet_Z'Img);
   end Test_Print_Vector;

   procedure Test_Print_Float(this : in out CInterpreter) is
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      Ada.Text_IO.Put_Line("Dot Product: " & fValue'Img);
   end Test_Print_Float;

   procedure Instr_Sin (this : in out CInterpreter) is
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      this.pxMemoryManager.Push_Float(fValue => Ada.Numerics.Elementary_Functions.Sin(fValue));

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Sin;
   procedure Instr_Cos (this : in out CInterpreter) is
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      this.pxMemoryManager.Push_Float(fValue => Ada.Numerics.Elementary_Functions.Cos(fValue));

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Cos;
   procedure Instr_ArcSin (this : in out CInterpreter) is
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      fValue := Float'Min(Float'Max(fValue, -1.0), 1.0);
      this.pxMemoryManager.Push_Float(fValue => Ada.Numerics.Elementary_Functions.Arcsin(fValue));

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_ArcSin;
   procedure Instr_ArcCos (this : in out CInterpreter) is
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      fValue := Float'Min(Float'Max(fValue, -1.0), 1.0);
      this.pxMemoryManager.Push_Float(fValue => Ada.Numerics.Elementary_Functions.Arccos(fValue));

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_ArcCos;
   procedure Instr_Sqrt (this : in out CInterpreter) is
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      this.pxMemoryManager.Push_Float(fValue => Ada.Numerics.Elementary_Functions.Sqrt(fValue));

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Sqrt;
   procedure Instr_Abs_Integer (this : in out CInterpreter) is
      iValue : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iValue);
      this.pxMemoryManager.Push_Int(iValue => abs(iValue));

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Abs_Integer;
   procedure Instr_Abs_Float (this : in out CInterpreter) is
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      this.pxMemoryManager.Push_Float(fValue => abs(fValue));

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Abs_Float;

   procedure Instr_Integer_To_Float (this : in out CInterpreter) is
      iValue : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iValue);
      this.pxMemoryManager.Push_Float(fValue => float(iValue));

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Integer_To_Float;
   procedure Instr_Float_To_Integer (this : in out CInterpreter) is
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      this.pxMemoryManager.Push_Int(iValue => integer(fValue));

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Float_To_Integer;

   procedure Instr_Print_Integer (this : in out CInterpreter) is
      iValue : integer;
   begin
      this.pxMemoryManager.Pop_Int(iValue => iValue);
      Ada.Text_IO.Put_Line("Int: " & iValue'Img);
      this.pxMemoryManager.Push_Int(iValue => iValue);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Print_Integer;
   procedure Instr_Print_Boolean (this : in out CInterpreter) is
      bValue : boolean;
   begin
      this.pxMemoryManager.Pop_Bool(bValue => bValue);
      Ada.Text_IO.Put_Line("Bool: " & bValue'Img);
      this.pxMemoryManager.Push_Bool(bValue => bValue);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Print_Boolean;
   procedure Instr_Print_Float (this : in out CInterpreter) is
      fValue : float;
   begin
      this.pxMemoryManager.Pop_Float(fValue => fValue);
      Ada.Text_IO.Put_Line("Float: " & fValue'Img);
      this.pxMemoryManager.Push_Float(fValue => fValue);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Print_Float;
   procedure Instr_Print_Vector (this : in out CInterpreter) is
      xValue : Math.Vectors.CVector;
   begin
      this.pxMemoryManager.Pop_Vector(xValue => xValue);
      Ada.Text_IO.Put_Line("Vec: [" & xValue.fGet_X'Img & ", " & xValue.fGet_Y'Img & ", " & xValue.fGet_Z'Img & "]");
      this.pxMemoryManager.Push_Vector(xValue => xValue);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Print_Vector;
   procedure Instr_Print_Matrix (this : in out CInterpreter) is
      xValue : Math.Matrices.CMatrix;
      xVecX : Math.Vectors.CVector;
      xVecY : Math.Vectors.CVector;
      xVecZ : Math.Vectors.CVector;
   begin
      this.pxMemoryManager.Pop_Matrix(xValue => xValue);

      Ada.Text_IO.Put_Line("Mat:");
      xVecX := xValue.xGet_X_Vector;
      xVecY := xValue.xGet_Y_Vector;
      xVecZ := xValue.xGet_Z_Vector;
      Ada.Text_IO.Put_Line("[" & xVecX.fGet_X'Img & ", " & xVecY.fGet_X'Img & ", " & xVecZ.fGet_X'Img & "]");
      Ada.Text_IO.Put_Line("[" & xVecX.fGet_Y'Img & ", " & xVecY.fGet_Y'Img & ", " & xVecZ.fGet_Y'Img & "]");
      Ada.Text_IO.Put_Line("[" & xVecX.fGet_Z'Img & ", " & xVecY.fGet_Z'Img & ", " & xVecZ.fGet_Z'Img & "]");

      this.pxMemoryManager.Push_Matrix(xValue => xValue);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Print_Matrix;



   procedure Instr_Null (this : in out CInterpreter) is
   begin
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Null;


end VirtualMachine.Interpreter;
