
---------------------------------------------------------------------------
-- This code implements string to float conversion.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-24

-- TODO: Unit testing
---------------------------------------------------------------------------


package Str2Float is

   function fStr2Float(sStr : String) return Float;

private
   function fChar2Float(cChar : Character) return float;

end Str2Float;
