with UartWrapper;
with Ada.Text_IO;
with GNAT.Serial_Communications;
with Ada.Directories; use Ada.Directories;

with Interfaces.C;

procedure Main is

   pxUart : UartWrapper.pCUartHandler;

   readString : String(1 .. 100);
   iNumBytesRead : integer := 0;
begin


   pxUart := UartWrapper.pxCreate("/dev/ttyACM1", UartWrapper.B115200, Interfaces.C.int(0), 200, Interfaces.C.int(0));
   while true loop
      pxUart.UartRead(sStringRead   => readString,
                      iNumBytesRead => iNumBytesRead);
      if iNumBytesRead > 0 then
         Ada.Text_IO.Put_Line("Shit read: " & readString(1 .. iNumBytesRead));
      end if;
   end loop;
end Main;
