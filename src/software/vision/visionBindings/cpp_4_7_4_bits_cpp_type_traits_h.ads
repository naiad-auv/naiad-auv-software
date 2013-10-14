pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package cpp_4_7_4_bits_cpp_type_traits_h is

   type uu_true_type is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, uu_true_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/cpp_type_traits.h:83

   type uu_false_type is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, uu_false_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/cpp_type_traits.h:84

end cpp_4_7_4_bits_cpp_type_traits_h;
