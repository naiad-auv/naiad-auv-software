
---------------------------------------------------------------------------
-- This code is mainly based on the router.adb file from the Vasa project.
-- As of now it is not using any handshake at all.
-- It has been tested in hardware and it works.

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-24

-- To do: Hardware testing.

---------------------------------------------------------------------------

with Interfaces;
with CAN_Link_Utils;

package body CAN_Link_pack is
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
      -- This procedure will not return until if it has sent all data
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



   procedure Send_CanData_To_BBB(Msg : AVR.AT90CAN128.CAN.CAN_Message) is
      Can_Buf   : String(1..Integer(Msg.Len) + CAN_Link_Utils.HEADLEN);
   begin
      CAN_Link_Utils.Message_To_Bytes(Can_Buf, Msg);
      Usart_Write(Can_Buf, USART_PORT, Integer(Msg.Len) + CAN_Link_Utils.HEADLEN);
   end Send_CanData_To_BBB;

   procedure CANBUS_Monitoring is
      Msg_In : AVR.AT90CAN128.CAN.CAN_Message;
      Ret    : Boolean;
   begin

      AVR.AT90CAN128.CAN.Can_Get(Msg_In, Ret, 0);
      while Ret loop
         Send_CanData_To_BBB(Msg_In);

         AVR.AT90CAN128.CAN.Can_Get(Msg_In, Ret, 0);
      end loop;
   end CANBUS_Monitoring;

   --     procedure Send_CanData_To_Can(ID : AVR.AT90CAN128.CAN.CAN_ID; Len : AVR.AT90CAN128.DLC_Type ; Data : String) is
   --        Msg : AVR.AT90CAN128.CAN.CAN_Message;
   --     begin
   --        Msg.ID := ID;
   --        Msg.Len := Len;
   --        for I in 1..Len loop
   --           Msg.Data (I) := Character'Pos(Data(Integer(I)));
   --        end loop;
   --        AVR.AT90CAN128.CAN.Can_Send (Msg);
   --     end Send_CanData_To_Can;

   procedure Cmd_Handler is

      use AVR.AT90CAN128.CAN;
      use Interfaces;

      iRnum        	  : Integer;
      Head_Buf     	  : String(1..CAN_Link_Utils.HEADLEN);
      u8ActualChecksum    : Interfaces.Unsigned_8;
      u8ReceivedChecksum  : Interfaces.Unsigned_8;
      msg 		  : AVR.AT90CAN128.CAN.CAN_Message;
   begin

      if AVR.AT90CAN128.USART.Data_Available(USART_PORT) < CAN_Link_Utils.HEADLEN  then
         return;
      end if;

      Usart_Read(Head_Buf, USART_PORT, CAN_Link_Utils.HEADLEN, iRnum);

      CAN_Link_Utils.Bytes_To_Message_Header(Head_Buf, msg, u8ReceivedChecksum);

      if Integer(msg.Len) /= 0 then
         while AVR.AT90CAN128.USART.Data_Available < Integer(msg.Len) loop
            null;
         end loop;

         declare
            Data_Buf   : String(1..Integer(msg.Len));
            iData_Num  : Integer;
         begin
            Usart_Read(Data_Buf, USART_PORT, Integer(msg.Len), iData_Num);
            CAN_Link_Utils.Bytes_To_Message_Data(Data_Buf, msg, u8ActualChecksum);
         end;

         --At present, we just ignore this message if the checksum is wrong.
         if u8ReceivedChecksum /= u8ActualChecksum then
            return;
         end if;
      end if;
      AVR.AT90CAN128.CAN.Can_Send(msg);

   end Cmd_Handler;


   --     procedure Wait_For_Reply(Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART) is
   --        sBuffer : String(1..HEADLEN);
   --        Num    : Integer := 0;
   --        cChar : Character;
   --        bRet : Boolean;
   --
   --     begin
   --        loop
   --           while Num < 5 loop
   --              Avr.AT90CAN128.USART.Get_Char(Port, cChar, bRet);
   --              if bRet then
   --                 Num := Num + 1;
   --                 sBuffer(Num) := cChar;
   --              end if;
   --           end loop;
   --
   --           if Character'Pos(sBuffer(1)) /= 3 or
   --             Character'Pos(sBuffer(2)) /=  0 or
   --             Character'Pos(sBuffer(3)) /=  0 or
   --             Character'Pos(sBuffer(4)) /=  0 or
   --             Character'Pos(sBuffer(5)) /=  0 then
   --              AVR.AT90CAN128.USART.Flush_Receive_Buffer;
   --           else
   --              exit;
   --           end if;
   --        end loop;
   --     end Wait_For_Reply;
   --
   --     procedure Send_Reply(Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART) is
   --        sBuffer : String(1..5);
   --     begin
   --        sBuffer(1) := Character'Val(3);
   --        sBuffer(2) := Character'Val(0);
   --        sBuffer(3) := Character'Val(0);
   --        sBuffer(4) := Character'Val(0);
   --        sBuffer(5) := Character'Val(0);
   --        Usart_Write(sBuffer, Port, 5);
   --     end Send_Reply;

   --waiting for the BBB.
   --This application should start before BBB starts
   --     procedure Handshake_With_BBB is
   --     begin
   --        AVR.AT90CAN128.WDTCR := (False, False, False, True, True, True, True, True);  -- enables watchdog timer, will resest the controller if no handshake successful
   --        AVR.AT90CAN128.WDTCR := (False, False, False, True, True, True, True, True);
   --        Wait_For_Reply(USART_PORT);
   --        AVR.AT90CAN128.WDTCR := (False, False, False, True, True, True, True, True);
   --        AVR.AT90CAN128.WDTCR := (False, False, False, True, False, True, True, True);
   --        AVR.AT90CAN128.WDTCR := (False, False, False, False, False, False, False, False);
   --        Send_Reply(USART_PORT);
   --     end Handshake_With_BBB;

   procedure Main_Loop is
   begin

      loop
         -- Handle the commands from the BBB
         Cmd_Handler;
         -- Deal with the data from the CAN bus.
         CANBUS_Monitoring;
      end loop;
   end Main_Loop;

   procedure Hardware_Init is
   begin
      AVR.AT90CAN128.USART.Init(USART_PORT,  AVR.AT90CAN128.USART.BAUD38400);

      --   Handshake_With_BBB;

      AVR.AT90CAN128.CAN.Can_Init(AVR.AT90CAN128.CAN.K250);

      for i in 0..3 loop
         AVR.AT90CAN128.CAN.Can_Set_MOB_ID_MASK(
                 AVR.AT90CAN128.READ_MOB_ID(i), (0, false), (0, false));
         AVR.AT90CAN128.CAN.Can_Set_MOB_ID_MASK(
                 AVR.AT90CAN128.READ_MOB_ID(i+4), (0, true), (0, true));
      end loop;
   end Hardware_Init;

end CAN_Link_pack;
