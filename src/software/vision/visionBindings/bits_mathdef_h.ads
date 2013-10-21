pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package bits_mathdef_h is


   FP_ILOGB0 : constant := (-2147483647 - 1);  --  /usr/include/bits/mathdef.h:45
   FP_ILOGBNAN : constant := (-2147483647 - 1);  --  /usr/include/bits/mathdef.h:46

   subtype float_t is float;  -- /usr/include/bits/mathdef.h:31

   subtype double_t is double;  -- /usr/include/bits/mathdef.h:32

end bits_mathdef_h;
