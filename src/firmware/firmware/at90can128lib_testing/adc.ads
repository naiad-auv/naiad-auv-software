
-- Handles the ADC for the AT90CAN. This code is based on code from the Vasa project.
-- Changes have been made since the interrupt service routine was incorrect
-- When initializing the code one sets which channels to read.
-- This way one can read only those channels one wants.

-- Edits by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-10


with AVR.AT90CAN128;
--use  AVR.AT90CAN128;
with Interfaces; --use Interfaces;

package ADC is

 --  type TPin is Integer range 0..7;
 --  type TChannelSelection is array(TPin) of Boolean;
   type TChannelSelection is array(0..7) of Boolean;

   procedure ADC_Init;  --activates all channels
   procedure ADC_Init(selection : TChannelSelection); --activates channels according to selection

   function Get (Ch : AVR.AT90CAN128.Channel_type) return interfaces.Unsigned_16;

private
   Data : array (0..7) of Interfaces.Unsigned_16 := (others => 42);

   procedure ADC_Interrupt;

   pragma Machine_Attribute (ADC_Interrupt, "signal");
   pragma Export (C, ADC_Interrupt, AVR.AT90CAN128.Vector_ADC);

   procedure Change_Channel(currentChannel : Integer);

end ADC;
