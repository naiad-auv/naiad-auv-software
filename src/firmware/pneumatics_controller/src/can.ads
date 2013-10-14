-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-11

with Interfaces;

package Can is

   type DLC_Type is range 0..8;
   for DLC_Type'size use 4;

   type CAN_ID is range 0..2047;

   type Byte8 is array (DLC_Type range 1..8) of Interfaces.Unsigned_8;

   type CAN_Message is record
      ID   : CAN_ID;
      Len  : DLC_Type;
      Data : Byte8;
   end record;

   MSG_KILL_SWITCH_ID			: CAN_ID := 10;
   MSG_KILL_SWITCH_ACTIVE		: CAN_Message := (ID => MSG_KILL_SWITCH_ID, Len => 0, Data => (0, others => 0) );
   MSG_KILL_SWITCH_NOT_ACTIVE 		: CAN_Message := (ID => MSG_KILL_SWITCH_ID, Len => 0, Data => (255, others => 0) );

   MSG_SIMULATION_MODE_ID		: CAN_ID := 11;
   MSG_SIMULATION_MODE_ACTIVE		: CAN_Message := (ID => MSG_SIMULATION_MODE_ID, Len => 0, Data => (0, others => 0) );
   MSG_SIMULATION_MODE_NOT_ACTIVE	: CAN_Message := (ID => MSG_SIMULATION_MODE_ID, Len => 0, Data => (255, others => 0) );

   MSG_PNEUMATICS_ID			: CAN_ID := 16;
   MSG_PNEUMATICS_CONFIRM_ID		: CAN_ID := 17;
   MSG_TORPEDO_LEFT			: CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (1, others => 0) );
   MSG_TORPEDO_LEFT_CONFIRM 		: CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (1, others => 0) );
   MSG_TORPEDO_RIGHT			: CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (2, others => 0) );
   MSG_TORPEDO_RIGHT_CONFIRM 		: CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (2, others => 0) );
   MSG_MARKER_LEFT			: CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (3, others => 0) );
   MSG_MARKER_LEFT_CONFIRM 		: CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (3, others => 0) );
   MSG_MARKER_RIGHT			: CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (4, others => 0) );
   MSG_MARKER_RIGHT_CONFIRM 		: CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (4, others => 0) );
   MSG_GRIPPER_GRAB			: CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (5, others => 0) );
   MSG_GRIPPER_GRAB_CONFIRM		: CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (5, others => 0) );
   MSG_GRIPPER_RELEASE			: CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (6, others => 0) );
   MSG_GRIPPER_RELEASE_CONFIRM		: CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (6, others => 0) );
   MSG_GRIPPER_ROTATE_CW		: CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (7, others => 0) );
   MSG_GRIPPER_ROTATE_CW_CONFIRM	: CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (7, others => 0) );
   MSG_GRIPPER_ROTATE_ACW		: CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (8, others => 0) );
   MSG_GRIPPER_ROTATE_ACW_CONFIRM	: CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (8, others => 0) );

end Can;
