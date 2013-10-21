with UartWrapper;
with Ada.Text_IO;
with GNAT.Serial_Communications;

procedure Main is

   pxUart : UartWrapper.pCUartHandler;

   bytesRead : Integer;
begin

   pxUart := UartWrapper.pxCreate("/dev/ttyACM1", GNAT.Serial_Communications.B9600, 1.0, 100);


  -- pxUart.Uart_Write("hej jag heter emil bergstroem");




--     for i in 1 .. 10 loop
--        Ada.Text_IO.Put_Line("nu läser jag: " & integer'Image(i));
--        Ada.Text_IO.Put_Line(pxUart.sUartReadSpecificAmount(4, bytesRead));
--        Ada.Text_IO.put_line("antalet lästa bytes: " & integer'Image(bytesRead));
--        delay(1.0);
--
--     end loop;

   Ada.Text_IO.Put_Line(pxUart.sUartEcho(4,bytesRead,"HEJ",5.0));




end Main;
