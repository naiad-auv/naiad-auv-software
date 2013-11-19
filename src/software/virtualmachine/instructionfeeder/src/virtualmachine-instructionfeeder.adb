package body VirtualMachine.InstructionFeeder is

   procedure Set_Program_Counter(this : in out CInstructionFeeder; iNewProgramCounterValue : in integer) is
   begin
      this.iProgramCounter := iNewProgramCounterValue;
      this.pxInstructionList := this.pxInstructionList.Find_Instruction(this.iProgramCounter);
   end Set_Program_Counter;

   procedure Feed_Instruction(this : in CInstructionFeeder; eInstr : out EInstruction; sArg : out string) is
--      sTemp : string(1 .. this.pxInstructionList.iArgumentLength);
   begin
      sArg := this.pxInstructionList.sArgument;
      eInstr := EInstruction'Val(this.pxInstructionList.iInstruction);
   end Feed_Instruction;



   function Find_Instruction(this : in CInstructionItem; iLineNumberToFind : in integer) return pCInstructionItem is
   begin

      if this.iLineNumber - 1 = iLineNumberToFind then
         return this.pxPreviousInstruction;
      end if;

      if this.iLineNumber + 1 = iLineNumberToFind then
         return this.pxNextInstruction;
      end if;

      if this.iLineNumber < iLineNumberToFind then
         return this.pxNextInstruction.Find_Instruction(iLineNumberToFind => iLineNumberToFind);
      end if;

      return this.pxPreviousInstruction.Find_Instruction(iLineNumberToFind => iLineNumberToFind);

   end Find_Instruction;


   procedure Destroy(this : in out CInstructionItem) is
   begin

      if this.pxNextInstruction /= null then
         this.pxNextInstruction.Destroy;
         Free(this.pxNextInstruction);
      end if;

      if this.pxPreviousInstruction /= null then
         this.pxPreviousInstruction.Destroy;
         Free(this.pxPreviousInstruction);
      end if;

   end Destroy;


   procedure Free(pxInstructionFeederToDeallocate : in out pCInstructionFeeder) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CInstructionFeeder, pCInstructionFeeder);
   begin
      Dealloc(pxInstructionFeederToDeallocate);
   end Free;


   procedure Free(pxInstructionItemToDeallocate : in out pCInstructionItem) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CInstructionItem, pCInstructionItem);
   begin
      Dealloc(pxInstructionItemToDeallocate);
   end Free;

   procedure Finalize (this : in out CInstructionFeeder) is
   begin

      if this.pxInstructionList /= null then
         this.pxInstructionList.Destroy;
         Free(this.pxInstructionList);
      end if;

   end Finalize;

end VirtualMachine.InstructionFeeder;
