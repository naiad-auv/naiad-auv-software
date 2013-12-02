
-- This file contains functions for ins_controller in order to reduce its number of lines of code.
--  Written by: Nils Brynedal Ignell for the Naiad AUV project
--  Last changed (yyyy-mm-dd): 2013-11-02

--  TODO: Hardware testing....



with AVR.AT90CAN128;
with AVR.AT90CAN128.USART;

package Ins_Controller_Utils is

   procedure Write(sData : String; iSize : Integer; port : AVR.AT90CAN128.USART.USARTID);
   procedure Read(sData : out String; iSize : Integer; iCharsRead : out Integer; port : AVR.AT90CAN128.USART.USARTID);
   procedure Send_Command(sCommand : String; port : AVR.AT90CAN128.USART.USARTID);
   procedure Init_Uart(port : AVR.AT90CAN128.USART.USARTID);
   procedure Init_Interrupts;
   procedure Communication_Protocol_Control(port : AVR.AT90CAN128.USART.USARTID);
   procedure Async_Data_Output_Type_Register_Off;
   procedure Async_Data_Output_Frequency_Register(port : AVR.AT90CAN128.USART.USARTID);
   procedure Synchronization_Control(port : AVR.AT90CAN128.USART.USARTID);
   procedure VPE_Basic_Control(port : AVR.AT90CAN128.USART.USARTID);
   procedure Async_Data_Output_Type_Register(port : AVR.AT90CAN128.USART.USARTID);
--     procedure sChecksum(sData : String; iSize : Integer; sStr : out String);
end Ins_Controller_Utils;
