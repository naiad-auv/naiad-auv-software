
---------------------------------------------------------------------------
-- This code is mainly based on the router.adb file from the Vasa project

-- Rewritten by Nils Brynedal Ignell for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-03

-- TODO:

---------------------------------------------------------------------------

with Text_IO;

package body CAN_Link_pack is
   pragma Suppress (All_Checks);

   ---------------------------------------------------------------------------
   --- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   TEST_MESSAGE_ID : AVR.AT90CAN128.CAN.CAN_ID := 634; -- 00000010 01111010  = <start of text>, z
   TEST_MESSAGE_LENGTH : AVR.AT90CAN128.DLC_Type := 7; --I
   TEST_MESSAGE : AVR.AT90CAN128.CAN.Byte8 := (65, 66, 67, 68, 69, 70, 71, 72); -- A..H
       ---------------------------------------------------------------------------

   function Calculate_Checksum(Data : String; Len : Integer) return Interfaces.Unsigned_8 is
      Checksum : Interfaces.Unsigned_8 := 0;
   begin
      for I in 1..Len loop
         Checksum := Interfaces."xor"(Checksum, Character'Pos(Data(I)));
      end loop;
      return Checksum;
   end;

   procedure usart_write(Buffer : String;   Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                         Size   : Positive) is
      Left  : Integer;
      Pos   : Integer;
      Temp : String(1..Size);
      Num  : Integer;


   begin

      Text_IO.Put_Line("usart_write");
      Pos  := 0;
      Left := Size;
      -- This procedure will not return until if it has all data sent;
      while Left > 0 loop
         for I in 1..Left loop
            Temp(I) := Buffer(Pos + I);
         end loop;

         --num := AVR.AT90CAN128.USART.Write(Temp, Port, Left);

         --- ----------- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         for i in 1..Temp'Length loop
            Text_IO.Put_Line(Integer'Image(Character'Pos(Temp(i))));
         end loop;
         num := Left;
         -- ----------- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

         Left := Left - Num;
         Pos  := Pos + Num;
       --  Text_IO.Put_Line("loop");
      end loop;
   end  usart_write;

   procedure usart_Read(Buffer : out String; Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART;
                        Size   : Positive; Number : out integer) is
      Pos      : Integer;
      Left     : Integer;
      Temp     : String(1..Size);
      Num      : Integer;
   begin
      Left := Size;
      Pos  := 0;
      while Left > 0 loop
         AVR.AT90CAN128.USART.Read(Temp, Port, Left, Num);
         if Num /= 0 then
            for I in 1..Num loop
               Buffer(Pos + I) := Temp(I);
            end loop;
            Left := Left - Num;
            Pos  := Pos + Num;
         else
            --This procedure will return if it got nothning
            if Pos = 0 then
               Number := 0;
               return;
            end if;
         end if;
      end loop;
      Number := Pos;
   end  usart_read;


   procedure Send_CanData_To_Qseven(Msg : AVR.AT90CAN128.CAN.CAN_Message) is
      DataLen  : Integer;
   begin
      DataLen := Integer(Msg.Len);
      declare
         Can_Buf   : String(1..DataLen + HEADLEN);
         Temp_Buf  : String(1..DataLen);
         Len       : Integer  := HEADLEN;
         Checksum  : Interfaces.Unsigned_8;
      begin
         --Set the header of this buffer.
         Can_Buf(BUSTYPE_POS) 	:= Character'Val(0);
         Can_Buf(IDHIGH_POS) 	:= Character'Val(Integer(Msg.ID) / 256);
         Can_Buf(IDLOW_POS) 	:= Character'Val(Integer(Msg.ID) Mod 256);
         Can_Buf(LEN_POS) 	:= Character'Val(DataLen);
         if DataLen /= 0 then
            for I in 1..DataLen loop
               Can_Buf(HEADLEN + I) := Character'Val(Msg.Data ( AVR.AT90CAN128.DLC_Type(I)));
               Temp_Buf(I) := Character'Val(Msg.Data ( AVR.AT90CAN128.DLC_Type(I)));
            end loop;
            Len := Len + DataLen;
            --Calculate the checksum
            Checksum := Calculate_Checksum(Temp_Buf, DataLen);
            Can_Buf(Checksum_POS) := Character'Val(Checksum);
         else
            Can_Buf(Checksum_POS) := Character'Val(0);
         end if;
         --Send the data to QSEVEN
         usart_write(Can_Buf, Q7USART, Len);
      end;
   end Send_CanData_To_Qseven;

   procedure Send_CanData_To_Can(ID : AVR.AT90CAN128.CAN.CAN_ID; Len : AVR.AT90CAN128.DLC_Type ; Data : String) is
      Msg : AVR.AT90CAN128.CAN.CAN_Message;
   begin
      Msg.ID := ID;
      Msg.Len := Len;
      for I in 1..Len loop
         Msg.Data (I) := Character'Pos(Data(Integer(I)));
      end loop;
