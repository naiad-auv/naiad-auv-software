
package AVR.AT90CAN128.CALENDAR is

   --type Time is private;
   type Time is new Interfaces.Unsigned_32;
   type Duration is new Integer; -- milliseconds

   function Clock return Time;

   function "+"
     (Left : Time;
      Right : Duration)
      return Time;

   function "+"
     (Left : Duration;
      Right : Time)
      return Time;

   function "-"
     (Left : Time;
      Right : Duration)
      return Time;

   function "-"
     (Left : Time;
      Right : Time)
      return Duration;

   function "<"
     (Left, Right : Time)
      return Boolean;

   function "<="
     (Left, Right : Time)
      return Boolean;

   function ">"
     (Left, Right : Time)
      return Boolean;

   function ">="
     (Left, Right : Time)
      return Boolean;

   procedure Delay_ms
     (T : Duration);

   procedure Delay_Until
     (T : Time);

   procedure Init;
end AVR.AT90CAN128.CALENDAR;


