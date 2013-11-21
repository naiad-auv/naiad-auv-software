package body VirtualMachine.Interpreter is

   procedure Free(pxInterpreterToDeallocate : in out pCInterpreter) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CInterpreter, pCInterpreter);
   begin
      Dealloc(pxInterpreterToDeallocate);
   end Free;


   procedure Step(this : in out CInterpreter; fDeltaTime : in float) is
      use VirtualMachine.InstructionFeeder;

   begin

      this.fTimer := this.fTimer + fDeltaTime;

      case this.pxInstructionFeeder.Feed_Instruction is

         when INSTR_PUSHBOOL =>
            this.Instr_Push_Bool(bArgument => this.pxInstructionFeeder.Feed_Boolean_Argument);

         when INSTR_PUSHINT =>
            this.Instr_Push_Int(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_PUSHFLOAT =>
            this.Instr_Push_Float(fArgument => this.pxInstructionFeeder.Feed_Float_Argument);

         when INSTR_PUSHMAT =>
            this.Instr_Push_Matrix(xArgument => this.pxInstructionFeeder.Feed_Matrix_Argument);

         when INSTR_PUSHVEC =>
            this.Instr_Push_Vector(xArgument => this.pxInstructionFeeder.Feed_Vector_Argument);


         when INSTR_BRF =>
            this.Instr_Branch_False(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_BRA =>
            this.Instr_Branch_Always(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_BSR =>
            this.Instr_Branch_Subroutine(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_POP =>
            this.Instr_Pop(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_RVALINT =>
            this.Instr_Right_Value_Integer(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_RVALBOOL =>
            this.Instr_Right_Value_Boolean(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_RVALFLOAT =>
            this.Instr_Right_Value_Float(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_RVALMAT =>
            this.Instr_Right_Value_Matrix(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_RVALVEC =>
            this.Instr_Right_Value_Vector(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_LVAL =>
            this.Instr_Left_Value(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);

         when INSTR_VECCOMP =>
            this.Instr_Vector_Component(iArgument => this.pxInstructionFeeder.Feed_Integer_Argument);


         when INSTR_LINK =>
            this.Instr_Link;

         when INSTR_UNLINK =>
            this.Instr_Unlink;


         when INSTR_RTS =>
            this.Instr_Return_To_Subroutine;


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



         when INSTR_NEGFLOAT =>
            this.Instr_Negate_Float;

         when INSTR_ADDFLOAT =>
            this.Instr_Add_Float;

         when INSTR_MULFLOAT =>
            this.Instr_Multiply_Float;



         when INSTR_NEGVEC =>
            this.Instr_Negate_Vector;

         when INSTR_ADDVEC =>
            this.Instr_Add_Vector;

         when INSTR_MULVEC =>
            this.Instr_Multiply_Vector;


         when INSTR_MULMAT =>
            this.Instr_Multiply_Matrix;

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
   procedure Instr_Push_Vector(this : in out CInterpreter; xArgument : in Math.Vectors.CVector) is
   begin
      this.pxMemoryManager.Push_Vector(xValue => xArgument);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Push_Vector;
   procedure Instr_Push_Matrix(this : in out CInterpreter; xArgument : in Math.Matrices.CMatrix) is
   begin
      this.pxMemoryManager.Push_Matrix(xValue => xArgument);
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
   procedure Instr_Branch_Subroutine (this : in out CInterpreter; iArgument : in integer) is
   begin
      this.pxMemoryManager.Push_Int(iValue => this.iProgramCounter + 1);
      this.iProgramCounter := iArgument;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Branch_Subroutine;

   procedure Instr_Pop (this : in out CInterpreter; iArgument : in integer) is
   begin
      for i in 1 .. iArgument loop
         this.pxMemoryManager.Pop;
      end loop;
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Pop;

   procedure Instr_Right_Value_Integer (this : in out CInterpreter; iArgument : in integer) is
      iValue : integer;
   begin
      this.pxMemoryManager.Peek_Int(iValue => iValue,
                                    iOffset => iArgument);
      this.pxMemoryManager.Push_Int(iValue => iValue);

      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Right_Value_Integer;
   procedure Instr_Right_Value_Boolean (this : in out CInterpreter; iArgument : in integer) is
      bValue : boolean;
   begin
      this.pxMemoryManager.Peek_Bool(bValue  => bValue,
                                     iOffset => iArgument);
      this.pxMemoryManager.Push_Bool(bValue => bValue);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Right_Value_Boolean;
   procedure Instr_Right_Value_Float (this : in out CInterpreter; iArgument : in integer) is
      fValue : float;
   begin
      this.pxMemoryManager.Peek_Float(fValue  => fValue,
                                      iOffset => iArgument);
      this.pxMemoryManager.Push_Float(fValue => fValue);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Right_Value_Float;
   procedure Instr_Right_Value_Matrix (this : in out CInterpreter; iArgument : in integer) is
      xValue : Math.Matrices.CMatrix;
   begin
      this.pxMemoryManager.Peek_Matrix(xValue  => xValue,
                                       iOffset => iArgument);
      this.pxMemoryManager.Push_Matrix(xValue => xValue);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Right_Value_Matrix;
   procedure Instr_Right_Value_Vector (this : in out CInterpreter; iArgument : in integer) is
      xValue : Math.Vectors.CVector;
   begin
      this.pxMemoryManager.Peek_Vector(xValue  => xValue,
                                       iOffset => iArgument);
      this.pxMemoryManager.Push_Vector(xValue => xValue);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Right_Value_Vector;

   procedure Instr_Left_Value (this : in out CInterpreter; iArgument : in integer) is
   begin
      this.pxMemoryManager.Push_Address(iAddress => iArgument);
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Left_Value;

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
            raise Numeric_Error;
      end case;
      this.iProgramCounter := this.iProgramCounter + 1;
      this.pxInstructionFeeder.Set_Program_Counter(iNewProgramCounterValue => this.iProgramCounter);
   end Instr_Vector_Component;

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
      this.pxMemoryManager.Pop_Address(iAddress => iReturnAddress);
      this.iProgramCounter := iReturnAddress;
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
      this.pxMemoryManager.Pop_Address(iAddress => iAddress);
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
      this.pxMemoryManager.Pop_Address(iAddress => iAddress);
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
      this.pxMemoryManager.Pop_Address(iAddress => iAddress);
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
      this.pxMemoryManager.Pop_Address(iAddress => iAddress);
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
      this.pxMemoryManager.Pop_Address(iAddress => iAddress);
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


end VirtualMachine.Interpreter;
