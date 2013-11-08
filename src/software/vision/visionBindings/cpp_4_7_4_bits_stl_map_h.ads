pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with cpp_4_7_4_bits_stl_function_h;
with System;
with Interfaces.C.Extensions;
with cpp_4_7_4_bits_stl_pair_h;

package cpp_4_7_4_bits_stl_map_h is

   package map_Class_basic_string.basic_string_int_Class_less.less_Class_allocator.allocator is
      type map is limited record
         u_M_t : aliased u_Rep_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:132
      end record;
      pragma Import (CPP, map);

      function New_map return map;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:154
      pragma CPP_Constructor (New_map, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEEC1Ev");

      function New_map (uu_comp : access constant cpp_4_7_4_bits_stl_function_h.Class_less.less; uu_a : System.Address) return map;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:163
      pragma CPP_Constructor (New_map, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEEC1ERKS1_RKS5_");

      function operator_as (this : access map; uu_x : System.Address) return access map;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:258
      pragma Import (CPP, operator_as, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEEaSERKS6_");

      function get_allocator (this : access constant map) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:304
      pragma Import (CPP, get_allocator, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE13get_allocatorEv");

      function c_begin (this : access map) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:314
      pragma Import (CPP, c_begin, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE5beginEv");

      function c_begin (this : access constant map) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:323
      pragma Import (CPP, c_begin, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE5beginEv");

      function c_end (this : access map) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:332
      pragma Import (CPP, c_end, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE3endEv");

      function c_end (this : access constant map) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:341
      pragma Import (CPP, c_end, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE3endEv");

      function rbegin (this : access map) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:350
      pragma Import (CPP, rbegin, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE6rbeginEv");

      function rbegin (this : access constant map) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:359
      pragma Import (CPP, rbegin, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE6rbeginEv");

      function rend (this : access map) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:368
      pragma Import (CPP, rend, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE4rendEv");

      function rend (this : access constant map) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:377
      pragma Import (CPP, rend, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE4rendEv");

      function empty (this : access constant map) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:423
      pragma Import (CPP, empty, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE5emptyEv");

      function size (this : access constant map) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:428
      pragma Import (CPP, size, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE4sizeEv");

      function max_size (this : access constant map) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:433
      pragma Import (CPP, max_size, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE8max_sizeEv");

      function operator_ob (this : access map; uu_k : System.Address) return access mapped_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:450
      pragma Import (CPP, operator_ob, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEEixERS3_");

      function c_at (this : access map; uu_k : System.Address) return access mapped_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:487
      pragma Import (CPP, c_at, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE2atERS3_");

      function c_at (this : access constant map; uu_k : System.Address) return access mapped_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:496
      pragma Import (CPP, c_at, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE2atERS3_");

      function insert (this : access map; uu_x : System.Address) return cpp_4_7_4_bits_stl_pair_h.pair;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:522
      pragma Import (CPP, insert, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE6insertERKS4_");

      function insert
        (this : access map;
         uu_position : iterator;
         uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:574
      pragma Import (CPP, insert, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE6insertESt17_Rb_tree_iteratorIS4_ERKS4_");

      procedure erase (this : access map; uu_position : iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:637
      pragma Import (CPP, erase, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE5eraseESt17_Rb_tree_iteratorIS4_E");

      function erase (this : access map; uu_x : System.Address) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:653
      pragma Import (CPP, erase, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE5eraseERS3_");

      procedure erase
        (this : access map;
         uu_first : iterator;
         uu_last : iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:689
      pragma Import (CPP, erase, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE5eraseESt17_Rb_tree_iteratorIS4_ES8_");

      procedure swap (this : access map; uu_x : access map);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:705
      pragma Import (CPP, swap, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE4swapERS6_");

      procedure clear (this : access map);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:715
      pragma Import (CPP, clear, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE5clearEv");

      function key_comp (this : access constant map) return key_compare;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:724
      pragma Import (CPP, key_comp, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE8key_compEv");

      function value_comp (this : access constant map) return value_compare;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:732
      pragma Import (CPP, value_comp, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE10value_compEv");

      function find (this : access map; uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:748
      pragma Import (CPP, find, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE4findERS3_");

      function find (this : access constant map; uu_x : System.Address) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:763
      pragma Import (CPP, find, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE4findERS3_");

      function count (this : access constant map; uu_x : System.Address) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:775
      pragma Import (CPP, count, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE5countERS3_");

      function lower_bound (this : access map; uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:790
      pragma Import (CPP, lower_bound, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE11lower_boundERS3_");

      function lower_bound (this : access constant map; uu_x : System.Address) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:805
      pragma Import (CPP, lower_bound, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE11lower_boundERS3_");

      function upper_bound (this : access map; uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:815
      pragma Import (CPP, upper_bound, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE11upper_boundERS3_");

      function upper_bound (this : access constant map; uu_x : System.Address) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:825
      pragma Import (CPP, upper_bound, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE11upper_boundERS3_");

      function equal_range (this : access map; uu_x : System.Address) return cpp_4_7_4_bits_stl_pair_h.pair;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:844
      pragma Import (CPP, equal_range, "_ZNSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE11equal_rangeERS3_");

      function equal_range (this : access constant map; uu_x : System.Address) return cpp_4_7_4_bits_stl_pair_h.pair;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:863
      pragma Import (CPP, equal_range, "_ZNKSt3mapISsiSt4lessISsESaISt4pairIKSsiEEE11equal_rangeERS3_");

   end;
   use map_Class_basic_string.basic_string_int_Class_less.less_Class_allocator.allocator;

   package map_Class_basic_string.basic_string_vector_Class_less.less_Class_allocator.allocator is
      type map is limited record
         u_M_t : aliased u_Rep_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:132
      end record;
      pragma Import (CPP, map);

      function New_map return map;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:154
      pragma CPP_Constructor (New_map, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEEC1Ev");

      function New_map (uu_comp : access constant cpp_4_7_4_bits_stl_function_h.Class_less.less; uu_a : System.Address) return map;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:163
      pragma CPP_Constructor (New_map, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEEC1ERKS4_RKS8_");

      function operator_as (this : access map; uu_x : System.Address) return access map;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:258
      pragma Import (CPP, operator_as, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEEaSERKS9_");

      function get_allocator (this : access constant map) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:304
      pragma Import (CPP, get_allocator, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE13get_allocatorEv");

      function c_begin (this : access map) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:314
      pragma Import (CPP, c_begin, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE5beginEv");

      function c_begin (this : access constant map) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:323
      pragma Import (CPP, c_begin, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE5beginEv");

      function c_end (this : access map) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:332
      pragma Import (CPP, c_end, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE3endEv");

      function c_end (this : access constant map) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:341
      pragma Import (CPP, c_end, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE3endEv");

      function rbegin (this : access map) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:350
      pragma Import (CPP, rbegin, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE6rbeginEv");

      function rbegin (this : access constant map) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:359
      pragma Import (CPP, rbegin, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE6rbeginEv");

      function rend (this : access map) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:368
      pragma Import (CPP, rend, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE4rendEv");

      function rend (this : access constant map) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:377
      pragma Import (CPP, rend, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE4rendEv");

      function empty (this : access constant map) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:423
      pragma Import (CPP, empty, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE5emptyEv");

      function size (this : access constant map) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:428
      pragma Import (CPP, size, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE4sizeEv");

      function max_size (this : access constant map) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:433
      pragma Import (CPP, max_size, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE8max_sizeEv");

      function operator_ob (this : access map; uu_k : System.Address) return System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:450
      pragma Import (CPP, operator_ob, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEEixERS6_");

      function c_at (this : access map; uu_k : System.Address) return System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:487
      pragma Import (CPP, c_at, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE2atERS6_");

      function c_at (this : access constant map; uu_k : System.Address) return System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:496
      pragma Import (CPP, c_at, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE2atERS6_");

      function insert (this : access map; uu_x : System.Address) return cpp_4_7_4_bits_stl_pair_h.pair;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:522
      pragma Import (CPP, insert, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE6insertERKS7_");

      function insert
        (this : access map;
         uu_position : iterator;
         uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:574
      pragma Import (CPP, insert, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE6insertESt17_Rb_tree_iteratorIS7_ERKS7_");

      procedure erase (this : access map; uu_position : iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:637
      pragma Import (CPP, erase, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE5eraseESt17_Rb_tree_iteratorIS7_E");

      function erase (this : access map; uu_x : System.Address) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:653
      pragma Import (CPP, erase, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE5eraseERS6_");

      procedure erase
        (this : access map;
         uu_first : iterator;
         uu_last : iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:689
      pragma Import (CPP, erase, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE5eraseESt17_Rb_tree_iteratorIS7_ESB_");

      procedure swap (this : access map; uu_x : access map);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:705
      pragma Import (CPP, swap, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE4swapERS9_");

      procedure clear (this : access map);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:715
      pragma Import (CPP, clear, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE5clearEv");

      function key_comp (this : access constant map) return key_compare;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:724
      pragma Import (CPP, key_comp, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE8key_compEv");

      function value_comp (this : access constant map) return value_compare;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:732
      pragma Import (CPP, value_comp, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE10value_compEv");

      function find (this : access map; uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:748
      pragma Import (CPP, find, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE4findERS6_");

      function find (this : access constant map; uu_x : System.Address) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:763
      pragma Import (CPP, find, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE4findERS6_");

      function count (this : access constant map; uu_x : System.Address) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:775
      pragma Import (CPP, count, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE5countERS6_");

      function lower_bound (this : access map; uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:790
      pragma Import (CPP, lower_bound, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE11lower_boundERS6_");

      function lower_bound (this : access constant map; uu_x : System.Address) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:805
      pragma Import (CPP, lower_bound, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE11lower_boundERS6_");

      function upper_bound (this : access map; uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:815
      pragma Import (CPP, upper_bound, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE11upper_boundERS6_");

      function upper_bound (this : access constant map; uu_x : System.Address) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:825
      pragma Import (CPP, upper_bound, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE11upper_boundERS6_");

      function equal_range (this : access map; uu_x : System.Address) return cpp_4_7_4_bits_stl_pair_h.pair;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:844
      pragma Import (CPP, equal_range, "_ZNSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE11equal_rangeERS6_");

      function equal_range (this : access constant map; uu_x : System.Address) return cpp_4_7_4_bits_stl_pair_h.pair;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_map.h:863
      pragma Import (CPP, equal_range, "_ZNKSt3mapISsSt6vectorISsSaISsEESt4lessISsESaISt4pairIKSsS2_EEE11equal_rangeERS6_");

   end;
   use map_Class_basic_string.basic_string_vector_Class_less.less_Class_allocator.allocator;



end cpp_4_7_4_bits_stl_map_h;
