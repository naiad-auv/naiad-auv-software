pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h;

package cpp_4_7_4_bits_slice_array_h is

   package Class_slice is
      type slice is limited record
         u_M_off : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/slice_array.h:83
         u_M_sz : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/slice_array.h:84
         u_M_st : aliased cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/slice_array.h:85
      end record;
      pragma Import (CPP, slice);

      function New_slice return slice;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/slice_array.h:91
      pragma CPP_Constructor (New_slice, "_ZNSt5sliceC1Ev");

      function New_slice
        (uu_o : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;
         uu_d : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;
         uu_s : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t) return slice;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/slice_array.h:95
      pragma CPP_Constructor (New_slice, "_ZNSt5sliceC1Emmm");

      function start (this : access constant slice) return cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/slice_array.h:99
      pragma Import (CPP, start, "_ZNKSt5slice5startEv");

      function size (this : access constant slice) return cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/slice_array.h:103
      pragma Import (CPP, size, "_ZNKSt5slice4sizeEv");

      function stride (this : access constant slice) return cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.size_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/slice_array.h:107
      pragma Import (CPP, stride, "_ZNKSt5slice6strideEv");
   end;
   use Class_slice;
end cpp_4_7_4_bits_slice_array_h;
