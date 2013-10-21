
---------------------------------------------------------------------------
-- This code is mainly based on the router.adb file from the Vasa project

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-18

-- TODO:

---------------------------------------------------------------------------

package body CAN_Link_pack is
   pragma Suppress (All_Checks);

   function Calculate_Checksum(Data : String; Len : Integer) return Interfaces.Unsigned_8 is
      Checksum : Interfaces.Unsigned_8 := 0;
      use Interfaces;
   begin
      for I in 1..Len loop
         Checksum := Checksum xor Character'Pos(Data(I));
      end loop;
      return Checksum;
   end;

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
      iDataLen  : Integer;
   begin
      iDataLen := Integer(Msg.Len);
      declare
         Can_Buf   : String(1..iDataLen + HEADLEN);
         Temp_Buf  : String(1..iDataLen);
         Len       : Integer  := HEADLEN;
         Checksum  : Interfaces.Unsigned_8;
      begin
         --Set the header of this buffer.
         Can_Buf(BUSTYPE_POS) 	:= Character'Val(0);
         Can_Buf(IDHIGH_POS) 	:= Character'Val(Integer(Msg.ID) / 256);
         Can_Buf(IDLOW_POS) 	:= Character'Val(Integer(Msg.ID) Mod 256);
         Can_Buf(LEN_POS) 	:= Character'Val(iDataLen);
         if iDataLen /= 0 then
            for I in 1..iDataLen loop
               Can_Buf(HEADLEN + I) := Character'Val(Msg.Data ( AVR.AT90CAN128.DLC_Type(I)));
               Temp_Buf(I) := Character'Val(Msg.Data ( AVR.AT90CAN128.DLC_Type(I)));
            end loop;
            Len := Len + iDataLen;

            Checksum := Calculate_Checksum(Temp_Buf, iDataLen);
            Can_Buf(Checksum_POS) := Character'Val(Checksum);
         else
            Can_Buf(Checksum_POS) := Character'Val(0);
         end if;
         --Send the data to BBB
         Usart_Write(Can_Buf, USART_PORT, Len);
      end;
   end Send_CanData_To_BBB;

   procedure Send_CanData_To_Can(ID : AVR.AT90CAN128.CAN.CAN_ID; Len : AVR.AT90CAN128.DLC_Type ; Data : String) is
      Msg : AVR.AT90CAN128.CAN.CAN_Message;
   begin
      Msg.ID := ID;
      Msg.Len := Len;
      for I in 1..Len loop
         Msg.Data (I) := Character'Pos(Data(Integer(I)));
      end loop;
      AVR.AT90CAN128.CAN.Can_Send (Msg);
   end Send_CanData_To_Can;

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


   procedure Cmd_Handler is

      use AVR.AT90CAN128.CAN;
      use Interfaces;

      iRnum        : Integer;
      iDataLen     : Interfaces.Unsigned_8;
      u8Data_Type  : Interfaces.Unsigned_8;
      ID           : AVR.AT90CAN128.CAN.CAN_ID;
      Data_Buf     : String(1..Integer(MAX_DATALEN));
      u8Checksum   : Interfaces.Unsigned_8;
   begin
      Usart_Read(Head_Buf, USART_PORT, HEADLEN, iRnum);

      if iRnum = HEADLEN then
         --First get the size of the data
         iDataLen := Character'Pos(Head_Buf(LEN_POS));
         if iDataLen /= 0 then
            declare
               Data_Num : Integer := 0;
            begin

               while Data_Num = 0 loop
                  Usart_Read(Data_Buf, USART_PORT, Integer(iDataLen), Data_Num);
               end loop;
            end;
            u8Checksum := Calculate_Checksum(Data_Buf, Integer(iDataLen));

            --At present, We just ignore this buffer if the checksum is wrong.
            if u8Checksum /= Character'Pos(Head_Buf(Checksum_POS)) then
               return;
            end if;
         end if;

         u8Data_Type := Character'Pos(Head_Buf(BUSTYPE_POS));
         case u8Data_Type is
            -- Can bus data
            when CAN_DATA =>
               ID := Character'Pos(Head_Buf(IDHIGH_POS)) * 256 + Character'Pos(Head_Buf(IDLOW_POS));

               Send_CanData_To_Can(ID, AVR.AT90CAN128.DLC_Type(iDataLen), Data_Buf);

            when others => null;
         end case;
      end if;
   end Cmd_Handler;

   procedure Wait_For_Reply(Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART) is
      Buffer : String(1..HEADLEN);
      Num    : Integer := 0;
   begin
      loop
         while Num = 0 loop
            Usart_Read(Buffer, Port, HEADLEN, Num);
         end loop;
         if Character'Pos(buffer(1)) /= 3 or
           Character'Pos(buffer(2)) /=  0 or
           Character'Pos(buffer(3)) /=  0 or
           Character'Pos(buffer(4)) /=  0 or
           Character'Pos(buffer(5)) /=  0 then
            AVR.AT90CAN128.USART.Flush_Receive_Buffer;
         else
            exit;
         end if;
      end loop;
   end Wait_For_Reply;

   procedure Send_Reply(Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART) is
      sBuffer : String(1..HEADLEN);
   begin
      sBuffer(1) := Character'Val(3);
      sBuffer(2) := Character'Val(0);
      sBuffer(3) := Character'Val(0);
      sBuffer(4) := Character'Val(0);
      sBuffer(5) := Character'Val(0);
      Usart_Write(sBuffer, Port, HEADLEN);
   end Send_Reply;

   --waiting for the BBB.
   --This application should start before BBB starts
   procedure Handshake_With_BBB is
   begin
      AVR.AT90CAN128.WDTCR := (False, False, False, True, True, True, True, True);  -- enables watchdog timer, will resest the controller if no handshake successful
      AVR.AT90CAN128.WDTCR := (False, False, False, True, True, True, True, True);
      Wait_For_Reply(USART_PORT);
      AVR.AT90CAN128.WDTCR := (False, False, False, True, True, True, True, True);
      AVR.AT90CAN128.WDTCR := (False, False, False, True, False, True, True, True);
      AVR.AT90CAN128.WDTCR := (False, False, False, False, False, False, False, False);
      Send_Reply(USART_PORT);
   end Handshake_With_BBB;

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

      Handshake_With_BBB;

      AVR.AT90CAN128.CAN.Can_Init(AVR.AT90CAN128.CAN.K250);
      AVR.AT90CAN128.CAN.Can_Set_All_MOB_ID_MASK(0, 0);
   end Hardware_Init;

end CAN_Link_pack;
