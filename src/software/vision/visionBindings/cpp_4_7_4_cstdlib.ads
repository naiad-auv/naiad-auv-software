pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stdlib_h;

package cpp_4_7_4_cstdlib is

   function c_abs (uu_i : long) return long;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cstdlib:140
   pragma Import (CPP, c_abs, "_ZSt3absl");

   function div (uu_i : long; uu_j : long) return stdlib_h.Class_ldiv_t.ldiv_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cstdlib:143
   pragma Import (CPP, div, "_ZSt3divll");

   function c_abs (uu_x : Long_Long_Integer) return Long_Long_Integer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cstdlib:175
   pragma Import (CPP, c_abs, "_ZN9__gnu_cxx3absEx");

   function div (uu_n : Long_Long_Integer; uu_d : Long_Long_Integer) return stdlib_h.Class_lldiv_t.lldiv_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/cstdlib:181
   pragma Import (CPP, div, "_ZN9__gnu_cxx3divExx");

end cpp_4_7_4_cstdlib;
