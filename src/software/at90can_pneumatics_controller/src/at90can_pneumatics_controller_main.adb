-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-12-20 by Konstantinos Konstantopoulos

with Pneumatics;
with AVR.AT90CAN128.CAN;
with AVR.AT90CAN128.CLOCK;
with CAN_Defs;
with Board_and_Mode_Defs;

procedure AT90CAN_Pneumatics_Controller_Main is

   canReceivedMsg : CAN_Defs.CAN_Message;
   msgReceived	: Boolean;
   myResult : Pneumatics.Controller_Response;

   use type CAN_Defs.CAN_ID;

begin

   AVR.AT90CAN128.CAN.Can_Init(CAN_Defs.K250, Board_and_Mode_Defs.PNUMATICS_CONTROLLER);
   AVR.AT90CAN128.CAN.Can_Enable;
   AVR.AT90CAN128.CAN.Can_Set_MOB_ID_MASK(1, (CAN_Defs.MSG_KILL_SWITCH_ID.Identifier, False), (16#7FF#, False));
   AVR.AT90CAN128.CAN.Can_Set_MOB_ID_MASK(3, (CAN_Defs.MSG_PNEUMATICS_ID.Identifier, False), (16#7FF#, False));

   Pneumatics.Init_Pins;

   loop
      AVR.AT90CAN128.CAN.Can_Get(canReceivedMsg, msgReceived, AVR.AT90CAN128.CLOCK.Time_Duration(-1));
      if msgReceived then
         if CAN_Defs."="(canReceivedMsg.ID.Identifier, CAN_Defs.MSG_KILL_SWITCH_ID.Identifier) then
            Pneumatics.Dispatch_Kill_Msg(canReceivedMsg);
         elsif CAN_Defs."="(canReceivedMsg.ID.Identifier, CAN_Defs.MSG_MODE_ID.Identifier) then
            Pneumatics.Dispatch_Sim_Msg(canReceivedMsg);
         elsif CAN_Defs."="(canReceivedMsg.ID.Identifier, CAN_Defs.MSG_PNEUMATICS_ID.Identifier) then
            if Pneumatics.bKillSwitchFlag = False then
               Pneumatics.Dispatch_Actuation_msg(canReceivedMsg, myResult);
            else
               null;
            end if;
         else
            myResult.success := False;
         end if;

         if myResult.success then
            myResult.success := False;
            AVR.AT90CAN128.CAN.Can_Send(myResult.canMsgOut);
         else
            null;
         end if;
      end if;
   end loop;

end AT90CAN_Pneumatics_Controller_Main;
