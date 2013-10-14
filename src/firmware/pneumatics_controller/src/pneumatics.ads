-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-14 by Nils Brynedal Ignell

with AVR.AT90CAN128.CAN;

package Pneumatics is

   type Controller_Response is record
      success	: Boolean;
      canMsgOut	: AVR.AT90CAN128.CAN.CAN_Message;
   end record;

   procedure Controller (canMsgIn : IN AVR.AT90CAN128.CAN.CAN_Message; result : OUT Controller_Response);
end pneumatics;
