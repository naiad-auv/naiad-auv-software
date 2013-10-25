pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with opencv2_core_core_hpp;
limited with opencv2_contrib_contrib_hpp;
limited with opencv2_objdetect_objdetect_hpp;
limited with cpp_4_7_4_bits_stl_vector_h;
limited with opencv2_features2d_features2d_hpp;
limited with opencv2_imgproc_imgproc_hpp;

package cpp_4_7_4_ext_new_allocator_h is

   package new_allocator_Vec is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIiLi4EEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIiLi4EEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv3VecIiLi4EEEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv3VecIiLi4EEEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIiLi4EEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIiLi4EEEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv3VecIiLi4EEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIiLi4EEEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIiLi4EEEE7destroyEPS3_");

   end;
   use new_allocator_Vec;

   package new_allocator_Class_Point_u.Point_u is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IfEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IfEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv6Point_IfEEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv6Point_IfEEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IfEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IfEEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv6Point_IfEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_core_core_hpp.Class_Point_u.Point_u);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IfEEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IfEEE7destroyEPS3_");

   end;
   use new_allocator_Class_Point_u.Point_u;

   package new_allocator_Class_Vec.Vec is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi2EEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi2EEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv3VecIfLi2EEEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv3VecIfLi2EEEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi2EEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi2EEEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv3VecIfLi2EEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_core_core_hpp.Class_Vec.Vec);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi2EEEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi2EEEE7destroyEPS3_");

   end;
   use new_allocator_Class_Vec.Vec;

   package new_allocator_Class_Vec.Vec is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi3EEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi3EEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv3VecIfLi3EEEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv3VecIfLi3EEEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi3EEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi3EEEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv3VecIfLi3EEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_core_core_hpp.Class_Vec.Vec);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi3EEEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv3VecIfLi3EEEE7destroyEPS3_");

   end;
   use new_allocator_Class_Vec.Vec;

   package new_allocator_Class_Scalar_u.Scalar_u is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv7Scalar_IdEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv7Scalar_IdEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv7Scalar_IdEEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv7Scalar_IdEEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv7Scalar_IdEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv7Scalar_IdEEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv7Scalar_IdEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_core_core_hpp.Class_Scalar_u.Scalar_u);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv7Scalar_IdEEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv7Scalar_IdEEE7destroyEPS3_");

   end;
   use new_allocator_Class_Scalar_u.Scalar_u;

   package new_allocator_Class_Node.Node is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv6Octree4NodeEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv6Octree4NodeEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv6Octree4NodeEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv6Octree4NodeEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv6Octree4NodeEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv6Octree4NodeEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv6Octree4NodeEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_contrib_contrib_hpp.Class_Node.Node);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv6Octree4NodeEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv6Octree4NodeEE7destroyEPS3_");

   end;
   use new_allocator_Class_Node.Node;

   package new_allocator_Class_Point3_u.Point3_u is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv7Point3_IfEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv7Point3_IfEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv7Point3_IfEEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv7Point3_IfEEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv7Point3_IfEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv7Point3_IfEEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv7Point3_IfEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_core_core_hpp.Class_Point3_u.Point3_u);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv7Point3_IfEEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv7Point3_IfEEE7destroyEPS3_");

   end;
   use new_allocator_Class_Point3_u.Point3_u;

   package new_allocator_accessClass_CvFuzzyRule.CvFuzzyRule is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIP11CvFuzzyRuleEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIP11CvFuzzyRuleED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIP11CvFuzzyRuleE7addressERS2_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIP11CvFuzzyRuleE7addressERKS2_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIP11CvFuzzyRuleE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIP11CvFuzzyRuleE10deallocateEPS2_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIP11CvFuzzyRuleE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIP11CvFuzzyRuleE9constructEPS2_RKS2_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIP11CvFuzzyRuleE7destroyEPS2_");

   end;
   use new_allocator_accessClass_CvFuzzyRule.CvFuzzyRule;

   package new_allocator_Class_CvFuzzyCurve.CvFuzzyCurve is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyCurveEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyCurveED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorI12CvFuzzyCurveE7addressERS1_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorI12CvFuzzyCurveE7addressERKS1_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyCurveE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyCurveE10deallocateEPS1_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorI12CvFuzzyCurveE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_contrib_contrib_hpp.Class_CvFuzzyCurve.CvFuzzyCurve);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyCurveE9constructEPS1_RKS1_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyCurveE7destroyEPS1_");

   end;
   use new_allocator_Class_CvFuzzyCurve.CvFuzzyCurve;

   package new_allocator_Class_CvFuzzyPoint.CvFuzzyPoint is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyPointEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyPointED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorI12CvFuzzyPointE7addressERS1_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorI12CvFuzzyPointE7addressERKS1_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyPointE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyPointE10deallocateEPS1_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorI12CvFuzzyPointE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_contrib_contrib_hpp.Class_CvFuzzyPoint.CvFuzzyPoint);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyPointE9constructEPS1_RKS1_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorI12CvFuzzyPointE7destroyEPS1_");

   end;
   use new_allocator_Class_CvFuzzyPoint.CvFuzzyPoint;

   package new_allocator_u_Rb_tree_node is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsiEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsiEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsiEEE7addressERS5_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsiEEE7addressERKS5_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsiEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsiEEE10deallocateEPS5_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsiEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsiEEE9constructEPS5_RKS5_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsiEEE7destroyEPS5_");

   end;
   use new_allocator_u_Rb_tree_node;

   package new_allocator_pair is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsiEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsiEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt4pairIKSsiEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt4pairIKSsiEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsiEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsiEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorISt4pairIKSsiEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsiEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsiEE7destroyEPS3_");

   end;
   use new_allocator_pair;

   package new_allocator_Class_Point_u.Point_u is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IiEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IiEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv6Point_IiEEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv6Point_IiEEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IiEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IiEEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv6Point_IiEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_core_core_hpp.Class_Point_u.Point_u);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IiEEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv6Point_IiEEE7destroyEPS3_");

   end;
   use new_allocator_Class_Point_u.Point_u;

   package new_allocator_DTreeNode is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data9DTreeNodeEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data9DTreeNodeEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data9DTreeNodeEE7addressERS4_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data9DTreeNodeEE7addressERKS4_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data9DTreeNodeEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data9DTreeNodeEE10deallocateEPS4_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data9DTreeNodeEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_objdetect_objdetect_hpp.DTreeNode);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data9DTreeNodeEE9constructEPS4_RKS4_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data9DTreeNodeEE7destroyEPS4_");

   end;
   use new_allocator_DTreeNode;

   package new_allocator_DTree is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5DTreeEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5DTreeEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5DTreeEE7addressERS4_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5DTreeEE7addressERKS4_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5DTreeEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5DTreeEE10deallocateEPS4_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5DTreeEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_objdetect_objdetect_hpp.DTree);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5DTreeEE9constructEPS4_RKS4_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5DTreeEE7destroyEPS4_");

   end;
   use new_allocator_DTree;

   package new_allocator_Stage is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5StageEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5StageEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5StageEE7addressERS4_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5StageEE7addressERKS4_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5StageEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5StageEE10deallocateEPS4_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5StageEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_objdetect_objdetect_hpp.Stage);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5StageEE9constructEPS4_RKS4_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv17CascadeClassifier4Data5StageEE7destroyEPS4_");

   end;
   use new_allocator_Stage;

   package new_allocator_Class_vector.vector is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorISt6vectorIcSaIcEEE7destroyEPS3_");

   end;
   use new_allocator_Class_vector.vector;

   package new_allocator_Class_vector.vector is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv8KeyPointESaIS3_EEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv8KeyPointESaIS3_EEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIN2cv8KeyPointESaIS3_EEE7addressERS5_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIN2cv8KeyPointESaIS3_EEE7addressERKS5_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv8KeyPointESaIS3_EEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv8KeyPointESaIS3_EEE10deallocateEPS5_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIN2cv8KeyPointESaIS3_EEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv8KeyPointESaIS3_EEE9constructEPS5_RKS5_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv8KeyPointESaIS3_EEE7destroyEPS5_");

   end;
   use new_allocator_Class_vector.vector;

   package new_allocator_Class_DMatch.DMatch is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv6DMatchEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv6DMatchEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv6DMatchEE7addressERS2_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv6DMatchEE7addressERKS2_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv6DMatchEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv6DMatchEE10deallocateEPS2_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv6DMatchEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_features2d_features2d_hpp.Class_DMatch.DMatch);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv6DMatchEE9constructEPS2_RKS2_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv6DMatchEE7destroyEPS2_");

   end;
   use new_allocator_Class_DMatch.DMatch;

   package new_allocator_Class_vector.vector is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv6DMatchESaIS3_EEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv6DMatchESaIS3_EEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIN2cv6DMatchESaIS3_EEE7addressERS5_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIN2cv6DMatchESaIS3_EEE7addressERKS5_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv6DMatchESaIS3_EEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv6DMatchESaIS3_EEE10deallocateEPS5_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIN2cv6DMatchESaIS3_EEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv6DMatchESaIS3_EEE9constructEPS5_RKS5_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorISt6vectorIN2cv6DMatchESaIS3_EEE7destroyEPS5_");

   end;
   use new_allocator_Class_vector.vector;

   package new_allocator_Class_KeyPoint.KeyPoint is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv8KeyPointEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv8KeyPointEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv8KeyPointEE7addressERS2_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv8KeyPointEE7addressERKS2_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv8KeyPointEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv8KeyPointEE10deallocateEPS2_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv8KeyPointEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_features2d_features2d_hpp.Class_KeyPoint.KeyPoint);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv8KeyPointEE9constructEPS2_RKS2_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv8KeyPointEE7destroyEPS2_");

   end;
   use new_allocator_Class_KeyPoint.KeyPoint;

   package new_allocator_Class_RandomizedTree.RandomizedTree is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv14RandomizedTreeEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv14RandomizedTreeEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv14RandomizedTreeEE7addressERS2_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv14RandomizedTreeEE7addressERKS2_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv14RandomizedTreeEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv14RandomizedTreeEE10deallocateEPS2_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv14RandomizedTreeEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_features2d_features2d_hpp.Class_RandomizedTree.RandomizedTree);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv14RandomizedTreeEE9constructEPS2_RKS2_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv14RandomizedTreeEE7destroyEPS2_");

   end;
   use new_allocator_Class_RandomizedTree.RandomizedTree;

   package new_allocator_Class_RTreeNode.RTreeNode is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv9RTreeNodeEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv9RTreeNodeEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv9RTreeNodeEE7addressERS2_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv9RTreeNodeEE7addressERKS2_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv9RTreeNodeEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv9RTreeNodeEE10deallocateEPS2_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv9RTreeNodeEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_features2d_features2d_hpp.Class_RTreeNode.RTreeNode);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv9RTreeNodeEE9constructEPS2_RKS2_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv9RTreeNodeEE7destroyEPS2_");

   end;
   use new_allocator_Class_RTreeNode.RTreeNode;

   package new_allocator_float is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIfEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIfED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIfE7addressERf");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIfE7addressERKf");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIfE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIfE10deallocateEPfm");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIfE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access float);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIfE9constructEPfRKf");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIfE7destroyEPf");

   end;
   use new_allocator_float;

   package new_allocator_Class_Feature.Feature is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv14FernClassifier7FeatureEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv14FernClassifier7FeatureEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv14FernClassifier7FeatureEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv14FernClassifier7FeatureEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv14FernClassifier7FeatureEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv14FernClassifier7FeatureEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv14FernClassifier7FeatureEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_features2d_features2d_hpp.Class_Feature.Feature);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv14FernClassifier7FeatureEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv14FernClassifier7FeatureEE7destroyEPS3_");

   end;
   use new_allocator_Class_Feature.Feature;

   package new_allocator_address is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIPN2cv3ORB11OrbPatternsEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIPN2cv3ORB11OrbPatternsEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIPN2cv3ORB11OrbPatternsEE7addressERS4_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIPN2cv3ORB11OrbPatternsEE7addressERKS4_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIPN2cv3ORB11OrbPatternsEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIPN2cv3ORB11OrbPatternsEE10deallocateEPS4_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIPN2cv3ORB11OrbPatternsEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIPN2cv3ORB11OrbPatternsEE9constructEPS4_RKS4_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIPN2cv3ORB11OrbPatternsEE7destroyEPS4_");

   end;
   use new_allocator_address;

   package new_allocator_Class_vector.vector is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorISt6vectorIiSaIiEEE7destroyEPS3_");

   end;
   use new_allocator_Class_vector.vector;

   package new_allocator_Class_QuadEdge.QuadEdge is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D8QuadEdgeEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D8QuadEdgeEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv8Subdiv2D8QuadEdgeEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv8Subdiv2D8QuadEdgeEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D8QuadEdgeEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D8QuadEdgeEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv8Subdiv2D8QuadEdgeEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_imgproc_imgproc_hpp.Class_QuadEdge.QuadEdge);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D8QuadEdgeEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D8QuadEdgeEE7destroyEPS3_");

   end;
   use new_allocator_Class_QuadEdge.QuadEdge;

   package new_allocator_Class_Vertex.Vertex is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D6VertexEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D6VertexEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv8Subdiv2D6VertexEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv8Subdiv2D6VertexEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D6VertexEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D6VertexEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv8Subdiv2D6VertexEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_imgproc_imgproc_hpp.Class_Vertex.Vertex);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D6VertexEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv8Subdiv2D6VertexEE7destroyEPS3_");

   end;
   use new_allocator_Class_Vertex.Vertex;

   package new_allocator_accessunsigned_char is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIPhEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIPhED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIPhE7addressERS1_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIPhE7addressERKS1_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIPhE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIPhE10deallocateEPS1_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIPhE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIPhE9constructEPS1_RKS1_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIPhE7destroyEPS1_");

   end;
   use new_allocator_accessunsigned_char;

   package new_allocator_Class_Mat.Mat is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv3MatEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv3MatEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv3MatEE7addressERS2_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv3MatEE7addressERKS2_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv3MatEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv3MatEE10deallocateEPS2_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv3MatEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv3MatEE9constructEPS2_RKS2_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv3MatEE7destroyEPS2_");

   end;
   use new_allocator_Class_Mat.Mat;

   package new_allocator_u_Rb_tree_node is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsSt6vectorISsSaISsEEEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsSt6vectorISsSaISsEEEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsSt6vectorISsSaISsEEEEE7addressERS8_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsSt6vectorISsSaISsEEEEE7addressERKS8_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsSt6vectorISsSaISsEEEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsSt6vectorISsSaISsEEEEE10deallocateEPS8_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsSt6vectorISsSaISsEEEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsSt6vectorISsSaISsEEEEE9constructEPS8_RKS8_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorISt13_Rb_tree_nodeISt4pairIKSsSt6vectorISsSaISsEEEEE7destroyEPS8_");

   end;
   use new_allocator_u_Rb_tree_node;

   package new_allocator_pair is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsSt6vectorISsSaISsEEEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsSt6vectorISsSaISsEEEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt4pairIKSsSt6vectorISsSaISsEEEE7addressERS6_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorISt4pairIKSsSt6vectorISsSaISsEEEE7addressERKS6_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsSt6vectorISsSaISsEEEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsSt6vectorISsSaISsEEEE10deallocateEPS6_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorISt4pairIKSsSt6vectorISsSaISsEEEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsSt6vectorISsSaISsEEEE9constructEPS6_RKS6_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorISt4pairIKSsSt6vectorISsSaISsEEEE7destroyEPS6_");

   end;
   use new_allocator_pair;

   package new_allocator_int is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIiEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIiED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIiE7addressERi");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIiE7addressERKi");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access int);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIiE9constructEPiRKi");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIiE7destroyEPi");

   end;
   use new_allocator_int;

   package new_allocator_Class_Node.Node is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv6KDTree4NodeEEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIN2cv6KDTree4NodeEED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv6KDTree4NodeEE7addressERS3_");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIN2cv6KDTree4NodeEE7addressERKS3_");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIN2cv6KDTree4NodeEE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIN2cv6KDTree4NodeEE10deallocateEPS3_m");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIN2cv6KDTree4NodeEE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access constant opencv2_core_core_hpp.Class_Node.Node);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIN2cv6KDTree4NodeEE9constructEPS3_RKS3_");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIN2cv6KDTree4NodeEE7destroyEPS3_");

   end;
   use new_allocator_Class_Node.Node;

   package new_allocator_unsigned_long is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorImEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorImED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorImE7addressERm");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorImE7addressERKm");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorImE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorImE10deallocateEPmm");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorImE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access unsigned_long);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorImE9constructEPmRKm");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorImE7destroyEPm");

   end;
   use new_allocator_unsigned_long;

   package new_allocator_unsigned_char is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIhEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIhED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIhE7addressERh");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIhE7addressERKh");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIhE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIhE10deallocateEPhm");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIhE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access unsigned_char);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIhE9constructEPhRKh");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIhE7destroyEPh");

   end;
   use new_allocator_unsigned_char;

   package new_allocator_wchar_t is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIwEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIwED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIwE7addressERw");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIwE7addressERKw");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIwE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIwE10deallocateEPwm");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIwE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access wchar_t);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIwE9constructEPwRKw");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIwE7destroyEPw");

   end;
   use new_allocator_wchar_t;

   package new_allocator_char is
      type new_allocator is limited record
         null;
      end record;
      pragma Import (CPP, new_allocator);

      function New_new_allocator return new_allocator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:69
      pragma CPP_Constructor (New_new_allocator, "_ZN9__gnu_cxx13new_allocatorIcEC1Ev");

      procedure Delete_new_allocator (this : access new_allocator);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:76
      pragma Import (CPP, Delete_new_allocator, "_ZN9__gnu_cxx13new_allocatorIcED1Ev");

      function address (this : access constant new_allocator; uu_x : reference) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:79
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIcE7addressERc");

      function address (this : access constant new_allocator; uu_x : const_reference) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:83
      pragma Import (CPP, address, "_ZNK9__gnu_cxx13new_allocatorIcE7addressERKc");

      function allocate
        (this : access new_allocator;
         uu_n : size_type;
         arg3 : System.Address) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:89
      pragma Import (CPP, allocate, "_ZN9__gnu_cxx13new_allocatorIcE8allocateEmPKv");

      procedure deallocate
        (this : access new_allocator;
         uu_p : pointer;
         arg3 : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:99
      pragma Import (CPP, deallocate, "_ZN9__gnu_cxx13new_allocatorIcE10deallocateEPcm");

      function max_size (this : access constant new_allocator) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:103
      pragma Import (CPP, max_size, "_ZNK9__gnu_cxx13new_allocatorIcE8max_sizeEv");

      procedure construct
        (this : access new_allocator;
         uu_p : pointer;
         uu_val : access char);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:119
      pragma Import (CPP, construct, "_ZN9__gnu_cxx13new_allocatorIcE9constructEPcRKc");

      procedure destroy (this : access new_allocator; uu_p : pointer);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/ext/new_allocator.h:123
      pragma Import (CPP, destroy, "_ZN9__gnu_cxx13new_allocatorIcE7destroyEPc");

   end;
   use new_allocator_char;



end cpp_4_7_4_ext_new_allocator_h;
