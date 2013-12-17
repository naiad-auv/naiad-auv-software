-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-12 by Nils Brynedal Ignell

with Interfaces;

package CAN_Defs is

   pragma Suppress(All_Checks);

   ------------ Moved from AVR.AT90CAN128 ------------------------------------
   type DLC_Type is range 0..8;
   for DLC_Type'size use 4;
   ---------------------------------------------------------------------------

   ---- Moved from AVR.AT90CAN128.CAN ----------------------------------------
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
   ---------------------------------------------------------------------------


   ---------- Subgroups of message IDs:  -------------------------------------

   -- MESSAGE ID 	MEANING

   -- 0 - 12		Bootloader messages
   -- 13 - 29		Future bootloader messages
   -- 30 - 289		Node bootloader acknowledge messages
   -- 290 - 349		Status request response from nodes


   ---------- Definitions of message IDs -------------------------------------

   MSG_STATUS_REQUEST_RESPONSE_ID	: constant CAN_ID := (290, False); -- Message IDs for Status request responses from nodes will start at this message id

   MSG_KILL_SWITCH_ID			: constant CAN_ID := (351, False);
--   MSG_KILL_SWITCH_CONFIRM_ID		: constant CAN_ID := (351, False);

   MSG_SIMULATION_MODE_ID		: constant CAN_ID := (380, False);
--     MSG_SIMULATION_MODE_CONFIRM_ID	: constant CAN_ID := (89, False);

   MSG_VISUALLY_DETECTED_OBSTACLE_ID	: constant CAN_ID := (410, False);

   MSG_SENSOR_FUSION_ORIENTATION_ID	: constant CAN_ID := (440, False);
   MSG_SENSOR_FUSION_POSITION_ID	: constant CAN_ID := (470, False);

   MSG_IMU_ORIENTATION_ID		: constant CAN_ID := (500, False);
   MSG_IMU_ACCELERATION_ID		: constant CAN_ID := (530, False);
   MSG_GYRO_YAW_ID			: constant CAN_ID := (560, False);

   MSG_MISSION_SWITCH_ID		: constant CAN_ID := (590, False);

   MSG_THRUSTER_ID			: constant CAN_ID := (620, False);

   MSG_PNEUMATICS_ID			: constant CAN_ID := (650, False);
   MSG_PNEUMATICS_CONFIRM_ID		: constant CAN_ID := (680, False);

   MSG_BATTERY_STATUS_ID		: constant CAN_ID := (710, False);

   MSG_VISION_REQUEST_FORWARD_ID	: constant CAN_ID := (740, False);
   MSG_VISION_REQUEST_DOWN_ID		: constant CAN_ID := (770, False);
   MSG_VISION_ANSWER_FORWARD_ID		: constant CAN_ID := (800, False);
   MSG_VISION_ANSWER_DOWN_ID		: constant CAN_ID := (830, False);

   MSG_MISSION_STATUS_ID		: constant CAN_ID := (860, False);
   MSG_PID_SCALING_ID			: constant CAN_ID := (890, False);

   MSG_STATUS_REQUEST_ID		: constant CAN_ID := (920, False);
   MSG_REQUEST_KILL_SWITCH_ID		: constant CAN_ID := (950, False);

   MSG_SENSOR_ID			: constant CAN_ID := (980, False);

   MSG_Sim_Orientation_X_Vector_ID	: constant CAN_ID := (450, False);
   MSG_Sim_Orientation_Y_Vector_ID	: constant CAN_ID := (451, False);
   MSG_Sim_Orientation_Z_Vector_ID	: constant CAN_ID := (452, False);


   ---------- Definitions of standard messages and other constants --------------------------

   MSG_KILL_SWITCH_ACTIVE		: constant CAN_Message := (ID => MSG_KILL_SWITCH_ID, Len => 1, Data => (0, others => 0) );
 --  MSG_KILL_SWITCH_ACTIVE_CONFIRM	: constant CAN_Message := (ID => MSG_KILL_SWITCH_CONFIRM_ID, Len => 1, Data => (0, others => 0) );
   MSG_KILL_SWITCH_NOT_ACTIVE 		: constant CAN_Message := (ID => MSG_KILL_SWITCH_ID, Len => 1, Data => (255, others => 0) );
  -- MSG_KILL_SWITCH_NOT_ACTIVE_CONFIRM	: constant CAN_Message := (ID => MSG_KILL_SWITCH_CONFIRM_ID, Len => 1, Data => (255, others => 0) );

   SIMULATION_MODE_ACTIVE			: constant Interfaces.Unsigned_8 := 0;
   SIMULATION_MODE_NOT_ACTIVE			: constant Interfaces.Unsigned_8 := 255;
   MSG_SIMULATION_MODE_ACTIVE			: constant CAN_Message := 	(ID => MSG_SIMULATION_MODE_ID, 		Len => 1, Data => (SIMULATION_MODE_ACTIVE, others => 0) );
--     MSG_SIMULATION_MODE_ACTIVE_CONFIRM		: constant CAN_Message := 	(ID => MSG_SIMULATION_MODE_CONFIRM_ID, 	Len => 1, Data => (SIMULATION_MODE_ACTIVE, others => 0) );
   MSG_SIMULATION_MODE_NOT_ACTIVE		: constant CAN_Message := 	(ID => MSG_SIMULATION_MODE_ID, 		Len => 1, Data => (SIMULATION_MODE_NOT_ACTIVE, others => 0) );
--     MSG_SIMULATION_MODE_NOT_ACTIVE_CONFIRM 	: constant CAN_Message := 	(ID => MSG_SIMULATION_MODE_CONFIRM_ID, 	Len => 1, Data => (SIMULATION_MODE_NOT_ACTIVE, others => 0) );

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

  MSG_MISSION_STATUS_SIMULATION 	: constant CAN_Message := (ID => MSG_PNEUMATICS_CONFIRM_ID, 	Len => 1, Data => (8, others => 0) );

end CAN_Defs;

