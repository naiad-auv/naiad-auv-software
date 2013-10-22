--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into BBB_CAN.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body BBB_CAN.Test_Data.Tests is


--  begin read only
   procedure Test_Init (Gnattest_T : in out Test);
   procedure Test_Init_bf9922 (Gnattest_T : in out Test) renames Test_Init;
--  id:2.1/bf992215ed679bf0/Init/1/0/
   procedure Test_Init (Gnattest_T : in out Test) is
   --  bbb_can.ads:58:4:Init
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Init;
--  end read only


--  begin read only
   procedure Test_Handshake (Gnattest_T : in out Test);
   procedure Test_Handshake_5f7b88 (Gnattest_T : in out Test) renames Test_Handshake;
--  id:2.1/5f7b883b90e04140/Handshake/1/0/
   procedure Test_Handshake (Gnattest_T : in out Test) is
   --  bbb_can.ads:62:4:Handshake
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (true,
         "Error: Handshake returned true.");

--  begin read only
   end Test_Handshake;
--  end read only


--  begin read only
   procedure Test_Send (Gnattest_T : in out Test);
   procedure Test_Send_006149 (Gnattest_T : in out Test) renames Test_Send;
--  id:2.1/0061498a7ec5ff43/Send/1/0/
   procedure Test_Send (Gnattest_T : in out Test) is
   --  bbb_can.ads:64:4:Send
--  end read only

      pragma Unreferenced (Gnattest_T);

      --msg : CAN_Message;
   begin

--        msg.Len := 8;
--        msg.ID := 100;
--        msg.Data := (1, 1, 1, 1, 1, 1, 1, 1);
     -- Send(msg);

      AUnit.Assertions.Assert
        (True, "");

--  begin read only
   end Test_Send;
--  end read only


--  begin read only
   procedure Test_Get (Gnattest_T : in out Test);
   procedure Test_Get_bd4d93 (Gnattest_T : in out Test) renames Test_Get;
--  id:2.1/bd4d931ac6ebed7e/Get/1/0/
   procedure Test_Get (Gnattest_T : in out Test) is
   --  bbb_can.ads:66:4:Get
--  end read only

      pragma Unreferenced (Gnattest_T);

      msg : CAN_Message;
      bMsgReceived : Boolean := false;
      bUARTChecksumOK : Boolean := false;
   begin

     -- Get(msg, bMsgReceived, bUARTChecksumOK);

      AUnit.Assertions.Assert
        (not bMsgReceived,
         "Function Get says it received a message.");

      AUnit.Assertions.Assert
        (not bUARTChecksumOK,
         "Function Get returned bUARTChecksumOK = true.");

--  begin read only
   end Test_Get;
--  end read only


--  begin read only
   procedure Test_Bytes_To_Message (Gnattest_T : in out Test);
   procedure Test_Bytes_To_Message_d4818d (Gnattest_T : in out Test) renames Test_Bytes_To_Message;
--  id:2.1/d4818d3e45de580c/Bytes_To_Message/1/0/
   procedure Test_Bytes_To_Message (Gnattest_T : in out Test) is
   --  bbb_can.ads:71:4:Bytes_To_Message
--  end read only

      pragma Unreferenced (Gnattest_T);
--      with bbb_can.ads;
      use Interfaces;

      msg : BBB_CAN.CAN_Message;
      sBytes : String(1..13);
      bChecksumOK : Boolean;
   begin

      sBytes(1) := Character'Val(3);
      sBytes(2) := Character'Val(1); --id
      sBytes(3) := Character'Val(1); --id
      sBytes(4) := Character'Val(8); --length
      sBytes(5) := Character'Val(0); --checksum
      sBytes(6) := Character'Val(0);
      sBytes(7) := Character'Val(0);
      sBytes(8) := Character'Val(0);
      sBytes(9) := Character'Val(0);
      sBytes(10) := Character'Val(0);
      sBytes(11) := Character'Val(0);
      sBytes(12) := Character'Val(0);
      sBytes(13) := Character'Val(0);

      BBB_CAN.Bytes_To_Message(sBytes, msg, bChecksumOK);
      AUnit.Assertions.Assert
        (bChecksumOK,
         "Bytes_To_Message incorrectly says that the checksum is wrong, test 1.");

      AUnit.Assertions.Assert
        (Integer(msg.ID) = 257,
         "msg.ID wrong test 1.");
      AUnit.Assertions.Assert
        (Integer(msg.Len) = 8,
         "msg.Len wrong test 1.");

      AUnit.Assertions.Assert
        (msg.Data(1) = Unsigned_8(0) and msg.Data(2) = Unsigned_8(0) and msg.Data(3) = Unsigned_8(0) and msg.Data(4) = Unsigned_8(0) and
           msg.Data(5) = Unsigned_8(0) and msg.Data(6) = Unsigned_8(0) and msg.Data(7) = Unsigned_8(0) and msg.Data(8) = Unsigned_8(0),
         "msg.Data wrong test 1.");

      sBytes(12) := Character'Val(255); --changes value so that checksum check should fail
      BBB_CAN.Bytes_To_Message(sBytes, msg, bChecksumOK);
      AUnit.Assertions.Assert
        (not bChecksumOK,
         "Bytes_To_Message incorrectly says that the checksum is correct, test 2.");

      sBytes(4) := Character'Val(4); --changes length, the checksum check should now pass
      BBB_CAN.Bytes_To_Message(sBytes, msg, bChecksumOK);
      AUnit.Assertions.Assert
        (bChecksumOK,
         "Bytes_To_Message incorrectly says that the checksum is wrong, test 3.");
      AUnit.Assertions.Assert
        (Integer(msg.Len) = 4,
         "Bytes_To_Message incorrectly says that the checksum is wrong, test 3.");

      AUnit.Assertions.Assert
        (msg.Data(1) = Unsigned_8(0) and msg.Data(2) = Unsigned_8(0) and msg.Data(3) = Unsigned_8(0) and msg.Data(4) = Unsigned_8(0) and
           msg.Data(5) = Unsigned_8(0),
         "msg.Data wrong test 1.");

