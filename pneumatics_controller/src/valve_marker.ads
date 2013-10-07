with Interfaces;

package Valve_Marker is
begin

   PIN_MARKER_LEFT 	: Constant Interfaces.Unsigned_8 := 0;
   PIN_MARKER_RIGHT	: Constant Interfaces.Unsigned_8 := 0;
   T_MARKER_ACTUATION : Constant AVR.AT90CAN128.CALENDAR.Duration := 1000;

end Valve_Marker;
