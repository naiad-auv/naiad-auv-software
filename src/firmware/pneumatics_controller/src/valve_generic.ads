-- Written by: Konstantinos Konstantopoulos for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-10-18 by Konstantinos Konstantopoulos


with Interfaces;
with AVR.AT90CAN128.Clock;

package Valve_Generic is
   procedure Actuate_For_Duration(u8Pin : in Interfaces.Unsigned_8; dT : in AVR.AT90CAN128.Clock.Time_Duration; bSimModeFlag : in Boolean);
   procedure Actuate(u8Pin : in Interfaces.Unsigned_8; bSetPin : in Boolean; bSimModeFlag : in Boolean);
end Valve_Generic;
