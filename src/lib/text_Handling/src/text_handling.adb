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


end Text_Handling;
