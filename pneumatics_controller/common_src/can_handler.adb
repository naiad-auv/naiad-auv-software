with AT90CAN; use AT90CAN;
with System.Machine_Code;
--  with interfaces;

package body CAN_Handler is
   pragma Suppress (All_Checks);

   Buffer_Size : constant := 16;
   type Buffer_Array is array (1..16) of CAN_Message;
   type Buffer_Type is record
      Data  : Buffer_Array;
      In_P  : Integer := 1;
      Out_P : Integer := 1;
   end record;

   Buffer: Buffer_Type;

   function Find_Free_MOB return MOB_ID is
   begin
      for M in MOB_ID loop
         if not CANEN (M) then
            return M;
         end if;
      end loop;
      return 14; -- should have a success instead!!
   end Find_Free_MOB;

   procedure Enable is
   begin
      CANGIE.Bit_7 := True; -- Enable all Interrupts
      CANGIE.Bit_5 := True; -- Enable Receive Interrupt
      CANGIE.Bit_4 := True; -- Enable Transmit Interrupt
   end Enable;

   procedure Disable is
   begin
      CANGIE.Bit_7 := False; -- Disable all Interrupts
      CANGIE.Bit_5 := False; -- Disable Receive Interrupt
      CANGIE.Bit_4 := False; -- Disable Transmit Interrupt
   end Disable;

   procedure Enable_Reception (ID, Mask : CAN_ID; DLC : DLC_Type) is
   begin
      CANPAGE := (Find_Free_MOB, True, 0); -- (Full_MOB_ID, Auto_Increment, Data Index)
      CANIDT   := Shift_Left(Unsigned_16(ID),5);
      CANCDMOB := (Enable_Reception, False, False, DLC);
      CANIDM := Shift_Left(Unsigned_16(Mask),5);
   end Enable_Reception;

   procedure Send (Msg : CAN_Message) is
   begin
      CANPAGE := (Find_Free_MOB, False, 0);
      for I in 1..Msg.Len loop
--           if I = 3 then
--              CANMSG := Unsigned_8(CANPAGE.MOB);
--           else
            CANMSG := Msg.Data (I);
--         end if;
      end loop;
      CANIDT   := Shift_Left(Unsigned_16(Msg.ID),5);
      CANCDMOB := (Enable_Transmission, False, False, Msg.Len);
   end Send;

   procedure CAN_Interrupt;
   pragma Machine_Attribute (CAN_Interrupt, "signal");
   pragma Export (C, CAN_Interrupt, AT90CAN.Vector_CAN_IT);

   procedure CAN_Interrupt is
      Page_Saved : constant CAN_Page_Type := CANPAGE;
      Temp : General_Register;
   begin
      while CANHPMOB.MOB /= 15 loop
         CANPAGE := CANHPMOB;
         Temp := CANSTMOB;
         if Temp.Bit_5 then
            declare
               Msg : CAN_Message;
            begin
               Msg.ID := CAN_ID (Shift_Right (CANIDT,5));
               Msg.Len := CANCDMOB.DLC;
               for I in 1..Msg.Len loop
                  Msg.Data (I) := CANMSG;
               end loop;
               Buffer.Data(Buffer.In_P) := Msg;
               Buffer.In_P := (Buffer.In_P + 1) mod Buffer_Size + 1;
            end;
            Temp.Bit_5 := False;
         end if;
         if Temp.Bit_6 then
            CANCDMOB.State := Disable;
            Temp.Bit_6 := False;
         end if;
         CANSTMOB := Temp;
      end loop;
      CANPAGE := Page_Saved;
   end CAN_Interrupt;

   function Valid_Message return Boolean is
      Result : Boolean;
   begin
      System.Machine_Code.Asm ("cli", Volatile => True);
      Result := Buffer.In_P /= Buffer.Out_P;
      System.Machine_Code.Asm ("sei", Volatile => True);

      return Result;
   end Valid_Message;

   function Get return CAN_Message is
      Result : CAN_Message;
   begin
      System.Machine_Code.Asm ("cli", Volatile => True);
      Result := Buffer.Data(Buffer.Out_P);
      Buffer.Out_P := (Buffer.Out_P + 1) mod Buffer_Size + 1;
      System.Machine_Code.Asm ("sei", Volatile => True);
      return Result;
   end Get;

   procedure Init(Rate : Baud_Rate) is
   begin

      CANGCON.Bit_0 := True; -- Software Reset
      --      CANTCON := 0;
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
      CANGCON.Bit_1 := True; -- Enable
      AT90CAN.DDRD.Bit_5 := True; -- CAN_Tx is PortD.5
      CANIE := (others => True);
      -- Interrupt Enable
      Enable;
   end Init;

begin
   Init (K100);
end CAN_Handler;

