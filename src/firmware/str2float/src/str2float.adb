
---------------------------------------------------------------------------
-- This code implements string to float conversion.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-19

-- TODO:
---------------------------------------------------------------------------


package body Str2Float is

   function fChar2Float(cChar : Character) return float is
   begin
      return Float(
                   Character'Pos(cChar) -
                     Character'Pos('0'));
   end fChar2Float;


   function fStr2Float(sStr : String) return Float is
      iIndex : integer := sStr'First;

      fValue : float := 1.0;

      fRet : float;

   begin

      if sStr(iIndex) = '+' then
         fRet := +1.0;
         iIndex := 2;
      elsif sStr(iIndex) = '-' then
         fRet := -1.0;
         iIndex := 2;
      else
         fRet := +1.0;
         iIndex := 1;
      end if;

      while sStr(iIndex) /= '.' loop
         fRet := fRet * fValue + fChar2Float(sStr(iIndex));

         iIndex := iIndex + 1;
         fValue := fValue * 10.0;
      end loop;

      fValue := 0.1;

      for i in iIndex..sStr'Last loop
         fRet := fRet + fChar2Float(sStr(i)) * fValue;
         fValue := fValue / 10.0;
      end loop;

      return fRet;
   end fStr2Float;

end Str2Float;
