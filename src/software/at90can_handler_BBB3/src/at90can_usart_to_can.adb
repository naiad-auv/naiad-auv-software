
---------------------------------------------------------------------------
-- This code is mainly based on the router.adb file from the Vasa project.
-- As of now it is not using any handshake at all.
-- It has been tested in hardware and it works.

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-12

-- To do: Hardware testing.

---------------------------------------------------------------------------

with Interfaces;
with CAN_Utils;
with AVR.AT90CAN128.CAN;
--with Board_and_Mode_Defs;

package body AT90CAN_Usart_To_Can is
   pragma Suppress (All_Checks);

   procedure Usart_Write(sBuffer : String;   Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                         iSize   : Positive) is
      iLeft  : Integer;
      iPos   : Integer;
      sTemp  : String(1..iSize);
      iNum   : Integer;
   begin
      iPos  := 0;
      iLeft := iSize;
      -- This procedure will not return until it has sent all data
      while iLeft > 0 loop
         for I in 1..iLeft loop
            sTemp(I) := sBuffer(iPos + I);
         end loop;
         iNum := AVR.AT90CAN128.USART.Write(sTemp, Port, iLeft);
         iLeft := iLeft - iNum;
         iPos  := iPos + iNum;
      end loop;
   end  Usart_Write;

   procedure Usart_Read(sBuffer : out String; Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                        iSize   : Positive; iNumber : out integer) is
      iPos      : Integer;
      iLeft     : Integer;
      iTemp     : String(1..iSize);
      iNum      : Integer;
   begin
      iLeft := iSize;
      iPos  := 0;
      while iLeft > 0 loop
         AVR.AT90CAN128.USART.Read(iTemp, Port, iLeft, iNum);
         if iNum /= 0 then
            for I in 1..iNum loop
               sBuffer(iPos + I) := iTemp(I);
            end loop;
            iLeft := iLeft - iNum;
            iPos  := iPos + iNum;
         else
            --This procedure will return if it got nothning
            if iPos = 0 then
               iNumber := 0;
               return;
            end if;
         end if;
      end loop;
      iNumber := iPos;
   end  Usart_Read;



   procedure Send_CanData_To_BBB(Msg : Can_Defs.CAN_Message) is
      Can_Buf   : String(1..Integer(Msg.Len) + CAN_Utils.HEADLEN);
   begin
      CAN_Utils.Message_To_Bytes(Can_Buf, Msg);
      Usart_Write(Can_Buf, USART_PORT, Integer(Msg.Len) + CAN_Utils.HEADLEN);
   end Send_CanData_To_BBB;

   procedure Handle_Can is
      Msg_In : Can_Defs.CAN_Message;
      Ret    : Boolean;
      use Interfaces; -- For 13 test
   begin
      -- This function only handles one message at a time, giving
      -- higher priority to receiving messages on the uart than on the can bus
      -- An overflow in the can bus buffer causes a missed message.
      -- An overflow in the uart receive buffer causes the protocal to .
      AVR.AT90CAN128.CAN.Can_Get(Msg_In, Ret, 0);
      if Ret then
         -- Set diode if 13 is read from CAN
--           if Msg_In.Data(1) = 13 then
            AVR.AT90CAN128.PORTE.Bit_4 := true;
--           end if;

         Send_CanData_To_BBB(Msg_In);
      end if;
--        while Ret loop
--           Send_CanData_To_BBB(Msg_In);
--
--           AVR.AT90CAN128.CAN.Can_Get(Msg_In, Ret, 0);
--        end loop;
   end Handle_Can;

   procedure Handle_Uart is

      use AVR.AT90CAN128.CAN;
      use Interfaces;

      iRnum        	  : Integer;
      Head_Buf     	  : String(1..CAN_Utils.HEADLEN);
      u8ActualChecksum    : Interfaces.Unsigned_8;
      u8ReceivedChecksum  : Interfaces.Unsigned_8;
      msg 		  : Can_Defs.CAN_Message;
   begin

      loop
         if AVR.AT90CAN128.USART.Data_Available(USART_PORT) < CAN_Utils.HEADLEN  then
            return;
         end if;

         Usart_Read(Head_Buf, USART_PORT, CAN_Utils.HEADLEN, iRnum);

         CAN_Utils.Bytes_To_Message_Header(Head_Buf, msg, u8ReceivedChecksum);

         if Integer(msg.Len) /= 0 then
            while AVR.AT90CAN128.USART.Data_Available(USART_PORT) < Integer(msg.Len) loop
               null;
            end loop;

            declare
               Data_Buf   : String(1..Integer(msg.Len));
               iData_Num  : Integer;
            begin
               Usart_Read(Data_Buf, USART_PORT, Integer(msg.Len), iData_Num);
               CAN_Utils.Bytes_To_Message_Data(Data_Buf, msg, u8ActualChecksum);
            end;

            --At present, we just ignore this message if the checksum is wrong.
            if u8ReceivedChecksum /= u8ActualChecksum then
               return;
            end if;
         end if;

         AVR.AT90CAN128.CAN.Can_Send(msg);
      end loop;
   end Handle_Uart;

   procedure Main_Loop is
   begin

      loop
         -- Handle the messages from the BBB
         Handle_Uart;
         -- Deal with the messages from the CAN bus.
         Handle_Can;
      end loop;
   end Main_Loop;

   procedure Hardware_Init is
   begin
      AVR.AT90CAN128.DDRE.Bit_4 := true;
      AVR.AT90CAN128.PORTE.Bit_4 := false;

      AVR.AT90CAN128.USART.Init(USART_PORT,  AVR.AT90CAN128.USART.BAUD115200);

      --   Handshake_With_BBB;

      AVR.AT90CAN128.CAN.Can_Init(Can_Defs.K250, Board_and_Mode_Defs.BBB_CONTROLLER_3 );

--        for i in 0..3 loop
--           AVR.AT90CAN128.CAN.Can_Set_MOB_ID_MASK(
--                   AVR.AT90CAN128.CAN.BUFFER_ID(i), (0, false), (0, false));
--           AVR.AT90CAN128.CAN.Can_Set_MOB_ID_MASK(
--                   AVR.AT90CAN128.CAN.BUFFER_ID(i+4), (0, true), (0, true));
--        end loop;
      AVR.AT90CAN128.CAN.Can_Set_All_MOB_ID_MASK(CAN_Defs.MSG_THRUSTER_ID,
                                                CAN_Defs.MSG_THRUSTER_ID);
   end Hardware_Init;

end AT90CAN_Usart_To_Can;
