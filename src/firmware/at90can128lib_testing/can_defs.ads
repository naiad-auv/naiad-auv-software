-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-14 by Nils Brynedal Ignell

with Interfaces;
with AVR.AT90CAN128.CAN;

package CAN_Defs is

   MSG_KILL_SWITCH_ID			: AVR.AT90CAN128.CAN.CAN_ID := 10;
   MSG_KILL_SWITCH_ACTIVE		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_KILL_SWITCH_ID, Len => 0, Data => (0, others => 0) );
   MSG_KILL_SWITCH_NOT_ACTIVE 		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_KILL_SWITCH_ID, Len => 0, Data => (255, others => 0) );

   MSG_SIMULATION_MODE_ID		: AVR.AT90CAN128.CAN.CAN_ID := 11;
   MSG_SIMULATION_MODE_ACTIVE		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_SIMULATION_MODE_ID, Len => 0, Data => (0, others => 0) );
   MSG_SIMULATION_MODE_NOT_ACTIVE	: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_SIMULATION_MODE_ID, Len => 0, Data => (255, others => 0) );

   MSG_PNEUMATICS_ID			: AVR.AT90CAN128.CAN.CAN_ID := 16;
   MSG_PNEUMATICS_CONFIRM_ID		: AVR.AT90CAN128.CAN.CAN_ID := 17;
   MSG_TORPEDO_LEFT			: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (1, others => 0) );
   MSG_TORPEDO_LEFT_CONFIRM 		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (1, others => 0) );
   MSG_TORPEDO_RIGHT			: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (2, others => 0) );
   MSG_TORPEDO_RIGHT_CONFIRM 		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (2, others => 0) );
   MSG_MARKER_LEFT			: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (3, others => 0) );
   MSG_MARKER_LEFT_CONFIRM 		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (3, others => 0) );
   MSG_MARKER_RIGHT			: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (4, others => 0) );
   MSG_MARKER_RIGHT_CONFIRM 		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (4, others => 0) );
   MSG_GRIPPER_GRAB			: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (5, others => 0) );
   MSG_GRIPPER_GRAB_CONFIRM		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (5, others => 0) );
   MSG_GRIPPER_RELEASE			: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (6, others => 0) );
   MSG_GRIPPER_RELEASE_CONFIRM		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (6, others => 0) );
   MSG_GRIPPER_ROTATE_CW		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (7, others => 0) );
   MSG_GRIPPER_ROTATE_CW_CONFIRM	: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (7, others => 0) );
   MSG_GRIPPER_ROTATE_ACW		: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_ID, Len => 1, Data => (8, others => 0) );
   MSG_GRIPPER_ROTATE_ACW_CONFIRM	: AVR.AT90CAN128.CAN.CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, Len => 1, Data => (8, others => 0) );

end CAN_Defs;
