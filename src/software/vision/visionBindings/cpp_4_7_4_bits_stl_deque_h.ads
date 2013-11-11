pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Extensions;

package cpp_4_7_4_bits_stl_deque_h is

   package u_Deque_base_Class_Mat.Mat_Class_allocator.allocator is
      type u_Deque_base is limited record
         u_M_impl : aliased u_Deque_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:557
      end record;
      pragma Import (CPP, u_Deque_base);

      function operator_as (this : access u_Deque_base; arg2 : access constant u_Deque_base) return access u_Deque_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:440
      pragma Import (CPP, operator_as, "_ZNSt11_Deque_baseIN2cv3MatESaIS1_EEaSERKS3_");

      function get_allocator (this : access constant u_Deque_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:446
      pragma Import (CPP, get_allocator, "_ZNKSt11_Deque_baseIN2cv3MatESaIS1_EE13get_allocatorEv");

      --  skipped func _Deque_base

      --  skipped func _Deque_base

      --  skipped func _Deque_base

      --  skipped func _Deque_base

      --  skipped func _Deque_base

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_map_allocator

      --  skipped func _M_allocate_node

      --  skipped func _M_deallocate_node

      --  skipped func _M_allocate_map

      --  skipped func _M_deallocate_map

      --  skipped func _M_initialize_map

      --  skipped func _M_create_nodes

      --  skipped func _M_destroy_nodes

   end;
   use u_Deque_base_Class_Mat.Mat_Class_allocator.allocator;



   package deque_Class_Mat.Mat_Class_allocator.allocator is
      type deque is limited record
         parent : aliased u_Deque_base;
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:759
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:760
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:761
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:762
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:763
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:764
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:765
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:766
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:772
      end record;
      pragma Import (CPP, deque);

      --  skipped func _S_buffer_size

      function New_deque return deque;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:780
      pragma CPP_Constructor (New_deque, "_ZNSt5dequeIN2cv3MatESaIS1_EEC1Ev");

      function New_deque (uu_a : System.Address) return deque;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:788
      pragma CPP_Constructor (New_deque, "_ZNSt5dequeIN2cv3MatESaIS1_EEC1ERKS2_");

      function New_deque
        (uu_n : size_type;
         uu_value : System.Address;
         uu_a : System.Address) return deque;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:826
      pragma CPP_Constructor (New_deque, "_ZNSt5dequeIN2cv3MatESaIS1_EEC1EmRKS1_RKS2_");

      procedure Delete_deque (this : access deque);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:906
      pragma Import (CPP, Delete_deque, "_ZNSt5dequeIN2cv3MatESaIS1_EED1Ev");

      function operator_as (this : access deque; uu_x : System.Address) return access deque;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/deque.tcc:95
      pragma Import (CPP, operator_as, "_ZNSt5dequeIN2cv3MatESaIS1_EEaSERKS3_");

      procedure assign
        (this : access deque;
         uu_n : size_type;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:967
      pragma Import (CPP, assign, "_ZNSt5dequeIN2cv3MatESaIS1_EE6assignEmRKS1_");

      function get_allocator (this : access constant deque) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1009
      pragma Import (CPP, get_allocator, "_ZNKSt5dequeIN2cv3MatESaIS1_EE13get_allocatorEv");

      function c_begin (this : access deque) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1018
      pragma Import (CPP, c_begin, "_ZNSt5dequeIN2cv3MatESaIS1_EE5beginEv");

      function c_begin (this : access constant deque) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1026
      pragma Import (CPP, c_begin, "_ZNKSt5dequeIN2cv3MatESaIS1_EE5beginEv");

      function c_end (this : access deque) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1035
      pragma Import (CPP, c_end, "_ZNSt5dequeIN2cv3MatESaIS1_EE3endEv");

      function c_end (this : access constant deque) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1044
      pragma Import (CPP, c_end, "_ZNKSt5dequeIN2cv3MatESaIS1_EE3endEv");

      function rbegin (this : access deque) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1053
      pragma Import (CPP, rbegin, "_ZNSt5dequeIN2cv3MatESaIS1_EE6rbeginEv");

      function rbegin (this : access constant deque) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1062
      pragma Import (CPP, rbegin, "_ZNKSt5dequeIN2cv3MatESaIS1_EE6rbeginEv");

      function rend (this : access deque) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1071
      pragma Import (CPP, rend, "_ZNSt5dequeIN2cv3MatESaIS1_EE4rendEv");

      function rend (this : access constant deque) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1080
      pragma Import (CPP, rend, "_ZNKSt5dequeIN2cv3MatESaIS1_EE4rendEv");

      function size (this : access constant deque) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1123
      pragma Import (CPP, size, "_ZNKSt5dequeIN2cv3MatESaIS1_EE4sizeEv");

      function max_size (this : access constant deque) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1128
      pragma Import (CPP, max_size, "_ZNKSt5dequeIN2cv3MatESaIS1_EE8max_sizeEv");

      procedure resize
        (this : access deque;
         uu_new_size : size_type;
         uu_x : value_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1186
      pragma Import (CPP, resize, "_ZNSt5dequeIN2cv3MatESaIS1_EE6resizeEmS1_");

      function empty (this : access constant deque) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1209
      pragma Import (CPP, empty, "_ZNKSt5dequeIN2cv3MatESaIS1_EE5emptyEv");

      function operator_ob (this : access deque; uu_n : size_type) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1225
      pragma Import (CPP, operator_ob, "_ZNSt5dequeIN2cv3MatESaIS1_EEixEm");

      function operator_ob (this : access constant deque; uu_n : size_type) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1240
      pragma Import (CPP, operator_ob, "_ZNKSt5dequeIN2cv3MatESaIS1_EEixEm");

      --  skipped func _M_range_check

      function c_at (this : access deque; uu_n : size_type) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1265
      pragma Import (CPP, c_at, "_ZNSt5dequeIN2cv3MatESaIS1_EE2atEm");

      function c_at (this : access constant deque; uu_n : size_type) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1283
      pragma Import (CPP, c_at, "_ZNKSt5dequeIN2cv3MatESaIS1_EE2atEm");

      function front (this : access deque) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1294
      pragma Import (CPP, front, "_ZNSt5dequeIN2cv3MatESaIS1_EE5frontEv");

      function front (this : access constant deque) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1302
      pragma Import (CPP, front, "_ZNKSt5dequeIN2cv3MatESaIS1_EE5frontEv");

      function back (this : access deque) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1310
      pragma Import (CPP, back, "_ZNSt5dequeIN2cv3MatESaIS1_EE4backEv");

      function back (this : access constant deque) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1322
      pragma Import (CPP, back, "_ZNKSt5dequeIN2cv3MatESaIS1_EE4backEv");

      procedure push_front (this : access deque; uu_x : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1340
      pragma Import (CPP, push_front, "_ZNSt5dequeIN2cv3MatESaIS1_EE10push_frontERKS1_");

      procedure push_back (this : access deque; uu_x : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1371
      pragma Import (CPP, push_back, "_ZNSt5dequeIN2cv3MatESaIS1_EE9push_backERKS1_");

      procedure pop_front (this : access deque);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1402
      pragma Import (CPP, pop_front, "_ZNSt5dequeIN2cv3MatESaIS1_EE9pop_frontEv");

      procedure pop_back (this : access deque);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1423
      pragma Import (CPP, pop_back, "_ZNSt5dequeIN2cv3MatESaIS1_EE8pop_backEv");

      function insert
        (this : access deque;
         uu_position : iterator;
         uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/deque.tcc:151
      pragma Import (CPP, insert, "_ZNSt5dequeIN2cv3MatESaIS1_EE6insertESt15_Deque_iteratorIS1_RS1_PS1_ERKS1_");

      procedure insert
        (this : access deque;
         uu_position : iterator;
         uu_n : size_type;
         uu_x : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1500
      pragma Import (CPP, insert, "_ZNSt5dequeIN2cv3MatESaIS1_EE6insertESt15_Deque_iteratorIS1_RS1_PS1_EmRKS1_");

      function erase (this : access deque; uu_position : iterator) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/deque.tcc:196
      pragma Import (CPP, erase, "_ZNSt5dequeIN2cv3MatESaIS1_EE5eraseESt15_Deque_iteratorIS1_RS1_PS1_E");

      function erase
        (this : access deque;
         uu_first : iterator;
         uu_last : iterator) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/deque.tcc:219
      pragma Import (CPP, erase, "_ZNSt5dequeIN2cv3MatESaIS1_EE5eraseESt15_Deque_iteratorIS1_RS1_PS1_ES7_");

      procedure swap (this : access deque; uu_x : access deque);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1568
      pragma Import (CPP, swap, "_ZNSt5dequeIN2cv3MatESaIS1_EE4swapERS3_");

      procedure clear (this : access deque);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_deque.h:1588
      pragma Import (CPP, clear, "_ZNSt5dequeIN2cv3MatESaIS1_EE5clearEv");

      --  skipped func _M_fill_initialize

      --  skipped func _M_fill_assign

      --  skipped func _M_push_back_aux

      --  skipped func _M_push_front_aux

      --  skipped func _M_pop_back_aux

      --  skipped func _M_pop_front_aux

      --  skipped func _M_fill_insert

      --  skipped func _M_insert_aux

      --  skipped func _M_insert_aux

      --  skipped func _M_destroy_data_aux

      --  skipped func _M_destroy_data

      --  skipped func _M_erase_at_begin

      --  skipped func _M_erase_at_end

      --  skipped func _M_reserve_elements_at_front

      --  skipped func _M_reserve_elements_at_back

      --  skipped func _M_new_elements_at_front

      --  skipped func _M_new_elements_at_back

      --  skipped func _M_reserve_map_at_back

      --  skipped func _M_reserve_map_at_front

      --  skipped func _M_reallocate_map

   end;
   use deque_Class_Mat.Mat_Class_allocator.allocator;



end cpp_4_7_4_bits_stl_deque_h;
