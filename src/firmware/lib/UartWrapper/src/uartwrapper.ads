with GNAT.Serial_Communications;
with Ada.Streams;
with Interfaces.C;

package UartWrapper is

   package C renames Interfaces.C;

   type CUartHandler is tagged limited private;
   type pCUartHandler is access CUartHandler;

   type BaudRates is (B9600, B115200);

   function pxCreate (path : string; speed : BaudRates; vtime : C.int; bufferSize : C.int; vmin : C.int) return pCUartHandler;

   procedure Uart_Write (this : in out CUartHandler; sStringToBeWritten : string; iLengthOfString : Integer; bAppendEOT : Boolean := false);

   procedure Uart_Write(this : in out CUartHandler; stringToBeWritten : string);

   procedure UartRead (this : in out CUartHandler; sStringRead : out string; iNumBytesRead : out integer);

  procedure UartReadSpecificAmount(this : in out CUartHandler; sStringRead : out string; iBytesToRead : in integer;  iNumBytesRead : out integer);
private

   function openUartPort(portname : C.char_array; speed : C.int; vmin : C.int; vtime : C.int) return C.int;
   pragma Import(Convention => C, Entity => openUartPort, External_Name => "openPort");

   function uartUartWrite(port : C.int; message : C.char_array; messageSize : C.int) return C.int;
   pragma Import(Convention => C, Entity => uartUartWrite, External_Name => "uartWrite");

   function uartUartRead(port : C.int; buffer : C.char_array; bufferSize : C.int) return C.int;
   pragma Import(Convention => C, Entity => uartUartRead, External_Name => "uartRead");

   type CUartHandler is tagged limited
      record
         serialHandler : C.int;
         bufferSize : C.int;
      end record;
end UartWrapper;
