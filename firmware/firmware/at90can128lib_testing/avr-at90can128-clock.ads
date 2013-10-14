
package AVR.AT90CAN128.CLOCK is

   --type Time is private;
   type Time is new Interfaces.Unsigned_32;
   type Time_Duration is new Integer; -- milliseconds

   function getClockTime return Time;

   function "+"
     (Left : Time;
      Right : Time_Duration)
      return Time;

   function "+"
     (Left : Time_Duration;
      Right : Time)
      return Time;

   function "-"
     (Left : Time;
      Right : Time_Duration)
      return Time;

   function "-"
     (Left : Time;
      Right : Time)
      return Time_Duration;

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
     (T : Time_Duration);

   procedure Delay_Until
     (T : Time);

   procedure Init;
end AVR.AT90CAN128.CLOCK;


