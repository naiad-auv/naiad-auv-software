with Interfaces; use Interfaces;
with AT90CAN.CAN; use AT90CAN.CAN;
package CAN_Handler is
   type Baud_Rate is (K100,K125,K200, K250, K500, M1);

   Default_Speed : constant Baud_Rate := M1;

   type CAN_ID is range 0..2047;

   type Byte8 is array (AT90CAN.CAN.DLC_Type range 1..8) of Unsigned_8;
   type CAN_Message is record
      ID : CAN_ID;
      Len : AT90CAN.CAN.DLC_Type;
      Data : Byte8;
   end record;

   procedure Init (Rate : Baud_Rate);
   procedure Enable;
   procedure Disable;

   procedure Enable_Reception (ID, Mask : CAN_ID; DLC : DLC_Type);

   procedure Send (Msg : CAN_Message);
   function Valid_Message  return Boolean;
   function Get return CAN_Message;

end CAN_Handler;

