--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Queue.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Queue.Test_Data.Tests is


--  begin read only
   procedure Test_iDataAvailable (Gnattest_T : in out Test);
   procedure Test_iDataAvailable_a432a5 (Gnattest_T : in out Test) renames Test_iDataAvailable;
--  id:2.1/a432a508eb47192d/iDataAvailable/1/0/
   procedure Test_iDataAvailable (Gnattest_T : in out Test) is
   --  queue.ads:19:4:iDataAvailable
--  end read only

      pragma Unreferenced (Gnattest_T);

      sData : String(1..5) := "Hello";
      iBytes : Integer;
   begin

      -- THESE TESTS ASSUME THE iSIZE CONSTANT IS SET TO 10,
      -- THIS IS IN ORDER TO CONVENIENTLY TEST THE CODE (THE
      -- TESTS MUST INPUT A TOTAL OF MORE THAN iSIZE BYTES
      -- INTO THE BUFFER FOR RELIABLE TEST RESULTS)

      iLast  := 1;
      iFirst := 1;

      AUnit.Assertions.Assert
        (iDataAvailable = 0,
         "iDataAvailable incorrect");

      Write(sData, 5, iBytes);

      AUnit.Assertions.Assert
        (iDataAvailable = 5,
         "iDataAvailable incorrect");

      Read(sData, iBytes, 4);
      AUnit.Assertions.Assert
        (iDataAvailable = 1,
         "iDataAvailable incorrect");

      --  begin read only
   end Test_iDataAvailable;
--  end read only


--  begin read only
   procedure Test_Write (Gnattest_T : in out Test);
   procedure Test_Write_187f13 (Gnattest_T : in out Test) renames Test_Write;
--  id:2.1/187f13d65f785924/Write/1/0/
   procedure Test_Write (Gnattest_T : in out Test) is
   --  queue.ads:21:4:Write
--  end read only

      pragma Unreferenced (Gnattest_T);

      sData : String(1..5) := "Hello";
      iBytes : Integer;
   begin

      -- THESE TESTS ASSUME THE iSIZE CONSTANT IS SET TO 10,
      -- THIS IS IN ORDER TO CONVENIENTLY TEST THE CODE (THE
      -- TESTS MUST INPUT A TOTAL OF MORE THAN iSIZE BYTES
      -- INTO THE BUFFER FOR RELIABLE TEST RESULTS)

      iLast  := 1;
      iFirst := 1;

      Write(sData, 5, iBytes);
      AUnit.Assertions.Assert
        (iBytes = 5,
         "Write: iBytes incorrect, 1st");

      AUnit.Assertions.Assert
        (iFirst = 1 and iLast = 6,
         "iFirst= " & iFirst'Img & " iLast=" & iLast'Img);

      Write(sData, 4, iBytes);
      AUnit.Assertions.Assert
        (iBytes = 4,
         "Write: iBytes incorrect, 2nd, iBytes=" & iBytes'Img);

      Write(sData, 5, iBytes);
      AUnit.Assertions.Assert
        (iBytes = 0,
         "Write: iBytes incorrect, 3rd, iBytes=" & iBytes'Img);

--  begin read only
   end Test_Write;
--  end read only


--  begin read only
   procedure Test_Read (Gnattest_T : in out Test);
   procedure Test_Read_7c3830 (Gnattest_T : in out Test) renames Test_Read;
--  id:2.1/7c3830f5bf2e33ff/Read/1/0/
   procedure Test_Read (Gnattest_T : in out Test) is
   --  queue.ads:23:4:Read
--  end read only

      pragma Unreferenced (Gnattest_T);

      sData : String(1..5) := "Hello";
      sReceived : String(1..10);
      iBytes : Integer;
      iBytesRead : Integer;
   begin

      -- THESE TESTS ASSUME THE iSIZE CONSTANT IS SET TO 10,
      -- THIS IS IN ORDER TO CONVENIENTLY TEST THE CODE (THE
      -- TESTS MUST INPUT A TOTAL OF MORE THAN iSIZE BYTES
      -- INTO THE BUFFER FOR RELIABLE TEST RESULTS)

      iLast  := 1;
      iFirst := 1;

      Write(sData, 5, iBytes);
      Read(sReceived, iBytesRead, 5);

      AUnit.Assertions.Assert
        (iBytesRead = 5,
         "Read: iBytesRead incorrect, 1st");

      AUnit.Assertions.Assert
        (sReceived(1..5) = "Hello",
         "Read: sReceived incorrect, 1st, sReceived= " & sReceived);

      AUnit.Assertions.Assert
        (iDataAvailable = 0,
         "Read: iDataAvailable= " & iDataAvailable'Img);

      Write(sData, 5, iBytes);
      Write(sData, 5, iBytes);

      AUnit.Assertions.Assert
        (iBytes = 4,
         "Read: iBytes incorrect, 2nd");

      Read(sReceived, iBytesRead, 10);

      AUnit.Assertions.Assert
        (iBytesRead = 9,
         "Read: iBytesRead incorrect, 2nd, iBytesRead=" & iBytesRead'Img);

      AUnit.Assertions.Assert
        (sReceived(1..9) = "HelloHell",
         "Read: sReceived incorrect, 2nd");
--  begin read only
   end Test_Read;
--  end read only


--  begin read only
   procedure Test_Put (Gnattest_T : in out Test);
   procedure Test_Put_f5b796 (Gnattest_T : in out Test) renames Test_Put;
--  id:2.1/f5b7960c608d17fa/Put/1/0/
   procedure Test_Put (Gnattest_T : in out Test) is
   --  queue.ads:27:4:Put
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (True,
         "Test not implemented.");

--  begin read only
   end Test_Put;
--  end read only


--  begin read only
   procedure Test_cGet (Gnattest_T : in out Test);
   procedure Test_cGet_7541ba (Gnattest_T : in out Test) renames Test_cGet;
--  id:2.1/7541ba9cdbb30b51/cGet/1/0/
   procedure Test_cGet (Gnattest_T : in out Test) is
   --  queue.ads:29:4:cGet
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (True,
         "Test not implemented.");

--  begin read only
   end Test_cGet;
--  end read only

end Queue.Test_Data.Tests;
