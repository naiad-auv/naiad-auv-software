
with Interfaces;
with AVR.AT90CAN128;
with AVR.AT90CAN128.CAN;

package CAN_Link_Utils is

   --the length of  the Header of the packet is 5
   HEADLEN       : constant integer    := 5;

   -- Maximum length of data is 8 (excluding the the header of the packet)
   MAX_DATALEN   : constant AVR.AT90CAN128.DLC_Type   := 8;

   -- Data type should be put in the 1st byte to indicate that
   -- the data packet is CAN bus data or handshake
   -- (handshake isn't used at the time so this byte will always be 0)
   BUSTYPE_POS   : constant Integer    := 1;

   -- ID of data should be put in 2nd to 5th byte
   IDHIGH_POS    : constant integer    := 2;

   -- The 6th byte will be 0 for non extended message
   -- and 1 for extended messsage
   MSG_TYPE_POS  : constant Integer := 6;

   -- The length of data should be put in 7th byte
   LEN_POS       : constant integer    := 7;

   --Checksum should be put in the 8th byte
   CHECKSUM_POS  : constant integer    := 8;

  -- CAN_DATA      : constant Interfaces.Unsigned_8 	:= 16#00#;

   function  Calculate_Checksum(b8Data : AVR.AT90CAN128.CAN.Byte8; Len : AVR.AT90CAN128.DLC_Type) return Interfaces.Unsigned_8;

   procedure Bytes_To_Message_Header(sBuffer : String; msg : in out AVR.AT90CAN128.CAN.CAN_Message);

   procedure Bytes_To_Message_Data  (sBuffer : String; msg : in out AVR.AT90CAN128.CAN.CAN_Message; bCheckSumCorrect : out Boolean);

   procedure Message_To_Bytes(sBuffer : out String; msg : AVR.AT90CAN128.CAN.CAN_Message);

end CAN_Link_Utils;
