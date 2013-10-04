pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package bits_waitstatus_h is

   --  unsupported macro: w_termsig __wait_terminated.__w_termsig
   --  unsupported macro: w_coredump __wait_terminated.__w_coredump
   --  unsupported macro: w_retcode __wait_terminated.__w_retcode
   --  unsupported macro: w_stopsig __wait_stopped.__w_stopsig
   --  unsupported macro: w_stopval __wait_stopped.__w_stopval
   type wait;
   type anon_0 is record
      uu_w_termsig : Extensions.Unsigned_7;  -- /usr/include/bits/waitstatus.h:73
      uu_w_coredump : Extensions.Unsigned_1;  -- /usr/include/bits/waitstatus.h:74
      uu_w_retcode : aliased unsigned_char;  -- /usr/include/bits/waitstatus.h:75
      field_4 : aliased unsigned_short;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_0);
   type anon_1 is record
      uu_w_stopval : aliased unsigned_char;  -- /usr/include/bits/waitstatus.h:88
      uu_w_stopsig : aliased unsigned_char;  -- /usr/include/bits/waitstatus.h:89
      field_3 : aliased unsigned_short;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_1);
   type wait (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            w_status : aliased int;  -- /usr/include/bits/waitstatus.h:69
         when 1 =>
            uu_wait_terminated : aliased anon_0;  -- /usr/include/bits/waitstatus.h:84
         when others =>
            uu_wait_stopped : aliased anon_1;  -- /usr/include/bits/waitstatus.h:97
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, wait);
   pragma Unchecked_Union (wait);  -- /usr/include/bits/waitstatus.h:67

end bits_waitstatus_h;
