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

end Text_Handling;
