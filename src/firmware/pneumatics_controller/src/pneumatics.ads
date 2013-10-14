-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-11

with Can;

package Pneumatics is

   type Controller_Response is record
      success	: Boolean;
      canMsgOut	: Can.CAN_Message;
   end record;

   procedure Controller (canMsgIn : IN Can.CAN_Message; result : OUT Controller_Response);
end pneumatics;
