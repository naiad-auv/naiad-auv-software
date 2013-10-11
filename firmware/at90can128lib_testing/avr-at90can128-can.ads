with AVR.AT90CAN128.CLOCK; use AVR.AT90CAN128.CLOCK;

package AVR.AT90CAN128.CAN is

   type Baud_Rate is (K100,K125,K200, K250, K500, M1);

   Default_Speed : constant Baud_Rate := K100;

   type CAN_ID is range 0..2047;

   type Byte8 is array (DLC_Type range 1..8) of Unsigned_8;
   type CAN_Message is record
      ID   : CAN_ID;
      Len  : DLC_Type;
      Data : Byte8;
   end record;


   procedure Can_Init (Rate : Baud_Rate);
   procedure Can_SetBaudRate(Rate : Baud_Rate);
   procedure Can_Enable;
   procedure Can_Disable;

   procedure Can_Set_MOB_ID_MASK (mob : READ_MOB_ID;  ID, Mask : CAN_ID);
   procedure Can_Set_All_MOB_ID_MASK (ID, Mask : CAN_ID);

   procedure Can_Send (Msg : CAN_Message);
   procedure Can_Get (Msg : out CAN_Message; Ret : out Boolean; Wait : in Time_Duration);
   function Can_Valid_Message  return Boolean;

end AVR.AT90CAN128.CAN;
