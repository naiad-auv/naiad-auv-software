package body VirtualMachine.Interpreter is

   procedure Free(pxInterpreterToDeallocate : in out pCInterpreter) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CInterpreter, pCInterpreter);
   begin
      Dealloc(pxInterpreterToDeallocate);
   end Free;


   procedure Step(this : in CInterpreter; fDeltaTime : in float) is
      use VirtualMachine.InstructionFeeder;

      xMatrixArgument : Math.Matrices.CMatrix;
      xVectorArgument : Math.Vectors.CVector;
      fArgument : float;
      bArgument : boolean;
      iArgument : integer;

      eInstr : EInstruction := this.pxInstructionFeeder.Feed_Instruction;

   begin

      case eInstr is

         when INSTR_PUSHBOOL =>
            bArgument := this.pxInstructionFeeder.Feed_Boolean_Argument(
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

            iStartIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                    cCharacterToFind => '[',
                                                    iStartFromIndex  => 1) + 1;
            for row in 1 .. 3 loop

               iStartIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                       cCharacterToFind => '[',
                                                       iStartFromIndex  => iStartIndex) + 1;
               iStopIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                      cCharacterToFind => ',',
                                                      iStartFromIndex  => iStartIndex) - 1;

               tfMatrix(row, 1) := Float'Value(sPureArgument(iStartIndex .. iStopIndex));

               iStartIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                       cCharacterToFind => ',',
                                                       iStartFromIndex  => iStopIndex) + 1;
               iStopIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                      cCharacterToFind => ',',
                                                      iStartFromIndex  => iStartIndex) - 1;

               tfMatrix(row, 2) := Float'Value(sPureArgument(iStartIndex .. iStopIndex));


               iStartIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                       cCharacterToFind => ',',
                                                       iStartFromIndex  => iStopIndex) + 1;
               iStopIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                      cCharacterToFind => ']',
                                                      iStartFromIndex  => iStartIndex) - 1;

               tfMatrix(row, 3) := Float'Value(sPureArgument(iStartIndex .. iStopIndex));

            end loop;

            this.Instr_Push_Matrix(xArgument => Math.Matrices.xCreate(tfMatrix => tfMatrix));

         when INSTR_PUSHVECTOR =>

            iStartIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                    cCharacterToFind => '[',
                                                    iStartFromIndex  => 1) + 1;
            iStopIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                   cCharacterToFind => ',',
                                                   iStartFromIndex  => iStartIndex) - 1;

            fVectorComponentX := Float'Value(sPureArgument(iStartIndex .. iStopIndex));

            iStartIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                    cCharacterToFind => ',',
                                                    iStartFromIndex  => iStopIndex) + 1;
            iStopIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                   cCharacterToFind => ',',
                                                   iStartFromIndex  => iStartIndex) - 1;

            fVectorComponentY := Float'Value(sPureArgument(iStartIndex .. iStopIndex));


            iStartIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                    cCharacterToFind => ',',
                                                    iStartFromIndex  => iStopIndex) + 1;
            iStopIndex := Text_Handling.iFind_Next(sText            => sPureArgument,
                                                   cCharacterToFind => ']',
                                                   iStartFromIndex  => iStartIndex) - 1;

            fVectorComponentZ := Float'Value(sPureArgument(iStartIndex .. iStopIndex));


            this.Instr_Push_Vector(xArgument => Math.Vectors.xCreate(fX => fVectorComponentX,
                                                                     fY => fVectorComponentY,
                                                                     fZ => fVectorComponentZ));


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
