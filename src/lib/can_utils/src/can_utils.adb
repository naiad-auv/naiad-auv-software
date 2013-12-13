---------------------------------------------------------------------------
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-13
---------------------------------------------------------------------------


package body CAN_Utils is
   pragma Suppress (All_Checks);

   function Calculate_Checksum(b8Data : CAN_Defs.Byte8; Len : CAN_Defs.DLC_Type) return Interfaces.Unsigned_8 is
      Checksum : Interfaces.Unsigned_8 := 0;
      use Interfaces;
   begin
      for I in 1..Len loop
         Checksum := Checksum xor b8Data(I);
      end loop;
      return Checksum;
   end Calculate_Checksum;


   procedure Bytes_To_Message_Header(sBuffer : String; msg : in out CAN_Defs.CAN_Message; u8SpecifiedChecksum : out Interfaces.Unsigned_8) is
      use Interfaces;
   begin
      msg.ID.isExtended := (Interfaces.Unsigned_8(Character'Pos(sBuffer(HEADER_INFO_POS)))
                            and MSG_TYPE_MASK) /= Interfaces.Unsigned_8(0);

      msg.ID.Identifier :=
        CAN_Defs.CAN_Identifier(
                                Standard.Long_Integer(Character'Pos(sBuffer(sBuffer'First + IDHIGH_POS - 1))     * Standard.Long_Integer(16777216)) +
                                Standard.Long_Integer(Character'Pos(sBuffer(sBuffer'First + IDHIGH_POS)) 	 * Standard.Long_Integer(65536)) +
                                Standard.Long_Integer(Character'Pos(sBuffer(sBuffer'First + IDHIGH_POS + 1)) 	 * Standard.Long_Integer(256)) +
                                Standard.Long_Integer(Character'Pos(sBuffer(sBuffer'First + IDHIGH_POS + 2))));

      msg.Len := CAN_Defs.DLC_Type(
                                   Interfaces.Unsigned_8(Character'Pos(sBuffer(HEADER_INFO_POS)))
                                   and MSG_LEN_MASK);

      u8SpecifiedChecksum := Interfaces.Unsigned_8(0);
   end Bytes_To_Message_Header;


   procedure Bytes_To_Message_Data(sBuffer : String;
                                   msg : in out CAN_Defs.CAN_Message; u8ActualChecksum : out Interfaces.Unsigned_8) is
      -- sBuffer shall only contain the data, not the header
   begin
      for i in 1..msg.Len loop
         msg.Data(i) := Interfaces.Unsigned_8(Character'Pos(sBuffer(Integer(i))));
      end loop;

      u8ActualChecksum :=  Interfaces.Unsigned_8(0);
   end Bytes_To_Message_Data;

   procedure Message_To_Bytes(sBuffer : out String; msg : CAN_Defs.CAN_Message) is
      iDataLength : Integer := Integer(msg.Len);
   begin
      if msg.ID.isExtended then
         sBuffer(HEADER_INFO_POS) := Character'Val(Integer(msg.Len) + Integer(MSG_TYPE_MASK));
      else
         sBuffer(HEADER_INFO_POS) := Character'Val(Integer(msg.Len));
      end if;


      sBuffer(sBuffer'First + IDHIGH_POS - 1)   := Character'Val(Standard.Long_Integer(Msg.ID.Identifier) / Standard.Long_Integer(16777216));
      sBuffer(sBuffer'First + IDHIGH_POS) 	:= Character'Val(Standard.Long_Integer(Msg.ID.Identifier) / Standard.Long_Integer(65536));
      sBuffer(sBuffer'First + IDHIGH_POS + 1) 	:= Character'Val(Standard.Long_Integer(Msg.ID.Identifier) / Standard.Long_Integer(256));
      sBuffer(sBuffer'First + IDHIGH_POS + 2) 	:= Character'Val(Standard.Long_Integer(Msg.ID.Identifier) Mod Standard.Long_Integer(256));

      if Integer(msg.Len) > 0 then
         for I in 1..Integer(msg.Len) loop
            sBuffer(HEADLEN + I) := Character'Val(Msg.Data ( CAN_Defs.DLC_Type(I)));
         end loop;
      end if;
   end Message_To_Bytes;
end CAN_Utils;
