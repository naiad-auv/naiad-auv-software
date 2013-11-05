
pragma Style_Checks (Off);

-- This code handles basic digital IO

-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-02

with Interfaces;
use Interfaces;

package Digital_IO is

   procedure Make_Output_Pin	(u8Pin : Interfaces.Unsigned_8);
   procedure Make_Input_Pin	(u8Pin : Interfaces.Unsigned_8);
   procedure Clear_Pin		(u8Pin : Interfaces.Unsigned_8);
   procedure Set_Pin		(u8Pin : Interfaces.Unsigned_8);
   function bRead_Pin		(u8Pin : Interfaces.Unsigned_8) return Boolean;

end Digital_IO;
