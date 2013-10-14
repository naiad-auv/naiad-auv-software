

-- E.C. Circuit 3.0 salinity sensor
-- This code handles the UART communication with the E.C. Circuit 3.0 salinity sensor.
-- This code is largely based on the AT90CAN128.UART code. The reason that
-- AT90CAN128.UART isn't used with a "with" statement is that this code needs to
-- do some more things in the interrupt routines.

-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-02

-- TODO: Test everything...


with Interfaces;

package Salinity_Sensor is

   type USARTID is (USART0,USART1);

   --Initiates the sensor. The temperature of the water needs to be given to the salinity sensor.
   --The temperature should be on the format "TT.T", for example "23.5"
   --Ensure that this code is the only code using this UART port, or things will go bad. You have been warned...
   procedure Initate_Salinity_Sensor(Port : USARTID; sTemperature : String);

   -- Get the last reading of salinity. The value is given on the practical salinity scale.
   -- If the value is out of range, or if the wrong probe (with regard to salinity in the water) is used,
   -- the value 255 will be returned.
   -- If the value 254 is returned, no conversion has not yet been done (this indicates an error)
   function Get_Salinity return Interfaces.Unsigned_8;

   --Tells the salinity sensor of a new updated water temperature
   --temperature should be on the format "TT.T", for example "23.5"
   procedure Set_Temperature(sTemperature : String);

private ------------------------------------------------

   --  handles the new messages from the sensor, is run when a carrage return has benn received
   procedure Message_Received;

   -- ---- <copy paste from avr-at90can-usart> ------------------------

   --puts a character into the send buffer
   function Put
     (Item : Character) return Boolean;

   --  Write: Send the data to the USARTs
   -- Parameters:
   --            Buffer: the Data is going to be sent.
   --            Size  : denote how many data should be send.
   -- Return value:
   --               How many data have been actually sent out
   function Write
     (Buffer : String;
      Size   : Positive) return Integer;

   -- Get_Char: Read one byte from the USARTs
   -- Parameters:
   --            Ch(out)     : the character which read from USARTS..
   --           Return(out)  : this function will return True if at least one byte is available.
   --                          otherwise it will will be False.
   procedure Get_Char (Ch : out Character; Ret : out Boolean);

   -- ---- <end of copy paste from avr-at90can-usart> -----------------
end Salinity_Sensor;
