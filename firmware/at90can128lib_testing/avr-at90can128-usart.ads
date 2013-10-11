package AVR.AT90CAN128.USART is
   type BAUDTYPE is (BAUD9600, BAUD38400, BAUD57600, BAUD115200);

   type USARTID is (USART0,USART1);
   Default_USART : constant USARTID := USART0;

   procedure Init (Port : USARTID := Default_USART; Baud : BAUDTYPE);

   function Put
     (Item : Character;
      Port : USARTID := Default_USART) return Boolean;


   function Write
     (Buffer : String;
      Port   : USARTID := Default_USART;
      Size   : Positive) return Integer;

   function Data_Available
     (Port : USARTID := Default_USART)
   return Boolean;

   procedure Get_Char (Port : USARTID; Ch : out Character; Ret : out Boolean);

   procedure Read
     (Buffer : out String;
      Port   : USARTID := Default_USART;
      Size   : Positive;
      Num    : out Integer);

   procedure Flush_Receive_Buffer;

end AVR.AT90CAN128.USART;
