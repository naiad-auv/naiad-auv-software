pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stddef_h;
with System;

package alloca_h is

   --  arg-macro: procedure alloca (size)
   --    __builtin_alloca (size)
   function alloca (uu_size : stddef_h.size_t) return System.Address;  -- /usr/include/alloca.h:33
   pragma Import (C, alloca, "alloca");

end alloca_h;
