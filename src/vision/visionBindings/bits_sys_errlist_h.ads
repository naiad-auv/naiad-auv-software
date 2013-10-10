pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package bits_sys_errlist_h is

   sys_nerr : aliased int;  -- /usr/include/bits/sys_errlist.h:27
   pragma Import (C, sys_nerr, "sys_nerr");

   sys_errlist : aliased array (size_t) of Interfaces.C.Strings.chars_ptr;  -- /usr/include/bits/sys_errlist.h:28
   pragma Import (C, sys_errlist, "sys_errlist");

end bits_sys_errlist_h;
