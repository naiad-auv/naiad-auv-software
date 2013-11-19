package body VirtualMachine.Interpreter is

   procedure Free(pxInterpreterToDeallocate : in out pCInterpreter) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CInterpreter, pCInterpreter);
   begin
      Dealloc(pxInterpreterToDeallocate);
   end Free;


   procedure Step(this : in CInterpreter; fDeltaTime : in float) is
      use VirtualMachine.InstructionFeeder;
      tfMatrix : Math.Matrices.TMatrix;
      iIndex : integer;
      eInstr : EInstruction := this.pxInstructionFeeder.Feed_Instruction;
      sArgument : string := this.pxInstructionFeeder.Feed_Argument;
   begin

      case eInstr is

         when INSTR_PUSHBOOL =>
            if sArgument'Length = 4 and then Text_Handling.sGet_Upper_Case(sArgument) = "TRUE" then
               this.Instr_Push_Bool(bArgument => true);
            elsif sArgument'Length = 5 and then Text_Handling.sGet_Upper_Case(sArgument) = "FALSE" then
               this.Instr_Push_Bool(bArgument => false);
            else
               null; -- ERROR!!
            end if;

         when INSTR_PUSHINT =>
            this.Instr_Push_Int(iArgument => Integer'Value(sArgument));

         when INSTR_PUSHFLOAT =>
            this.Instr_Push_Float(fArgument => Float'Value(sArgument));

         when INSTR_PUSHMATRIX =>
            iIndex := sArgument'First;
            while sArgument(iIndex) /= '[' loop
               iIndex := iIndex + 1;
            end loop;
            iIndex := iIndex + 1;
            while sArgument(iIndex) /= '[' loop
               iIndex := iIndex + 1;
            end loop;
            iIndex := iIndex + 1;



         when others =>
            null;

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


   procedure Instr_Push_Bool(this : in CInterpreter; bArgument : in boolean) is
   begin
      this.pxMemoryManager.Push_Bool(bValue => bArgument);
   end Instr_Push_Bool;


   procedure Instr_Push_Int(this : in CInterpreter; iArgument : in integer) is
   begin
      this.pxMemoryManager.Push_Int(iValue => iArgument);
   end Instr_Push_Int;

   procedure Instr_Push_Float(this : in CInterpreter; fArgument : in float) is
   begin
      this.pxMemoryManager.Push_Float(fValue => fArgument);
   end Instr_Push_Float;

   procedure Instr_Push_Vector(this : in CInterpreter; xArgument : in Math.Vectors.CVector) is
   begin
      this.pxMemoryManager.Push_Vector(xValue => xArgument);
   end Instr_Push_Vector;

   procedure Instr_Push_Matrix(this : in CInterpreter; xArgument : in Math.Matrices.CMatrix) is
   begin
      this.pxMemoryManager.Push_Matrix(xValue => xArgument);
   end Instr_Push_Matrix;


end VirtualMachine.Interpreter;
