with AVR.AT90CAN128;

with CAN_Defs;

package body AVR.AT90CAN128.CAN is
   pragma Suppress (All_Checks);

   Buffer_Size : constant := 16;
   type Buffer_pointer is mod 2 ** 5;
   type Can_Buffer_Array is array (Buffer_pointer range 0..15) of CAN_Defs.CAN_Message;

   ID_Tag_array : array (READ_MOB_ID) of CAN_Defs.CAN_ID;
   ID_Mask_array : array (READ_MOB_ID) of CAN_Defs.CAN_ID;

   pRXWrite     : Buffer_pointer := 0;
   pRXRead	: Buffer_pointer := 0;
   RX_buffer    : Can_Buffer_Array;

   pTXWrite     : Buffer_pointer := 0;
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
      Msg : CAN_Defs.CAN_Message;
   begin
      if pTXRead = pTXWrite then
         return;
      end if;
      Msg := TX_buffer(pTXRead mod Buffer_Size);
      CANPAGE := (TX_MOB_ID, False, 0);
      for I in 1..Msg.Len loop
         CANMSG := Msg.Data (I);
      end loop;
      if Msg.ID.isExtended then
         CANIDT := Shift_Left(Unsigned_32(Msg.ID.Identifier),3);
      else
         CANIDT := Shift_Left(Unsigned_32(Msg.ID.Identifier),21);
      end if;
      CANCDMOB := (Enable_Transmission, False, Msg.ID.isExtended , Msg.Len);
   end CanWriteTXMOB;

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

   -- Can_Send  : Send out a CAN messaage
   -- Parameter :
   --		 Msg : the CAN message which is going to be sent.
   procedure Can_Send (Msg : CAN_Defs.CAN_Message) is
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
               Msg : CAN_Defs.CAN_Message;
            begin
               if CANCDMOB.Extended_ID then
                  Msg.ID.Identifier := CAN_Defs.CAN_Identifier (Shift_Right (CANIDT,3));
               else
                  Msg.ID.Identifier := CAN_Defs.CAN_Identifier (Shift_Right (CANIDT,21));
               end if;
               Msg.ID.isExtended := CANCDMOB.Extended_ID;
               Msg.Len := CANCDMOB.DLC;
               for I in 1..Msg.Len loop
                  Msg.Data (I) := CANMSG;
               end loop;
               if iGetBufferSize(pRXWrite,pRXRead) < Buffer_Size then
                  Pos := pRXWrite;
                  RX_buffer(Pos mod Buffer_Size) := Msg;
                  Pos := Pos + 1;
                  pRXWrite := Pos;
               end if;
            end;
            Temp.RXOK := False;
            if ID_Tag_array(CANHPMOB.MOB).isExtended then
               CANIDT := Shift_Left(Unsigned_32(ID_Tag_array(CANHPMOB.MOB).Identifier),3);
               CANIDM := Shift_Left(Unsigned_32(ID_Mask_array(CANHPMOB.MOB).Identifier),3);
            else
               CANIDT := Shift_Left(Unsigned_32(ID_Tag_array(CANHPMOB.MOB).Identifier),21);
               CANIDM := Shift_Left(Unsigned_32(ID_Mask_array(CANHPMOB.MOB).Identifier),21);
            end if;
            CANCDMOB := (Enable_Reception, False, ID_Tag_array(CANHPMOB.MOB).isExtended, 8);
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
      ret : Buffer_pointer := pRead;
      prio : CAN_Defs.CAN_Identifier := CAN_Defs.CAN_Identifier'Last;
      counter : Buffer_pointer;

      use CAN_Defs;
   begin
      counter := pRead;
      while counter /= pWrite loop
         if buffer(counter mod Buffer_Size).ID.Identifier < prio then
            prio := buffer(counter mod Buffer_Size).ID.Identifier;
            ret := counter;
         end if;
         counter := counter + 1;
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
   Procedure Can_Get(Msg : out CAN_Defs.CAN_Message; Ret : out Boolean; Wait : AVR.AT90CAN128.CLOCK.Time_Duration) is
      use AVR.AT90CAN128.CLOCK;
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
   procedure Can_SetBaudRate(Rate : CAN_Defs.Baud_Rate) is
   begin
      CANGCON.SWRES := True; -- Software Reset
      case Rate is
         when CAN_Defs.K100 =>
            CANBT1 := 16#12#;
            CANBT2 := 16#0C#;
            CANBT3 := 16#37#;
         when CAN_Defs.K125 =>
            CANBT1 := 16#0E#;
            CANBT2 := 16#0C#;
            CANBT3 := 16#37#;
         when CAN_Defs.K200 =>
            CANBT1 := 16#08#;
            CANBT2 := 16#0C#;
            CANBT3 := 16#37#;
         when CAN_Defs.K250 =>
            CANBT1 := 16#06#;
            CANBT2 := 16#0C#;
            CANBT3 := 16#37#;
         when CAN_Defs.K500 =>
            CANBT1 := 16#06#;
            CANBT2 := 16#04#;
            CANBT3 := 16#13#;
         when CAN_Defs.M1 =>
            CANBT1 := 16#02#;
            CANBT2 := 16#04#;
            CANBT3 := 16#13#;
      end case;
   end  Can_SetBaudRate;


   -- Can_Init : Initialize the CAN controller.
   -- Parameter:
   --           Rate : baud rate.
   procedure Can_Init(Rate : CAN_Defs.Baud_Rate) is
   begin
      Can_SetBaudRate(Rate);
      -- can_clear_all_mob
      for P in MOB_ID loop
         CANPAGE.MOB := P;
         -- can_clear_mob
         CANSTMOB :=  (others => False);
         CANCDMOB := (Disable, False, False, 0);
         CANIDT   := 0;
         --CANIDTX  := 0;
         CANIDM   := 0;
         --CANIDMX  := 0;
      end loop;
      -- Can_enable
      CANGCON.ENASTB := True; -- Enable
      AVR.AT90CAN128.DDRD.Bit_5 := True; -- CAN_Tx is PortD.5
      CANIE := (others => True);
      -- Interrupt Enable
      Can_Enable;
   end Can_Init;

   procedure Can_Set_Mob_ID_MASK (MOB : READ_MOB_ID;  ID, Mask : CAN_Defs.CAN_ID) is
   begin
      if not CANEN (MOB) then
         CANPAGE := (MOB, True, 0);
         if ID.isExtended then
               CANIDT := Shift_Left(Unsigned_32(ID.Identifier),3);
               CANIDM := Shift_Left(Unsigned_32(Mask.Identifier),3);
            else
               CANIDT := Shift_Left(Unsigned_32(ID.Identifier),21);
               CANIDM := Shift_Left(Unsigned_32(Mask.Identifier),21);
            end if;
         CANCDMOB := (Enable_Reception, False, ID.isExtended, 8);

--        	CANIDT   := Shift_Left(Unsigned_16(ID),5);
--        	CANCDMOB := (Enable_Reception, False, False, 8);
--          CANIDM := Shift_Left(Unsigned_16(Mask),5);
        ID_Mask_array(MOB) := Mask;
        ID_Tag_array(MOB) := ID;
      end if;
   end Can_Set_Mob_ID_MASK;

   procedure Can_Set_All_MOB_ID_MASK (ID, Mask : CAN_Defs.CAN_ID) is
   begin
      for M in READ_MOB_ID loop
         Can_Set_Mob_ID_MASK (M ,ID ,Mask);
      end loop;
   end Can_Set_All_MOB_ID_MASK;

end AVR.AT90CAN128.CAN;
