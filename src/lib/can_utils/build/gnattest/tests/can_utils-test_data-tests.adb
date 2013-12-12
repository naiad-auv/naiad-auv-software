--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into CAN_Utils.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body CAN_Utils.Test_Data.Tests is


   --  begin read only
   procedure Test_Bytes_To_Message_Header (Gnattest_T : in out Test);
   procedure Test_Bytes_To_Message_Header_50b6ff (Gnattest_T : in out Test) renames Test_Bytes_To_Message_Header;
   --  id:2.1/50b6ff865fb18622/Bytes_To_Message_Header/1/0/
   procedure Test_Bytes_To_Message_Header (Gnattest_T : in out Test) is
      --  can_utils.ads:29:4:Bytes_To_Message_Header
      --  end read only

      pragma Unreferenced (Gnattest_T);

      use Interfaces;
      use CAN_Defs;

      msg : CAN_Defs.CAN_Message;
      sBytes : String(1..13);
      u8CheckSum : Interfaces.Unsigned_8;
   begin

      sBytes(CAN_Utils.IDHIGH_POS) := Character'Val(0);
      sBytes(CAN_Utils.IDHIGH_POS + 1) := Character'Val(0);
      sBytes(CAN_Utils.IDHIGH_POS + 2) := Character'Val(0);
      sBytes(CAN_Utils.IDHIGH_POS + 3) := Character'Val(0);
      sBytes(CAN_Utils.HEADER_INFO_POS) := Character'Val(16+7); --extended msg id, length = 7

      CAN_Utils.Bytes_To_Message_Header(sBytes, msg, u8CheckSum);

      AUnit.Assertions.Assert
        (msg.ID.isExtended = true,
         "msg.ID.isExtended is incorrect");

      AUnit.Assertions.Assert
        (msg.ID.Identifier = CAN_Defs.CAN_Identifier(0),
         "msg.ID.Identifier is incorrect");

      AUnit.Assertions.Assert
        (msg.Len = CAN_Defs.DLC_Type(7),
         "msg.ID.Len is incorrect");

      --  begin read only
   end Test_Bytes_To_Message_Header;
   --  end read only


   --  begin read only
   procedure Test_Bytes_To_Message_Data (Gnattest_T : in out Test);
   procedure Test_Bytes_To_Message_Data_98d965 (Gnattest_T : in out Test) renames Test_Bytes_To_Message_Data;
   --  id:2.1/98d965b17d21d380/Bytes_To_Message_Data/1/0/
   procedure Test_Bytes_To_Message_Data (Gnattest_T : in out Test) is
      --  can_utils.ads:31:4:Bytes_To_Message_Data
      --  end read only

      pragma Unreferenced (Gnattest_T);

      use Interfaces;

      msg : CAN_Defs.CAN_Message;
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

      CAN_Utils.Bytes_To_Message_Data(sBytes, msg, u8CheckSum);

      AUnit.Assertions.Assert
        (msg.Data(1) = Unsigned_8(255) and msg.Data(2) = Unsigned_8(255) and
           msg.Data(3) = Unsigned_8(255) and msg.Data(4) = Unsigned_8(255) and
           msg.Data(5) = Unsigned_8(255) and msg.Data(6) = Unsigned_8(255) and
           msg.Data(7) = Unsigned_8(255),
         "msg.Data is incorrect");

      --  begin read only
   end Test_Bytes_To_Message_Data;
   --  end read only


   --  begin read only
   procedure Test_Message_To_Bytes (Gnattest_T : in out Test);
   procedure Test_Message_To_Bytes_de59e8 (Gnattest_T : in out Test) renames Test_Message_To_Bytes;
   --  id:2.1/de59e81b7852f164/Message_To_Bytes/1/0/
   procedure Test_Message_To_Bytes (Gnattest_T : in out Test) is
      --  can_utils.ads:33:4:Message_To_Bytes
      --  end read only

      pragma Unreferenced (Gnattest_T);
      use Interfaces;

      msg : CAN_Defs.CAN_Message;
      sBytes : String(1..16);
      iTemp : Integer;
   begin

      msg.ID := (514, false);
      msg.Len := 8;
      msg.Data := (255, 255, 255, 255, 255, 255, 255, 255);
      CAN_Utils.Message_To_Bytes(sBytes, msg);


      AUnit.Assertions.Assert
        (sBytes(CAN_Utils.IDHIGH_POS) = Character'Val(0) and
           sBytes(CAN_Utils.IDHIGH_POS + 1) = Character'Val(0) and
           sBytes(CAN_Utils.IDHIGH_POS + 2) = Character'Val(2) and
           sBytes(CAN_Utils.IDHIGH_POS + 3) = Character'Val(2), --message id
         "Message_To_Bytes: Incorrect message ID.");

      iTemp := Character'Pos(sBytes(CAN_Utils.HEADER_INFO_POS));
      iTemp := Integer(Interfaces.Unsigned_8(iTemp) and MSG_LEN_MASK);

      AUnit.Assertions.Assert
        (iTemp = 8,
         "Message_To_Bytes: Incorrect message length: " & iTemp'Img);

      iTemp := Character'Pos(sBytes(CAN_Utils.HEADER_INFO_POS));
      iTemp := Integer(Interfaces.Unsigned_8(iTemp) and MSG_TYPE_MASK);

      AUnit.Assertions.Assert
        (iTemp = 0,
         "Message_To_Bytes: Incorrect message id type. iTemp=" & iTemp'img);

      AUnit.Assertions.Assert
        (sBytes(CAN_Utils.HEADLEN + 1) = Character'Val(255) and
           sBytes(CAN_Utils.HEADLEN + 2) = Character'Val(255) and sBytes(CAN_Utils.HEADLEN + 3) = Character'Val(255) and
           sBytes(CAN_Utils.HEADLEN + 4) = Character'Val(255) and sBytes(CAN_Utils.HEADLEN + 5) = Character'Val(255) and
           sBytes(CAN_Utils.HEADLEN + 6) = Character'Val(255) and sBytes(CAN_Utils.HEADLEN + 7) = Character'Val(255) and
           sBytes(CAN_Utils.HEADLEN + 8) = Character'Val(255),
         "Message_To_Bytes: Data wrong test 1.");

      --  begin read only
   end Test_Message_To_Bytes;
   --  end read only


   --  begin read only
   procedure Test_Calculate_Checksum (Gnattest_T : in out Test);
   procedure Test_Calculate_Checksum_3e3043 (Gnattest_T : in out Test) renames Test_Calculate_Checksum;
   --  id:2.1/3e3043c1bb3f81be/Calculate_Checksum/1/0/
   procedure Test_Calculate_Checksum (Gnattest_T : in out Test) is
      --  can_utils.ads:46:4:Calculate_Checksum
      --  end read only

      pragma Unreferenced (Gnattest_T);

      pragma Unreferenced (Gnattest_T);
      use Interfaces;
      Data : CAN_Defs.Byte8;
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

end CAN_Utils.Test_Data.Tests;
