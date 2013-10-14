pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package bits_sigset_h is

   subtype uu_sig_atomic_t is int;  -- /usr/include/bits/sigset.h:24

   type uu_sigset_t_uu_val_array is array (0 .. 15) of aliased unsigned_long;
   type uu_sigset_t is record
      uu_val : aliased uu_sigset_t_uu_val_array;  -- /usr/include/bits/sigset.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, uu_sigset_t);  -- /usr/include/bits/sigset.h:32

   --  skipped anonymous struct anon_6

end bits_sigset_h;
