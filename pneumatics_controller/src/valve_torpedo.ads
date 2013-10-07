with Interfaces;

package Valve_Torpedo is
begin

   PIN_TORPEDO_LEFT	: Constant Interfaces.Unsigned_8 := 0;
   PIN_TORPEDO_RIGHT	: Constant Interfaces.Unsigned_8 := 0;
   T_TORPEDO_ACTUATION	: Constant AVR.AT90CAN128.CALENDAR.Duration := 1000;

   procedure Fire_Torpedo(u8Pin : in Interfaces.Unsigned_8; dT : in AVR.AT90CAN128.CALENDAR.Duration; bSimModeFlag : in Boolean);

end Valve_Torpedo;
