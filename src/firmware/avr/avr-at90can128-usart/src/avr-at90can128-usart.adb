with AVR.AT90CAN128 ; use AVR.AT90CAN128;
with System;
with System.Machine_Code;
use System.Machine_Code;
--with Interfaces; use Interfaces;

package body AVR.AT90CAN128.USART is
   pragma Suppress (All_Checks);

   bLED : boolean := false;
   bInInterupt : boolean := false;

   UART_PRIMARY_BUFFER_SIZE : constant Integer := 16;
   UART_SECONDARY_BUFFER_SIZE : constant Integer := 256;

   Uart0RX_Primary_Buffer : string (1 .. UART_PRIMARY_BUFFER_SIZE);
   Uart0RX_Secondary_Buffer : string (1 .. UART_SECONDARY_BUFFER_SIZE);
   Uart0RX_Secondary_Buffer_Smph_Taken : boolean := false;

   Uart1RX_Primary_Buffer : string (1 .. UART_PRIMARY_BUFFER_SIZE);
   Uart1RX_Secondary_Buffer : string (1 .. UART_SECONDARY_BUFFER_SIZE);
   Uart1RX_Secondary_Buffer_Smph_Taken : boolean := false;

   Uart0RX_Primary_Buffer_Pos : integer := Uart0RX_Primary_Buffer'First;
   Uart0RX_Secondary_Buffer_Pos : integer := Uart0RX_Secondary_Buffer'First;
   Uart1RX_Primary_Buffer_Pos : integer := Uart1RX_Primary_Buffer'First;
   Uart1RX_Secondary_Buffer_Pos : integer := Uart1RX_Secondary_Buffer'First;

   Uart_Buffer_Size : constant integer := 64;
   -- the non-Circular buffer for USART0 receiver
   Uart0_Rbuffer : String (1..Uart_Buffer_Size);
   Uart0_In_R  : Integer := 1;
   Uart0_Out_R : Integer := 1;

    -- the non-Circular buffer for USART0 transmitter
   Uart0_Wbuffer : String (1..Uart_Buffer_Size);
   Uart0_In_W  : Integer := 1;
   Uart0_Out_W : Integer := 1;


    -- the Circular buffer for USART1 receiver
   Uart1_Rbuffer : String (1..Uart_Buffer_Size);
   Uart1_In_R  : Integer := 1;
   Uart1_Out_R : Integer := 1;

   -- the Circular buffer for USART1 transmitter
   Uart1_Wbuffer : String (1..Uart_Buffer_Size);
   Uart1_In_W  : Integer := 1;
   Uart1_Out_W : Integer := 1;

   pragma Volatile (Uart1_In_R);
   pragma Volatile (Uart1_Out_R);
   pragma Volatile (Uart1_In_W);
   pragma Volatile (Uart1_Out_W);

   ------------------------------------------------------------------------------
   -----------------------   INIT  ---------------------------------------------
   -----------------------------------------------------------------------------

   -- Init : Initialize the USART.
   -- Parameter:
   --           Port : denote the ID of USART.(USART0 OR USART1)
   --           Rate : baud rate of the usart.
   procedure Init (Port : USARTID := Default_USART; Baud : BAUDTYPE) is
   begin
      Asm ("sei", Volatile => True);
      case Port is
      when USART0 =>
         -- Enable receiver and transmitter and the interrupt for receive
         UCSR0B.RXEN  := True;
         UCSR0B.TXEN  := True;
         UCSR0B.RXCIE := True;

         --UCSR0A := +(others => False);
         case Baud is
            when BAUD9600 =>
               UBRR0L := 103; -- 16 Mhz Osc.  9600 Baud
            when BAUD38400 =>
               UBRR0L := 25;  -- 16 Mhz Osc.  38400 Baud
            when BAUD57600 =>
               UBRR0L := 16;  -- 16 Mhz Osc.  56700 Baud
            when BAUD115200 =>
               UBRR0L := 8;   -- 16 Mhz Osc.  115200 Baud
            when BAUD230400 =>
               UBRR0L := 3;
         end case;

