with UartWrapper;
with Ada.Text_IO;
use Ada.Text_IO;
with GNAT.Serial_Communications;
with Ada.Directories; use Ada.Directories;

procedure Main is

   	pxUart : UartWrapper.pCUartHandler;

begin

   Ada.Text_IO.Put_Line("Testar Emils kod p� BBB (l�ser /dev/ttyO4)");

   pxUart := UartWrapper.pxCreate("/dev/ttyACM1", GNAT.Serial_Communications.B9600, 1.0, 100);


   pxUart.Uart_Write("nils testar\n");




--     for i in 1 .. 10 loop
--        Ada.Text_IO.Put_Line("nu l�ser jag: " & integer'Image(i));
--        Ada.Text_IO.Put_Line(pxUart.sUartReadSpecificAmount(4, bytesRead));
--        Ada.Text_IO.put_line("antalet l�sta bytes: " & integer'Image(bytesRead));
--        delay(1.0);
--
--     end loop;

--   Ada.Text_IO.Put_Line(pxUart.sUartEcho(4,bytesRead,"HEJ",5.0));

	--Put_Line (File_Size'Image (Size ("/home/emibe/make.out")) & " bytes");


end Main;
