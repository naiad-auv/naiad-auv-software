with AVR.AT90CAN128.CLOCK;
with Board_and_Mode_Defs;

package AVR.AT90CAN128.CAN is

 -- I moved the definition of CAN_Message etc. to the CAN_Defs.ads file // Nils

 --  Default_Speed : constant Baud_Rate := K100;
 
   type BUFFER_ID is new Full_MOB_ID range 0..9;
   procedure Can_Init (Rate : CAN_Defs.Baud_Rate; brd : Board_and_Mode_Defs.Boards);
   procedure Can_SetBaudRate(Rate : CAN_Defs.Baud_Rate);
   procedure Can_Enable;
   procedure Can_Disable;

   procedure Can_Set_MOB_ID_MASK (mob : BUFFER_ID;  ID, Mask : CAN_Defs.CAN_ID);
   procedure Can_Set_All_MOB_ID_MASK (ID, Mask : CAN_Defs.CAN_ID);

   procedure Can_Send (Msg : CAN_Defs.CAN_Message);
   procedure Can_Get (Msg : out CAN_Defs.CAN_Message; Ret : out Boolean; Wait : in AVR.AT90CAN128.CLOCK.Time_Duration);
   function Can_Valid_Message  return Boolean;

private
--     type mode_states_array is array (Mode_Defs.Modes) of Boolean;
--     mode_states : mode_states_array := (others => False);
   board : Board_and_Mode_Defs.Boards;
   mode : Board_and_Mode_Defs.Modes := Board_and_Mode_Defs.NORMAL;
   procedure Can_Set_Mob_ID_MASK_Internal (MOB : READ_MOB_ID;  ID, Mask : CAN_Defs.CAN_ID);
end AVR.AT90CAN128.CAN;
