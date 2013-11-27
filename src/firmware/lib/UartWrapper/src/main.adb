with UartWrapper;
with Ada.Text_IO;
with GNAT.Serial_Communications;
with Ada.Directories; use Ada.Directories;

procedure Main is

   pxUart : UartWrapper.pCUartHandler;

   readString : String(1 .. 100);
   iNumBytesRead : integer := 0;
begin

   --Ada.Text_IO.Put_Line("Testar Emils kod på BBB (läser /dev/ttyO4)");

   pxUart := UartWrapper.pxCreate("/dev/ttyACM1", UartWrapper.B115200, 1.0, 100, 0);

   while true loop
      pxUart.UartRead(sStringRead   => readString,
                      iNumBytesRead => iNumBytesRead);
      if iNumBytesRead > 0 then
         Ada.Text_IO.Put_Line("Shit read: " & readString(1 .. iNumBytesRead));
      end if;
   end loop;
   --pxUart.Uart_Write("supertest", 9, true);
--   --  pxUart.Uart_Write("nils testar detta");
--
--  --     sSend(1..5) := "first";
--  --     sSend(6) := Character'Val(4);
--  --     sSend(7..10) := "last";
--
--    -- pxUart.Uart_Write(sSend, 10);
--
--     loop
--
--
--        --  for i in 1..4 loop
--        delay(2.0);
--        pxUart.UartReadSpecificAmount(5, iBytesRead, sStringRead);
--        Ada.Text_IO.Put_Line("iBytesRead=" & iBytesRead'Img & ", Message: " & sStringRead(1..iBytesRead) &
--                               "   sStringRead(iBytesRead)= " &
--                               Integer'Image(Character'Pos(sStringRead(iBytesRead))));
--
--
--        --  end loop;
--     end loop;
end Main;
