package body VirtualMachine.Interpreter is

   procedure Free(pxInterpreterToDeallocate : in out pCInterpreter) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CInterpreter, pCInterpreter);
   begin
      Dealloc(pxInterpreterToDeallocate);
   end Free;


   procedure Step(this : in CInterpreter; fDeltaTime : in float) is
      use VirtualMachine.InstructionFeeder;
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

end VirtualMachine.Interpreter;