----------- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      --AVR.AT90CAN128.CAN.Can_Send (Msg);
      Text_IO.Put("ID: ");
      Text_IO.Put_Line(Integer'Image(Integer(Msg.ID)));
      Text_IO.Put("Length: ");
      Text_IO.Put_Line(Integer'Image(Integer(Msg.Len)));
      Text_IO.Put_Line("Message: ");
      for i in 1..Msg.Len loop
         Text_IO.Put(Character'Val(Msg.Data(i)));
         Text_IO.New_Line;
      end loop;

----------- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   end Send_CanData_To_Can;


   procedure Send_Serial_Data_Out(Data : String; Len : Interfaces.Unsigned_8) is
   begin
      usart_write(Data, xUSART, Integer(Len));
   end Send_Serial_Data_Out;

   procedure CANBUS_Monitoring is
   begin
      --- ----------- COMMENTED OUT FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!
      --AVR.AT90CAN128.CAN.Can_Enable_Reception(MIN_CANID, 16#7_00#, MAX_DATALEN); -- Messages 0..255

      --while AVR.AT90CAN128.CAN.Can_Valid_Message loop
         declare
            Msg_In : AVR.AT90CAN128.CAN.CAN_Message;
         Ret    : Boolean;
      begin
         -- AVR.AT90CAN128.CAN.Can_Get(Msg_In, Ret);
         ----------- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         Msg_In.ID := TEST_MESSAGE_ID;
         Msg_In.Len := TEST_MESSAGE_LENGTH;
         Msg_In.Data := TEST_MESSAGE;
         Ret := true;
         ----------- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         if Ret then
            Send_CanData_To_Qseven(Msg_In);
         end if;
      end;
     --end loop;
   end CANBUS_Monitoring;



   procedure Qseven_Cmd_Handler is

      use AVR.AT90CAN128.CAN;

      Rnum      : Integer;
      Datalen   : Interfaces.Unsigned_8;
      Data_Type : Interfaces.Unsigned_8;
      ID        : AVR.AT90CAN128.CAN.CAN_ID;
      Data_Buf : String(1..Integer(MAX_DATALEN));
      Checksum    : Interfaces.Unsigned_8;

      MESSAGE : String := ('I', 'T', ' ', 'W', 'O', 'R', 'K', 'S'); ----- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   begin
      --usart_Read(Head_Buf,Q7USART,HEADLEN, Rnum);
----------- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      Head_Buf(1) := Character'Val(0);
      Head_Buf(2) := Character'Val(2);
      Head_Buf(3) := Character'Val(122);
      Head_Buf(4) := Character'Val(8);
      Head_Buf(5) := Character'Val(Calculate_Checksum(MESSAGE, 8));
      Rnum := HEADLEN;
----------- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      if Rnum = HEADLEN then
         --First get the size of the data
         Datalen := Character'Pos(Head_Buf(LEN_POS));
         if Interfaces."/="(DataLen, 0) then
            declare
               Data_Num : Integer := 0;
            begin

----- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--                 while Data_Num = 0 loop
--                    usart_Read(Data_Buf, Q7USART, Integer(Datalen), Data_Num);
--                 end loop;
               Data_Buf := MESSAGE;
               Data_Num := 8;
----- FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            end;
            Checksum := Calculate_Checksum(Data_Buf, Integer(DataLen));
            --At present, We just ignore this buffer if the checksum is wrong.
            if Interfaces."/="(Checksum, Character'Pos(Head_Buf(Checksum_POS))) then
               return;
            end if;
         end if;

         Data_Type := Character'Pos(Head_Buf(BUSTYPE_POS));
         case Data_Type is
            -- Can bus data
           when Can_Data =>
           ID := Character'Pos(Head_Buf(IDHIGH_POS)) * 256 + Character'Pos(Head_Buf(IDLOW_POS));

          --  ID := AVR.AT90CAN128.CAN."*"(Character'Pos(Head_Buf(IDHIGH_POS)), AVR.AT90CAN128.CAN."+"(256, Character'Pos(Head_Buf(IDLOW_POS))));
              Send_CanData_To_Can(ID, AVR.AT90CAN128.DLC_Type(Datalen), Data_Buf);
               --Command for Servo
            when Serial_Data =>
               Send_Serial_Data_Out(Data_buf, DataLen);
            when others => null;
         end case;
      end if;
   end Qseven_Cmd_Handler;

   procedure Wait_For_Reply(Port : AVR.AT90CAN128.USART.USARTID := AVR.AT90CAN128.USART.Default_USART) is
      Buffer : String(1..HEADLEN);
      Num    : Integer := 0;
   begin
      loop
         while Num = 0 loop
            usart_Read(Buffer, Port, HEADLEN, Num);
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
      Buffer : String(1..HEADLEN);
   begin
      Buffer(1) := Character'Val(3);
      Buffer(2) := Character'Val(0);
      Buffer(3) := Character'Val(0);
      Buffer(4) := Character'Val(0);
      Buffer(5) := Character'Val(0);
      usart_write(Buffer, Port, HEADLEN);
   end Send_Reply;

   --waiting for the QSEVEN.
   --This application should start before Qseven starts
   procedure HandshakeWithQseven is
   begin
      AVR.AT90CAN128.WDTCR := (False, False, False, True, True, True, True, True);
      AVR.AT90CAN128.WDTCR := (False, False, False, True, True, True, True, True);
      Wait_For_Reply(Q7USART);
      AVR.AT90CAN128.WDTCR := (False, False, False, True, True, True, True, True);
      AVR.AT90CAN128.WDTCR := (False, False, False, True, False, True, True, True);
      AVR.AT90CAN128.WDTCR := (False, False, False, False, False, False, False, False);
      Send_Reply(Q7USART);
   end HandshakeWithQseven;

   procedure Main_Loop is
   begin
    --  HandshakeWithQseven;
     --- COMMENTED OUT FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      Text_IO.Put_Line("start");

      loop
         -- Handle the commands from Qseven
         Qseven_Cmd_Handler;
         -- Deal with the data from the CAN bus.
       --  CANBUS_Monitoring;
         return; --FOR DEBUGGING PURPOSES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      end loop;
   end Main_Loop;

   procedure hardware_init is
   begin
      AVR.AT90CAN128.USART.Init(Q7USART,  AVR.AT90CAN128.USART.BAUD38400);
      AVR.AT90CAN128.CAN.Can_Init(AVR.AT90CAN128.CAN.K100);
   end hardware_init;

end CAN_Link_pack;
