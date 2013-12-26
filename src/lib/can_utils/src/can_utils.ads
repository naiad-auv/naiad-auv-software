
---------------------------------------------------------------------------
-- This code handle functionalities that will be on both the CAN-link
-- firmware and in the BBB's drivers for communications with the CAN-link.
-- This code is partially based on code from the Vasa project.

-- Since this protocol is the slowest part of the can network, it has been
-- optimized by removing some of the bytes in the header. Checksum and the
-- 'bustype' bytes are removed for speed. The checksum was only a checksum
-- of the data (not the header) and there would always only be one type of
-- message making the 'bustype' byte redundant.

-- The out parameters regarding checksums are kept for compatibility but
-- will allways indicate a correct checksum.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-28

---------------------------------------------------------------------------

with Interfaces;
with CAN_Defs;

package CAN_Utils is

   --the length of  the Header of the packet
   HEADLEN       : constant integer    := 5;

   procedure Bytes_To_Message_Header(sBuffer : String; msg : in out CAN_Defs.CAN_Message; u8SpecifiedChecksum : out Interfaces.Unsigned_8);

   procedure Bytes_To_Message_Data  (sBuffer : String; msg : in out CAN_Defs.CAN_Message; u8ActualChecksum : out Interfaces.Unsigned_8);

   procedure Message_To_Bytes(sBuffer : out String; msg :CAN_Defs.CAN_Message);

private

   -- The first byte contains the length of the data and the type of ID (extended or not) of the can message
   HEADER_INFO_POS  : constant Integer := 1;

   MSG_TYPE_MASK : constant Interfaces.Unsigned_8 := 16;
   MSG_LEN_MASK  : constant Interfaces.Unsigned_8 := 15;

   -- ID of data should be put in 2nd to 5th bytes
   IDHIGH_POS    : constant integer    := 2;

   function  Calculate_Checksum(b8Data : CAN_Defs.Byte8; Len : CAN_Defs.DLC_Type) return Interfaces.Unsigned_8;

end CAN_Utils;