--           UBRR0H := 0;
--
--           UCSR0C := (false, -- reserved
--                      false, -- asynchronous mode
--                      false, false, -- no parity
--                      false, -- one stop bit
--                      true, true, --8-bit Character Size
--                      false); --Clock Polarity


      when USART1 =>
         -- Enable receiver and transmitter and the interrupt for receive
         UCSR1B.RXEN  := True;
         UCSR1B.TXEN  := True;
         UCSR1B.RXCIE := True;

         case Baud is
            when BAUD9600 =>
               UBRR1L := 103; -- 16 Mhz Osc.  9600 Baud
            when BAUD38400 =>
               UBRR1L := 25;  -- 16 Mhz Osc.  38400 Baud
            when BAUD57600 =>
               UBRR1L := 16;  -- 16 Mhz Osc.  56700 Baud
            when BAUD115200 =>
               UBRR1L := 8;   -- 16 Mhz Osc.  115200 Baud
            when BAUD230400 =>
               UBRR0L := 3;
         end case;
         --           UBRR1H := 0;
         --
         --           UCSR1C := (false, -- reserved
         --                      false, -- asynchronous mode
--                      false, false, -- no parity
--                      false, -- one stop bit
--                      true, true, --8-bit Character Size
--                      false); --Clock Polarity
      end case;
   end Init;



   -----------------------------------------------------------------------------
   -----------------------   INTERRUPTS ----------------------------------------
   -----------------------------------------------------------------------------
   -- USART1 --
   -- Usart1_RX: interrupt handler of USART1 for RX. This handler will
   --                read data from USART1 and put them in a
   --                circular buffer.
   -- FIXME:
   --       At present, if the circular buffer is full, the new data
   --       will be dropped
   procedure Usart1_RX;
   pragma Machine_Attribute (Usart1_RX, "signal");
   pragma Export (C, Usart1_RX, Vector_USART1_RX);

   procedure Usart1_RX is
      Pos : Integer;
      cChar : Character;
   begin
      cChar := Character'Val(UDR1);
      Pos := Uart1_In_R mod Uart_Buffer_Size + 1;
      if Pos /= Uart1_Out_R then
         Uart1_Rbuffer(Uart1_In_R) := cChar;
         Uart1_In_R := Pos;
      end if;
   end Usart1_RX;

   -- Usart1_Udre: interrupt handler of USART1 for Data Register Empty.
   --              This handler will read data from a circular buffer
   --              and send it out to USART1 circular buffer.
   procedure Usart1_Udre;
   pragma Machine_Attribute (Usart1_Udre, "signal");
   pragma Export (C, Usart1_Udre, Vector_USART1_UDRE);

   procedure Usart1_Udre is
   begin
      if Uart1_In_W /= Uart1_Out_W then
         UDR1 := Character'Pos (Uart1_Wbuffer(Uart1_Out_W));
         Uart1_Out_W := Uart1_Out_W mod Uart_Buffer_Size + 1;
      else
         UCSR1B.UDRIE := False;
      end if;
   end Usart1_Udre;


   -- USART0 --

   -- Usart0_RX: interrupt handler of USART0 for RX. This handler will
   --                read data from USART0 and put them in a
   --                circular buffer.
   -- FIXME:
   --       At present, if the circular buffer is full, the new data
   --       will be dropped
   procedure Usart0_RX;
   pragma Machine_Attribute (Usart0_RX, "signal");
   pragma Export (C, Usart0_RX, Vector_USART0_RX);

   procedure Usart0_RX is
   begin
      Uart0RX_Primary_Buffer(Uart0RX_Primary_Buffer_Pos) := Character'Val(UDR0);

      if Uart0RX_Secondary_Buffer_Smph_Taken = false then -- smph not taken, transfer data from prim buffer to sec buffer
         for i in Uart0RX_Primary_Buffer'First .. Uart0RX_Primary_Buffer_Pos loop -- loop through all data in prim buffer
            Uart0RX_Secondary_Buffer(Uart0RX_Secondary_Buffer_Pos) := Uart0RX_Primary_Buffer(i); -- put data in sec buffer
            Uart0RX_Secondary_Buffer_Pos := Uart0RX_Secondary_Buffer_Pos + 1; -- increase ptr in sec buffer
            if Uart0RX_Secondary_Buffer_Pos > Uart0RX_Secondary_Buffer'Last then
               bLED := not bLED;
               AVR.AT90CAN128.PORTD.Bit_7 := bLED;
            end if;
         end loop;
         Uart0RX_Primary_Buffer_Pos := Uart0RX_Primary_Buffer'First; -- reset ptr in prim buffer
      else      -- smph was taken, prepare to keep filling prim buffer
         Uart0RX_Primary_Buffer_Pos := Uart0RX_Primary_Buffer_Pos + 1;
         if Uart0RX_Primary_Buffer_Pos > Uart0RX_Primary_Buffer'Last then -- if prim buffer is full, flush it
            bLED := not bLED;
            AVR.AT90CAN128.PORTE.Bit_4 := bLED;
            Uart0RX_Primary_Buffer_Pos := Uart0RX_Primary_Buffer'First; -- by resetting ptr to first
         end if;
      end if;
   end Usart0_RX;


   -- Usart0_Udre: interrupt handler of USART0 for Data Register Empty.
   --              This handler will read data from a circular buffer
   --              and send it out to USART0 circular buffer.
   procedure Usart0_Udre;
   pragma Machine_Attribute (Usart0_Udre, "signal");
   pragma Export (C, Usart0_Udre, Vector_USART0_UDRE);

   procedure Usart0_Udre is
   begin
      if Uart0_In_W /= Uart0_Out_W then
         UDR0 := Character'Pos (Uart0_Wbuffer(Uart0_Out_W));
         Uart0_Out_W := Uart0_Out_W mod Uart_Buffer_Size + 1;
      else
         UCSR0B.UDRIE := False;
      end if;
   end Usart0_Udre;

   procedure Flush_Receive_Buffer(Port : USARTID) is
   begin
      Asm ("Cli", Volatile => True);
      case Port is
         when USART0 =>
            Uart0_In_R := 1;
            Uart0_Out_R := 1;
         when USART1 =>
            Uart1_In_R := 1;
            Uart1_Out_R := 1;
      end case;
      Asm ("Sei", Volatile => True);
   end Flush_Receive_Buffer;




   -----------------------------------------------------------------------------
   -----------------------   External Subprograms ------------------------------
   -----------------------------------------------------------------------------
   -- Data_Available: Check whether there are some valid
   --                    data from USARTs or not
   -- Parameter:
   --             Port : denote the ID of USART.(USART0 OR USART1)
   -- Return value:
   --               This function will return false if there is no
   --               valid data, otherwise it will return True.
   function Data_Available (Port : USARTID := Default_USART) return Integer is
      Result : Integer;
   begin
      case Port is
         when USART0 =>
            return Uart0RX_Secondary_Buffer_Pos - Uart0RX_Secondary_Buffer'First;
         when USART1 =>
            Result := (Uart_Buffer_Size + (Uart1_In_R - Uart1_Out_R)) mod Uart_Buffer_Size;
            return Result;
      end case;
   end Data_Available;

   function Space_Available (Port : USARTID := Default_USART) return Integer is
      iSpaceUsed : Integer;
   begin
      case Port is
         when USART0 =>
            iSpaceUsed := (Uart0_In_W - Uart0_Out_W) mod Uart_Buffer_Size;
            return Uart_Buffer_Size - iSpaceUsed - 1;
         when USART1 =>
            iSpaceUsed := (Uart1_In_W - Uart1_Out_W) mod Uart_Buffer_Size;
            return Uart_Buffer_Size - iSpaceUsed - 1;
      end case;
   end Space_Available;

   -- Get_Char: Read one byte from the USARTs
   -- Parameters:
   --            Port        : denote the ID of USART.(USART0 OR USART1)
   --            Ch(out)     : the character which read from USARTS..
   --           Return(out)  : this function will return True if at least one byte is available.
   --                          otherwill it will be False.
   procedure Get_Char (Port : USARTID; Ch : out Character; Ret : out Boolean) is
   begin
      case Port is
         when USART0 =>
            if Uart0_In_R /= Uart0_Out_R then
               Ch := Uart0_Rbuffer(Uart0_Out_R);
               Uart0_Out_R := (Uart0_Out_R mod Uart_Buffer_Size) + 1;
               Ret := True;
               return;
            end if;
            Ret := False;
         when USART1 =>
            if Uart1_In_R /= Uart1_Out_R then
               Ch := Uart1_Rbuffer(Uart1_Out_R);
               Uart1_Out_R := (Uart1_Out_R mod Uart_Buffer_Size) + 1;
               Ret := True;
               return;
            end if;
            Ret := False;
      end case;
   end Get_Char;

   -- Read: Read the data to the USARTs
   -- Parameters:
   --            Buffer(out): the Data which read from the USART will be put in this buffer.
   --            Port       : denote the ID of USART.(USART0 OR USART1)
   --            Size       : denote how many data should be read.
   --            Num (out)  : How many data have been actually read
   procedure Read (Buffer : out String; Port : USARTID := Default_USART; Size : Integer; Num : out Integer)  is
      Number : Integer := 0;
      iRefillPos : Integer := Uart0RX_Secondary_Buffer'First;
   begin
      Number := 0;
      case Port is
         when USART0 =>
            Uart0RX_Secondary_Buffer_Smph_Taken := true;
            for i in Uart0RX_Secondary_Buffer'First .. Uart0RX_Secondary_Buffer_Pos - 1 loop
               if i < Uart0RX_Secondary_Buffer'First + Size then
                  Buffer(Buffer'First + (i - Uart0RX_Secondary_Buffer'First)) := Uart0RX_Secondary_Buffer(i);
                  Number := Number + 1;
               else
                  Uart0RX_Secondary_Buffer(iRefillPos) := Uart0RX_Secondary_Buffer(i);
                  iRefillPos := iRefillPos + 1;
               end if;
            end loop;
            Uart0RX_Secondary_Buffer_Pos := iRefillPos;
            Uart0RX_Secondary_Buffer_Smph_Taken := false;
            Num := Number;
         when USART1 =>
            while Number < Size loop
               if Uart1_In_R /= Uart1_Out_R then
                  Number := Number + 1;
                  Buffer((Buffer'First - 1) + Number) := Uart1_Rbuffer(Uart1_Out_R);
                  Uart1_Out_R := Uart1_Out_R mod Uart_Buffer_Size + 1;
               else
                  Num := Number;
                  return;
               end if;
            end loop;
            Num := Number;
      end case;
   end Read;

   -- Put: Send one byte to the USARTs
   -- Parameters:
   --            Item  : the character is going to be sent.
   --            Port  : denote the ID of USART.(USART0 OR USART1)
   -- Return value: this function will return false if this character cannot be sent out
   --               otherwill it will return True.
   function Put (Item : Character;Port : USARTID := Default_USART) return Boolean is
      Pos : Integer;
   begin
      case Port is
         when USART0 =>
            Pos := Uart0_In_W mod Uart_Buffer_Size + 1;
            if Pos /= Uart0_Out_W then
               --Insert in Buffer
               Uart0_Wbuffer(Uart0_In_W) := Item;
               Uart0_In_W := Pos;
               if not UCSR0B.UDRIE then
                  if UCSR0A.UDRE then
                     UDR0 := Character'Pos (Uart0_Wbuffer(Uart0_Out_W));
                     Uart0_Out_W := Uart0_Out_W mod Uart_Buffer_Size + 1;
                  end if;
                  UCSR0B.UDRIE := True;
               end if;
               return True;
            else
               return False;
            end if;
         when USART1 =>
            Pos := Uart1_In_W mod Uart_Buffer_Size + 1;
            if Pos /= Uart1_Out_W then
               --Insert in Buffer
               Uart1_Wbuffer(Uart1_In_W) := Item;
               Uart1_In_W := Pos;
               if not UCSR1B.UDRIE then
                  if UCSR1A.UDRE then
                     UDR1 := Character'Pos (Uart1_Wbuffer(Uart1_Out_W));
                     Uart1_Out_W := Uart1_Out_W mod Uart_Buffer_Size + 1;
                  end if;
                  UCSR1B.UDRIE := True;
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
   --            Port  : denote the ID of USART.(USART0 OR USART1)
   --            Size  : denote how many data should be send.
   -- Return value:
   --               How many data have been actually sent out
   function  Write (Buffer : String; Port : USARTID := Default_USART; Size : Positive) return Integer is
      Result : Boolean;
      Count : Integer;
      Last : Integer;
   begin
      if Buffer'First + Size - 1 <= Buffer'Last then
         Last :=  Buffer'First + Size - 1;
      else
         Last :=  Buffer'Last;
      end if;

      Count := 0;
      for I in Buffer'First..Last loop
         --        for I in 1..Size loop
         Result := Put(Buffer(I),Port);
         if Result then
            Count := Count + 1;
         else
            return Count;
         end if;
      end loop;
      return Size;
   end Write;

end AVR.AT90CAN128.USART;
