
---------------------------------------------------------------------------
-- This code implements a simple FIFO-queue.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-31

-- TODO: BEFORE RUNNING THE AUNIT TESTS, CHANGE THE iSIZE CONSTANT TO 10
---------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

package body Queue is

   function iDataAvailable return Integer is
   begin
      return (iLast - iFirst) mod iSIZE;
   end iDataAvailable;

   procedure Write(sData : String; iBytesToWrite : Integer; iBytesWritten : out Integer) is
      iCount : Integer := 0;
      nByteCount : Integer;
   begin
      for i in 1..iBytesToWrite loop
         if iDataAvailable < iSize - 1 then
            sBuffer(iLast) := sData(i);
            iLast := (iLast mod iSIZE) + 1;
            iCount := iCount + 1;
         end if;
      end loop;
      iBytesWritten := iCount;

--        Ada.Text_IO.Put("queue.Write():");
--        nByteCount := 0;
--        for Index in sBuffer'Range loop
--           nByteCount := nByteCount + 1;
--           if nByteCount > 1 then
--              Ada.Text_IO.Put(", ");
--           end if;
--           Ada.Text_IO.Put(Character'Image(sBuffer(nByteCount)));
--        end loop;
--        Ada.Text_IO.Put_Line("   wrote:" & iCount'Img);
--        Ada.Text_IO.Put_Line("   iFirst:" & iFirst'Img);
--        Ada.Text_IO.Put_Line("   iLast:" & iLast'Img);
--        Ada.Text_IO.Put_Line("   iDataAvailable:" & iDataAvailable'Img);

   end Write;


   procedure Read(sData : out String; iBytesRead : out Integer; iBytesToRead : Integer) is
      iCount : Integer := 0;
      nByteCount : Integer;
   begin
      for i in 1..iBytesToRead loop
         if iFirst /= iLast then
            sData(iCount+1) := sBuffer(iFirst);
            iFirst := (iFirst mod iSIZE) + 1;
            iCount := iCount + 1;
         end if;
      end loop;
      iBytesRead := iCount;

--        Ada.Text_IO.Put("queue.Read():");
--        nByteCount := 0;
--        for Index in sBuffer'Range loop
--           nByteCount := nByteCount + 1;
--           if nByteCount > 1 then
--              Ada.Text_IO.Put(", ");
--           end if;
--           Ada.Text_IO.Put(Character'Image(sBuffer(nByteCount)));
--        end loop;
--        Ada.Text_IO.Put_Line("   read:" & iCount'Img);
--        Ada.Text_IO.Put_Line("   iFirst:" & iFirst'Img);
--        Ada.Text_IO.Put_Line("   iLast:" & iLast'Img);
--        Ada.Text_IO.Put_Line("   iDataAvailable:" & iDataAvailable'Img);
   end Read;
end Queue;
