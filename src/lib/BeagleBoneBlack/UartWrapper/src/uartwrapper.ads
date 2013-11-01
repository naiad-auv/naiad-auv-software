with GNAT.Serial_Communications;
with Ada.Streams;

package UartWrapper is

   type CUartHandler is tagged limited private;
   type pCUartHandler is access CUartHandler;

   function pxCreate (path : Gnat.Serial_Communications.Port_Name; baudRate : Gnat.Serial_Communications.Data_Rate; blockingTime : Duration; bufferSize : Integer) return pCUartHandler;

   procedure Uart_Write (this : in out CUartHandler; sStringToBeWritten : string; iLengthOfString : Integer; bAppendEOT : Boolean := false);

   procedure Uart_Write(this : in out CUartHandler; stringToBeWritten : string);

   procedure UartRead (this : in out CUartHandler; iNumBytesRead : out Integer; sStringRead : out string);

   procedure UartReadSpecificAmount (this : in out CUartHandler; iBytesToRead : in Integer; iNumBytesRead : out Integer;sStringRead : out string);

   procedure UartEcho (this : in out CUartHandler; iBytesToRead : in Integer; iNumBytesRead : out integer; sStringToBeWritten : string; dWaitTime : Duration; sStringRead : out string);

private

   type CUartHandler is tagged limited
      record
         serialHandler : Gnat.Serial_Communications.Serial_Port;
         bufferSize : Integer;
      end record;
end UartWrapper;
