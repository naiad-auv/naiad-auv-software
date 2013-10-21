
---------------------------------------------------------------------------
-- This code handles communication between the BeagleBone Black (BBB) and
-- the CAN-link
-- This code is loosly based on the router.adb file from the Vasa project.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-17

-- TODO: Unit testing, hardware testing
---------------------------------------------------------------------------



with Interfaces;

package BBB_CAN is

   -- copy from AVR.AT90CAN128
   type DLC_Type is range 0..8;
   for DLC_Type'size use 4;
   -- end of copy from AVR.AT90CAN128

   -- copy from AVR.AT90CAN128.CAN
   type Baud_Rate is (K100,K125,K200, K250, K500, M1);
   Default_Speed : constant Baud_Rate := K250;
   type CAN_ID is range 0..2047;
   type Byte8 is array (DLC_Type range 1..8) of Interfaces.Unsigned_8;

   type CAN_Message is record
      ID   : CAN_ID;
      Len  : DLC_Type;
      Data : Byte8;
   end record;
   -- end of copy from AVR.AT90CAN128.CAN

   --the length of  the Header of the packet is 5
   HEADLEN       : constant Integer    := 5;

   -- Maximum length of data is 8 (excluding the the header of the packet)
   MAX_DATALEN   : constant DLC_Type   := 8;

   -- Data type should be put in the 1st byte to indicate that
   -- the data packet is CAN bus data (3), or a handshake (0)
   BUSTYPE_POS   : constant Integer    := 1;

   -- ID of data should be put in 2nd and 3rd byte
   IDHIGH_POS    : constant Integer    := 2;
   IDLOW_POS     : constant Integer    := 3;

   -- The length of data should be put in 4th byte
   LEN_POS       : constant Integer    := 4;

   --Checksum should be put in the 5th byte
   CHECKSUM_POS  : constant Integer    := 5;

   iHANDSHAKE_WAIT_TIME_MS : constant Integer := 200;

   procedure Init;

   -- Tries a handshake, if no answer is received after iHANDSHAKE_WAIT_TIME_MS it returns false
   -- if handshake was successful, true is returned
   function Handshake return Boolean;

   procedure Send(msg : CAN_Message);

   -- Tries to return a CAN message
   -- bUARTChecksumOK returns false if there was an error in the data transfer over the UART
   procedure Get(msg : out CAN_Message; bMsgReceived : out Boolean; bUARTChecksumOK : out Boolean);


private

   procedure Bytes_To_Message(sBuffer : String; msg : out CAN_Message; bCheckSumCorrect : out Boolean);

   procedure Message_To_Bytes(sBuffer : out String; msg : CAN_Message);

   function Calculate_Checksum(b8Data : Byte8; Len : DLC_Type) return Interfaces.Unsigned_8;

   procedure Usart_Read(sBuffer : out String; iSize : Integer; iBytesRead : out Integer);

   procedure Usart_Write(sBuffer : String; iSize : Integer);


end BBB_CAN;
