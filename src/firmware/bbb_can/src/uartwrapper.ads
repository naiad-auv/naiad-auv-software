with GNAT.Serial_Communications;
with Ada.Streams;

package UartWrapper is

   type CUartHandler is tagged limited private;
   type pCUartHandler is access CUartHandler;

   function pxCreate (path : Gnat.Serial_Communications.Port_Name; baudRate : Gnat.Serial_Communications.Data_Rate; blockingTime : Duration; bufferSize : Integer) return pCUartHandler;

   procedure Uart_Write(this : in out CUartHandler; stringToBeWritten : string; length : Integer);

   procedure Uart_Write(this : in out CUartHandler; stringToBeWritten : string);

   function sUart_Read (this : in out CUartHandler; numBytesRead : out Integer) return string;

private

   type CUartHandler is tagged limited
      record
         serialHandler : Gnat.Serial_Communications.Serial_Port;
         bufferSize : Integer;
      end record;
end UartWrapper;
