
package body CAN_Link_Utils is
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
   begin
      msg.ID.isExtended := sBuffer(MSG_TYPE_POS) /= Character'Val(0);

      msg.ID.Identifier :=
        CAN_Defs.CAN_Identifier(
                                          Standard.Long_Integer(Character'Pos(sBuffer(IDHIGH_POS))     * Standard.Long_Integer(16777216)) +
                                          Standard.Long_Integer(Character'Pos(sBuffer(IDHIGH_POS + 1)) * Standard.Long_Integer(65536)) +
                                          Standard.Long_Integer(Character'Pos(sBuffer(IDHIGH_POS + 2)) * Standard.Long_Integer(256)) +
                                          Standard.Long_Integer(Character'Pos(sBuffer(IDHIGH_POS + 3))));

      msg.Len := Character'Pos(sBuffer(LEN_POS));

      u8SpecifiedChecksum := Interfaces.Unsigned_8(Character'Pos(sBuffer(CHECKSUM_POS)));
   end Bytes_To_Message_Header;


   procedure Bytes_To_Message_Data(sBuffer : String;
                                   msg : in out CAN_Defs.CAN_Message; u8ActualChecksum : out Interfaces.Unsigned_8) is
      -- sBuffer shall only contain the data, not the header
   begin
      for i in 1..msg.Len loop
         msg.Data(i) := Interfaces.Unsigned_8(Character'Pos(sBuffer(Integer(i))));
      end loop;

      u8ActualChecksum :=  Calculate_Checksum(msg.Data, msg.Len);
   end Bytes_To_Message_Data;

   procedure Message_To_Bytes(sBuffer : out String; msg : CAN_Defs.CAN_Message) is
      iDataLength : Integer := Integer(msg.Len);
   begin
      sBuffer(BUSTYPE_POS) := Character'Val(0);

      sBuffer(IDHIGH_POS)     := Character'Val(Standard.Long_Integer(Msg.ID.Identifier) / Standard.Long_Integer(16777216));
      sBuffer(IDHIGH_POS + 1) := Character'Val(Standard.Long_Integer(Msg.ID.Identifier) / Standard.Long_Integer(65536));
      sBuffer(IDHIGH_POS + 2) := Character'Val(Standard.Long_Integer(Msg.ID.Identifier) / Standard.Long_Integer(256));
      sBuffer(IDHIGH_POS + 3) := Character'Val(Standard.Long_Integer(Msg.ID.Identifier) Mod Standard.Long_Integer(256));

      if msg.ID.isExtended then
         sBuffer(MSG_TYPE_POS) := Character'Val(1);
      else
         sBuffer(MSG_TYPE_POS) := Character'Val(0);
      end if;

      sBuffer(LEN_POS) 	   := Character'Val(Integer(msg.Len));

      if Integer(msg.Len) > 0 then
         for I in 1..Integer(msg.Len) loop
            sBuffer(HEADLEN + I) := Character'Val(Msg.Data ( CAN_Defs.DLC_Type(I)));
         end loop;
      end if;

      sBuffer(CHECKSUM_POS) := Character'Val(Integer(Calculate_Checksum(Msg.Data, msg.Len)));
   end Message_To_Bytes;
end CAN_Link_Utils;
