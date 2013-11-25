
---------------------------------------------------------------------------
-- This code implements string to float conversion.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-24

-- TODO:
---------------------------------------------------------------------------

with Ada.Text_IO;

package body Str2Float is

   function fChar2Float(cChar : Character) return float is
   begin
      return Float(Character'Pos(cChar) -
                     Character'Pos('0'));
   end fChar2Float;

   function fStr2Float(sStr : String) return Float is
      iIndex : integer := sStr'First;
      fValue : float := 1.0;
      fRet : float := 0.0;
      fSign : float;
   begin

      if sStr(iIndex) = '+' then
         fSign := +1.0;
         iIndex := iIndex + 1;
      elsif sStr(iIndex) = '-' then
         fSign := -1.0;
         iIndex := iIndex + 1;
      else
         fSign := +1.0;
      end if;

      while sStr(iIndex) /= '.' loop
         fRet := fRet * 10.0 + fChar2Float(sStr(iIndex));

         iIndex := iIndex + 1;
      end loop;

      iIndex := iIndex + 1;
      fValue := 0.1;

      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line("fRet=" & fRet'Img);

      for i in iIndex..sStr'Last loop
         fRet := fRet + fChar2Float(sStr(i)) * fValue;
         declare
            f : float := fChar2Float(sStr(i)) * fValue;
         begin
            Ada.Text_IO.Put_Line("fChar2Float(sStr(i)) * fValue=" & f'Img);
         end;

         fValue := fValue / 10.0;

         Ada.Text_IO.Put_Line("fRet=" & fRet'Img);
      end loop;

      return fRet * fSign;
   end fStr2Float;

end Str2Float;
