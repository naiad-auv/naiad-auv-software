--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Pneumatics.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Interfaces;

package body Pneumatics.Test_Data.Tests is

   --  begin read only
   procedure Test_Controller (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6 (Gnattest_T : in out Test) renames Test_Controller;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_KILL_SWITCH_ACTIVE;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_KILL_SWITCH_ACTIVE),
         "Wrong action for MSG_KILL_SWITCH_ACTIVE can message.");

      --  begin read only
   end Test_Controller;
   --  end read only

   --  begin read only
   procedure Test_Controller_2 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_2 (Gnattest_T : in out Test) renames Test_Controller_2;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_2 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_KILL_SWITCH_NOT_ACTIVE;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_KILL_SWITCH_NOT_ACTIVE),
         "Wrong action for MSG_KILL_SWITCH_NOT_ACTIVE can message.");

      --  begin read only
   end Test_Controller_2;
   --  end read only

   --  begin read only
   procedure Test_Controller_3 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_3 (Gnattest_T : in out Test) renames Test_Controller_3;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_3 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_SIMULATION_MODE_ACTIVE;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_SIMULATION_MODE_ACTIVE),
         "Wrong action for MSG_SIMULATION_MODE_ACTIVE can message.");

      --  begin read only
   end Test_Controller_3;
   --  end read only

   --  begin read only
   procedure Test_Controller_4 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_4 (Gnattest_T : in out Test) renames Test_Controller_4;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_4 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_SIMULATION_MODE_NOT_ACTIVE;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_SIMULATION_MODE_NOT_ACTIVE),
         "Wrong action for MSG_SIMULATION_MODE_NOT_ACTIVE can message.");

      --  begin read only
   end Test_Controller_4;
   --  end read only

   --  begin read only
   procedure Test_Controller_5 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_5 (Gnattest_T : in out Test) renames Test_Controller_5;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_5 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_TORPEDO_LEFT;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_TORPEDO_LEFT_CONFIRM),
         "Wrong action for MSG_TORPEDO_LEFT can message.");

      --  begin read only
   end Test_Controller_5;
   --  end read only

   --  begin read only
   procedure Test_Controller_6 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_6 (Gnattest_T : in out Test) renames Test_Controller_6;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_6 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_TORPEDO_RIGHT;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_TORPEDO_RIGHT_CONFIRM),
         "Wrong action for MSG_TORPEDO_RIGHT can message.");

      --  begin read only
   end Test_Controller_6;
   --  end read only

   --  begin read only
   procedure Test_Controller_7 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_7 (Gnattest_T : in out Test) renames Test_Controller_7;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_7 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_MARKER_LEFT;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_MARKER_LEFT_CONFIRM),
         "Wrong action for MSG_MARKER_LEFT can message.");

      --  begin read only
   end Test_Controller_7;
   --  end read only

   --  begin read only
   procedure Test_Controller_8 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_8 (Gnattest_T : in out Test) renames Test_Controller_8;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_8 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_MARKER_RIGHT;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_MARKER_RIGHT_CONFIRM),
         "Wrong action for MSG_MARKER_RIGHT can message.");

      --  begin read only
   end Test_Controller_8;
   --  end read only

   --  begin read only
   procedure Test_Controller_9 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_9 (Gnattest_T : in out Test) renames Test_Controller_9;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_9 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_GRIPPER_GRAB;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_GRIPPER_GRAB_CONFIRM),
         "Wrong action for MSG_GRIPPER_GRAB can message.");

      --  begin read only
   end Test_Controller_9;
   --  end read only

   --  begin read only
   procedure Test_Controller_10 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_10 (Gnattest_T : in out Test) renames Test_Controller_10;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_10 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_GRIPPER_RELEASE;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_GRIPPER_RELEASE_CONFIRM),
         "Wrong action for MSG_GRIPPER_RELEASE can message.");

      --  begin read only
   end Test_Controller_10;
   --  end read only

   --  begin read only
   procedure Test_Controller_11 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_11 (Gnattest_T : in out Test) renames Test_Controller_11;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_11 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_GRIPPER_ROTATE_CW;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_GRIPPER_ROTATE_CW_CONFIRM),
         "Wrong action for MSG_GRIPPER_ROTATE_CW can message.");

      --  begin read only
   end Test_Controller_11;
   --  end read only

   --  begin read only
   procedure Test_Controller_12 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_12 (Gnattest_T : in out Test) renames Test_Controller_12;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_12 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      msgIn : Can.CAN_Message := Can.MSG_GRIPPER_ROTATE_ACW;
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

      AUnit.Assertions.Assert
        (response.success and Can."="(response.canMsgOut, Can.MSG_GRIPPER_ROTATE_ACW_CONFIRM),
         "Wrong action for MSG_GRIPPER_ROTATE_ACW can message.");

      --  begin read only
   end Test_Controller_12;
   --  end read only

   --  begin read only
   procedure Test_Controller_13 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_13 (Gnattest_T : in out Test) renames Test_Controller_13;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_13 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      -- Invalid id
      msgIn : Can.CAN_Message := (ID => 1234, Len => 0, Data => (0, others => 0) );
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

       AUnit.Assertions.Assert
        (response.success = False,
         "Wrong action for invalid can message.");

      --  begin read only
   end Test_Controller_13;
   --  end read only

   --  begin read only
   procedure Test_Controller_14 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_14 (Gnattest_T : in out Test) renames Test_Controller_14;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_14 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      -- Invalid payload
      msgIn : Can.CAN_Message := (ID => Can.MSG_KILL_SWITCH_ID, Len => 0, Data => (123, others => 0) );
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

       AUnit.Assertions.Assert
        (response.success = False,
         "Wrong action for invalid KILL can message.");

      --  begin read only
   end Test_Controller_14;
   --  end read only

   --  begin read only
   procedure Test_Controller_15 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_15 (Gnattest_T : in out Test) renames Test_Controller_15;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_15 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      -- Invalid payload
      msgIn : Can.CAN_Message := (ID => Can.MSG_SIMULATION_MODE_ID, Len => 0, Data => (123, others => 0) );
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

       AUnit.Assertions.Assert
        (response.success = False,
         "Wrong action for invalid SIMULATION can message.");

      --  begin read only
   end Test_Controller_15;
   --  end read only

   --  begin read only
   procedure Test_Controller_16 (Gnattest_T : in out Test);
   procedure Test_Controller_7da7e6_16 (Gnattest_T : in out Test) renames Test_Controller_16;
   --  id:2.1/7da7e6e543326723/Controller/1/0/
   procedure Test_Controller_16 (Gnattest_T : in out Test) is
      --  pneumatics.ads:15:4:Controller
      --  end read only

      pragma Unreferenced (Gnattest_T);

      -- Invalid payload
      msgIn : Can.CAN_Message := (ID => Can.MSG_PNEUMATICS_ID, Len => 0, Data => (123, others => 0) );
      response : Pneumatics.Controller_Response;

   begin

      Pneumatics.Controller(msgIn, response);

       AUnit.Assertions.Assert
        (response.success = False,
         "Wrong action for invalid PNEUMATICS can message.");

      --  begin read only
   end Test_Controller_16;
   --  end read only

end Pneumatics.Test_Data.Tests;
