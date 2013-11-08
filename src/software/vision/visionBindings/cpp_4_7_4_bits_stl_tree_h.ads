pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_bits_stl_function_h;
with Interfaces.C.Extensions;
limited with cpp_4_7_4_bits_basic_string_h;
with System;
with cpp_4_7_4_bits_stl_pair_h;

package cpp_4_7_4_bits_stl_tree_h is

   type u_Rb_tree_color is 
     (u_S_red,
      u_S_black);
   pragma Convention (C, u_Rb_tree_color);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:88

   package Class_u_Rb_tree_node_base is
      type u_Rb_tree_node_base is limited record
         u_M_color : aliased u_Rb_tree_color;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:95
         u_M_parent : u_Base_ptr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:96
         u_M_left : u_Base_ptr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:97
         u_M_right : u_Base_ptr;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:98
      end record;
      pragma Import (CPP, u_Rb_tree_node_base);

      --  skipped func _S_minimum

      --  skipped func _S_minimum

      --  skipped func _S_maximum

      --  skipped func _S_maximum
   end;
   use Class_u_Rb_tree_node_base;
   --  skipped func _Rb_tree_increment

   --  skipped func _Rb_tree_increment

   --  skipped func _Rb_tree_decrement

   --  skipped func _Rb_tree_decrement

   --  skipped func _Rb_tree_insert_and_rebalance

   --  skipped func _Rb_tree_rebalance_for_erase

   package u_Rb_tree_Class_basic_string.basic_string_pair_u_Select1st_Class_less.less_Class_allocator.allocator is
      type u_Rb_tree is limited record
         u_M_impl : aliased u_Rb_tree_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:471
      end record;
      pragma Import (CPP, u_Rb_tree);

      --  skipped func _M_get_Node_allocator

      --  skipped func _M_get_Node_allocator

      function get_allocator (this : access constant u_Rb_tree) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:363
      pragma Import (CPP, get_allocator, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE13get_allocatorEv");

      --  skipped func _M_get_node

      --  skipped func _M_put_node

      --  skipped func _M_create_node

      --  skipped func _M_destroy_node

      --  skipped func _M_clone_node

      --  skipped func _M_root

      --  skipped func _M_root

      --  skipped func _M_leftmost

      --  skipped func _M_leftmost

      --  skipped func _M_rightmost

      --  skipped func _M_rightmost

      --  skipped func _M_begin

      --  skipped func _M_begin

      --  skipped func _M_end

      --  skipped func _M_end

      --  skipped func _S_value

      --  skipped func _S_key

      --  skipped func _S_left

      --  skipped func _S_left

      --  skipped func _S_right

      --  skipped func _S_right

      --  skipped func _S_value

      --  skipped func _S_key

      --  skipped func _S_minimum

      --  skipped func _S_minimum

      --  skipped func _S_maximum

      --  skipped func _S_maximum

      --  skipped func _M_insert_

      --  skipped func _M_insert_lower

      --  skipped func _M_insert_equal_lower

      --  skipped func _M_copy

      --  skipped func _M_erase

      --  skipped func _M_lower_bound

      --  skipped func _M_lower_bound

      --  skipped func _M_upper_bound

      --  skipped func _M_upper_bound

      --  skipped func _Rb_tree

      --  skipped func _Rb_tree

      --  skipped func _Rb_tree

      function operator_as (this : access u_Rb_tree; uu_x : access constant u_Rb_tree) return access u_Rb_tree;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:944
      pragma Import (CPP, operator_as, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EEaSERKS8_");

      function key_comp (this : access constant u_Rb_tree) return cpp_4_7_4_bits_stl_function_h.Class_less.less;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:653
      pragma Import (CPP, key_comp, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE8key_compEv");

      function c_begin (this : access u_Rb_tree) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:657
      pragma Import (CPP, c_begin, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5beginEv");

      function c_begin (this : access constant u_Rb_tree) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:664
      pragma Import (CPP, c_begin, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5beginEv");

      function c_end (this : access u_Rb_tree) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:671
      pragma Import (CPP, c_end, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE3endEv");

      function c_end (this : access constant u_Rb_tree) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:675
      pragma Import (CPP, c_end, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE3endEv");

      function rbegin (this : access u_Rb_tree) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:682
      pragma Import (CPP, rbegin, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE6rbeginEv");

      function rbegin (this : access constant u_Rb_tree) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:686
      pragma Import (CPP, rbegin, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE6rbeginEv");

      function rend (this : access u_Rb_tree) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:690
      pragma Import (CPP, rend, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE4rendEv");

      function rend (this : access constant u_Rb_tree) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:694
      pragma Import (CPP, rend, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE4rendEv");

      function empty (this : access constant u_Rb_tree) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:698
      pragma Import (CPP, empty, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5emptyEv");

      function size (this : access constant u_Rb_tree) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:702
      pragma Import (CPP, size, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE4sizeEv");

      function max_size (this : access constant u_Rb_tree) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:706
      pragma Import (CPP, max_size, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE8max_sizeEv");

      procedure swap (this : access u_Rb_tree; uu_t : access u_Rb_tree);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1219
      pragma Import (CPP, swap, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE4swapERS8_");

      --  skipped func _M_insert_unique

      --  skipped func _M_insert_equal

      --  skipped func _M_insert_unique_

      --  skipped func _M_insert_equal_

      --  skipped func _M_erase_aux

      --  skipped func _M_erase_aux

      procedure erase (this : access u_Rb_tree; uu_position : iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:782
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5eraseESt17_Rb_tree_iteratorIS2_E");

      procedure erase (this : access u_Rb_tree; uu_position : const_iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:786
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5eraseESt23_Rb_tree_const_iteratorIS2_E");

      function erase (this : access u_Rb_tree; uu_x : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1519
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5eraseERS1_");

      procedure erase
        (this : access u_Rb_tree;
         uu_first : iterator;
         uu_last : iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:803
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5eraseESt17_Rb_tree_iteratorIS2_ESA_");

      procedure erase
        (this : access u_Rb_tree;
         uu_first : const_iterator;
         uu_last : const_iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:807
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5eraseESt23_Rb_tree_const_iteratorIS2_ESA_");

      procedure erase
        (this : access u_Rb_tree;
         uu_first : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string;
         uu_last : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1531
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5eraseEPS1_S9_");

      procedure clear (this : access u_Rb_tree);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:814
      pragma Import (CPP, clear, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5clearEv");

      function find (this : access u_Rb_tree; uu_k : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1542
      pragma Import (CPP, find, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE4findERS1_");

      function find (this : access constant u_Rb_tree; uu_k : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1555
      pragma Import (CPP, find, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE4findERS1_");

      function count (this : access constant u_Rb_tree; uu_k : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1567
      pragma Import (CPP, count, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE5countERS1_");

      function lower_bound (this : access u_Rb_tree; uu_k : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:834
      pragma Import (CPP, lower_bound, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE11lower_boundERS1_");

      function lower_bound (this : access constant u_Rb_tree; uu_k : System.Address) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:838
      pragma Import (CPP, lower_bound, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE11lower_boundERS1_");

      function upper_bound (this : access u_Rb_tree; uu_k : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:842
      pragma Import (CPP, upper_bound, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE11upper_boundERS1_");

      function upper_bound (this : access constant u_Rb_tree; uu_k : System.Address) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:846
      pragma Import (CPP, upper_bound, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE11upper_boundERS1_");

      function equal_range (this : access u_Rb_tree; uu_k : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return cpp_4_7_4_bits_stl_pair_h.pair;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1160
      pragma Import (CPP, equal_range, "_ZNSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE11equal_rangeERS1_");

      function equal_range (this : access constant u_Rb_tree; uu_k : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return cpp_4_7_4_bits_stl_pair_h.pair;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1191
      pragma Import (CPP, equal_range, "_ZNKSt8_Rb_treeISsSt4pairIKSsiESt10_Select1stIS2_ESt4lessISsESaIS2_EE11equal_rangeERS1_");



   end;
   use u_Rb_tree_Class_basic_string.basic_string_pair_u_Select1st_Class_less.less_Class_allocator.allocator;

   package u_Rb_tree_Class_basic_string.basic_string_pair_u_Select1st_Class_less.less_Class_allocator.allocator is
      type u_Rb_tree is limited record
         u_M_impl : aliased u_Rb_tree_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:471
      end record;
      pragma Import (CPP, u_Rb_tree);

      --  skipped func _M_get_Node_allocator

      --  skipped func _M_get_Node_allocator

      function get_allocator (this : access constant u_Rb_tree) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:363
      pragma Import (CPP, get_allocator, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE13get_allocatorEv");

      --  skipped func _M_get_node

      --  skipped func _M_put_node

      --  skipped func _M_create_node

      --  skipped func _M_destroy_node

      --  skipped func _M_clone_node

      --  skipped func _M_root

      --  skipped func _M_root

      --  skipped func _M_leftmost

      --  skipped func _M_leftmost

      --  skipped func _M_rightmost

      --  skipped func _M_rightmost

      --  skipped func _M_begin

      --  skipped func _M_begin

      --  skipped func _M_end

      --  skipped func _M_end

      --  skipped func _S_value

      --  skipped func _S_key

      --  skipped func _S_left

      --  skipped func _S_left

      --  skipped func _S_right

      --  skipped func _S_right

      --  skipped func _S_value

      --  skipped func _S_key

      --  skipped func _S_minimum

      --  skipped func _S_minimum

      --  skipped func _S_maximum

      --  skipped func _S_maximum

      --  skipped func _M_insert_

      --  skipped func _M_insert_lower

      --  skipped func _M_insert_equal_lower

      --  skipped func _M_copy

      --  skipped func _M_erase

      --  skipped func _M_lower_bound

      --  skipped func _M_lower_bound

      --  skipped func _M_upper_bound

      --  skipped func _M_upper_bound

      --  skipped func _Rb_tree

      --  skipped func _Rb_tree

      --  skipped func _Rb_tree

      function operator_as (this : access u_Rb_tree; uu_x : access constant u_Rb_tree) return access u_Rb_tree;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:944
      pragma Import (CPP, operator_as, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EEaSERKSB_");

      function key_comp (this : access constant u_Rb_tree) return cpp_4_7_4_bits_stl_function_h.Class_less.less;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:653
      pragma Import (CPP, key_comp, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE8key_compEv");

      function c_begin (this : access u_Rb_tree) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:657
      pragma Import (CPP, c_begin, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5beginEv");

      function c_begin (this : access constant u_Rb_tree) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:664
      pragma Import (CPP, c_begin, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5beginEv");

      function c_end (this : access u_Rb_tree) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:671
      pragma Import (CPP, c_end, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE3endEv");

      function c_end (this : access constant u_Rb_tree) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:675
      pragma Import (CPP, c_end, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE3endEv");

      function rbegin (this : access u_Rb_tree) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:682
      pragma Import (CPP, rbegin, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE6rbeginEv");

      function rbegin (this : access constant u_Rb_tree) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:686
      pragma Import (CPP, rbegin, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE6rbeginEv");

      function rend (this : access u_Rb_tree) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:690
      pragma Import (CPP, rend, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE4rendEv");

      function rend (this : access constant u_Rb_tree) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:694
      pragma Import (CPP, rend, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE4rendEv");

      function empty (this : access constant u_Rb_tree) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:698
      pragma Import (CPP, empty, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5emptyEv");

      function size (this : access constant u_Rb_tree) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:702
      pragma Import (CPP, size, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE4sizeEv");

      function max_size (this : access constant u_Rb_tree) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:706
      pragma Import (CPP, max_size, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE8max_sizeEv");

      procedure swap (this : access u_Rb_tree; uu_t : access u_Rb_tree);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1219
      pragma Import (CPP, swap, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE4swapERSB_");

      --  skipped func _M_insert_unique

      --  skipped func _M_insert_equal

      --  skipped func _M_insert_unique_

      --  skipped func _M_insert_equal_

      --  skipped func _M_erase_aux

      --  skipped func _M_erase_aux

      procedure erase (this : access u_Rb_tree; uu_position : iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:782
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5eraseESt17_Rb_tree_iteratorIS5_E");

      procedure erase (this : access u_Rb_tree; uu_position : const_iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:786
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5eraseESt23_Rb_tree_const_iteratorIS5_E");

      function erase (this : access u_Rb_tree; uu_x : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1519
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5eraseERS1_");

      procedure erase
        (this : access u_Rb_tree;
         uu_first : iterator;
         uu_last : iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:803
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5eraseESt17_Rb_tree_iteratorIS5_ESD_");

      procedure erase
        (this : access u_Rb_tree;
         uu_first : const_iterator;
         uu_last : const_iterator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:807
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5eraseESt23_Rb_tree_const_iteratorIS5_ESD_");

      procedure erase
        (this : access u_Rb_tree;
         uu_first : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string;
         uu_last : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1531
      pragma Import (CPP, erase, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5eraseEPS1_SC_");

      procedure clear (this : access u_Rb_tree);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:814
      pragma Import (CPP, clear, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5clearEv");

      function find (this : access u_Rb_tree; uu_k : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1542
      pragma Import (CPP, find, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE4findERS1_");

      function find (this : access constant u_Rb_tree; uu_k : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1555
      pragma Import (CPP, find, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE4findERS1_");

      function count (this : access constant u_Rb_tree; uu_k : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1567
      pragma Import (CPP, count, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE5countERS1_");

      function lower_bound (this : access u_Rb_tree; uu_k : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:834
      pragma Import (CPP, lower_bound, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11lower_boundERS1_");

      function lower_bound (this : access constant u_Rb_tree; uu_k : System.Address) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:838
      pragma Import (CPP, lower_bound, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11lower_boundERS1_");

      function upper_bound (this : access u_Rb_tree; uu_k : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:842
      pragma Import (CPP, upper_bound, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11upper_boundERS1_");

      function upper_bound (this : access constant u_Rb_tree; uu_k : System.Address) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:846
      pragma Import (CPP, upper_bound, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11upper_boundERS1_");

      function equal_range (this : access u_Rb_tree; uu_k : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return cpp_4_7_4_bits_stl_pair_h.pair;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1160
      pragma Import (CPP, equal_range, "_ZNSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11equal_rangeERS1_");

      function equal_range (this : access constant u_Rb_tree; uu_k : access constant cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string) return cpp_4_7_4_bits_stl_pair_h.pair;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_tree.h:1191
      pragma Import (CPP, equal_range, "_ZNKSt8_Rb_treeISsSt4pairIKSsSt6vectorISsSaISsEEESt10_Select1stIS5_ESt4lessISsESaIS5_EE11equal_rangeERS1_");



   end;
   use u_Rb_tree_Class_basic_string.basic_string_pair_u_Select1st_Class_less.less_Class_allocator.allocator;



   --  skipped func _Rb_tree_black_count

end cpp_4_7_4_bits_stl_tree_h;
