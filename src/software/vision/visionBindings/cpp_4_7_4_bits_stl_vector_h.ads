pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Extensions;

package cpp_4_7_4_bits_stl_vector_h is

   package u_Vector_base_Class_Vec.Vec_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv3VecIfLi2EEESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv3VecIfLi2EEESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_Vec.Vec_Class_allocator.allocator;

   package u_Vector_base_Class_Vec.Vec_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv3VecIfLi3EEESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv3VecIfLi3EEESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_Vec.Vec_Class_allocator.allocator;

   package u_Vector_base_Class_Scalar_u.Scalar_u_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv7Scalar_IdEESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv7Scalar_IdEESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_Scalar_u.Scalar_u_Class_allocator.allocator;

   package u_Vector_base_Class_Node.Node_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv6Octree4NodeESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv6Octree4NodeESaIS2_EE13get_allocatorEv");

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

   package u_Vector_base_Class_Point3_u.Point3_u_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv7Point3_IfEESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv7Point3_IfEESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_Point3_u.Point3_u_Class_allocator.allocator;

   package u_Vector_base_accessClass_CvFuzzyRule.CvFuzzyRule_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIP11CvFuzzyRuleSaIS1_EEaSERKS3_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIP11CvFuzzyRuleSaIS1_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_accessClass_CvFuzzyRule.CvFuzzyRule_Class_allocator.allocator;

   package u_Vector_base_Class_CvFuzzyCurve.CvFuzzyCurve_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseI12CvFuzzyCurveSaIS0_EEaSERKS2_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseI12CvFuzzyCurveSaIS0_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_CvFuzzyCurve.CvFuzzyCurve_Class_allocator.allocator;

   package u_Vector_base_Class_CvFuzzyPoint.CvFuzzyPoint_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseI12CvFuzzyPointSaIS0_EEaSERKS2_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseI12CvFuzzyPointSaIS0_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_CvFuzzyPoint.CvFuzzyPoint_Class_allocator.allocator;

   package u_Vector_base_Class_Point_u.Point_u_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv6Point_IiEESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv6Point_IiEESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_Point_u.Point_u_Class_allocator.allocator;

   package u_Vector_base_DTreeNode_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv17CascadeClassifier4Data9DTreeNodeESaIS3_EEaSERKS5_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv17CascadeClassifier4Data9DTreeNodeESaIS3_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_DTreeNode_Class_allocator.allocator;

   package u_Vector_base_DTree_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv17CascadeClassifier4Data5DTreeESaIS3_EEaSERKS5_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv17CascadeClassifier4Data5DTreeESaIS3_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_DTree_Class_allocator.allocator;

   package u_Vector_base_Stage_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv17CascadeClassifier4Data5StageESaIS3_EEaSERKS5_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv17CascadeClassifier4Data5StageESaIS3_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Stage_Class_allocator.allocator;

   package u_Vector_base_vector_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseISt6vectorIcSaIcEESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_vector_Class_allocator.allocator;

   package u_Vector_base_vector_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseISt6vectorIN2cv8KeyPointESaIS2_EESaIS4_EEaSERKS6_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseISt6vectorIN2cv8KeyPointESaIS2_EESaIS4_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_vector_Class_allocator.allocator;

   package u_Vector_base_Class_DMatch.DMatch_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv6DMatchESaIS1_EEaSERKS3_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv6DMatchESaIS1_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_DMatch.DMatch_Class_allocator.allocator;

   package u_Vector_base_vector_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseISt6vectorIN2cv6DMatchESaIS2_EESaIS4_EEaSERKS6_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseISt6vectorIN2cv6DMatchESaIS2_EESaIS4_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_vector_Class_allocator.allocator;

   package u_Vector_base_Class_KeyPoint.KeyPoint_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv8KeyPointESaIS1_EEaSERKS3_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv8KeyPointESaIS1_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_KeyPoint.KeyPoint_Class_allocator.allocator;

   package u_Vector_base_Class_RandomizedTree.RandomizedTree_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv14RandomizedTreeESaIS1_EEaSERKS3_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv14RandomizedTreeESaIS1_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_RandomizedTree.RandomizedTree_Class_allocator.allocator;

   package u_Vector_base_Class_RTreeNode.RTreeNode_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv9RTreeNodeESaIS1_EEaSERKS3_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv9RTreeNodeESaIS1_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_RTreeNode.RTreeNode_Class_allocator.allocator;

   package u_Vector_base_float_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIfSaIfEEaSERKS1_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIfSaIfEE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_float_Class_allocator.allocator;

   package u_Vector_base_Class_Feature.Feature_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIN2cv14FernClassifier7FeatureESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIN2cv14FernClassifier7FeatureESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_Class_Feature.Feature_Class_allocator.allocator;

   package u_Vector_base_address_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseIPN2cv3ORB11OrbPatternsESaIS3_EEaSERKS5_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseIPN2cv3ORB11OrbPatternsESaIS3_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_address_Class_allocator.allocator;

   package u_Vector_base_vector_Class_allocator.allocator is
      type u_Vector_base is limited record
         u_M_impl : aliased u_Vector_impl;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:165
      end record;
      pragma Import (CPP, u_Vector_base);

      function operator_as (this : access u_Vector_base; arg2 : access constant u_Vector_base) return access u_Vector_base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:73
      pragma Import (CPP, operator_as, "_ZNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EEaSERKS4_");

      --  skipped func _M_get_Tp_allocator

      --  skipped func _M_get_Tp_allocator

      function get_allocator (this : access constant u_Vector_base) return allocator_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:122
      pragma Import (CPP, get_allocator, "_ZNKSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE13get_allocatorEv");

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _Vector_base

      --  skipped func _M_allocate

      --  skipped func _M_deallocate

      --  skipped func _M_create_storage

   end;
   use u_Vector_base_vector_Class_allocator.allocator;

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



   package vector_Class_Vec.Vec_Class_allocator.allocator is
      type vector is limited record
         parent : aliased u_Vector_base;
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:235
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:236
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:237
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:238
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:509
      end record;
      pragma Import (CPP, vector);

      function New_vector return vector;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:246
      pragma CPP_Constructor (New_vector, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EEC1Ev");

      function New_vector (uu_a : System.Address) return vector;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:254
      pragma CPP_Constructor (New_vector, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EEC1ERKS3_");

      function New_vector
        (uu_n : size_type;
         uu_value : System.Address;
         uu_a : System.Address) return vector;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:292
      pragma CPP_Constructor (New_vector, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EEC1EmRKS2_RKS3_");

      procedure Delete_vector (this : access vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:402
      pragma Import (CPP, Delete_vector, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EED1Ev");

      function operator_as (this : access vector; uu_x : access constant vector) return access vector;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/vector.tcc:162
      pragma Import (CPP, operator_as, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EEaSERKS4_");

      procedure assign
        (this : access vector;
         uu_n : size_type;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:467
      pragma Import (CPP, assign, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE6assignEmRKS2_");

      function c_begin (this : access vector) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:518
      pragma Import (CPP, c_begin, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE5beginEv");

      function c_begin (this : access constant vector) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:527
      pragma Import (CPP, c_begin, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE5beginEv");

      function c_end (this : access vector) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:536
      pragma Import (CPP, c_end, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE3endEv");

      function c_end (this : access constant vector) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:545
      pragma Import (CPP, c_end, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE3endEv");

      function rbegin (this : access vector) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:554
      pragma Import (CPP, rbegin, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE6rbeginEv");

      function rbegin (this : access constant vector) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:563
      pragma Import (CPP, rbegin, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE6rbeginEv");

      function rend (this : access vector) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:572
      pragma Import (CPP, rend, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE4rendEv");

      function rend (this : access constant vector) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:581
      pragma Import (CPP, rend, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE4rendEv");

      function size (this : access constant vector) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:625
      pragma Import (CPP, size, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE4sizeEv");

      function max_size (this : access constant vector) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:630
      pragma Import (CPP, max_size, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE8max_sizeEv");

      procedure resize
        (this : access vector;
         uu_new_size : size_type;
         uu_x : value_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:684
      pragma Import (CPP, resize, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE6resizeEmS2_");

      function capacity (this : access constant vector) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:705
      pragma Import (CPP, capacity, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE8capacityEv");

      function empty (this : access constant vector) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:714
      pragma Import (CPP, empty, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE5emptyEv");

      procedure reserve (this : access vector; uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/vector.tcc:67
      pragma Import (CPP, reserve, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE7reserveEm");

      function operator_ob (this : access vector; uu_n : size_type) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:750
      pragma Import (CPP, operator_ob, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EEixEm");

      function operator_ob (this : access constant vector; uu_n : size_type) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:765
      pragma Import (CPP, operator_ob, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EEixEm");

      --  skipped func _M_range_check

      function c_at (this : access vector; uu_n : size_type) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:790
      pragma Import (CPP, c_at, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE2atEm");

      function c_at (this : access constant vector; uu_n : size_type) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:808
      pragma Import (CPP, c_at, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE2atEm");

      function front (this : access vector) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:819
      pragma Import (CPP, front, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE5frontEv");

      function front (this : access constant vector) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:827
      pragma Import (CPP, front, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE5frontEv");

      function back (this : access vector) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:835
      pragma Import (CPP, back, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE4backEv");

      function back (this : access constant vector) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:843
      pragma Import (CPP, back, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE4backEv");

      function data (this : access vector) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:858
      pragma Import (CPP, data, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE4dataEv");

      function data (this : access constant vector) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:866
      pragma Import (CPP, data, "_ZNKSt6vectorIN2cv3VecIfLi2EEESaIS2_EE4dataEv");

      procedure push_back (this : access vector; uu_x : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:881
      pragma Import (CPP, push_back, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE9push_backERKS2_");

      procedure pop_back (this : access vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:917
      pragma Import (CPP, pop_back, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE8pop_backEv");

      function insert
        (this : access vector;
         uu_position : iterator;
         uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/vector.tcc:109
      pragma Import (CPP, insert, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE6insertEN9__gnu_cxx17__normal_iteratorIPS2_S4_EERKS2_");

      procedure insert
        (this : access vector;
         uu_position : iterator;
         uu_n : size_type;
         uu_x : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:1003
      pragma Import (CPP, insert, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE6insertEN9__gnu_cxx17__normal_iteratorIPS2_S4_EEmRKS2_");

      function erase (this : access vector; uu_position : iterator) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/vector.tcc:136
      pragma Import (CPP, erase, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS2_S4_EE");

      function erase
        (this : access vector;
         uu_first : iterator;
         uu_last : iterator) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/vector.tcc:148
      pragma Import (CPP, erase, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS2_S4_EES8_");

      procedure swap (this : access vector; uu_x : access vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:1079
      pragma Import (CPP, swap, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE4swapERS4_");

      procedure clear (this : access vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:1096
      pragma Import (CPP, clear, "_ZNSt6vectorIN2cv3VecIfLi2EEESaIS2_EE5clearEv");

      --  skipped func _M_fill_initialize

      --  skipped func _M_fill_assign

      --  skipped func _M_fill_insert

      --  skipped func _M_insert_aux

      --  skipped func _M_check_len

      --  skipped func _M_erase_at_end

   end;
   use vector_Class_Vec.Vec_Class_allocator.allocator;

   package vector_Class_Vec.Vec_Class_allocator.allocator is
      type vector is limited record
         parent : aliased u_Vector_base;
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:235
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:236
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:237
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:238
          : aliased u_Base;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:509
      end record;
      pragma Import (CPP, vector);

      function New_vector return vector;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:246
      pragma CPP_Constructor (New_vector, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EEC1Ev");

      function New_vector (uu_a : System.Address) return vector;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:254
      pragma CPP_Constructor (New_vector, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EEC1ERKS3_");

      function New_vector
        (uu_n : size_type;
         uu_value : System.Address;
         uu_a : System.Address) return vector;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:292
      pragma CPP_Constructor (New_vector, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EEC1EmRKS2_RKS3_");

      procedure Delete_vector (this : access vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:402
      pragma Import (CPP, Delete_vector, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EED1Ev");

      function operator_as (this : access vector; uu_x : access constant vector) return access vector;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/vector.tcc:162
      pragma Import (CPP, operator_as, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EEaSERKS4_");

      procedure assign
        (this : access vector;
         uu_n : size_type;
         uu_val : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:467
      pragma Import (CPP, assign, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE6assignEmRKS2_");

      function c_begin (this : access vector) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:518
      pragma Import (CPP, c_begin, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE5beginEv");

      function c_begin (this : access constant vector) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:527
      pragma Import (CPP, c_begin, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE5beginEv");

      function c_end (this : access vector) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:536
      pragma Import (CPP, c_end, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE3endEv");

      function c_end (this : access constant vector) return const_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:545
      pragma Import (CPP, c_end, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE3endEv");

      function rbegin (this : access vector) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:554
      pragma Import (CPP, rbegin, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE6rbeginEv");

      function rbegin (this : access constant vector) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:563
      pragma Import (CPP, rbegin, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE6rbeginEv");

      function rend (this : access vector) return reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:572
      pragma Import (CPP, rend, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE4rendEv");

      function rend (this : access constant vector) return const_reverse_iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:581
      pragma Import (CPP, rend, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE4rendEv");

      function size (this : access constant vector) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:625
      pragma Import (CPP, size, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE4sizeEv");

      function max_size (this : access constant vector) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:630
      pragma Import (CPP, max_size, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE8max_sizeEv");

      procedure resize
        (this : access vector;
         uu_new_size : size_type;
         uu_x : value_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:684
      pragma Import (CPP, resize, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE6resizeEmS2_");

      function capacity (this : access constant vector) return size_type;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:705
      pragma Import (CPP, capacity, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE8capacityEv");

      function empty (this : access constant vector) return Extensions.bool;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:714
      pragma Import (CPP, empty, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE5emptyEv");

      procedure reserve (this : access vector; uu_n : size_type);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/vector.tcc:67
      pragma Import (CPP, reserve, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE7reserveEm");

      function operator_ob (this : access vector; uu_n : size_type) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:750
      pragma Import (CPP, operator_ob, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EEixEm");

      function operator_ob (this : access constant vector; uu_n : size_type) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:765
      pragma Import (CPP, operator_ob, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EEixEm");

      --  skipped func _M_range_check

      function c_at (this : access vector; uu_n : size_type) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:790
      pragma Import (CPP, c_at, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE2atEm");

      function c_at (this : access constant vector; uu_n : size_type) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:808
      pragma Import (CPP, c_at, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE2atEm");

      function front (this : access vector) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:819
      pragma Import (CPP, front, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE5frontEv");

      function front (this : access constant vector) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:827
      pragma Import (CPP, front, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE5frontEv");

      function back (this : access vector) return reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:835
      pragma Import (CPP, back, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE4backEv");

      function back (this : access constant vector) return const_reference;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:843
      pragma Import (CPP, back, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE4backEv");

      function data (this : access vector) return pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:858
      pragma Import (CPP, data, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE4dataEv");

      function data (this : access constant vector) return const_pointer;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:866
      pragma Import (CPP, data, "_ZNKSt6vectorIN2cv3VecIfLi3EEESaIS2_EE4dataEv");

      procedure push_back (this : access vector; uu_x : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:881
      pragma Import (CPP, push_back, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE9push_backERKS2_");

      procedure pop_back (this : access vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:917
      pragma Import (CPP, pop_back, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE8pop_backEv");

      function insert
        (this : access vector;
         uu_position : iterator;
         uu_x : System.Address) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/vector.tcc:109
      pragma Import (CPP, insert, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE6insertEN9__gnu_cxx17__normal_iteratorIPS2_S4_EERKS2_");

      procedure insert
        (this : access vector;
         uu_position : iterator;
         uu_n : size_type;
         uu_x : System.Address);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:1003
      pragma Import (CPP, insert, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE6insertEN9__gnu_cxx17__normal_iteratorIPS2_S4_EEmRKS2_");

      function erase (this : access vector; uu_position : iterator) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/vector.tcc:136
      pragma Import (CPP, erase, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS2_S4_EE");

      function erase
        (this : access vector;
         uu_first : iterator;
         uu_last : iterator) return iterator;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/vector.tcc:148
      pragma Import (CPP, erase, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS2_S4_EES8_");

      procedure swap (this : access vector; uu_x : access vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:1079
      pragma Import (CPP, swap, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE4swapERS4_");

      procedure clear (this : access vector);  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/../../../../include/c++/4.7.4/bits/stl_vector.h:1096
      pragma Import (CPP, clear, "_ZNSt6vectorIN2cv3VecIfLi3EEESaIS2_EE5clearEv");

      --  skipped func _M_fill_initialize

      --  skipped func _M_fill_assign

      --  skipped func _M_fill_insert

      --  skipped func _M_insert_aux

      --  skipped func _M_check_len

      --  skipped func _M_erase_at_end

   end;
   use vector_Class_Vec.Vec_Class_allocator.allocator;



end cpp_4_7_4_bits_stl_vector_h;
