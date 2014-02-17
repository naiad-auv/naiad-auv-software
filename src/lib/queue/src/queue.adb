
---------------------------------------------------------------------------
-- This code implements a simple FIFO-queue.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2014-01-10

-- TODO: BEFORE RUNNING THE AUNIT TESTS, CHANGE THE iSIZE CONSTANT TO 10
---------------------------------------------------------------------------


package body Queue is

   function iDataAvailable return Integer is
   begin
      return (iLast - iFirst) mod iSIZE;
   end iDataAvailable;

   procedure Write(sData : String; iBytesToWrite : Integer; iBytesWritten : out Integer) is
      iCount : Integer := 0;
      iLastIndex : integer;
   begin
      if iBytesToWrite + sData'First <= sData'Last then
         iLastIndex := (iBytesToWrite - 1) + sData'First;
      else
         iLastIndex := sData'Last;
      end if;

      for i in sData'First..iLastIndex loop
         if iDataAvailable < iSize - 1 then
            sBuffer(iLast) := sData(i);
            iLast := (iLast mod iSIZE) + 1;
            iCount := iCount + 1;
         end if;
      end loop;
      iBytesWritten := iCount;
   end Write;


 procedure Read(sData : out String; iBytesRead : out Integer; iBytesToRead : Integer) is
      iCount : Integer := 0;
   begin
      for i in 1..iBytesToRead loop
         if iFirst /= iLast then
            sData(iCount + sData'First) := sBuffer(iFirst);
            iFirst := (iFirst mod iSIZE) + 1;
            iCount := iCount + 1;
         end if;
      end loop;
      iBytesRead := iCount;
   end Read;
end Queue;
