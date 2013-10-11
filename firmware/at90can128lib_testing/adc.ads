
-- This code comes from the Vasa Project

with AVR.AT90CAN128;
use  AVR.AT90CAN128;
with Interfaces; use Interfaces;

package ADC is

   Data : array (0..7) of Unsigned_16 := (others => 42);

   procedure ADC_Interrupt;
   pragma Machine_Attribute (ADC_Interrupt, "signal");
   pragma Export (C, ADC_Interrupt, Vector_ADC);

   procedure ADC_Init;
   function Get (Ch : Channel_type) return Interfaces.Unsigned_16;

end ADC;