--  begin read only
   end Test_Bytes_To_Message;
--  end read only


--  begin read only
   procedure Test_Message_To_Bytes (Gnattest_T : in out Test);
   procedure Test_Message_To_Bytes_a63283 (Gnattest_T : in out Test) renames Test_Message_To_Bytes;
--  id:2.1/a63283872822070b/Message_To_Bytes/1/0/
   procedure Test_Message_To_Bytes (Gnattest_T : in out Test) is
   --  bbb_can.ads:73:4:Message_To_Bytes
--  end read only

      pragma Unreferenced (Gnattest_T);

      msg : BBB_CAN.CAN_Message;
      sBytes : String(1..13);
   begin

      msg.ID := 514;
      msg.Len := 8;
      msg.Data := (255, 255, 255, 255, 255, 255, 255, 255);
      BBB_CAN.Message_To_Bytes(sBytes, msg);

      AUnit.Assertions.Assert
        (sBytes(1) = Character'Val(0), --message type 0 means CAN message
         "Message_To_Bytes: Incorrect message type.");
      AUnit.Assertions.Assert
        (sBytes(2) = Character'Val(2) and sBytes(3) = Character'Val(2), --message id
         "Message_To_Bytes: Incorrect message ID.");
      AUnit.Assertions.Assert
        (sBytes(4) = Character'Val(8),
         "Message_To_Bytes: Incorrect message length.");
      AUnit.Assertions.Assert
        (sBytes(5) = Character'Val(0),
         "Message_To_Bytes: Incorrect checksum.");

      AUnit.Assertions.Assert
        (sBytes(6) = Character'Val(255) and sBytes(7) = Character'Val(255) and sBytes(8) = Character'Val(255) and sBytes(9) = Character'Val(255) and
           sBytes(10) = Character'Val(255) and sBytes(11) = Character'Val(255) and sBytes(12) = Character'Val(255) and sBytes(13) = Character'Val(255),
         "Message_To_Bytes: Data wrong test 1.");


--  begin read only
   end Test_Message_To_Bytes;
--  end read only


--  begin read only
   procedure Test_Calculate_Checksum (Gnattest_T : in out Test);
   procedure Test_Calculate_Checksum_e6925f (Gnattest_T : in out Test) renames Test_Calculate_Checksum;
--  id:2.1/e6925f37c819c321/Calculate_Checksum/1/0/
   procedure Test_Calculate_Checksum (Gnattest_T : in out Test) is
   --  bbb_can.ads:75:4:Calculate_Checksum
--  end read only

      pragma Unreferenced (Gnattest_T);
      use Interfaces;
      Data : Byte8;
   begin

      Data(1) := 0;
      Data(2) := 0;
      Data(3) := 0;

      AUnit.Assertions.Assert
        (Calculate_Checksum(Data, 3) = 0,
         "Calculate_Checksum returns incorrect checksum");

      Data(3) := 255;
      AUnit.Assertions.Assert
        (Calculate_Checksum(Data, 3) = 255,
         "Calculate_Checksum returns incorrect checksum");

      Data(1) := 1;
      AUnit.Assertions.Assert
        (Calculate_Checksum(Data, 3) = 254,
         "Calculate_Checksum returns incorrect checksum");



--  begin read only
   end Test_Calculate_Checksum;
--  end read only


--  begin read only
   procedure Test_Usart_Write (Gnattest_T : in out Test);
   procedure Test_Usart_Write_e4c49d (Gnattest_T : in out Test) renames Test_Usart_Write;
--  id:2.1/e4c49dddf9ab7aba/Usart_Write/1/0/
   procedure Test_Usart_Write (Gnattest_T : in out Test) is
   --  bbb_can.ads:77:4:Usart_Write
--  end read only

      pragma Unreferenced (Gnattest_T);
      sBuff : String := "hej";
   begin

      Init;

      Usart_Write(sBuff, 3);

      AUnit.Assertions.Assert
        (true,
         "Test not implemented.");

--  begin read only
   end Test_Usart_Write;
--  end read only


--  begin read only
   procedure Test_Usart_Read (Gnattest_T : in out Test);
   procedure Test_Usart_Read_71be54 (Gnattest_T : in out Test) renames Test_Usart_Read;
--  id:2.1/71be540befda45cc/Usart_Read/1/0/
   procedure Test_Usart_Read (Gnattest_T : in out Test) is
   --  bbb_can.ads:79:4:Usart_Read
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Usart_Read;
--  end read only

end BBB_CAN.Test_Data.Tests;
