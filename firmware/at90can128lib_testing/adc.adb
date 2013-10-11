
-- This code comes from the Vasa Project

with System.Machine_Code;

package body ADC is
   pragma suppress (All_Checks);

   procedure ADC_Interrupt is
   begin
      if ADMUX.MUX = 0 then         -- Channel 0
         Data(0)    := ADC_Data;
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
      ADCSRA.Bit_6 := True; --Start ADC conversion
   end ADC_Interrupt;

   function Get (Ch : Channel_type) return interfaces.Unsigned_16 is
      use System.Machine_Code;
      Result : Unsigned_16;
   begin
      Asm ("cli", Volatile => True, Clobber => "memory");
      Result := Data (integer(Ch));
  --    Asm ("sei", Volatile => True, Clobber => "memory");
      return Result;
   end Get;

   ---------------------------------------
   --Initialization for ADC registers ----
   ---------------------------------------
   procedure ADC_Init is
   begin
      ADMUX.Refs := 0; -- Use AREF pin as reference
      ADMUX.MUX := 0;  -- Start conversion on channel 0
      ADMUX.ADLAR := False;  -- Right adjusted result

      ADCSRA := (True, False, True, False, True, True, True, True);
      --         ADEN  ADSC  ADATE  ADIF   ADIE  ADPS2  ADPS1 ADPS0
    --  System.Machine_Code.Asm ("sei", Volatile => True);
      ADCSRA.Bit_6 := True; --Start conversion
   end ADC_Init;

   begin

   null; --   ADC_Init; --  for debugging purposes

end ADC;
