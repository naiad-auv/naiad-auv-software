with Ada.Float_Text_IO;

package body Text_Handling is

   function sGet_Formatted_Float_String(fValue : in float) return string is

      sOutputString : string(1..10);
   begin

      Ada.Float_Text_IO.Put(To   => sOutputString,
                            Item => fValue,
                            Aft  => 4,
                            Exp  => 0);

      return sOutputString;

   end sGet_Formatted_Float_String;

   function sGet_Upper_Case(sText : in string) return string is
      sReturnText : string := sText;
   begin
      for index in sText'Range loop
         if sText(index) >= 'a' and then sText(index) <= 'z' then
            sReturnText(index) := Character'Val(Character'Pos(sText(index)) + (Character'Pos('A') - Character'Pos('a')));
         else
            sReturnText(index) := sText(index);
         end if;
      end loop;
      return sReturnText;
   end sGet_Upper_Case;

   function sGet_Lower_Case(sText : in string) return string is
      sReturnText : string := sText;
   begin
      for index in sText'Range loop
         if sText(index) >= 'A' and then sText(index) <= 'Z' then
            sReturnText(index) := Character'Val(Character'Pos(sText(index)) - (Character'Pos('A') - Character'Pos('a')));
         else
            sReturnText(index) := sText(index);
         end if;
      end loop;
      return sReturnText;
   end sGet_Lower_Case;

   function iFind_Next(sText : in string; cCharacterToFind : in character; iStartFromIndex : in integer) return integer is
   begin
      for i in iStartFromIndex .. sText'Length loop
         if sText(i) = cCharacterToFind then
            return i;
         end if;
      end loop;
      return -1;
   end iFind_Next;

   function bIs_White_Space(cCharacter : in character) return boolean is
   begin
      return cCharacter = ASCII.HT or cCharacter = ' ' or cCharacter = ASCII.CR or cCharacter = ASCII.LF;
   end bIs_White_Space;

   function iCount_White_Spaces(sText : in string) return integer is
      iWhiteSpaces : integer := 0;
   begin
      for i in sText'Range loop
         if bIs_White_Space(sText(i)) then
            iWhiteSpaces := iWhiteSpaces + 1;
         end if;
      end loop;
      return iWhiteSpaces;
   end iCount_White_Spaces;



   function sRemove_White_Spaces(sText : in string) return string is
      sNewText : string(1 .. sText'Length - iCount_White_Spaces(sText => sText));
      iWhiteSpaces : integer := 0;
   begin
      for i in sNewText'Range loop
         while bIs_White_Space(sText(i + iWhiteSpaces)) loop
            iWhiteSpaces := iWhiteSpaces + 1;
         end loop;
         sNewText(i) := sText(i + iWhiteSpaces);
      end loop;
      return sNewText;
   end sRemove_White_Spaces;


end Text_Handling;
