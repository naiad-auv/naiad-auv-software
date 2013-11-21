with Ada.Text_IO;

package body UartWrapper is

   --------------
   -- pxCreate --
   --------------

   function pxCreate (path : string; speed : BaudRates; blockingTime : Duration; bufferSize : C.int) return pCUartHandler is
      pxUartHandler : pCUartHandler;

   begin

      Ada.Text_IO.Put_Line("Trying to open from ada: " & path);

      pxUartHandler := new CUartHandler;

      pxUartHandler.serialHandler := openUartPort(portname     => C.To_C(Item =>path,
                                                                         Append_Nul => true),
                                                  speed        => C.int(blockingTime),
                                                  should_block => 0);
      pxUartHandler.bufferSize := bufferSize;

      Ada.Text_IO.Put_Line("Port open");

      return pxUartHandler;
   end pxCreate;

   ----------------
   -- Uart_Write --
   ----------------

   procedure Uart_Write (this : in out CUartHandler; sStringToBeWritten : string; iLengthOfString : Integer; bAppendEOT : Boolean := false) is
      use C;

      success : C.int;
   begin

      if bAppendEOT then
         success := UartWrapper.uartUartWrite(this.serialHandler, C.To_C(sStringToBeWritten & character'val(4)), C.int(sStringToBeWritten'Length + 1));
      else
         success := UartWrapper.uartUartWrite(this.serialHandler, C.To_C(sStringToBeWritten), C.int(sStringToBeWritten'Length + 1));
      end if;

      if success < 0 then
         Ada.Text_IO.Put_Line("Error occured when writing: " & C.int'Image(success));
      end if;
   end Uart_Write;

   procedure Uart_Write (this : in out CUartHandler; stringToBeWritten : string)is
   begin
      Uart_Write(this, stringToBeWritten, stringToBeWritten'Length);
   end Uart_Write;


   ----------------
   -- sUart_Read --
   ----------------

   procedure UartRead (this : in CUartHandler; sStringRead : out string; iNumBytesRead : out integer) is
      use C;

      function Read(this : in CUartHandler) return string is
         readBuffer : C.char_array(1 .. C.size_t(this.bufferSize)) := (others => C.char'Val(0));
         bytesRead : C.int;
      begin
         bytesRead := uartUartRead(this.serialHandler, readBuffer, this.bufferSize);

         if Integer(bytesRead) < 0 then
            Ada.Text_IO.Put_Line("Error occured when reading: " & C.int'Image(bytesRead));
         end if;

         return C.To_Ada(item 	  => readBuffer(1 .. C.size_t(bytesRead)),
                         Trim_Nul => false);
      end Read;

      sReturnString : string := Read(this);

   begin
      sStringRead(sReturnString'Range) := sReturnString;
      iNumBytesRead := sReturnString'Length;
   end UartRead;
end UartWrapper;
