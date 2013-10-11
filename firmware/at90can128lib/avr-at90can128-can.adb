with AVR.AT90CAN128 ; use AVR.AT90CAN128;
--with System	    ; use System;

package body AVR.AT90CAN128.CAN is
   pragma Suppress (All_Checks);

   Buffer_Size : constant := 16;
   type Buffer_pointer is mod 2 ** 5;
--     type Can_Buffer;
   type Can_Buffer_Array is array (Buffer_pointer range 0..15) of CAN_Message;

--     type Can_Buffer is record
--        Write : Buffer_pointer := 0;
--        Read : Buffer_pointer := 0;
--        Buffer : Can_Buffer_Array;
--     end record;

   ID_Tag_array : array (READ_MOB_ID) of CAN_ID;
   ID_Mask_array : array (READ_MOB_ID) of CAN_ID;

--     RX_Buffer : Can_Buffer;
--     TX_Buffer : Can_Buffer;

   pRXWrite   : Buffer_pointer := 0;
   pRXRead	: Buffer_pointer := 0;
   RX_buffer    : Can_Buffer_Array;

   pTXWrite   : Buffer_pointer := 0;
   pTXRead	: Buffer_pointer := 0;
   TX_buffer    : Can_Buffer_Array;

   TX_MOB_ID : MOB_ID := 13;

   pragma Volatile (pRXWrite);
   pragma Volatile (pRXRead);

   pragma Volatile (pTXWrite);
   pragma Volatile (pTXRead);


   function iGetBufferSize (write : in Buffer_pointer; read : in Buffer_pointer ) return Integer is
   	Result : Integer;
   begin
      Result := abs(Integer(write - read));
      return Result;
   end iGetBufferSize;

   procedure CanWriteTXMOB is
   Msg : CAN_Message;
begin
   Msg := TX_buffer(pTXRead mod Buffer_Size);
   CANPAGE := (TX_MOB_ID, False, 0);
   for I in 1..Msg.Len loop
      CANMSG := Msg.Data (I);
   end loop;
   CANIDT   := Shift_Left(Unsigned_16(Msg.ID),5);
   CANCDMOB := (Enable_Transmission, False, False, Msg.Len);
