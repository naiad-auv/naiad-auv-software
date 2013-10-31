--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into CAN_Link_Utils.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body CAN_Link_Utils.Test_Data.Tests is


--  begin read only
   procedure Test_Calculate_Checksum (Gnattest_T : in out Test);
   procedure Test_Calculate_Checksum_b57d3d (Gnattest_T : in out Test) renames Test_Calculate_Checksum;
--  id:2.1/b57d3dd5960a3bb1/Calculate_Checksum/1/0/
   procedure Test_Calculate_Checksum (Gnattest_T : in out Test) is
   --  can_link_utils.ads:34:4:Calculate_Checksum
--  end read only

      pragma Unreferenced (Gnattest_T);
      use Interfaces;
      Data : AVR.AT90CAN128.CAN.Byte8;
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
   procedure Test_Bytes_To_Message_Header (Gnattest_T : in out Test);
   procedure Test_Bytes_To_Message_Header_e3d094 (Gnattest_T : in out Test) renames Test_Bytes_To_Message_Header;
--  id:2.1/e3d0947355a04b17/Bytes_To_Message_Header/1/0/
   procedure Test_Bytes_To_Message_Header (Gnattest_T : in out Test) is
   --  can_link_utils.ads:36:4:Bytes_To_Message_Header
--  end read only

      pragma Unreferenced (Gnattest_T);
      use AVR.AT90CAN128.CAN;
      use AVR.AT90CAN128;
      use Interfaces;

      msg : AVR.AT90CAN128.CAN.CAN_Message;
      sBytes : String(1..16);
      u8CheckSum : Interfaces.Unsigned_8;
   begin
      sBytes(CAN_Link_Utils.BUSTYPE_POS) := Character'Val(0);
      sBytes(CAN_Link_Utils.IDHIGH_POS) := Character'Val(0);
      sBytes(CAN_Link_Utils.IDHIGH_POS + 1) := Character'Val(0);
      sBytes(CAN_Link_Utils.IDHIGH_POS + 2) := Character'Val(0);
      sBytes(CAN_Link_Utils.IDHIGH_POS + 3) := Character'Val(0);
      sBytes(CAN_Link_Utils.MSG_TYPE_POS) := Character'Val(1); --extended msg id
      sBytes(CAN_Link_Utils.LEN_POS) := Character'Val(7);
      sBytes(CAN_Link_Utils.CHECKSUM_POS) := Character'Val(0);

      CAN_Link_Utils.Bytes_To_Message_Header(sBytes, msg, u8CheckSum);

      AUnit.Assertions.Assert
        (msg.ID.isExtended = true,
         "msg.ID.isExtended is incorrect");

      AUnit.Assertions.Assert
        (msg.ID.Identifier = AVR.AT90CAN128.CAN.CAN_Identifier(0),
         "msg.ID.Identifier is incorrect");

      AUnit.Assertions.Assert
        (msg.Len = AVR.AT90CAN128.DLC_Type(7),
         "msg.ID.Len is incorrect");

      AUnit.Assertions.Assert
        (u8CheckSum = Interfaces.Unsigned_8(0),
         "checksum is incorrect");

--  begin read only
   end Test_Bytes_To_Message_Header;
--  end read only


--  begin read only
   procedure Test_Bytes_To_Message_Data (Gnattest_T : in out Test);
   procedure Test_Bytes_To_Message_Data_0647ae (Gnattest_T : in out Test) renames Test_Bytes_To_Message_Data;
--  id:2.1/0647aeaa1d381b3b/Bytes_To_Message_Data/1/0/
   procedure Test_Bytes_To_Message_Data (Gnattest_T : in out Test) is
   --  can_link_utils.ads:38:4:Bytes_To_Message_Data
