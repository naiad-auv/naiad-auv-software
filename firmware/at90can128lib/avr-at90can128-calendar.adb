with System.Machine_Code;
with interfaces;
use Interfaces;

package body AVR.AT90CAN128.CALENDAR is
   pragma Suppress (All_Checks);

   Time_Of_Day : Time := 0;
   Waiting     : Boolean := False;
   pragma Volatile (Waiting);
   Delay_Time  : Time;


   function Clock return Time is
      use  System.Machine_Code;
      Result : Time;
   begin
      Asm ("cli", Volatile => True);
      Result := Time_Of_Day;
      Asm ("sei", Volatile => True);
      return Result;
   end Clock;


   procedure Init is
   begin

      -- Using Timer 0 for Tick
      TCCR0A := 2#00000011#;   -- Normal Mode    -- Div64 Prescaler
      OCR0A := 250; -- 16MHz and 64 prescaler gives 1ms
      TCNT0 := 0;            -- Initial value
      TIMSK0.Bit_0 := true ;      --Timer 0 Interrupt

   end Init;

   procedure Timer;
   pragma Machine_Attribute (Timer, "signal");
   pragma Export (C, Timer, Vector_Timer0_OVF);

   procedure Timer is
      One : constant Time := 1;
   begin
      Time_Of_Day := Time_Of_Day + One;
      if Waiting then
         Waiting := Time_Of_Day < Delay_Time;
      end if;
   end Timer;

   function "+" (Left : Time; Right : Duration) return Time is
      --use Interfaces;
   begin
      if Right < 0 then
         if Left >= Time(-Right) then
            return Left-Time(-Right);
         else
            return 0;
         end if;
      else
         return Left + Time (Right);
      end if;
   end "+";

   function "+" (Left : Duration; Right : Time) return Time is
   begin
      return Right+Left;
   end "+";

   function "-" (Left : Time; Right : Duration) return Time is
   begin
      return Left + (-Right);
   end "-";

   function "-" (Left : Time; Right : Time) return Duration is
      --use Interfaces;
   begin
      if Left > Right then
         return Duration (Unsigned_32(Left)-Unsigned_32(Right));
      else
         return -Duration (Unsigned_32(Right)-Unsigned_32(Left));
      end if;
   end "-";

   function "<"  (Left, Right : Time) return Boolean is
      --use Interfaces;
   begin
      return Unsigned_32(Left) < Unsigned_32(Right);
   end "<";

   function "<=" (Left, Right : Time) return Boolean is
      --use Interfaces;
   begin
      return Unsigned_32(Left) <= Unsigned_32(Right);
   end "<=";

   function ">"  (Left, Right : Time) return Boolean is
      --use Interfaces;
   begin
      return Unsigned_32(Left) > Unsigned_32(Right);
   end ">";

   function ">=" (Left, Right : Time) return Boolean is
      --use Interfaces;
   begin
      return Unsigned_32(Left) >= Unsigned_32(Right);
   end ">=";

   procedure Delay_Ms (T : Duration) is
      Tau : constant Time := Clock + T;
   begin
      Delay_Until (Tau);
   end Delay_MS;

   procedure Delay_Until (T : Time) is
   begin
      Delay_Time := T;
      Waiting := True;
      while Waiting loop
         null;
      end loop;
   end Delay_Until;

   begin
      Calendar.Init;
end AVR.AT90CAN128.CALENDAR;


