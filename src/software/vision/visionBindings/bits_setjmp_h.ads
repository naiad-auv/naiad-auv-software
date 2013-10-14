pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package bits_setjmp_h is

   type uu_jmp_buf is array (0 .. 7) of aliased long;  -- /usr/include/bits/setjmp.h:32

end bits_setjmp_h;
