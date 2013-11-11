pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with System;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h;
with cpp_4_7_4_bits_stl_iterator_base_types_h;

package cpp_4_7_4_bits_stl_bvector_h is

   subtype u_Bit_type is unsigned_long;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:68

   package Class_u_Bit_reference is
      type u_Bit_reference is limited record
         u_M_p : access u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:73
         u_M_mask : aliased u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:74
      end record;
      pragma Import (CPP, u_Bit_reference);

      --  skipped func _Bit_reference

      --  skipped func _Bit_reference

      function operator_3 (this : access constant u_Bit_reference) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:81
      pragma Import (CPP, operator_3, "_ZNKSt14_Bit_referencecvbEv");

      function operator_as (this : access u_Bit_reference; uu_x : Extensions.bool) return access u_Bit_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:85
      pragma Import (CPP, operator_as, "_ZNSt14_Bit_referenceaSEb");

      function operator_as (this : access u_Bit_reference; uu_x : System.Address) return access u_Bit_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:95
      pragma Import (CPP, operator_as, "_ZNSt14_Bit_referenceaSERKS_");

      function operator_eq (this : access constant u_Bit_reference; uu_x : System.Address) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:99
      pragma Import (CPP, operator_eq, "_ZNKSt14_Bit_referenceeqERKS_");

      function operator_lt (this : access constant u_Bit_reference; uu_x : System.Address) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:103
      pragma Import (CPP, operator_lt, "_ZNKSt14_Bit_referenceltERKS_");

      procedure flip (this : access u_Bit_reference);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:107
      pragma Import (CPP, flip, "_ZNSt14_Bit_reference4flipEv");
   end;
   use Class_u_Bit_reference;
   package Class_u_Bit_iterator_base is
      type u_Bit_iterator_base is limited record
         u_M_p : access u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:114
         u_M_offset : aliased unsigned;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:115
      end record;
      pragma Import (CPP, u_Bit_iterator_base);

      --  skipped func _Bit_iterator_base

      --  skipped func _M_bump_up

      --  skipped func _M_bump_down

      --  skipped func _M_incr

      function operator_eq (this : access constant u_Bit_iterator_base; uu_i : System.Address) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:155
      pragma Import (CPP, operator_eq, "_ZNKSt18_Bit_iterator_baseeqERKS_");

      function operator_lt (this : access constant u_Bit_iterator_base; uu_i : System.Address) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:159
      pragma Import (CPP, operator_lt, "_ZNKSt18_Bit_iterator_baseltERKS_");

      function operator_ne (this : access constant u_Bit_iterator_base; uu_i : System.Address) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:166
      pragma Import (CPP, operator_ne, "_ZNKSt18_Bit_iterator_baseneERKS_");

      function operator_gt (this : access constant u_Bit_iterator_base; uu_i : System.Address) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:170
      pragma Import (CPP, operator_gt, "_ZNKSt18_Bit_iterator_basegtERKS_");

      function operator_le (this : access constant u_Bit_iterator_base; uu_i : System.Address) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:174
      pragma Import (CPP, operator_le, "_ZNKSt18_Bit_iterator_baseleERKS_");

      function operator_ge (this : access constant u_Bit_iterator_base; uu_i : System.Address) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:178
      pragma Import (CPP, operator_ge, "_ZNKSt18_Bit_iterator_basegeERKS_");
   end;
   use Class_u_Bit_iterator_base;
   function operator_m (uu_x : access constant u_Bit_iterator_base; uu_y : access constant u_Bit_iterator_base) return cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:183
   pragma Import (CPP, operator_m, "_ZStmiRKSt18_Bit_iterator_baseS1_");

   type u_Bit_iterator;
   type reference;
   type u_Bit_reference is record
      u_M_p : access u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:73
      u_M_mask : aliased u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:74
   end record;
   pragma Convention (C_Pass_By_Copy, u_Bit_reference);
   type reference is record
      u_M_p : access u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:73
      u_M_mask : aliased u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:74
   end record;
   pragma Convention (C_Pass_By_Copy, reference);
   type iterator;
   type u_Bit_iterator;
   type reference is record
      u_M_p : access u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:73
      u_M_mask : aliased u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:74
   end record;
   pragma Convention (C_Pass_By_Copy, reference);
   type iterator is record
      parent : aliased u_Bit_iterator_base;
   end record;
   pragma Convention (C_Pass_By_Copy, iterator);
   type u_Bit_iterator is record
      parent : aliased u_Bit_iterator_base;
   end record;
   pragma Convention (C_Pass_By_Copy, u_Bit_iterator);
   type reference is record
      u_M_p : access u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:73
      u_M_mask : aliased u_Bit_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:74
   end record;
   pragma Convention (C_Pass_By_Copy, reference);
   type iterator is record
      parent : aliased u_Bit_iterator_base;
   end record;
   pragma Convention (C_Pass_By_Copy, iterator);
   package Class_u_Bit_iterator is
      type u_Bit_iterator is limited record
         parent : aliased u_Bit_iterator_base;
      end record;
      pragma Import (CPP, u_Bit_iterator);

      --  skipped func _Bit_iterator

      --  skipped func _Bit_iterator

      function operator_t (this : access constant u_Bit_iterator) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:201
      pragma Import (CPP, operator_t, "_ZNKSt13_Bit_iteratordeEv");

      function operator_pp (this : access u_Bit_iterator) return access iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:205
      pragma Import (CPP, operator_pp, "_ZNSt13_Bit_iteratorppEv");

      function operator_pp (this : access u_Bit_iterator; arg2 : int) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:212
      pragma Import (CPP, operator_pp, "_ZNSt13_Bit_iteratorppEi");

      function operator_mm (this : access u_Bit_iterator) return access iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:220
      pragma Import (CPP, operator_mm, "_ZNSt13_Bit_iteratormmEv");

      function operator_mm (this : access u_Bit_iterator; arg2 : int) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:227
      pragma Import (CPP, operator_mm, "_ZNSt13_Bit_iteratormmEi");

      function operator_pa (this : access u_Bit_iterator; uu_i : cpp_4_7_4_bits_stl_iterator_base_types_h.difference_type) return access iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:235
      pragma Import (CPP, operator_pa, "_ZNSt13_Bit_iteratorpLEl");

      function operator_ma (this : access u_Bit_iterator; uu_i : cpp_4_7_4_bits_stl_iterator_base_types_h.difference_type) return access iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:242
      pragma Import (CPP, operator_ma, "_ZNSt13_Bit_iteratormIEl");

      function operator_p (this : access constant u_Bit_iterator; uu_i : cpp_4_7_4_bits_stl_iterator_base_types_h.difference_type) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:249
      pragma Import (CPP, operator_p, "_ZNKSt13_Bit_iteratorplEl");

      function operator_m (this : access constant u_Bit_iterator; uu_i : cpp_4_7_4_bits_stl_iterator_base_types_h.difference_type) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:256
      pragma Import (CPP, operator_m, "_ZNKSt13_Bit_iteratormiEl");

      function operator_ob (this : access constant u_Bit_iterator; uu_i : cpp_4_7_4_bits_stl_iterator_base_types_h.difference_type) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:263
      pragma Import (CPP, operator_ob, "_ZNKSt13_Bit_iteratorixEl");
   end;
   use Class_u_Bit_iterator;
   function operator_p (uu_n : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t; uu_x : access constant u_Bit_iterator) return u_Bit_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:268
   pragma Import (CPP, operator_p, "_ZStpllRKSt13_Bit_iterator");

   type u_Bit_const_iterator;
   type const_iterator;
   type u_Bit_const_iterator;
   type const_iterator is record
      parent : aliased u_Bit_iterator_base;
   end record;
   pragma Convention (C_Pass_By_Copy, const_iterator);
   type u_Bit_const_iterator is record
      parent : aliased u_Bit_iterator_base;
   end record;
   pragma Convention (C_Pass_By_Copy, u_Bit_const_iterator);
   type const_iterator is record
      parent : aliased u_Bit_iterator_base;
   end record;
   pragma Convention (C_Pass_By_Copy, const_iterator);
   package Class_u_Bit_const_iterator is
      type u_Bit_const_iterator is limited record
         parent : aliased u_Bit_iterator_base;
      end record;
      pragma Import (CPP, u_Bit_const_iterator);

      --  skipped func _Bit_const_iterator

      --  skipped func _Bit_const_iterator

      --  skipped func _Bit_const_iterator

      function operator_t (this : access constant u_Bit_const_iterator) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:287
      pragma Import (CPP, operator_t, "_ZNKSt19_Bit_const_iteratordeEv");

      function operator_pp (this : access u_Bit_const_iterator) return access const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:291
      pragma Import (CPP, operator_pp, "_ZNSt19_Bit_const_iteratorppEv");

      function operator_pp (this : access u_Bit_const_iterator; arg2 : int) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:298
      pragma Import (CPP, operator_pp, "_ZNSt19_Bit_const_iteratorppEi");

      function operator_mm (this : access u_Bit_const_iterator) return access const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:306
      pragma Import (CPP, operator_mm, "_ZNSt19_Bit_const_iteratormmEv");

      function operator_mm (this : access u_Bit_const_iterator; arg2 : int) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:313
      pragma Import (CPP, operator_mm, "_ZNSt19_Bit_const_iteratormmEi");

      function operator_pa (this : access u_Bit_const_iterator; uu_i : cpp_4_7_4_bits_stl_iterator_base_types_h.difference_type) return access const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:321
      pragma Import (CPP, operator_pa, "_ZNSt19_Bit_const_iteratorpLEl");

      function operator_ma (this : access u_Bit_const_iterator; uu_i : cpp_4_7_4_bits_stl_iterator_base_types_h.difference_type) return access const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:328
      pragma Import (CPP, operator_ma, "_ZNSt19_Bit_const_iteratormIEl");

      function operator_p (this : access constant u_Bit_const_iterator; uu_i : cpp_4_7_4_bits_stl_iterator_base_types_h.difference_type) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:335
      pragma Import (CPP, operator_p, "_ZNKSt19_Bit_const_iteratorplEl");

      function operator_m (this : access constant u_Bit_const_iterator; uu_i : cpp_4_7_4_bits_stl_iterator_base_types_h.difference_type) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:342
      pragma Import (CPP, operator_m, "_ZNKSt19_Bit_const_iteratormiEl");

      function operator_ob (this : access constant u_Bit_const_iterator; uu_i : cpp_4_7_4_bits_stl_iterator_base_types_h.difference_type) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:349
      pragma Import (CPP, operator_ob, "_ZNKSt19_Bit_const_iteratorixEl");
   end;
   use Class_u_Bit_const_iterator;
   function operator_p (uu_n : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t; uu_x : access constant u_Bit_const_iterator) return u_Bit_const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:354
   pragma Import (CPP, operator_p, "_ZStpllRKSt19_Bit_const_iterator");

   procedure fill
     (uu_first : u_Bit_iterator;
      uu_last : u_Bit_iterator;
      uu_x : access Extensions.bool);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_bvector.h:365
   pragma Import (CPP, fill, "_ZSt4fillSt13_Bit_iteratorS_RKb");

end cpp_4_7_4_bits_stl_bvector_h;
