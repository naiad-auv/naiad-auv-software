-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-26 by Nils Brynedal Ignell

with Interfaces;
--  with AVR.AT90CAN128.CAN;

package CAN_Defs is

   pragma Suppress(All_Checks);

     ---- Moved from AVR.AT90CAN128 ------------------------------------
   type DLC_Type is range 0..8;
   for DLC_Type'size use 4;
   -----------------------------------

   ---- Moved from AVR.AT90CAN128.CAN ------------------------------------
   type Baud_Rate is (K100,K125,K200, K250, K500, M1);
   type CAN_Identifier is range 0..536870911;
   type CAN_ID is record
      Identifier : CAN_Identifier;
      isExtended : Boolean := False;
   end record;
   type Byte8 is array (DLC_Type range 1..8) of Interfaces.Unsigned_8;
   type CAN_Message is record
      ID   : CAN_ID;
      Len  : DLC_Type;
      Data : Byte8;
   end record;
   ------------------------------------

   MSG_KILL_SWITCH_ID			: constant CAN_ID := (10, False);
   MSG_KILL_SWITCH_CONFIRM_ID		: constant CAN_ID := (88, False);
   MSG_KILL_SWITCH_ACTIVE		: constant CAN_Message := (ID => MSG_KILL_SWITCH_ID, Len => 1, Data => (0, others => 0) );
   MSG_KILL_SWITCH_ACTIVE_CONFIRM	: constant CAN_Message := (ID => MSG_KILL_SWITCH_CONFIRM_ID, Len => 1, Data => (0, others => 0) );
   MSG_KILL_SWITCH_NOT_ACTIVE 		: constant CAN_Message := (ID => MSG_KILL_SWITCH_ID, Len => 1, Data => (255, others => 0) );
   MSG_KILL_SWITCH_NOT_ACTIVE_CONFIRM	: constant CAN_Message := (ID => MSG_KILL_SWITCH_CONFIRM_ID, Len => 1, Data => (255, others => 0) );

   MSG_SIMULATION_MODE_ID		: constant CAN_ID := (11, False);
   MSG_SIMULATION_MODE_CONFIRM_ID	: constant CAN_ID := (89, False);
   SIMULATION_MODE_ACTIVE		: constant Interfaces.Unsigned_8 := 0;
   SIMULATION_MODE_NOT_ACTIVE		: constant Interfaces.Unsigned_8 := 255;
   MSG_SIMULATION_MODE_ACTIVE		: constant CAN_Message := (ID => MSG_SIMULATION_MODE_ID, Len => 1, Data => (SIMULATION_MODE_ACTIVE, others => 0) );
   MSG_SIMULATION_MODE_ACTIVE_CONFIRM	: constant CAN_Message := (ID => MSG_SIMULATION_MODE_CONFIRM_ID, Len => 1, Data => (SIMULATION_MODE_ACTIVE, others => 0) );
   MSG_SIMULATION_MODE_NOT_ACTIVE	: constant CAN_Message := (ID => MSG_SIMULATION_MODE_ID, Len => 1, Data => (SIMULATION_MODE_NOT_ACTIVE, others => 0) );
   MSG_SIMULATION_MODE_NOT_ACTIVE_CONFIRM : constant CAN_Message := (ID => MSG_SIMULATION_MODE_CONFIRM_ID, Len => 1, Data => (SIMULATION_MODE_NOT_ACTIVE, others => 0) );

   MSG_SENSOR_ID			: constant CAN_ID := (18, False);

   MSG_PNEUMATICS_ID			: constant CAN_ID := (16, False);
   MSG_PNEUMATICS_CONFIRM_ID		: constant CAN_ID := (17, False);
   MSG_TORPEDO_LEFT			: constant CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (1, others => 0) );
   MSG_TORPEDO_LEFT_CONFIRM 		: constant CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (1, others => 0) );
   MSG_TORPEDO_RIGHT			: constant CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (2, others => 0) );
   MSG_TORPEDO_RIGHT_CONFIRM 		: constant CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (2, others => 0) );
   MSG_MARKER_LEFT			: constant CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (3, others => 0) );
   MSG_MARKER_LEFT_CONFIRM 		: constant CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (3, others => 0) );
   MSG_MARKER_RIGHT			: constant CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (4, others => 0) );
   MSG_MARKER_RIGHT_CONFIRM 		: constant CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (4, others => 0) );
   MSG_GRIPPER_GRAB			: constant CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (5, others => 0) );
   MSG_GRIPPER_GRAB_CONFIRM		: constant CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (5, others => 0) );
   MSG_GRIPPER_RELEASE			: constant CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (6, others => 0) );
   MSG_GRIPPER_RELEASE_CONFIRM		: constant CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (6, others => 0) );
   MSG_GRIPPER_ROTATE_CW		: constant CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (7, others => 0) );
   MSG_GRIPPER_ROTATE_CW_CONFIRM	: constant CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (7, others => 0) );
   MSG_GRIPPER_ROTATE_ACW		: constant CAN_Message := (ID => MSG_PNEUMATICS_ID, 		Len => 1, Data => (8, others => 0) );
   MSG_GRIPPER_ROTATE_ACW_CONFIRM	: constant CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (8, others => 0) );

   MSG_IMU_ORIENTATION_ID		: constant CAN_ID := (12, False);
   MSG_IMU_ACCELERATION_ID		: constant CAN_ID := (13, False);
   MSG_GYRO_YAW_ID			: constant CAN_ID := (14, False);


end CAN_Defs;