end CanWriteTXMOB;

   -- Find_Free_MOB : Find a free MOB.
   -- Parameter:
   --           MOB_ID : the ID of a free MOB.
   function Find_Free_MOB return MOB_ID is
   begin
      for M in MOB_ID loop
         if not CANEN (M) then
            return M;
         end if;
      end loop;
      return 14; --No MOB available;
   end Find_Free_MOB;

   -- Can_Enable: Enable the CAN bus
   procedure Can_Enable is
   begin
      CANGIE.ENIT := True; -- Enable all Interrupt
      CANGIE.ENRX := True; -- Enable Receive Interrup
      CANGIE.ENTX := True; -- Enable Transmit Interrupt
   end Can_Enable;

    -- Can_Disable: Disable the CAN bus
   procedure Can_Disable is
   begin
      CANGIE.ENIT := False; -- Disable all Interrupt
      CANGIE.ENRX := False; -- Disable Receive Interrup
      CANGIE.ENTX := False; -- Disable Transmit Interrupt
   end Can_Disable;

   -- Can_Enable_Reception: Initialize MOBs and prepare to receive messages
   --  Parameters: ID   : ID of the CAN message.
   --		   MASK : this paremeter define a scope of IDs which CAN controller
   --                     should read from CAN bus.
   --              DLC  : the length of the DATA of CAN message
   procedure Can_Enable_Reception (ID, Mask : CAN_ID; DLC : DLC_Type) is
   begin
      CANPAGE := (Find_Free_MOB, True, 0); -- (Full_MOB_ID, Auto_Increment, Data Index)
      CANIDT   := Shift_Left(Unsigned_16(ID),5);
      CANCDMOB := (Enable_Reception, False, False, DLC);
      CANIDM := Shift_Left(Unsigned_16(Mask),5);
   end Can_Enable_Reception;


   -- Can_Send  : Send out a CAN messaage
   -- Parameter :
   --		 Msg : the CAN message which is going to be sent.
   procedure Can_Send (Msg : CAN_Message) is
      tmp : Buffer_pointer;
   begin
      if iGetBufferSize(pTXWrite,pTXRead) = Buffer_Size then
      	return;
      end if;
      TX_buffer(pTXWrite mod Buffer_Size) := Msg;
      tmp := pTXWrite;
      tmp := tmp + 1;
      pTXWrite := tmp;
      if iGetBufferSize(pTXWrite,pTXRead) = 1 then
        CanWriteTXMOB;
      end if;
   end Can_Send;

   procedure CAN_Interrupt;
   pragma Machine_Attribute (CAN_Interrupt, "signal");
   pragma Export (C, CAN_Interrupt, Vector_CAN_IT);

   -- CAN_Interrupt: interrupt handler of CAN. This handler will
   --                read messages from CAN bus and put them in a
   --                circular buffer.
   -- FIXME:
   --       At present, if the circular buffer is full, the new message
   --       will be dropped
   procedure CAN_Interrupt is
      Page_Saved : constant CAN_Page_Type := CANPAGE;
      TEMP : CANSTMOBREG;
      Pos  : Buffer_pointer;
   begin
      while CANHPMOB.MOB /= 15 loop
         CANPAGE := CANHPMOB;
         Temp := CANSTMOB;
	 if Temp.RXOK then
            declare
               Msg : CAN_Message;
            begin
               Msg.ID := CAN_ID (Shift_Right (CANIDT,5));
               Msg.Len := CANCDMOB.DLC;
               for I in 1..Msg.Len loop
                  Msg.Data (I) := CANMSG;
               end loop;
               if iGetBufferSize(pRXWrite,pRXRead) /= Buffer_Size then
                  Pos := pRXWrite;
                  RX_buffer(Pos mod Buffer_Size) := Msg;
                  Pos := Pos + 1;
                  pRXWrite := Pos;
               end if;
            end;
            Temp.RXOK := False;
            CANIDT   := Shift_Left(Unsigned_16(ID_Tag_array(CANHPMOB.MOB)),5);
            CANCDMOB := (Enable_Reception, False, False, 8);
            CANIDM := Shift_Left(Unsigned_16(ID_Mask_array(CANHPMOB.MOB)),5);
         end if;
	 if Temp.TXOK then
            CANCDMOB.State := Disable;
            Temp.TXOK := False;
            Pos := pTXRead;
            Pos := Pos + 1;
            pTXRead := Pos;
	    CanWriteTXMOB;
         end if;
         --CANSTMOB :=  (others => False);
         CANSTMOB := TEMP;
      end loop;
      CANPAGE := Page_Saved;
   end CAN_Interrupt;

   -- Can_Valid_Message: Check whether there are some valid
   --                    messages or not
   -- Return value:
   --               This function will return false if there is no
   --               valid message, otherwise it will return True.
   function Can_Valid_Message return Boolean is
      Result : Boolean;
   begin
      Result := iGetBufferSize(pRXWrite,pRXRead) > 0;
      return Result;
   end Can_Valid_Message;


   function findHighestPriorityMessage( buffer : in Can_Buffer_Array ; pRead, pWrite : in Buffer_pointer) return Buffer_pointer is
      ret : Buffer_pointer;
      prio : CAN_ID := CAN_ID'Last;
      counter : Buffer_pointer;
   begin
      counter := pRead;
      while counter /= pWrite loop
         if buffer(counter).ID < prio then
            prio := buffer(counter mod Buffer_Size).ID;
            ret := counter;
            counter := counter + 1;
         end if;
      end loop;
      return ret;
   end findHighestPriorityMessage;


   -- Can_Get : Read one CAN message.
   -- Parameter:
   --		Msg (out): the message which is read from CAN bus.
   --                      NOTE: this parameter can be invalid if
   --                            there is no message available.
   --           Ret (out): this parameter will be False if there is
   --                      no message is available. Otherwise it will
   --                      be True.
   Procedure Can_Get(Msg : out CAN_Message; Ret : out Boolean; Wait : Time_Duration) is
      timer : Time;
      curr : Time;
      inf : Boolean := False;
   begin
      if Wait < Time_Duration(0) then
         inf := True;
      else
         curr := getClockTime;
         timer := curr + Wait;
      end if;
      loop
         if iGetBufferSize(pRXWrite,pRXRead) > 0 then
            declare
               Pos : Buffer_pointer;
               high_prio_id : Buffer_pointer;
            begin
               high_prio_id := findHighestPriorityMessage(RX_buffer,pRead => pRXRead,pWrite => pRXWrite);
               Msg := RX_buffer(high_prio_id mod Buffer_Size);
               Ret := True;
               Pos := pRXRead;
               RX_buffer(high_prio_id mod Buffer_Size) := RX_buffer(pRXRead mod Buffer_Size);
               Pos := Pos + 1;
               pRXRead := Pos;
            end;
            exit;
         end if;
         if (inf = False) and (getClockTime > timer) then
               Ret := False;
               exit;
         end if;
      end loop;
   end Can_Get;

   -- Can_SetBaudRate: set baud rate of CAN bus
   -- Parameter:
   --        Baud_Rate: value of baud rate
   procedure Can_SetBaudRate(Rate : Baud_Rate) is
   begin
      CANGCON.SWRES := True; -- Software Reset
      case Rate is
         when K100 =>
            CANBT1 := 16#12#;
            CANBT2 := 16#0C#;
            CANBT3 := 16#37#;
         when K125 =>
            CANBT1 := 16#0E#;
            CANBT2 := 16#0C#;
            CANBT3 := 16#37#;
         when K200 =>
            CANBT1 := 16#08#;
            CANBT2 := 16#0C#;
            CANBT3 := 16#37#;
         when K250 =>
            CANBT1 := 16#06#;
            CANBT2 := 16#0C#;
            CANBT3 := 16#37#;
         when K500 =>
            CANBT1 := 16#06#;
            CANBT2 := 16#04#;
            CANBT3 := 16#13#;
         when M1 =>
            CANBT1 := 16#02#;
            CANBT2 := 16#04#;
            CANBT3 := 16#13#;
      end case;
   end  Can_SetBaudRate;


   -- Can_Init : Initialize the CAN controller.
   -- Parameter:
   --           Rate : baud rate.
   procedure Can_Init(Rate : Baud_Rate) is
   begin
      Can_SetBaudRate(Rate);
      -- can_clear_all_mob
      for P in MOB_ID loop
         CANPAGE.MOB := P;
         -- can_clear_mob
         CANSTMOB :=  (others => False);
         CANCDMOB := (Disable, False, False, 0);
         CANIDT   := 0;
         CANIDTX  := 0;
         CANIDM   := 0;
         CANIDMX  := 0;
      end loop;
      -- Can_enable
      CANGCON.ENASTB := True; -- Enable
      AVR.AT90CAN128.DDRD.Bit_5 := True; -- CAN_Tx is PortD.5
      CANIE := (others => True);
      -- Interrupt Enable
      Can_Enable;
   end Can_Init;

   procedure Can_Set_Mob_ID_MASK (MOB : READ_MOB_ID;  ID, Mask : CAN_ID) is
   begin
      if not CANEN (MOB) then
        CANPAGE := (MOB, True, 0);
      	CANIDT   := Shift_Left(Unsigned_16(ID),5);
      	CANCDMOB := (Enable_Reception, False, False, 8);
        CANIDM := Shift_Left(Unsigned_16(Mask),5);
        ID_Mask_array(MOB) := Mask;
        ID_Tag_array(MOB) := ID;
      end if;
   end Can_Set_Mob_ID_MASK;

   procedure Can_Set_All_MOB_ID_MASK (ID, Mask : CAN_ID) is
   begin
      for M in READ_MOB_ID loop
         Can_Set_Mob_ID_MASK (M ,ID ,Mask);
      end loop;
   end Can_Set_All_MOB_ID_MASK;

end AVR.AT90CAN128.CAN;
