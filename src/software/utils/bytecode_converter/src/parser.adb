package body Parser is


   function sAdd_Instr_String(sInstruction : in string) return string is
   begin
      return "INSTR_" & sInstruction;
   end sAdd_Instr_String;

   function sCharacter_To_String(cCharacter : in character) return string is
      sRet : string := cCharacter'Img;
   begin
      return sRet(2 .. 2);
   end sCharacter_To_String;

   function sGet_Next_Word_From_File (xFile : in Ada.Text_IO.File_Type; sReturnString : string := "") return string is
      cReadCharacter : character := ' ';
   begin
      while not Ada.Text_IO.End_Of_File(xFile) loop
         if Ada.Text_IO.End_Of_Line(xFile) and then sReturnString'Length > 0 then
            return sReturnString;
         end if;

         Ada.Text_IO.Get(File => xFile,
                         Item => cReadCharacter);
         if not Text_Handling.bIs_White_Space(cReadCharacter) then
            return  sGet_Next_Word_From_File(xFile         => xFile,
                                             sReturnString => sReturnString & sCharacter_To_String(cReadCharacter));
         else
            if sReturnString'Length > 0 then
               exit;
            end if;
         end if;
      end loop;
      return sReturnString;
   end sGet_Next_Word_From_File;

   function sGet_Next_Character_From_File (xFile : in Ada.Text_IO.File_Type) return character is
      cReadCharacter : character;
   begin
      while not Ada.Text_IO.End_Of_File(xFile) loop
         Ada.Text_IO.Get(File => xFile,
                         Item => cReadCharacter);
         if not Text_Handling.bIs_White_Space(cReadCharacter) then
            return cReadCharacter;
         end if;
      end loop;
      return ' ';
   end sGet_Next_Character_From_File;



   function sGet_Vector_From_File (xFile : in Ada.Text_IO.File_Type; sReturnString : in string := ""; iState : in integer := 0) return string is
      cNextCharacter : character;
   begin

      case iState is
         when 0 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            while cNextCharacter /= '[' loop
               cNextCharacter := sGet_Next_Character_From_File(xFile);
            end loop;

            return sGet_Vector_From_File(xFile         => xFile,
                                         sReturnString => sCharacter_To_String(cNextCharacter),
                                         iState        => 1);

         when 1 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            return sGet_Vector_From_File(xFile         => xFile,
                                         sReturnString => sReturnString & sCharacter_To_String(cNextCharacter),
                                         iState        => 2);
         when 2 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            if cNextCharacter = ',' then
               return sGet_Vector_From_File(xFile         => xFile,
                                            sReturnString => sReturnString & sCharacter_To_String(cNextCharacter),
                                            iState        => 3);
            else
               return sGet_Vector_From_File(xFile         => xFile,
                                            sReturnString => sReturnString & sCharacter_To_String(cNextCharacter),
                                            iState        => 2);
            end if;

         when 3 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            return sGet_Vector_From_File(xFile         => xFile,
                                         sReturnString => sReturnString & sCharacter_To_String(cNextCharacter),
                                         iState        => 4);
         when 4 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            if cNextCharacter = ',' then
               return sGet_Vector_From_File(xFile         => xFile,
                                            sReturnString => sReturnString & sCharacter_To_String(cNextCharacter),
                                            iState        => 5);
            else
               return sGet_Vector_From_File(xFile         => xFile,
                                            sReturnString => sReturnString & sCharacter_To_String(cNextCharacter),
                                            iState        => 4);
            end if;

         when 5 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            return sGet_Vector_From_File(xFile         => xFile,
                                         sReturnString => sReturnString & sCharacter_To_String(cNextCharacter),
                                         iState        => 6);
         when 6 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            if cNextCharacter = ']' then
               Ada.Text_IO.Put_Line(sReturnString & sCharacter_To_String(cNextCharacter));
               return sReturnString & sCharacter_To_String(cNextCharacter);
            else
               return sGet_Vector_From_File(xFile         => xFile,
                                            sReturnString => sReturnString & sCharacter_To_String(cNextCharacter),
                                            iState        => 5);
            end if;

         when others =>
            raise Numeric_Error;
      end case;
   end sGet_Vector_From_File;

   function sGet_Matrix_From_File (xFile : in Ada.Text_IO.File_Type; sReturnString : in string := ""; iState : in integer := 0) return string is
      cNextCharacter : character;
   begin

      case iState is
         when 0 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            while cNextCharacter /= '[' loop
               cNextCharacter := sGet_Next_Character_From_File(xFile);
            end loop;

            return sGet_Matrix_From_File(xFile         => xFile,
                                         sReturnString => sCharacter_To_String(cNextCharacter) & sGet_Vector_From_File(xFile),
                                         iState        => 1);
         when 1 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            if cNextCharacter = ',' then
               return sGet_Matrix_From_File(xFile         => xFile,
                                            sReturnString => sReturnString & sCharacter_To_String(cNextCharacter) & sGet_Vector_From_File(xFile),
                                            iState        => 2);
            else
               return sGet_Matrix_From_File(xFile         => xFile,
                                            sReturnString => sReturnString,
                                            iState        => 1);
            end if;

         when 2 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            if cNextCharacter = ',' then
               return sGet_Matrix_From_File(xFile         => xFile,
                                            sReturnString => sReturnString & sCharacter_To_String(cNextCharacter) & sGet_Vector_From_File(xFile),
                                            iState        => 3);
            else
               return sGet_Matrix_From_File(xFile         => xFile,
                                            sReturnString => sReturnString,
                                            iState        => 2);
            end if;

         when 3 =>
            cNextCharacter := sGet_Next_Character_From_File(xFile);
            while cNextCharacter /= ']' loop
               cNextCharacter := sGet_Next_Character_From_File(xFile);
            end loop;

            Ada.Text_IO.Put_Line(sReturnString & sCharacter_To_String(cNextCharacter));
            return sReturnString & sCharacter_To_String(cNextCharacter);

         when others =>
            return "";

      end case;

   end sGet_Matrix_From_File;


   procedure Unexpected_EOF(xInFile : in out Ada.Text_IO.File_Type; xOutFile : in out Ada.Streams.Stream_IO.File_Type; iLineNumber : in integer) is
   begin
      Ada.Text_IO.Close(File => xInFile);
      Ada.Streams.Stream_IO.Close(File => xOutFile);
      Ada.Text_IO.Put_Line("Error: Unexpected EOF at line " & iLineNumber'Img & ". Aborted!");
   end Unexpected_EOF;


   function xGet_Matrix_From_String (sMatrix : in string) return Math.Matrices.CMatrix is
      xXVector, xYVector, xZVector : Math.Vectors.CVector;
      iStart, iStop : integer;
      tfMatrix : Math.Matrices.TMatrix;
   begin
      iStart := Text_Handling.iFind_Next(sText            => sMatrix,
                                         cCharacterToFind => '[',
                                         iStartFromIndex  => sMatrix'First) + 1;
      iStop := Text_Handling.iFind_Next(sText            => sMatrix,
                                        cCharacterToFind => ']',
                                        iStartFromIndex  => iStart);

      xXVector := xGet_Vector_From_String(sVector => sMatrix(iStart .. iStop));

      iStart := iStop + 2;
      iStop := Text_Handling.iFind_Next(sText            => sMatrix,
                                        cCharacterToFind => ']',
                                        iStartFromIndex  => iStart);

      xYVector := xGet_Vector_From_String(sVector => sMatrix(iStart .. iStop));

      iStart := iStop + 2;
      iStop := Text_Handling.iFind_Next(sText            => sMatrix,
                                        cCharacterToFind => ']',
                                        iStartFromIndex  => iStart);

      xZVector := xGet_Vector_From_String(sVector => sMatrix(iStart .. iStop));

      tfMatrix := ((xXVector.fGet_X, xYVector.fGet_X, xZVector.fGet_X),
                   (xXVector.fGet_Y, xYVector.fGet_Y, xZVector.fGet_Y),
                   (xXVector.fGet_Z, xYVector.fGet_Z, xZVector.fGet_Z));
      return Math.Matrices.xCreate(tfMatrix);
   end xGet_Matrix_From_String;


   function xGet_Vector_From_String (sVector : in string) return Math.Vectors.CVector is
      fX, fY, fZ : float;
      iStart, iStop : integer;
   begin
      iStart := Text_Handling.iFind_Next(sText            => sVector,
                                         cCharacterToFind => '[',
                                         iStartFromIndex  => sVector'First) + 1;
      iStop := Text_Handling.iFind_Next(sText            => sVector,
                                        cCharacterToFind => ',',
                                        iStartFromIndex  => iStart) - 1;
      fX := Float'Value(sVector(iStart .. iStop));

      iStart := iStop + 2;
      iStop := Text_Handling.iFind_Next(sText            => sVector,
                                        cCharacterToFind => ',',
                                        iStartFromIndex  => iStart) - 1;
      fY := Float'Value(sVector(iStart .. iStop));

      iStart := iStop + 2;
      iStop := Text_Handling.iFind_Next(sText            => sVector,
                                        cCharacterToFind => ']',
                                        iStartFromIndex  => iStart) - 1;
      fZ := Float'Value(sVector(iStart .. iStop));

      return Math.Vectors.xCreate(fX => fX,
                                  fY => fY,
                                  fZ => fZ);
   end xGet_Vector_From_String;



end Parser;
