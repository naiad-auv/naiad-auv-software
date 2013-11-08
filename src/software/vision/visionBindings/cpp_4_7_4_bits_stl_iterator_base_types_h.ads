pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package cpp_4_7_4_bits_stl_iterator_base_types_h is

   type input_iterator_tag is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, input_iterator_tag);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_iterator_base_types.h:90

   type output_iterator_tag is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, output_iterator_tag);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_iterator_base_types.h:93

   type forward_iterator_tag is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, forward_iterator_tag);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_iterator_base_types.h:96

   type bidirectional_iterator_tag is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, bidirectional_iterator_tag);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_iterator_base_types.h:100

   type random_access_iterator_tag is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, random_access_iterator_tag);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_iterator_base_types.h:104

end cpp_4_7_4_bits_stl_iterator_base_types_h;
