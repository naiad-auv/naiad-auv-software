pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_bits_stl_deque_h;
with Interfaces.C.Extensions;
with System;

package cpp_4_7_4_bits_stl_queue_h is

   package queue_Class_Mat.Mat_Class_deque.deque is
      type queue is limited record
         c : aliased cpp_4_7_4_bits_stl_deque_h.Class_deque.deque;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_queue.h:125
      end record;
      pragma Import (CPP, queue);

      function New_queue (uu_c : access constant cpp_4_7_4_bits_stl_deque_h.Class_deque.deque) return queue;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_queue.h:133
      pragma CPP_Constructor (New_queue, "_ZNSt5queueIN2cv3MatESt5dequeIS1_SaIS1_EEEC1ERKS4_");

      function empty (this : access constant queue) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_queue.h:149
      pragma Import (CPP, empty, "_ZNKSt5queueIN2cv3MatESt5dequeIS1_SaIS1_EEE5emptyEv");

      function size (this : access constant queue) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_queue.h:154
      pragma Import (CPP, size, "_ZNKSt5queueIN2cv3MatESt5dequeIS1_SaIS1_EEE4sizeEv");

      function front (this : access queue) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_queue.h:162
      pragma Import (CPP, front, "_ZNSt5queueIN2cv3MatESt5dequeIS1_SaIS1_EEE5frontEv");

      function front (this : access constant queue) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_queue.h:173
      pragma Import (CPP, front, "_ZNKSt5queueIN2cv3MatESt5dequeIS1_SaIS1_EEE5frontEv");

      function back (this : access queue) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_queue.h:184
      pragma Import (CPP, back, "_ZNSt5queueIN2cv3MatESt5dequeIS1_SaIS1_EEE4backEv");

      function back (this : access constant queue) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_queue.h:195
      pragma Import (CPP, back, "_ZNKSt5queueIN2cv3MatESt5dequeIS1_SaIS1_EEE4backEv");

      procedure push (this : access queue; uu_x : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_queue.h:211
      pragma Import (CPP, push, "_ZNSt5queueIN2cv3MatESt5dequeIS1_SaIS1_EEE4pushERKS1_");

      procedure pop (this : access queue);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_queue.h:237
      pragma Import (CPP, pop, "_ZNSt5queueIN2cv3MatESt5dequeIS1_SaIS1_EEE3popEv");

   end;
   use queue_Class_Mat.Mat_Class_deque.deque;



end cpp_4_7_4_bits_stl_queue_h;
