with AVR.AT90CAN128 ; use AVR.AT90CAN128;
--with System	    ; use System;


package body AVR.AT90CAN128.CAN is
   pragma Suppress (All_Checks);

   Buffer_Size : constant := 16;
   type Can_Buffer_Array is array (1..16) of CAN_Message;

   Can_In_P   : Integer := 1;
   Can_Out_P  : Integer := 1;
   Rbuffer    : Can_Buffer_Array;

   pragma Volatile (Can_In_P);
   pragma Volatile (Can_Out_P);


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
   begin
      CANPAGE := (Find_Free_MOB, False, 0);
      for I in 1..Msg.Len loop
         CANMSG := Msg.Data (I);
      end loop;
      CANIDT   := Shift_Left(Unsigned_16(Msg.ID),5);
      CANCDMOB := (Enable_Transmission, False, False, Msg.Len);
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
      Pos  : Integer;
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
               Pos := Can_In_P mod Buffer_Size + 1;
               if Pos /= Can_Out_P then
                  Rbuffer(Can_In_P) := Msg;
                  Can_In_P := Pos;
               end if;
            end;
            Temp.RXOK := False;
         end if;
	 if Temp.TXOK then
            CANCDMOB.State := Disable;
            Temp.TXOK := False;
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
      Result := Can_In_P /= Can_Out_P;
      return Result;
   end Can_Valid_Message;


   -- Can_Get : Read one CAN message.
   -- Parameter:
   --		Msg (out): the message which is read from CAN bus.
   --                      NOTE: this parameter can be invalid if
   --                            there is no message available.
   --           Ret (out): this parameter will be False if there is
   --                      no message is available. Otherwise it will
   --                      be True.
   Procedure Can_Get(Msg : out CAN_Message; Ret : out Boolean) is
   begin
      if Can_Out_P /= Can_In_P then
         Msg := Rbuffer(Can_Out_P);
         Can_Out_P := Can_Out_P mod Buffer_Size + 1;
         Ret := True;
         return;
      end if;
      Ret := False;
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


end AVR.AT90CAN128.CAN;