--  end read only

      pragma Unreferenced (Gnattest_T);
      use AVR.AT90CAN128.CAN;
      use AVR.AT90CAN128;
      use Interfaces;

      msg : AVR.AT90CAN128.CAN.CAN_Message;
      sBytes : String(1..7);
      u8CheckSum : Interfaces.Unsigned_8;
   begin

      msg.ID := (514, false);
      msg.Len := 7;


      sBytes(1) := Character'Val(255);
      sBytes(2) := Character'Val(255);
      sBytes(3) := Character'Val(255);
      sBytes(4) := Character'Val(255);
      sBytes(5) := Character'Val(255);
      sBytes(6) := Character'Val(255);
      sBytes(7) := Character'Val(255);

      CAN_Link_Utils.Bytes_To_Message_Data(sBytes, msg, u8CheckSum);

      AUnit.Assertions.Assert
          (msg.Data(1) = Unsigned_8(255) and msg.Data(2) = Unsigned_8(255) and
           msg.Data(3) = Unsigned_8(255) and msg.Data(4) = Unsigned_8(255) and
           msg.Data(5) = Unsigned_8(255) and msg.Data(6) = Unsigned_8(255) and
           msg.Data(7) = Unsigned_8(255),
         "msg.Data is incorrect");

      AUnit.Assertions.Assert
        (u8CheckSum = Unsigned_8(255),
         "checksum incorrect");


--  begin read only
   end Test_Bytes_To_Message_Data;
--  end read only


--  begin read only
   procedure Test_Message_To_Bytes (Gnattest_T : in out Test);
   procedure Test_Message_To_Bytes_7306eb (Gnattest_T : in out Test) renames Test_Message_To_Bytes;
--  id:2.1/7306ebd622f6fda6/Message_To_Bytes/1/0/
   procedure Test_Message_To_Bytes (Gnattest_T : in out Test) is
   --  can_link_utils.ads:40:4:Message_To_Bytes
--  end read only

      pragma Unreferenced (Gnattest_T);

      msg : AVR.AT90CAN128.CAN.CAN_Message;
      sBytes : String(1..16);
      iTemp : Integer;
   begin

      msg.ID := (514, false);
      msg.Len := 8;
      msg.Data := (255, 255, 255, 255, 255, 255, 255, 255);
      CAN_Link_Utils.Message_To_Bytes(sBytes, msg);

      AUnit.Assertions.Assert
        (sBytes(CAN_Link_Utils.BUSTYPE_POS) = Character'Val(0), --message type 0 means CAN message
         "Message_To_Bytes: Incorrect message type.");
      AUnit.Assertions.Assert
        (sBytes(CAN_Link_Utils.IDHIGH_POS) = Character'Val(0) and
           sBytes(CAN_Link_Utils.IDHIGH_POS + 1) = Character'Val(0) and
           sBytes(CAN_Link_Utils.IDHIGH_POS + 2) = Character'Val(2) and
           sBytes(CAN_Link_Utils.IDHIGH_POS + 3) = Character'Val(2), --message id
         "Message_To_Bytes: Incorrect message ID.");

      iTemp := Character'Pos(sBytes(CAN_Link_Utils.LEN_POS));
      AUnit.Assertions.Assert
        (sBytes(CAN_Link_Utils.LEN_POS) = Character'Val(8),
         "Message_To_Bytes: Incorrect message length: " & iTemp'Img);
      AUnit.Assertions.Assert
        (sBytes(CAN_Link_Utils.CHECKSUM_POS) = Character'Val(0),
         "Message_To_Bytes: Incorrect checksum.");
      AUnit.Assertions.Assert
        (sBytes(CAN_Link_Utils.MSG_TYPE_POS) = Character'Val(0),
         "Message_To_Bytes: Incorrect message id type.");

      AUnit.Assertions.Assert
          (sBytes(CAN_Link_Utils.HEADLEN + 1) = Character'Val(255) and
           sBytes(CAN_Link_Utils.HEADLEN + 2) = Character'Val(255) and sBytes(CAN_Link_Utils.HEADLEN + 3) = Character'Val(255) and
           sBytes(CAN_Link_Utils.HEADLEN + 4) = Character'Val(255) and sBytes(CAN_Link_Utils.HEADLEN + 5) = Character'Val(255) and
           sBytes(CAN_Link_Utils.HEADLEN + 6) = Character'Val(255) and sBytes(CAN_Link_Utils.HEADLEN + 7) = Character'Val(255) and
           sBytes(CAN_Link_Utils.HEADLEN + 8) = Character'Val(255),
           "Message_To_Bytes: Data wrong test 1.");

--  begin read only
   end Test_Message_To_Bytes;
--  end read only

end CAN_Link_Utils.Test_Data.Tests;
