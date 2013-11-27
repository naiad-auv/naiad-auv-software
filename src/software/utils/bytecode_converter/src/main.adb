with Ada.Command_Line;
with Ada.Text_IO;
with Ada.Streams.Stream_IO;

with VirtualMachine.InstructionFeeder;
with Parser;

with Math.Matrices;
with Math.Vectors;

procedure Main is
   xBinaryOutFile : Ada.Streams.Stream_IO.File_Type;
   xBinaryOutStreamAccess : Ada.Streams.Stream_IO.Stream_Access;

   xTextInFile : Ada.Text_IO.File_Type;

   iLineNumber : integer;
   eInstr : VirtualMachine.InstructionFeeder.EInstruction;

begin

   if Ada.Command_Line.Argument_Count /= 2 then
      return;
   end if;

   Ada.Text_IO.Open(File => xTextInFile,
                    Mode => Ada.Text_IO.In_File,
                    Name => Ada.Command_Line.Argument(1));

   Ada.Streams.Stream_IO.Create(File => xBinaryOutFile,
                                Mode => Ada.Streams.Stream_IO.Out_File,
                                Name => Ada.Command_Line.Argument(2));

   xBinaryOutStreamAccess := Ada.Streams.Stream_IO.Stream(File => xBinaryOutFile);

   while not Ada.Text_IO.End_Of_File(xTextInFile) loop

      declare
         sLineNumber : string := Parser.sGet_Next_Word_From_File(xTextInFile);
      begin

         if sLineNumber'Length = 0 then
            exit;
         end if;

         iLineNumber := Integer'Value(sLineNumber);
      end;

      Integer'Write(xBinaryOutStreamAccess, iLineNumber);
      Ada.Text_IO.Put(iLineNumber'Img & "    ");

      declare
         use VirtualMachine.InstructionFeeder;
      begin
         eInstr := EInstruction'Value(Parser.sAdd_Instr_String(Parser.sGet_Next_Word_From_File(xTextInFile)));

         EInstruction'Write(xBinaryOutStreamAccess, eInstr);
         Ada.Text_IO.Put(eInstr'Img & " ");


         case eInstr is
         when INSTR_BRF ! INSTR_BRA ! INSTR_BSR ! INSTR_POP !
              INSTR_PUSHINT ! INSTR_RVALINT ! INSTR_RVALBOOL !
                INSTR_RVALFLOAT ! INSTR_RVALMAT ! INSTR_RVALVEC !
                  INSTR_LVAL ! INSTR_VECCOMP =>

            Integer'Write(xBinaryOutStreamAccess, Integer'Value(Parser.sGet_Next_Word_From_File(xTextInFile)));


         when INSTR_PUSHBOOL =>

            Boolean'Write(xBinaryOutStreamAccess, Boolean'Value(Parser.sGet_Next_Word_From_File(xTextInFile)));


         when INSTR_PUSHFLOAT =>

            Float'Write(xBinaryOutStreamAccess, Float'Value(Parser.sGet_Next_Word_From_File(xTextInFile)));


         when INSTR_PUSHMAT =>
            Math.Matrices.CMatrix'Write(xBinaryOutStreamAccess, Parser.xGet_Matrix_From_String(Parser.sGet_Matrix_From_File(xTextInFile)));

         when INSTR_PUSHVEC =>

            Math.Vectors.CVector'Write(xBinaryOutStreamAccess, Parser.xGet_Vector_From_String(Parser.sGet_Vector_From_File(xTextInFile)));

         when others =>
            null;

         end case;
      end;

      Ada.Text_IO.New_Line;

   end loop;

   Ada.Text_IO.Close(xTextInFile);
   Ada.Streams.Stream_IO.Close(xBinaryOutFile);

   Ada.Text_IO.Put_Line("File successfully converted to bytecode.");

exception
   when Ada.Text_IO.End_Error =>
      Parser.Unexpected_EOF(xInFile     => xTextInFile,
                            xOutFile    => xBinaryOutFile,
                            iLineNumber => iLineNumber);
   when others =>
      Ada.Text_IO.Close(xTextInFile);
      Ada.Streams.Stream_IO.Close(xBinaryOutFile);

end Main;
