with UartWrapper;
with Ada.Text_IO;
with GNAT.Serial_Communications;

procedure Main is

   pxUart : UartWrapper.pCUartHandler;

   bytesRead : Integer;
begin

   pxUart := UartWrapper.pxCreate("/dev/ttyACM1", GNAT.Serial_Communications.B9600, 11.0, 100);


   pxUart.Uart_Write("hej jag heter emil bergstroem");

 --  delay(10.0);

   Ada.Text_IO.Put_Line(pxUart.sUart_Read(bytesRead));

end Main;
