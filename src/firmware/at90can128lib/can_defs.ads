-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-22 by Konstantinos Konstantopoulos

with Interfaces;
with AVR.AT90CAN128.CAN;

package CAN_Defs is
   MSG_KILL_SWITCH_ID			: constant AVR.AT90CAN128.CAN.CAN_ID := (10, False);
   MSG_KILL_SWITCH_CONFIRM_ID		: constant AVR.AT90CAN128.CAN.CAN_ID := (88, False);
   MSG_KILL_SWITCH_ACTIVE		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_KILL_SWITCH_ID, Len => 1, Data => (0, others => 0) );
   MSG_KILL_SWITCH_ACTIVE_CONFIRM	: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_KILL_SWITCH_CONFIRM_ID, Len => 1, Data => (0, others => 0) );
   MSG_KILL_SWITCH_NOT_ACTIVE 		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_KILL_SWITCH_ID, Len => 1, Data => (255, others => 0) );
   MSG_KILL_SWITCH_NOT_ACTIVE_CONFIRM	: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_KILL_SWITCH_CONFIRM_ID, Len => 1, Data => (255, others => 0) );

   MSG_SIMULATION_MODE_ID		: constant AVR.AT90CAN128.CAN.CAN_ID := (11, False);
   MSG_SIMULATION_MODE_CONFIRM_ID	: constant AVR.AT90CAN128.CAN.CAN_ID := (89, False);
   SIMULATION_MODE_ACTIVE		: constant Interfaces.Unsigned_8 := 0;
   SIMULATION_MODE_NOT_ACTIVE		: constant Interfaces.Unsigned_8 := 255;
   MSG_SIMULATION_MODE_ACTIVE		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_SIMULATION_MODE_ID, Len => 1, Data => (SIMULATION_MODE_ACTIVE, others => 0) );
   MSG_SIMULATION_MODE_ACTIVE_CONFIRM	: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_SIMULATION_MODE_CONFIRM_ID, Len => 1, Data => (SIMULATION_MODE_ACTIVE, others => 0) );
   MSG_SIMULATION_MODE_NOT_ACTIVE	: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_SIMULATION_MODE_ID, Len => 1, Data => (SIMULATION_MODE_NOT_ACTIVE, others => 0) );
   MSG_SIMULATION_MODE_NOT_ACTIVE_CONFIRM : constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_SIMULATION_MODE_CONFIRM_ID, Len => 1, Data => (SIMULATION_MODE_NOT_ACTIVE, others => 0) );

   MSG_SENSOR_ID			: constant AVR.AT90CAN128.CAN.CAN_ID := (18, False);

   MSG_PNEUMATICS_ID			: constant AVR.AT90CAN128.CAN.CAN_ID := (16, False);
   MSG_PNEUMATICS_CONFIRM_ID		: constant AVR.AT90CAN128.CAN.CAN_ID := (17, False);
   MSG_TORPEDO_LEFT			: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (1, others => 0) );
   MSG_TORPEDO_LEFT_CONFIRM 		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (1, others => 0) );
   MSG_TORPEDO_RIGHT			: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (2, others => 0) );
   MSG_TORPEDO_RIGHT_CONFIRM 		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (2, others => 0) );
   MSG_MARKER_LEFT			: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (3, others => 0) );
   MSG_MARKER_LEFT_CONFIRM 		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (3, others => 0) );
   MSG_MARKER_RIGHT			: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (4, others => 0) );
   MSG_MARKER_RIGHT_CONFIRM 		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (4, others => 0) );
   MSG_GRIPPER_GRAB			: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (5, others => 0) );
   MSG_GRIPPER_GRAB_CONFIRM		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (5, others => 0) );
   MSG_GRIPPER_RELEASE			: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (6, others => 0) );
   MSG_GRIPPER_RELEASE_CONFIRM		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (6, others => 0) );
   MSG_GRIPPER_ROTATE_CW		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (7, others => 0) );
   MSG_GRIPPER_ROTATE_CW_CONFIRM	: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (7, others => 0) );
   MSG_GRIPPER_ROTATE_ACW		: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (8, others => 0) );
   MSG_GRIPPER_ROTATE_ACW_CONFIRM	: constant AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (8, others => 0) );

end CAN_Defs;
