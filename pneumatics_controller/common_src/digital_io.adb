
-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-09-25

with AVR.AT90CAN128;
use AVR.AT90CAN128;

package body Digital_IO is

   procedure Make_Input_Pin(u8Pin : Unsigned_8) is
   begin
      case u8Pin is
         when 0 =>
            DDRA.Bit_0 := False;
         when 1 =>
            DDRA.Bit_1 := False;
         when 2 =>
            DDRA.Bit_2 := False;
         when 3 =>
            DDRA.Bit_3 := False;
         when 4 =>
            DDRA.Bit_4 := False;
         when 5 =>
            DDRA.Bit_5 := False;
         when 6 =>
            DDRA.Bit_6 := False;
         when 7 =>
            DDRA.Bit_7 := False;
         when others =>  --will never happen
            null;
      end case;
   end Make_Input_Pin;

   procedure Make_Output_Pin(u8Pin : Unsigned_8) is
   begin
      case u8Pin is
         when 0 =>
            DDRA.Bit_0 := True;
         when 1 =>
            DDRA.Bit_1 := True;
         when 2 =>
            DDRA.Bit_2 := True;
         when 3 =>
            DDRA.Bit_3 := True;
         when 4 =>
            DDRA.Bit_4 := True;
         when 5 =>
            DDRA.Bit_5 := True;
         when 6 =>
            DDRA.Bit_6 := True;
         when 7 =>
            DDRA.Bit_7 := True;
         when others =>  --will never happen
            null;
      end case;
   end Make_Output_Pin;

   procedure Clear_Pin(u8Pin : Unsigned_8) is
   begin
      case u8Pin is
         when 0 =>
            PORTA.Bit_0 := False;
         when 1 =>
            PORTA.Bit_1 := False;
         when 2 =>
            PORTA.Bit_2 := False;
         when 3 =>
            PORTA.Bit_3 := False;
         when 4 =>
            PORTA.Bit_4 := False;
         when 5 =>
            PORTA.Bit_5 := False;
         when 6 =>
            PORTA.Bit_6 := False;
         when 7 =>
            PORTA.Bit_7 := False;
         when others =>  --will never happen
            null;
      end case;
   end Clear_Pin;

   procedure Set_Pin(u8Pin : Unsigned_8) is
   begin
      case u8Pin is
         when 0 =>
            PORTA.Bit_0 := True;
         when 1 =>
            PORTA.Bit_1 := True;
         when 2 =>
            PORTA.Bit_2 := True;
         when 3 =>
            PORTA.Bit_3 := True;
         when 4 =>
            PORTA.Bit_4 := True;
         when 5 =>
            PORTA.Bit_5 := True;
         when 6 =>
            PORTA.Bit_6 := True;
         when 7 =>
            PORTA.Bit_7 := True;
         when others =>  --will never happen
            null;
      end case;
   end Set_Pin;

   function bRead_Pin(u8Pin : Unsigned_8) return Boolean is
   begin
      case u8Pin is
         when 0 =>
            return(PinA.Bit_0);
         when 1 =>
            return(PinA.Bit_1);
         when 2 =>
            return(PinA.Bit_2);
         when 3 =>
            return(PinA.Bit_3);
         when 4 =>
            return(PinA.Bit_4);
         when 5 =>
            return(PinA.Bit_5);
         when 6 =>
            return(PinA.Bit_6);
         when 7 =>
            return(PinA.Bit_7);
         when others =>  --will never happen
            return False;
      end case;
   end bRead_Pin;


end Digital_IO;
