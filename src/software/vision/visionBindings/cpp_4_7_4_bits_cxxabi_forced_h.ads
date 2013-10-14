pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package cpp_4_7_4_bits_cxxabi_forced_h is

   package Class_uu_forced_unwind is
      type uu_forced_unwind is abstract tagged limited record
         null;
      end record;
      pragma Import (CPP, uu_forced_unwind);

      procedure forced_unwindend cpp_4_7_4_bits_cxxabi_forced_h;
