
-- Handles the ADC for the AT90CAN. This code is based on code from the Vasa project.
-- Changes have been made since the interrupt service routine was incorrect
-- When initializing the code one sets which channels to read.
-- This way one can read only those channels one wants.

-- Edits by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-11

with System.Machine_Code;

package body ADC is
   pragma suppress (All_Checks);

   channelSelection : TChannelSelection;

   procedure ADC_Interrupt is
      use AVR.AT90CAN128;
   begin
      if ADMUX.MUX = 0 then         -- Channel 0
         Data(0) := ADC_Data;
      elsif ADMUX.MUX = 1 then      -- Channel 1
         Data(1) := ADC_Data;
      elsif ADMUX.MUX = 2 then      -- Channel 2
         Data(2) := ADC_Data;
      elsif ADMUX.MUX = 3 then      -- Channel 3
         Data(3) := ADC_Data;
      elsif ADMUX.MUX = 4 then      -- Channel 4
         Data(4) := ADC_Data;
      elsif ADMUX.MUX = 5 then      -- Channel 5
         Data(5) := ADC_Data;
      elsif ADMUX.MUX = 6 then      -- Channel 6
         Data(6) := ADC_Data;
      elsif ADMUX.MUX = 7 then      -- Channel 7
         Data(7) := ADC_Data;
      end if;

      Change_Channel(Integer(ADMUX.MUX));

      AVR.AT90CAN128.ADCSRA.Bit_6 := True; --Start ADC conversion
   end ADC_Interrupt;

   function Get (Ch : AVR.AT90CAN128.Channel_type) return interfaces.Unsigned_16 is
      use System.Machine_Code;
      Result : Interfaces.Unsigned_16;
   begin
      Asm ("cli", Volatile => True, Clobber => "memory");
      Result := Data (integer(Ch));
   --   Asm ("sei", Volatile => True, Clobber => "memory");
      return Result;
   end Get;

   ---------------------------------------
   --Initialization for ADC registers ----
   ---------------------------------------

   procedure ADC_Init(selection : TChannelSelection) is
      bStart : Boolean;
   begin
      channelSelection := selection;

      for i in 0..7 loop --makes sure at least one instance of selection was true, i.e. that a channel is activated
         if channelSelection(i) then
            bStart := true;
            exit;
         end if;
      end loop;

      if bStart then
--           AVR.AT90CAN128.ADMUX.Refs := 0; -- Use AREF pin as reference
--           AVR.AT90CAN128.ADMUX.MUX := 0;  -- Start conversion on channel 0
--           AVR.AT90CAN128.ADMUX.ADLAR := False;  -- Right adjusted result
--
--           AVR.AT90CAN128.ADCSRA := (True, False, True, False, True, True, True, True);
--           --         ADEN  ADSC  ADATE  ADIF   ADIE  ADPS2  ADPS1 ADPS0
--       --    System.Machine_Code.Asm ("sei", Volatile => True);
--           AVR.AT90CAN128.ADCSRA.Bit_6 := True; --Start conversion
         null;
      end if;
   end ADC_Init;


   procedure ADC_Init is
      selection : TChannelSelection;
   begin
      selection(0) := true;
      selection(1) := true;
      selection(2) := true;
      selection(3) := true;
      selection(4) := true;
      selection(5) := true;
      selection(6) := true;
      selection(7) := true;
      ADC_Init(selection);
   end ADC_Init;

   procedure Change_Channel(currentChannel : Integer) is
   begin
      if channelSelection((currentChannel + 1) rem 8) then
         AVR.AT90CAN128.ADMUX.MUX := AVR.AT90CAN128.Channel_Type((currentChannel + 1) rem 8);
      else
         Change_Channel((currentChannel + 1) rem 8);
      end if;
   end Change_Channel;
end ADC;
