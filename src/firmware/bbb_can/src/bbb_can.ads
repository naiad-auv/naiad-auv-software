
---------------------------------------------------------------------------
-- This code handles communication between the BeagleBone Black (BBB) and
-- the CAN-link
-- This code is loosly based on the router.adb file from the Vasa project.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-01

-- TODO: Hardware testing
---------------------------------------------------------------------------

with CAN_Defs;
--  with AVR.AT90CAN128;
--  with AVR.AT90CAN128.CAN;
with UartWrapper;
with GNAT.Serial_Communications;

with Interfaces;

package BBB_CAN is

   iHANDSHAKE_WAIT_TIME_MS : constant Integer := 200;

   procedure Init(sPort : String; baud : UartWrapper.BaudRates);

   -- Tries a handshake, if no answer is received after iHANDSHAKE_WAIT_TIME_MS it returns false
   -- if handshake was successful, true is returned
 --  function Handshake return Boolean;

   procedure Send(msg : CAN_Defs.CAN_Message);

   -- Tries to return a CAN message
   -- bUARTChecksumOK returns false if there was an error in the data transfer over the UART
   procedure Get(msg : out CAN_Defs.CAN_Message; bMsgReceived : out Boolean; bUARTChecksumOK : out Boolean);


private

   procedure Usart_Read(sBuffer : out String; iSize : Integer; bBytesRead : out Boolean);

   procedure Usart_Write(sBuffer : String; iSize : Integer);

   procedure Usart_Read_Inf_Block(sBuffer : out String; iSize : Integer);

end BBB_CAN;
