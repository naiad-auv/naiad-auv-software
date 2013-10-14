
---------------------------------------------------------------------------
-- This code is mainly based on the router.adb file from the Vasa project

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-03

-- TODO:

---------------------------------------------------------------------------

with AVR.AT90CAN128;
with AVR.AT90CAN128.USART;
with AVR.AT90CAN128.CAN;
with Interfaces;

package CAN_Link_pack is

   -- USART0 is used for the communication between the CAN Router and Qseven
   Q7USART       : constant AVR.AT90CAN128.USART.USARTID    := AVR.AT90CAN128.USART.USART0;

   -- USART1 is used for the communication between the CAN Router and the outside computer
   xUSART        : constant AVR.AT90CAN128.USART.USARTID    := AVR.AT90CAN128.USART.USART1;

   --the lenght of  the Header of the packet is 5
   HEADLEN       : constant integer    := 5;

   -- Maximum length of data is 8 (excluding the the header of the packet)
   MAX_DATALEN   : constant AVR.AT90CAN128.DLC_Type   := 8;


   -- Data type should be put in the 1st byte to indicate that
   -- the data packet is CAN bus data, Servo command or Serial communication data
   BUSTYPE_POS   : constant Integer    := 1;

   -- ID of data should be put in 2nd and 3rd byte
   -- At present, Only CAN data need ID, for servo and
   -- Serial communication, these two bytes should be 0
   IDHIGH_POS    : constant integer    := 2;
   IDLOW_POS     : constant integer    := 3;

   -- The length of data should be put in 4th byte
   LEN_POS       : constant integer    := 4;

   --Checksum should be put in the 5th byte
   Checksum_POS  : constant integer    := 5;

   MIN_CANID     : constant AVR.AT90CAN128.CAN.CAN_ID     := 10;
   CAN_DATA      : constant Interfaces.Unsigned_8 := 16#00#;
   SERIAL_DATA   : constant Interfaces.Unsigned_8 := 16#02#;
   Head_Buf      : String(1..HEADLEN);

   function Calculate_Checksum(Data : String; Len : Integer) return Interfaces.Unsigned_8;

   procedure usart_write(Buffer : String;   Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART; Size   : Positive);

   procedure usart_Read(Buffer : out String; Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                        Size   : Positive; Number : out integer);

   procedure Send_CanData_To_Qseven(Msg : AVR.AT90CAN128.CAN.CAN_Message);

   procedure Send_CanData_To_Can(ID : AVR.AT90CAN128.CAN.CAN_ID; Len : AVR.AT90CAN128.DLC_Type ; Data : String);

   procedure Send_Serial_Data_Out(Data : String; Len : Interfaces.Unsigned_8);

   procedure CANBUS_Monitoring;

   procedure Qseven_Cmd_Handler;

   procedure Wait_For_Reply(Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART);

   procedure Send_Reply(Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART);

   procedure HandshakeWithQseven;

   procedure Main_Loop;

   procedure hardware_init;

end CAN_Link_pack;
