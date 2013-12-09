with Ada.Text_IO;

package body UartWrapper is

   --------------
   -- pxCreate --
   --------------

   function pxCreate (path : string; speed : BaudRates; vtime : C.int; bufferSize : C.int; vmin : C.int) return pCUartHandler is
      pxUartHandler : pCUartHandler;
      iBaudrateInt  : C.int;
   begin

      Ada.Text_IO.Put_Line("Trying to open from ada: " & path);

      pxUartHandler := new CUartHandler;

      -- kks: Translates baudrate to int number that the driver accepts.
      case speed is
         when UartWrapper.B9600 =>
            iBaudrateInt := 1;
         when UartWrapper.B115200 =>
            iBaudrateInt := 2;
         when others =>
            iBaudrateInt := 1;
      end case;
      --

      pxUartHandler.serialHandler := openUartPort(portname     => C.To_C(Item =>path, Append_Nul => true),
                                                  speed        => iBaudrateInt,
                                                  vmin => vmin,
                                                  vtime => vtime);
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
         success := UartWrapper.uartUartWrite(this.serialHandler, C.To_C(sStringToBeWritten), C.int(sStringToBeWritten'Length));
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

   procedure UartRead (this : in out CUartHandler; sStringRead : out string; iNumBytesRead : out integer) is
      use C;

      function Read(this : in CUartHandler) return string is
         readBuffer : C.char_array(1 .. C.size_t(this.bufferSize)) := (others => C.char'Val(0));
         bytesRead : C.int;
      begin
         bytesRead := uartUartRead(this.serialHandler, readBuffer, this.bufferSize);

         if Integer(bytesRead) < 0 then
            Ada.Text_IO.Put_Line("Error occured when reading: " & C.int'Image(bytesRead));
         end if;

         --Ada.Text_IO.Put_Line("bytesRead   =" & bytesRead'Img);
       --  Ada.Text_IO.Put_Line("   uart C driver read bytes: " & C.size_t(bytesRead)'Img);

         --Ada.Text_IO.Put_Line("C Converted" & C.To_Ada(item => readBuffer(1..C.size_t(bytesRead)),Trim_Nul => false) );
         return C.To_Ada(item 	  => readBuffer(1 .. C.size_t(bytesRead)),
                         Trim_Nul => False);
      end Read;

      sReturnString : string := Read(this);

   begin
      sStringRead(sReturnString'Range) := sReturnString;
      iNumBytesRead := sReturnString'Length;
   end UartRead;

   procedure UartReadSpecificAmount(this : in out CUartHandler; sStringRead : out string; iBytesToRead : integer;  iNumBytesRead : out integer) is
   	use C;
	iOriginalBufferSize : integer := integer(this.bufferSize);
   begin
	this.bufferSize := C.Int(iBytesToRead);
	this.UartRead(sStringRead, iNumBytesRead);
	this.bufferSize := C.int(iOriginalBufferSize);
   end UartReadSpecificAmount;
end UartWrapper;
