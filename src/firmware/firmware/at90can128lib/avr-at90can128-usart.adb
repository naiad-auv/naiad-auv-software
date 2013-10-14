with AVR.AT90CAN128 ; use AVR.AT90CAN128;
with System;
with System.Machine_Code;
use System.Machine_Code;
--with Interfaces; use Interfaces;

package body AVR.AT90CAN128.USART is
   pragma Suppress (All_Checks);


   Uart_Buffer_Size : constant Integer := 64;

   -- the Circular buffer for USART0 receiver
   Uart0_Rbuffer : String (1..Uart_Buffer_Size);
   Uart0_In_R  : Integer := 1;
   Uart0_Out_R : Integer := 1;

    -- the Circular buffer for USART0 transmitter
   Uart0_Wbuffer : String (1..Uart_Buffer_Size);
   Uart0_In_W  : Integer := 1;
   Uart0_Out_W : Integer := 1;

   pragma Volatile (Uart0_In_R);
   pragma Volatile (Uart0_Out_R);
   pragma Volatile (Uart0_In_W);
   pragma Volatile (Uart0_Out_W);

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
         end case;

         --UBRR0H := 0;

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
         end case;
         --UBRR1H := 0;
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
   begin
      Pos := Uart1_In_R mod Uart_Buffer_Size + 1;
      if Pos /= Uart1_Out_R then
         Uart1_Rbuffer(Uart1_In_R) := Character'Val (UDR1);
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
      Pos  : Integer;
   begin
      Pos := (Uart0_In_R mod Uart_Buffer_Size) + 1;
      if Pos /= Uart0_Out_R then
         Uart0_Rbuffer(Uart0_In_R) := Character'Val(UDR0);
         Uart0_In_R := Pos;
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

   procedure Flush_Receive_Buffer is
   begin
      Asm ("Cli", Volatile => True);
      Uart0_In_R := 0;
      Uart0_Out_R := 0;
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
   function Data_Available (Port : USARTID := Default_USART) return Boolean is
      Result : Boolean;
   begin
      case Port is
         when USART0 =>
            Result := Uart0_In_R /= Uart0_Out_R;
            return Result;
         when USART1 =>
            Result := Uart1_In_R /= Uart1_Out_R;
            return Result;
      end case;
   end Data_Available;



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
   procedure Read (Buffer : out String; Port : USARTID := Default_USART; Size : Positive; Num : out Integer)  is
      Number : Integer;
   begin
      Number := 0;
      case Port is
         when USART0 =>
            while Number < Size loop
               if Uart0_In_R /= Uart0_Out_R then
                  Number := Number + 1;
                  Buffer(Number) := Uart0_Rbuffer(Uart0_Out_R);
                  Uart0_Out_R := (Uart0_Out_R mod Uart_Buffer_Size) + 1;
               else
                  Num := Number;
                  return;
               end if;
            end loop;
            Num := Number;
            return;
         when USART1 =>
            while Number < Size loop
               if Uart1_In_R /= Uart1_Out_R then
                  Number := Number + 1;
                  Buffer(Number) := Uart1_Rbuffer(Uart1_Out_R);
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
   begin
      Count := 0;
      --for I in Buffer'range loop
      for I in 1..Size loop
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
