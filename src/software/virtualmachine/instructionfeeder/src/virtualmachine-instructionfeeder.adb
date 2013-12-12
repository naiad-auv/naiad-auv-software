with Ada.Text_IO;
package body VirtualMachine.InstructionFeeder is
   procedure Free is new Ada.Unchecked_Deallocation(CInstruction'Class, pCInstruction);

   procedure Read_Next_Instruction(this : in out CInstructionFeeder; xFileStream : in Ada.Streams.Stream_IO.Stream_Access) is
      xNewInstruction : CInstruction;
      pxNewInstruction : pCInstruction;
   begin
      Integer'Read(xFileStream, xNewInstruction.iLineNumber);
      EInstruction'Read(xFileStream, xNewInstruction.eInstr);

      case xNewInstruction.eInstr is

         when INSTR_BRF ! INSTR_BRA ! INSTR_PUSHINT ! INSTR_VECCOMP =>

            pxNewInstruction := new CInstructionIntegerArgument;
            Integer'Read(xFileStream, CInstructionIntegerArgument(pxNewInstruction.all).iArgument);


         when INSTR_PUSHBOOL =>
            pxNewInstruction := new CInstructionBooleanArgument;
            Boolean'Read(xFileStream, CInstructionBooleanArgument(pxNewInstruction.all).bArgument);


         when INSTR_PUSHFLOAT =>
            pxNewInstruction := new CInstructionFloatArgument;
            Float'Read(xFileStream, CInstructionFloatArgument(pxNewInstruction.all).fArgument);

         when others =>
            pxNewInstruction := new CInstruction;

      end case;

      pxNewInstruction.iLineNumber := xNewInstruction.iLineNumber;
      pxNewInstruction.eInstr := xNewInstruction.eInstr;

      this.Add_Instruction(pxNewInstruction);
   end Read_Next_Instruction;



   procedure Set_Program_Counter(this : in out CInstructionFeeder; iNewProgramCounterValue : in integer) is
   begin
      this.iProgramCounter := iNewProgramCounterValue;
      this.pxInstructionList := this.pxInstructionList.Find_Instruction(this.iProgramCounter);
   end Set_Program_Counter;

   procedure Get_Program_Counter(this: in CInstructionFeeder; iCurrentProgramCounterValue : out integer) is
   begin
      iCurrentProgramCounterValue := this.iProgramCounter;
   end Get_Program_Counter;



   function Feed_Instruction (this : in CInstructionFeeder) return VirtualMachine.InstructionFeeder.EInstruction is
   begin
      if this.pxInstructionList = null then
         return VirtualMachine.InstructionFeeder.INSTR_EOF;
      end if;

      --Ada.Text_IO.Put_Line(this.pxInstructionList.pxInstruction.eInstr'Img);
      return this.pxInstructionList.pxInstruction.eInstr;
   end Feed_Instruction;


   procedure Insert_Instruction(this : in out CInstructionItem; pxNewInstructionItem : in out pCInstructionItem) is
   begin
      if this.pxInstruction.iLineNumber - this.pxNextInstruction.pxInstruction.iLineNumber >= 0 then

         -- Put in list
         pxNewInstructionItem.pxNextInstruction := this.pxNextInstruction;
         pxNewInstructionItem.pxPreviousInstruction := this.pxNextInstruction.pxPreviousInstruction;
         this.pxNextInstruction.pxPreviousInstruction := pxNewInstructionItem;
         this.pxNextInstruction := pxNewInstructionItem;

      else

         this.pxNextInstruction.Insert_Instruction(pxNewInstructionItem);

      end if;

   end Insert_Instruction;



   function Find_Instruction(this : in CInstructionItem; iLineNumberToFind : in integer) return pCInstructionItem is
   begin

      if this.pxInstruction.iLineNumber - 1 = iLineNumberToFind then
         return this.pxPreviousInstruction;
      end if;

      if this.pxInstruction.iLineNumber + 1 = iLineNumberToFind then
         return this.pxNextInstruction;
      end if;

      if this.pxInstruction.iLineNumber < iLineNumberToFind then
         return this.pxNextInstruction.Find_Instruction(iLineNumberToFind => iLineNumberToFind);
      end if;

      return this.pxPreviousInstruction.Find_Instruction(iLineNumberToFind => iLineNumberToFind);

   end Find_Instruction;

   procedure Destroy_Element(this : in out CInstructionItem; iStopAt : in integer) is
   begin

      if this.pxNextInstruction /= null and then
        this.pxNextInstruction.pxInstruction.iLineNumber /= iStopAt then

         this.pxNextInstruction.Destroy_Element(iStopAt => iStopAt);
         Free(this.pxNextInstruction.pxInstruction);
         Free(this.pxNextInstruction);

      end if;

   end Destroy_Element;

   procedure Destroy(this : in out CInstructionItem) is
   begin

      if this.pxNextInstruction /= null then

         this.pxNextInstruction.Destroy_Element(iStopAt => this.pxInstruction.iLineNumber);
         Free(this.pxNextInstruction.pxInstruction);
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


   procedure Initialize(this : in out CInstructionFeeder) is
      xFile : Ada.Streams.Stream_IO.File_Type;
      xStreamAccess : Ada.Streams.Stream_IO.Stream_Access;
   begin
      Ada.Streams.Stream_IO.Open(File => xFile,
                                 Mode => Ada.Streams.Stream_IO.In_File,
                                 Name => "/home/evr/git/naiad-auv-software/src/software/utils/bytecode_converter/obj/test.byte");
      xStreamAccess := Ada.Streams.Stream_IO.Stream(xFile);

      while not Ada.Streams.Stream_IO.End_Of_File(xFile) loop
         this.Read_Next_Instruction(xStreamAccess);
      end loop;

      Ada.Streams.Stream_IO.Close(xFile);

      this.iProgramCounter := this.pxInstructionList.pxInstruction.iLineNumber;
   end Initialize;

   procedure Go_To_Entry_Point(this : in out CInstructionFeeder; iInstructionAddress : out integer) is
      No_Entry_Point : exception;
      iSearchUntil : integer := -1;
   begin
      while this.pxInstructionList.pxInstruction.eInstr /= INSTR_MAIN loop
         if iSearchUntil < 0 then
            iSearchUntil := this.pxInstructionList.pxInstruction.iLineNumber;
         elsif iSearchUntil = this.pxInstructionList.pxInstruction.iLineNumber then
            raise No_Entry_Point;
         end if;

         this.Set_Program_Counter(iNewProgramCounterValue => this.pxInstructionList.pxNextInstruction.pxInstruction.iLineNumber);
      end loop;
      iInstructionAddress := this.iProgramCounter;
   end Go_To_Entry_Point;



   procedure Add_Instruction(this : in out CInstructionFeeder; pxNewInstruction : in pCInstruction) is
      pxNewInstructionItem : pCInstructionItem := new CInstructionItem;
   begin
      pxNewInstructionItem.pxInstruction := pxNewInstruction;

      if this.pxInstructionList = null then
         this.pxInstructionList := pxNewInstructionItem;
         this.pxInstructionList.pxNextInstruction := this.pxInstructionList;
         this.pxInstructionList.pxPreviousInstruction := this.pxInstructionList;
      else
         this.pxInstructionList.Insert_Instruction(pxNewInstructionItem);
      end if;

   end Add_Instruction;

   function Feed_Boolean_Argument(this : in CInstructionFeeder) return boolean is
   begin
      return CInstructionBooleanArgument(this.pxInstructionList.pxInstruction.all).bArgument;
   end Feed_Boolean_Argument;

   function Feed_Integer_Argument(this : in CInstructionFeeder) return integer is
   begin
      return CInstructionIntegerArgument(this.pxInstructionList.pxInstruction.all).iArgument;
   end Feed_Integer_Argument;

   function Feed_Float_Argument(this : in CInstructionFeeder) return float is
   begin
      return CInstructionFloatArgument(this.pxInstructionList.pxInstruction.all).fArgument;
   end Feed_Float_Argument;

   function Feed_Vector_Argument(this : in CInstructionFeeder) return Math.Vectors.CVector is
   begin
      return CInstructionVectorArgument(this.pxInstructionList.pxInstruction.all).xArgument;
   end Feed_Vector_Argument;

   function Feed_Matrix_Argument(this : in CInstructionFeeder) return Math.Matrices.CMatrix is
   begin
      return CInstructionMatrixArgument(this.pxInstructionList.pxInstruction.all).xArgument;
   end Feed_Matrix_Argument;



end VirtualMachine.InstructionFeeder;
