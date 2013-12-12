
---------------------------------------------------------------------------
-- This code implements a simple FIFO-queue.
-- Written by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-31

-- TODO:
---------------------------------------------------------------------------


package Queue is

   iSIZE : constant Integer := 500;
   iFirst : Integer := 1;
   iLast  : Integer := 1;

   sBuffer : String(1..iSIZE);

   function iDataAvailable return Integer;

   procedure Write(sData : String; iBytesToWrite : Integer; iBytesWritten : out Integer);

   procedure Read(sData : out String; iBytesRead : out Integer; iBytesToRead : Integer);
end Queue;
