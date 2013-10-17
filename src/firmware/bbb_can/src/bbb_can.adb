
---------------------------------------------------------------------------
-- This code handles communication between the BeagleBone Black (BBB) and
-- the CAN-link
-- This code is loosly based on the router.adb file from the Vasa project.

-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-17

-- TODO: Unit testing, hardware testing
---------------------------------------------------------------------------

package body BBB_CAN is
   pragma Suppress (All_Checks);

   procedure Init is
   begin
      null;
   end Init;

   function Handshake return Boolean is
      sBuffer : String(1..HEADLEN);
   begin
      sBuffer(1) := Character'Val(3);
      sBuffer(2) := Character'Val(0);
      sBuffer(3) := Character'Val(0);
      sBuffer(4) := Character'Val(0);
      sBuffer(5) := Character'Val(0);
      Usart_Write(sBuffer, HEADLEN);   --sends handshake message

      --wait for bytes 3, 0, 0, 0, 0 while keeping a look at the clock

      return false;
   end Handshake;

   procedure Send(msg : CAN_Message) is
      sBuffer : String(1..Integer(msg.Len)+HEADLEN);
   begin
      Message_To_Bytes(sBuffer, msg);

      Usart_Write(sBuffer, Integer(msg.Len));
   end Send;

   procedure Get(msg : out CAN_Message; bMsgReceived : out Boolean) is
   begin
      null;
   end Get;

   --------- private functions -------------------------------------

   procedure Bytes_To_Message(sBuffer : String; msg : out CAN_Message; bCheckSumCorrect : out Boolean) is
   begin
      msg.ID := CAN_ID(
                       (Character'Pos(sBuffer(IDHIGH_POS)) * 256)
                       + Character'Pos(sBuffer(IDLOW_POS)));

      msg.Len := Character'Pos(sBuffer(LEN_POS));

      for I in 1..msg.Len loop
         Msg.Data(I) := Interfaces.Unsigned_8(
                                              Character'Pos(
                                                sBuffer(HEADLEN + Integer(I))));
      end loop;

      bCheckSumCorrect :=  Character'Pos(sBuffer(CHECKSUM_POS)) = Integer(Calculate_Checksum(msg.Data, msg.Len));

   end Bytes_To_Message;

   procedure Message_To_Bytes(sBuffer : out String; msg : CAN_Message) is
      iDataLength : Integer := Integer(msg.Len);
   begin
      sBuffer(BUSTYPE_POS) := Character'Val(0);
      sBuffer(IDHIGH_POS)  := Character'Val(Integer(msg.ID) / 256);
      sBuffer(IDLOW_POS)   := Character'Val(Integer(Msg.ID) Mod 256);
      sBuffer(LEN_POS) 	   := Character'Val(Integer(msg.Len));

      if Integer(msg.Len) > 0 then
         for I in 1..Integer(msg.Len) loop
            sBuffer(HEADLEN + I) := Character'Val(Msg.Data ( DLC_Type(I)));
         end loop;
      end if;

      sBuffer(CHECKSUM_POS) := Character'Val(Integer(Calculate_Checksum(Msg.Data, msg.Len)));

   end Message_To_Bytes;

   procedure Usart_Write(Buffer : String; iSize: Integer) is
   begin
      null;
   end Usart_Write;

   procedure Usart_Read(Buffer : out String; iSize : Integer) is
   begin
      null;
   end Usart_Read;

   function Calculate_Checksum(b8Data : Byte8; Len : DLC_Type) return Interfaces.Unsigned_8 is
      Checksum : Interfaces.Unsigned_8 := 0;
      use Interfaces;
   begin
      for I in 1..Len loop
         Checksum := Checksum xor b8Data(I);
      end loop;
      return Checksum;
   end Calculate_Checksum;

   end BBB_CAN;
