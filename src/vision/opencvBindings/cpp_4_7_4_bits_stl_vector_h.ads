pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package cpp_4_7_4_bits_stl_vector_h is

   package u_Vector_base_Class_Mat.Mat_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv3MatESaIS1_EEaSERKS3_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv3MatESaIS1_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_Mat.Mat_Class_allocator.allocator;

   package u_Vector_base_Class_QuadEdge.QuadEdge_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv8Subdiv2D8QuadEdgeESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv8Subdiv2D8QuadEdgeESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_QuadEdge.QuadEdge_Class_allocator.allocator;

   package u_Vector_base_Class_Vertex.Vertex_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv8Subdiv2D6VertexESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv8Subdiv2D6VertexESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_Vertex.Vertex_Class_allocator.allocator;

   package u_Vector_base_accessunsigned_char_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIPhSaIS0_EEaSERKS2_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIPhSaIS0_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_accessunsigned_char_Class_allocator.allocator;

   package u_Vector_base_Class_Node.Node_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv6KDTree4NodeESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv6KDTree4NodeESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_Node.Node_Class_allocator.allocator;

   package u_Vector_base_char_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIcSaIcEEaSERKS1_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIcSaIcEE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_char_Class_allocator.allocator;

   package u_Vector_base_unsigned_long_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseImSaImEEaSERKS1_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseImSaImEE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_unsigned_long_Class_allocator.allocator;

   package u_Vector_base_unsigned_char_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIhSaIhEEaSERKS1_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIhSaIhEE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_unsigned_char_Class_allocator.allocator;

   package u_Vector_base_int_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIiSaIiEEaSERKS1_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIiSaIiEE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_int_Class_allocator.allocator;



end cpp_4_7_4_bits_stl_vector_h;
