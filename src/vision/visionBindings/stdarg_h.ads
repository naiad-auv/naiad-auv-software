pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package stdarg_h is

   subtype uu_gnuc_va_list is System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/include/stdarg.h:40

end stdarg_h;
