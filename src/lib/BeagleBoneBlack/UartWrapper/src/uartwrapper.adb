package body UartWrapper is

   --------------
   -- pxCreate --
   --------------

   function pxCreate (path : Gnat.Serial_Communications.Port_Name; baudRate : Gnat.Serial_Communications.Data_Rate; blockingTime : Duration; bufferSize : Integer) return pCUartHandler is
      pxUartHandler : pCUartHandler;
   begin
      pxUartHandler := new CUartHandler;

      Gnat.Serial_Communications.Open(pxUartHandler.serialHandler, path);
      Gnat.Serial_Communications.Set(Port      => pxUartHandler.serialHandler,
                                     Rate      => baudRate,
                                     Bits      => Gnat.Serial_Communications.CS8,
                                     Stop_Bits => Gnat.Serial_Communications.One,
                                     Parity    => Gnat.Serial_Communications.None,
                                     Timeout   => blockingTime);
      pxUartHandler.bufferSize := bufferSize;


      return pxUartHandler;
   end pxCreate;

   ----------------
   -- Uart_Write --
   ----------------

   procedure Uart_Write (this : in out CUartHandler; sStringToBeWritten : string; iLengthOfString : Integer) is
      buffer : Ada.Streams.Stream_Element_Array(1 .. Ada.Streams.Stream_Element_Offset(iLengthOfString + 1));
   begin
      for i in 1 .. Ada.Streams.Stream_Element_Offset(iLengthOfString) loop
         buffer(i) := Ada.Streams.Stream_Element(Character'Pos(sStringToBeWritten(Integer(i))));
      end loop;

      buffer(Ada.Streams.Stream_Element_Offset(iLengthOfString + 1)) := Ada.Streams.Stream_Element(4);

      Gnat.Serial_Communications.Write(this.serialHandler, buffer);
   end Uart_Write;

   procedure Uart_Write (this : in out CUartHandler; stringToBeWritten : string)is
   begin
      Uart_Write(this, stringToBeWritten, stringToBeWritten'Length);
   end Uart_Write;


   ----------------
   -- sUart_Read --
   ----------------

   procedure UartRead (this : in out CUartHandler; iNumBytesRead : out Integer; sStringRead : out string) is
      returnString : string(1.. this.bufferSize);
      buffer : Ada.Streams.Stream_Element_Array(1 .. Ada.Streams.Stream_Element_Offset(this.bufferSize));
      bytesRead : Ada.Streams.Stream_Element_Offset;
   begin
      Gnat.Serial_Communications.Read(this.serialHandler,buffer, bytesRead);

      for i in 1 .. bytesRead loop
         returnString(Integer(i)) := Character'Val (Integer (Buffer (i)));
      end loop;

      iNumBytesRead := Integer(bytesRead);
      sStringRead := returnString(1..iNumBytesRead);
   end UartRead;


   procedure UartReadSpecificAmount (this : in out CUartHandler; iBytesToRead : in Integer; iNumBytesRead : out Integer; sStringRead : out string) is
      returnString : string(1.. this.bufferSize);
      buffer : Ada.Streams.Stream_Element_Array(1 .. Ada.Streams.Stream_Element_Offset(iBytesToRead));
      bytesRead : Ada.Streams.Stream_Element_Offset;
   begin
      Gnat.Serial_Communications.Read(this.serialHandler, buffer, bytesRead);

      for i in 1 .. bytesRead loop
         returnString(Integer(i)) := Character'Val (Integer (Buffer (i)));
      end loop;

      iNumBytesRead := Integer(bytesRead);

      if iNumBytesRead > 0 then
         sStringRead := returnString(1..iNumBytesRead);
      end if;
   end UartReadSpecificAmount;

   procedure UartEcho (this : in out CUartHandler; iBytesToRead : in Integer; iNumBytesRead : out integer; sStringToBeWritten : string; dWaitTime : Duration; sStringRead : out string) is
   begin
      this.Uart_Write(stringToBeWritten => sStringToBeWritten);

      delay(dWaitTime);

      this.UartReadSpecificAmount(iBytesToRead  => iBytesToRead,
                                  iNumBytesRead => iNumBytesRead,
                                  sStringRead => sStringRead);
   end UartEcho;

end UartWrapper;
