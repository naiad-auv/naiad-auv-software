
-- Written by: Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-09-26

with AVR.AT90CAN128;		--use AVR.AT90CAN128;
with System;
with System.Machine_Code;	--use System.Machine_Code;
--with Interfaces; 		use Interfaces;


package body Salinity_Sensor is

   -- ---- <copy paste from avr-at90can-usart> ------------------------
   -- the avr-at90can-usart implements both UARTs, this code only uses one, therefore
   -- this code is a little simpler
   pragma Suppress (All_Checks);

   Uart_Buffer_Size : constant Integer := 64;

   -- the Circular buffer for USART receiver
   Uart_Rbuffer : String (1..Uart_Buffer_Size);
   Uart_In_R  : Integer := 1;
   Uart_Out_R : Integer := 1;

   -- the Circular buffer for USART transmitter
   Uart_Wbuffer : String (1..Uart_Buffer_Size);
   Uart_In_W  : Integer := 1;
   Uart_Out_W : Integer := 1;

   pragma Volatile (Uart_In_R);
   pragma Volatile (Uart_Out_R);

   -- ---- <end of copy paste from avr-at90can-usart> ------------------------

   UsedPort : USARTID;
   u8LastSalinityReading : unsigned_8 := 254;

   --------------------------------------------------------------------------------------------
   procedure Initate_Salinity_Sensor(Port : USARTID; sTemperature : String) is
      sStr : String := "0000000";
      iInt : Integer;
   begin
      UsedPort := Port;

      -- ---- <copy paste from avr-at90can-usart> ------------------------
      System.Machine_Code.Asm ("sei", Volatile => True);
      case UsedPort is
      when USART0 =>
         -- Enable receiver and transmitter and the interrupt for receive
         AVR.AT90CAN128.UCSR0B.RXEN  := True;
         AVR.AT90CAN128.UCSR0B.TXEN  := True;
         AVR.AT90CAN128.UCSR0B.RXCIE := True;

         AVR.AT90CAN128.UBRR0L := 25;  -- 16 Mhz Osc.  38400 Baud

      when USART1 =>
         -- Enable receiver and transmitter and the interrupt for receive
         AVR.AT90CAN128.UCSR1B.RXEN  := True;
         AVR.AT90CAN128.UCSR1B.TXEN  := True;
         AVR.AT90CAN128.UCSR1B.RXCIE := True;
         AVR.AT90CAN128.UBRR1L := 25;  -- 16 Mhz Osc.  38400 Baud

      end case;
      -- ---- <end of copy paste from avr-at90can-usart> -----------------

      --Send command to start continous measurements:
      sStr := sTemperature & ",C" & Integer'Image(13);
      iInt := Write(sStr, sStr'Length);
   end Initate_Salinity_Sensor;

   --------------------------------------------------------------------------------------------
   procedure Set_Temperature(sTemperature : String) is
      sStr : String := sTemperature & ",C" & Integer'Image(13);
      iInt : Integer;
   begin
      iInt := Write(sStr, sStr'Length);  --Send command to start continous measurements
   end Set_Temperature;

   --------------------------------------------------------------------------------------------

   function Get_Salinity return Unsigned_8 is
   begin
      return u8LastSalinityReading;
   end Get_Salinity;


   ---------------------------------------------------------------------

   -- ---- <copy paste from avr-at90can-usart> -----------------------

   -----------------------   INTERRUPTS ----------------------------------------
   -----------------------------------------------------------------------------
   -- USART1 --
   -- Usart1_RX: interrupt handler of USART1 for RX. This handler will
   --                read data from USART1 and put them in the
   --                circular buffer.
   -- FIXME:
   --       At present, if the circular buffer is full, the new data
   --       will be dropped
   procedure Usart1_RX;
   pragma Machine_Attribute (Usart1_RX, "signal");
   pragma Export (C, Usart1_RX, AVR.AT90CAN128.Vector_USART1_RX);

   procedure Usart1_RX is
      iPos : Integer;
      cChar : Character;
   begin
      iPos := Uart_In_R mod Uart_Buffer_Size + 1;
      if iPos /= Uart_Out_R then
         cChar := Character'Val (AVR.AT90CAN128.UDR1);
         Uart_Rbuffer(Uart_In_R) := cChar;
         Uart_In_R := iPos;

         --if the character is a carrige return, then a whole message has been received
         if cChar = Character'Val(13) then
            Message_Received;
         end if;
      end if;
   end Usart1_RX;

   -- Usart1_Udre: interrupt handler of USART1 for Data Register Empty.
   --              This handler will read data from a circular buffer
   --              and send it out to USART1 circular buffer.
   procedure Usart1_Udre;
   pragma Machine_Attribute (Usart1_Udre, "signal");
   pragma Export (C, Usart1_Udre, AVR.AT90CAN128.Vector_USART1_UDRE);

   procedure Usart1_Udre is
   begin
      if Uart_In_W /= Uart_Out_W and UsedPort = USART1 then
         AVR.AT90CAN128.UDR1 := Character'Pos (Uart_Wbuffer(Uart_Out_W));
         Uart_Out_W := Uart_Out_W mod Uart_Buffer_Size + 1;
      else
         AVR.AT90CAN128.UCSR1B.UDRIE := False;
      end if;
   end Usart1_Udre;


   -- USART0 --

   -- Usart0_RX: interrupt handler of USART0 for RX. This handler will
   --                read data from USART0 and put them in the
   --                circular buffer.
   -- FIXME:
   --       At present, if the circular buffer is full, the new data
   --       will be dropped
   procedure Usart0_RX;
   pragma Machine_Attribute (Usart0_RX, "signal");
   pragma Export (C, Usart0_RX, AVR.AT90CAN128.Vector_USART0_RX);

   procedure Usart0_RX is
      iPos  : Integer;
      cChar : Character;
   begin
      iPos := (Uart_In_R mod Uart_Buffer_Size) + 1;
      if iPos /= Uart_Out_R then
         cChar := Character'Val(AVR.AT90CAN128.UDR0);
         Uart_Rbuffer(Uart_In_R) := cChar;
         Uart_In_R := iPos;

         --if the character is a carrige return, then a whole message has been received
         if cChar = Character'Val(13) then
            Message_Received;
         end if;
      end if;
   end Usart0_RX;


   -- Usart0_Udre: interrupt handler of USART0 for Data Register Empty.
   --              This handler will read data from a circular buffer
   --              and send it out to USART0 circular buffer.
   procedure Usart0_Udre;
   pragma Machine_Attribute (Usart0_Udre, "signal");
   pragma Export (C, Usart0_Udre, AVR.AT90CAN128.Vector_USART0_UDRE);

   procedure Usart0_Udre is
   begin
         if Uart_In_W /= Uart_Out_W and UsedPort = USART0 then
            AVR.AT90CAN128.UDR0 := Character'Pos (Uart_Wbuffer(Uart_Out_W));
            Uart_Out_W := Uart_Out_W mod Uart_Buffer_Size + 1;
      else
         AVR.AT90CAN128.UCSR0B.UDRIE := False;
      end if;
   end Usart0_Udre;

   -- ---- <end of copy paste from avr-at90can-usart> -----------------

   procedure Message_Received is
      sMessage : String := "+125.6";
      cChar : Character;
      bKeepGoing : Boolean;
      iCommas : Integer := 0;
   begin

      --copy the part of the buffer that comes after the second comma (","), this is the salinity reading
      for i in 1..Uart_Buffer_Size loop
         Get_Char(cChar, bKeepGoing);

         if cChar = ',' then
            iCommas := iCommas + 1;
         end if;

         if iCommas = 2 then
            sMessage(i) := cChar;
         end if;

         exit when bKeepGoing = False;
      end loop;

      if sMessage = "--" then --the value is out of range, or the wrong probe (with regard to salinity in the water) was used
         u8LastSalinityReading := 255;
      else
         u8LastSalinityReading := Unsigned_8(Integer'Value(sMessage));
      end if;

   end Message_Received;

   ------------------------ ------------------------ ------------------------ ------------------------

   -- Put: Send one byte to the USARTs
   -- Parameters:
   --            Item  : the character is going to be sent.
   --            Port  : denote the ID of USART.(USART0 OR USART1)
   -- Return value: this function will return false if this character cannot be sent out
   --               otherwill it will return True.
   function Put (Item : Character) return Boolean is
      Pos : Integer;
   begin
      case UsedPort is
         when USART0 =>
            Pos := Uart_In_W mod Uart_Buffer_Size + 1;
            if Pos /= Uart_Out_W then
               --Insert in Buffer
               Uart_Wbuffer(Uart_In_W) := Item;
               Uart_In_W := Pos;
               if not AVR.AT90CAN128.UCSR0B.UDRIE then
                  if AVR.AT90CAN128.UCSR0A.UDRE then
                     AVR.AT90CAN128.UDR0 := Character'Pos (Uart_Wbuffer(Uart_Out_W));
                     Uart_Out_W := Uart_Out_W mod Uart_Buffer_Size + 1;
                  end if;
                  AVR.AT90CAN128.UCSR0B.UDRIE := True;
               end if;
               return True;
            else
               return False;
            end if;
         when USART1 =>
            Pos := Uart_In_W mod Uart_Buffer_Size + 1;
            if Pos /= Uart_Out_W then
               --Insert in Buffer
               Uart_Wbuffer(Uart_In_W) := Item;
               Uart_In_W := Pos;
               if not AVR.AT90CAN128.UCSR1B.UDRIE then
                  if AVR.AT90CAN128.UCSR1A.UDRE then
                     AVR.AT90CAN128.UDR1 := Character'Pos (Uart_Wbuffer(Uart_Out_W));
                     Uart_Out_W := Uart_Out_W mod Uart_Buffer_Size + 1;
                  end if;
                  AVR.AT90CAN128.UCSR1B.UDRIE := True;
               end if;
               return True;
            else
               return False;
            end if;
      end case;
   end Put;

   -- Write: Send the data to the USARTs
   -- Parameters:
   --            Buffer: the Data is going to be sent.
   --            Size  : denote how many data should be send.
   -- Return value:
   --               How many data have been actually sent out
   function  Write (Buffer : String; Size : Positive) return Integer is
      Result : Boolean;
      Count : Integer;
   begin
      Count := 0;

      for I in 1..Size loop
         Result := Put(Buffer(I));
         if Result then
            Count := Count + 1;
         else
            return Count;
         end if;
      end loop;
      return Size;
   end Write;

      -- Get_Char: Read one byte from the USARTs
   -- Parameters:
   --            Ch(out)     : the character which read from USARTS..
   --           Return(out)  : this function will return True if at least one byte is available.
   --                          otherwise it will will be False.
   procedure Get_Char (Ch : out Character; Ret : out Boolean) is
   begin
      if Uart_In_R /= Uart_Out_R then
         Ch := Uart_Rbuffer(Uart_Out_R);
         Uart_Out_R := (Uart_Out_R mod Uart_Buffer_Size) + 1;
         Ret := True;
         return;
      else
         Ret := False;
      end if;
   end Get_Char;
end Salinity_Sensor;
