pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h;
with cpp_4_7_4_valarray;
with System;

package cpp_4_7_4_bits_gslice_h is

   type gslice;
   type u_Indexer is record
      u_M_count : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:109
      u_M_start : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:110
      u_M_size : aliased cpp_4_7_4_valarray.Class_valarray.valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:111
      u_M_stride : aliased cpp_4_7_4_valarray.Class_valarray.valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:112
      u_M_index : aliased cpp_4_7_4_valarray.Class_valarray.valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:113
   end record;
   pragma Convention (C_Pass_By_Copy, u_Indexer);
   package Class_gslice is
      type gslice is limited record
         u_M_index : access u_Indexer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:130
      end record;
      pragma Import (CPP, gslice);

      function New_gslice return gslice;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:150
      pragma CPP_Constructor (New_gslice, "_ZNSt6gsliceC1Ev");

      function New_gslice
        (uu_o : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;
         uu_l : access constant cpp_4_7_4_valarray.Class_valarray.valarray;
         uu_s : access constant cpp_4_7_4_valarray.Class_valarray.valarray) return gslice;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:154
      pragma CPP_Constructor (New_gslice, "_ZNSt6gsliceC1EmRKSt8valarrayImES3_");

      procedure Delete_gslice (this : access gslice);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:164
      pragma Import (CPP, Delete_gslice, "_ZNSt6gsliceD1Ev");

      function operator_as (this : access gslice; uu_g : System.Address) return access gslice;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:171
      pragma Import (CPP, operator_as, "_ZNSt6gsliceaSERKS_");

      function start (this : access constant gslice) return cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:136
      pragma Import (CPP, start, "_ZNKSt6gslice5startEv");

      function size (this : access constant gslice) return cpp_4_7_4_valarray.Class_valarray.valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:140
      pragma Import (CPP, size, "_ZNKSt6gslice4sizeEv");

      function stride (this : access constant gslice) return cpp_4_7_4_valarray.Class_valarray.valarray;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/gslice.h:144
      pragma Import (CPP, stride, "_ZNKSt6gslice6strideEv");
   end;
   use Class_gslice;
end cpp_4_7_4_bits_gslice_h;
