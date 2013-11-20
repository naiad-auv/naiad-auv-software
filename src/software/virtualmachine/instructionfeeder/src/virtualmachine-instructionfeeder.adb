package body VirtualMachine.InstructionFeeder is

   procedure Set_Program_Counter(this : in out CInstructionFeeder; iNewProgramCounterValue : in integer) is
   begin
      this.iProgramCounter := iNewProgramCounterValue;
      this.pxInstructionList := this.pxInstructionList.Find_Instruction(this.iProgramCounter);
   end Set_Program_Counter;



   function Feed_Instruction (this : in CInstructionFeeder) return VirtualMachine.InstructionFeeder.EInstruction is
   begin
      return this.pxInstructionList.pxInstruction.eInstr;
   end Feed_Instruction;


   procedure Insert_Instruction(this : in out CInstructionItem; pxNewInstructionItem : in out pCInstructionItem) is
   begin
      if this.iLineNumber - this.pxNextInstruction.iLineNumber >= 0 then

         pxNewInstructionItem := new CInstructionItem;

         -- Put in list
         pxNewInstructionItem.pxNextInstruction := this.pxNextInstruction;
         pxNewInstructionItem.pxPreviousInstruction := this.pxNextInstruction.pxPreviousInstruction;
         this.pxNextInstruction.pxPreviousInstruction := pxNewInstructionItem;
         this.pxNextInstruction := pxNewInstructionItem;

      else

         this.pxNextInstruction.Insert_Instruction(pCInstructionItem);
      end if;

   end Insert_Instruction;



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

   procedure Destroy_Element(this : in out CInstructionItem; iStopAt : in integer) is
   begin

      if this.pxNextInstruction /= null and then
        this.pxNextInstruction.iLineNumber /= iStopAt then

         this.pxNextInstruction.Destroy_Element(iStopAt => iStopAt);
         Free(this.pxNextInstruction);

      end if;

   end Destroy_Element;

   procedure Destroy(this : in out CInstructionItem) is
   begin

      if this.pxNextInstruction /= null then

         this.pxNextInstruction.Destroy_Element(iStopAt => this.iLineNumber);
         Free(this.pxNextInstruction);

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
