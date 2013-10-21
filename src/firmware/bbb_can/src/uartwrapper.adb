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

   procedure Uart_Write (this : in out CUartHandler; stringToBeWritten : string; length : Integer) is
	buffer : Ada.Streams.Stream_Element_Array(1 .. Ada.Streams.Stream_Element_Offset(length + 1));
   begin
      for i in 1 .. Ada.Streams.Stream_Element_Offset(length) loop
         buffer(i) := Ada.Streams.Stream_Element(Character'Pos(stringToBeWritten(Integer(i))));
      end loop;

      buffer(Ada.Streams.Stream_Element_Offset(length + 1)) := Ada.Streams.Stream_Element(4);

      Gnat.Serial_Communications.Write(this.serialHandler, buffer);
   end Uart_Write;

   procedure Uart_Write (this : in out CUartHandler; stringToBeWritten : string)is
   begin
      Uart_Write(this, stringToBeWritten, stringToBeWritten'Length);
   end Uart_Write;


   ----------------
   -- sUart_Read --
   ----------------

   function sUartRead (this : in out CUartHandler; numBytesRead : out Integer) return string is
      returnString : string(1.. this.bufferSize);
      buffer : Ada.Streams.Stream_Element_Array(1 .. Ada.Streams.Stream_Element_Offset(this.bufferSize));
      bytesRead : Ada.Streams.Stream_Element_Offset;
   begin
      Gnat.Serial_Communications.Read(this.serialHandler,buffer, bytesRead);

      for i in 1 .. bytesRead loop
      	returnString(Integer(i)) := Character'Val (Integer (Buffer (i)));
      end loop;

      numBytesRead := Integer(bytesRead);
      return returnString(1..numBytesRead);
   end sUartRead;


   function sUartReadSpecificAmount (this : in out CUartHandler; bytesToRead : in Integer; numBytesRead : out Integer) return string is
      returnString : string(1.. this.bufferSize);
      buffer : Ada.Streams.Stream_Element_Array(1 .. Ada.Streams.Stream_Element_Offset(bytesToRead));
      bytesRead : Ada.Streams.Stream_Element_Offset;
   begin
      Gnat.Serial_Communications.Read(this.serialHandler,buffer, bytesRead);

      for i in 1 .. bytesRead loop
      	returnString(Integer(i)) := Character'Val (Integer (Buffer (i)));
      end loop;

      numBytesRead := Integer(bytesRead);
      return returnString(1..numBytesRead);
   end sUartReadSpecificAmount;

   function sUartEcho(this : in out CUartHandler; bytesToRead : in Integer; numBytesRead : out integer; stringToBeWritten : string; waitTime : Duration) return string is
   begin
      this.Uart_Write(stringToBeWritten => stringToBeWritten);

       delay(waitTime);
--
--        return this.sUartReadSpecificAmount(bytesToRead  => bytesToRead,
--                                            numBytesRead => numBytesRead);

      return "hi";
   end sUartEcho;




end UartWrapper;
