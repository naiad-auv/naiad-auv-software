
pragma Style_Checks (Off);

-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-02

with AVR.AT90CAN128;

package body Digital_IO is

   pragma Suppress (All_Checks);

   procedure Make_Input_Pin(u8Pin : Unsigned_8) is
   begin
      case u8Pin is
         when 0 =>
             AVR.AT90CAN128.DDRA.Bit_0 := False;
         when 1 =>
             AVR.AT90CAN128.DDRA.Bit_1 := False;
         when 2 =>
             AVR.AT90CAN128.DDRA.Bit_2 := False;
         when 3 =>
             AVR.AT90CAN128.DDRA.Bit_3 := False;
         when 4 =>
             AVR.AT90CAN128.DDRA.Bit_4 := False;
         when 5 =>
             AVR.AT90CAN128.DDRA.Bit_5 := False;
         when 6 =>
             AVR.AT90CAN128.DDRA.Bit_6 := False;
         when 7 =>
             AVR.AT90CAN128.DDRA.Bit_7 := False;
         when others =>  --will never happen
            null;
      end case;
   end Make_Input_Pin;

   procedure Make_Output_Pin(u8Pin : Unsigned_8) is
   begin
      case u8Pin is
         when 0 =>
             AVR.AT90CAN128.DDRA.Bit_0 := True;
         when 1 =>
             AVR.AT90CAN128.DDRA.Bit_1 := True;
         when 2 =>
             AVR.AT90CAN128.DDRA.Bit_2 := True;
         when 3 =>
             AVR.AT90CAN128.DDRA.Bit_3 := True;
         when 4 =>
             AVR.AT90CAN128.DDRA.Bit_4 := True;
         when 5 =>
             AVR.AT90CAN128.DDRA.Bit_5 := True;
         when 6 =>
             AVR.AT90CAN128.DDRA.Bit_6 := True;
         when 7 =>
             AVR.AT90CAN128.DDRA.Bit_7 := True;
         when others =>  --will never happen
            null;
      end case;
   end Make_Output_Pin;

   procedure Clear_Pin(u8Pin : Unsigned_8) is
   begin
      case u8Pin is
         when 0 =>
             AVR.AT90CAN128.PORTA.Bit_0 := False;
         when 1 =>
             AVR.AT90CAN128.PORTA.Bit_1 := False;
         when 2 =>
             AVR.AT90CAN128.PORTA.Bit_2 := False;
         when 3 =>
             AVR.AT90CAN128.PORTA.Bit_3 := False;
         when 4 =>
             AVR.AT90CAN128.PORTA.Bit_4 := False;
         when 5 =>
             AVR.AT90CAN128.PORTA.Bit_5 := False;
         when 6 =>
             AVR.AT90CAN128.PORTA.Bit_6 := False;
         when 7 =>
             AVR.AT90CAN128.PORTA.Bit_7 := False;
         when others =>  --will never happen
            null;
      end case;
   end Clear_Pin;

   procedure Set_Pin(u8Pin : Unsigned_8) is
   begin
      case u8Pin is
         when 0 =>
             AVR.AT90CAN128.PORTA.Bit_0 := True;
         when 1 =>
             AVR.AT90CAN128.PORTA.Bit_1 := True;
         when 2 =>
             AVR.AT90CAN128.PORTA.Bit_2 := True;
         when 3 =>
             AVR.AT90CAN128.PORTA.Bit_3 := True;
         when 4 =>
             AVR.AT90CAN128.PORTA.Bit_4 := True;
         when 5 =>
             AVR.AT90CAN128.PORTA.Bit_5 := True;
         when 6 =>
             AVR.AT90CAN128.PORTA.Bit_6 := True;
         when 7 =>
             AVR.AT90CAN128.PORTA.Bit_7 := True;
         when others =>  --will never happen
            null;
      end case;
   end Set_Pin;

   function bRead_Pin(u8Pin : Unsigned_8) return Boolean is
   begin
      case u8Pin is
         when 0 =>
            return( AVR.AT90CAN128.PINA.Bit_0);
         when 1 =>
            return( AVR.AT90CAN128.PINA.Bit_1);
         when 2 =>
            return( AVR.AT90CAN128.PINA.Bit_2);
         when 3 =>
            return( AVR.AT90CAN128.PINA.Bit_3);
         when 4 =>
            return( AVR.AT90CAN128.PINA.Bit_4);
         when 5 =>
            return( AVR.AT90CAN128.PINA.Bit_5);
         when 6 =>
            return( AVR.AT90CAN128.PINA.Bit_6);
         when 7 =>
            return( AVR.AT90CAN128.PINA.Bit_7);
         when others =>  --will never happen
            return False;
      end case;
   end bRead_Pin;


end Digital_IO;
