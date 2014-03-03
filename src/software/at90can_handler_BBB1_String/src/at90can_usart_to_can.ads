
---------------------------------------------------------------------------
-- This code is mainly based on the router.adb file from the Vasa project.
-- As of now it is not using any handshake at all.
--

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-28

---------------------------------------------------------------------------

with AVR.AT90CAN128;
with AVR.AT90CAN128.USART;
with Board_and_Mode_Defs;
with CAN_Defs;

package AT90CAN_Usart_To_Can is

   procedure Main_Loop;

   procedure Hardware_Init;

    subtype UART_TO_CAN_BOARD is Board_and_Mode_Defs.Boards range Board_and_Mode_Defs.BBB_CONTROLLER_1.. Board_and_Mode_Defs.BBB_CONTROLLER_3;

--    type UART_TO_CAN_BOARD is (Board_and_Mode_Defs.BBB_CONTROLLER_1, Board_and_Mode_Defs.BBB_CONTROLLER_2, Board_and_Mode_Defs.BBB_CONTROLLER_3);
private


   bTransmissionLED : boolean := false;
   bAliveLED : boolean := false;

   -- USART1 is used for the communication between the CAN Router and BBB
   USART_PORT       : constant AVR.AT90CAN128.USART.USARTID    := AVR.AT90CAN128.USART.USART1;

   procedure Usart_Write(sBuffer : String;   Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                         iSize   : Positive);

   procedure Usart_Read(sBuffer : out String; Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                        iSize   : Positive; iNumber : out integer);

   procedure Send_CanData_To_BBB(Msg : Can_Defs.CAN_Message);
   procedure Handle_Can;
   procedure Handle_Uart;

   procedure Init_Transmission_LED;
   procedure Init_Alive_LED;
   procedure Flip_Transmission_LED;
   procedure Flip_Alive_LED;

end AT90CAN_Usart_To_Can;
