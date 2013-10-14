pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with bits_types_h;
limited with bits_timex_h;

package bits_time_h is


   CLOCKS_PER_SEC : constant := 1000000;  --  /usr/include/bits/time.h:49

   CLOCK_REALTIME : constant := 0;  --  /usr/include/bits/time.h:61

   CLOCK_MONOTONIC : constant := 1;  --  /usr/include/bits/time.h:63

   CLOCK_PROCESS_CPUTIME_ID : constant := 2;  --  /usr/include/bits/time.h:65

   CLOCK_THREAD_CPUTIME_ID : constant := 3;  --  /usr/include/bits/time.h:67

   CLOCK_MONOTONIC_RAW : constant := 4;  --  /usr/include/bits/time.h:69

   CLOCK_REALTIME_COARSE : constant := 5;  --  /usr/include/bits/time.h:71

   CLOCK_MONOTONIC_COARSE : constant := 6;  --  /usr/include/bits/time.h:73

   CLOCK_BOOTTIME : constant := 7;  --  /usr/include/bits/time.h:75

   CLOCK_REALTIME_ALARM : constant := 8;  --  /usr/include/bits/time.h:77

   CLOCK_BOOTTIME_ALARM : constant := 9;  --  /usr/include/bits/time.h:79

   TIMER_ABSTIME : constant := 1;  --  /usr/include/bits/time.h:82

   type timeval is record
      tv_sec : aliased bits_types_h.uu_time_t;  -- /usr/include/bits/time.h:33
      tv_usec : aliased bits_types_h.uu_suseconds_t;  -- /usr/include/bits/time.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, timeval);  -- /usr/include/bits/time.h:31

   function clock_adjtime (uu_clock_id : bits_types_h.uu_clockid_t; uu_utx : access bits_timex_h.timex) return int;  -- /usr/include/bits/time.h:91
   pragma Import (C, clock_adjtime, "clock_adjtime");

end bits_time_h;
