pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_bits_basic_string_h;
with stddef_h;
with System;
with cpp_4_7_4_bits_stringfwd_h;
with Interfaces.C.Strings;
with cpp_4_7_4_exception;
with Interfaces.C.Extensions;
with opencv2_core_types_c_h;
limited with opencv2_ml_ml_hpp;
limited with opencv2_calib3d_calib3d_hpp;
limited with opencv2_objdetect_objdetect_hpp;
limited with opencv2_features2d_features2d_hpp;
limited with opencv2_flann_miniflann_hpp;
with cpp_4_7_4_bits_stl_vector_h;
with opencv2_core_mat_hpp;
with cpp_4_7_4_bits_stl_iterator_base_types_h;
with cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h;
with cpp_4_7_4_bits_stl_map_h;

package opencv2_core_core_hpp is

   --  arg-macro: procedure CV_Error (code, msg)
   --    cv.error( cv.Exception(code, msg, __func__, __FILE__, __LINE__) )
   --  arg-macro: procedure CV_Error_ (code, args)
   --    cv.error( cv.Exception(code, cv.format args, __func__, __FILE__, __LINE__) )
   --  unsupported macro: CV_Assert(expr) if((expr)) ; else cv::error( cv::Exception(CV_StsAssert, #expr, __func__, __FILE__, __LINE__) )
   subtype String is cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string;

   subtype WString is cpp_4_7_4_bits_basic_string_h.Class_basic_string.basic_string;

   type Mat;
   type MSize is record
      p : access int;  -- /usr/include/opencv2/core/core.hpp:1873
   end record;
   pragma Convention (C_Pass_By_Copy, MSize);
   type Mat_buf_array is array (0 .. 1) of aliased stddef_h.size_t;
   type MStep is record
      p : access stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:1885
      buf : aliased Mat_buf_array;  -- /usr/include/opencv2/core/core.hpp:1886
   end record;
   pragma Convention (C_Pass_By_Copy, MStep);
   subtype MatND is Mat;

   --  skipped empty struct MatOp_Base

   --  skipped empty struct MatArg

   function fromUtf16 (str : System.Address) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:103
   pragma Import (CPP, fromUtf16, "_ZN2cv9fromUtf16ERKSbIwSt11char_traitsIwESaIwEE");

   function toUtf16 (str : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return WString;  -- /usr/include/opencv2/core/core.hpp:104
   pragma Import (CPP, toUtf16, "_ZN2cv7toUtf16ERKSs");

   function format (fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:106
   pragma Import (CPP, format, "_ZN2cv6formatEPKcz");

   function tempfile (suffix : Interfaces.C.Strings.chars_ptr) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:107
   pragma Import (CPP, tempfile, "_ZN2cv8tempfileEPKc");

   package Class_c_Exception is
      type c_Exception is limited new cpp_4_7_4_exception.Class_c_exception.c_exception with record
         msg : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:142
         code : aliased int;  -- /usr/include/opencv2/core/core.hpp:144
         err : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:145
         func : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:146
         file : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:147
         line : aliased int;  -- /usr/include/opencv2/core/core.hpp:148
      end record;
      pragma Import (CPP, c_Exception);

      function New_c_Exception return c_Exception;  -- /usr/include/opencv2/core/core.hpp:128
      pragma CPP_Constructor (New_c_Exception, "_ZN2cv9ExceptionC1Ev");

      function New_c_Exception
        (u_code : int;
         u_err : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         u_func : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         u_file : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         u_line : int) return c_Exception;  -- /usr/include/opencv2/core/core.hpp:133
      pragma CPP_Constructor (New_c_Exception, "_ZN2cv9ExceptionC1EiRKSsS2_S2_i");

      procedure Delete_c_Exception (this : access c_Exception);  -- /usr/include/opencv2/core/core.hpp:134
      pragma Import (CPP, Delete_c_Exception, "_ZN2cv9ExceptionD1Ev");

      procedure deleting_dtor (this : access c_Exception);  -- /usr/include/opencv2/core/core.hpp:134
      pragma Import (CPP, deleting_dtor, "_ZN2cv9ExceptionD0Ev");

      function what (this : access constant c_Exception) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/core.hpp:139
      pragma Import (CPP, what, "_ZNK2cv9Exception4whatEv");

      procedure formatMessage (this : access c_Exception'Class);  -- /usr/include/opencv2/core/core.hpp:140
      pragma Import (CPP, formatMessage, "_ZN2cv9Exception13formatMessageEv");
   end;
   use Class_c_Exception;
   procedure error (exc : access constant c_Exception'Class);  -- /usr/include/opencv2/core/core.hpp:161
   pragma Import (CPP, error, "_ZN2cv5errorERKNS_9ExceptionE");

   function setBreakOnError (flag : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:171
   pragma Import (CPP, setBreakOnError, "_ZN2cv15setBreakOnErrorEb");

   type ErrorCallback is access function
        (arg1 : int;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : int;
         arg6 : System.Address) return int;
   pragma Convention (C, ErrorCallback);  -- /usr/include/opencv2/core/core.hpp:173

   function redirectError
     (errCallback : ErrorCallback;
      userdata : System.Address;
      prevUserdata : System.Address) return ErrorCallback;  -- /usr/include/opencv2/core/core.hpp:188
   pragma Import (CPP, redirectError, "_ZN2cv13redirectErrorEPFiiPKcS1_S1_iPvES2_PS2_");

   procedure setNumThreads (nthreads : int);  -- /usr/include/opencv2/core/core.hpp:207
   pragma Import (CPP, setNumThreads, "_ZN2cv13setNumThreadsEi");

   function getNumThreads return int;  -- /usr/include/opencv2/core/core.hpp:208
   pragma Import (CPP, getNumThreads, "_ZN2cv13getNumThreadsEv");

   function getThreadNum return int;  -- /usr/include/opencv2/core/core.hpp:209
   pragma Import (CPP, getThreadNum, "_ZN2cv12getThreadNumEv");

   function getTickCount return opencv2_core_types_c_h.int64;  -- /usr/include/opencv2/core/core.hpp:219
   pragma Import (CPP, getTickCount, "_ZN2cv12getTickCountEv");

   function getTickFrequency return double;  -- /usr/include/opencv2/core/core.hpp:233
   pragma Import (CPP, getTickFrequency, "_ZN2cv16getTickFrequencyEv");

   function getCPUTickCount return opencv2_core_types_c_h.int64;  -- /usr/include/opencv2/core/core.hpp:243
   pragma Import (CPP, getCPUTickCount, "_ZN2cv15getCPUTickCountEv");

   function checkHardwareSupport (feature : int) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:264
   pragma Import (CPP, checkHardwareSupport, "_ZN2cv20checkHardwareSupportEi");

   function getNumberOfCPUs return int;  -- /usr/include/opencv2/core/core.hpp:267
   pragma Import (CPP, getNumberOfCPUs, "_ZN2cv15getNumberOfCPUsEv");

   function fastMalloc (bufSize : stddef_h.size_t) return System.Address;  -- /usr/include/opencv2/core/core.hpp:279
   pragma Import (CPP, fastMalloc, "_ZN2cv10fastMallocEm");

   procedure fastFree (ptr : System.Address);  -- /usr/include/opencv2/core/core.hpp:287
   pragma Import (CPP, fastFree, "_ZN2cv8fastFreeEPv");

   function alignSize (sz : stddef_h.size_t; n : int) return stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:315
   pragma Import (CPP, alignSize, "_ZN2cvL9alignSizeEmi");

   procedure setUseOptimized (onoff : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:329
   pragma Import (CPP, setUseOptimized, "_ZN2cv15setUseOptimizedEb");

   function useOptimized return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:336
   pragma Import (CPP, useOptimized, "_ZN2cv12useOptimizedEv");

   package Class_Matx_AddOp is
      type Matx_AddOp is limited record
         null;
      end record;
      pragma Import (CPP, Matx_AddOp);

      function New_Matx_AddOp return Matx_AddOp;  -- /usr/include/opencv2/core/core.hpp:417
      pragma CPP_Constructor (New_Matx_AddOp, "_ZN2cv10Matx_AddOpC1Ev");


   end;
   use Class_Matx_AddOp;
   package Class_Matx_SubOp is
      type Matx_SubOp is limited record
         null;
      end record;
      pragma Import (CPP, Matx_SubOp);

      function New_Matx_SubOp return Matx_SubOp;  -- /usr/include/opencv2/core/core.hpp:418
      pragma CPP_Constructor (New_Matx_SubOp, "_ZN2cv10Matx_SubOpC1Ev");


   end;
   use Class_Matx_SubOp;
   package Class_Matx_ScaleOp is
      type Matx_ScaleOp is limited record
         null;
      end record;
      pragma Import (CPP, Matx_ScaleOp);

      function New_Matx_ScaleOp return Matx_ScaleOp;  -- /usr/include/opencv2/core/core.hpp:419
      pragma CPP_Constructor (New_Matx_ScaleOp, "_ZN2cv12Matx_ScaleOpC1Ev");


   end;
   use Class_Matx_ScaleOp;
   type Matx_MulOp is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, Matx_MulOp);  -- /usr/include/opencv2/core/core.hpp:420

   type Matx_MatMulOp is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, Matx_MatMulOp);  -- /usr/include/opencv2/core/core.hpp:421

   type Matx_TOp is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, Matx_TOp);  -- /usr/include/opencv2/core/core.hpp:422

   --  skipped empty struct Matx12f

   --  skipped empty struct Matx12d

   --  skipped empty struct Matx13f

   --  skipped empty struct Matx13d

   --  skipped empty struct Matx14f

   --  skipped empty struct Matx14d

   --  skipped empty struct Matx16f

   --  skipped empty struct Matx16d

   type Matx;
   type Matx_val_array is array (0 .. 1) of aliased float;
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx_val_array is array (0 .. 1) of aliased float;
   type mat_type;
   type mat_type_val_array is array (0 .. 1) of aliased float;
   type Matx;
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   subtype Matx21f is Matx;

   --  skipped empty struct Matx21d

   type Matx;
   type Matx_val_array is array (0 .. 2) of aliased float;
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx_val_array is array (0 .. 2) of aliased float;
   type mat_type;
   type mat_type_val_array is array (0 .. 2) of aliased float;
   type Matx;
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   subtype Matx31f is Matx;

   type Matx;
   type Matx_val_array is array (0 .. 2) of aliased double;
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx_val_array is array (0 .. 2) of aliased double;
   type mat_type;
   type mat_type_val_array is array (0 .. 2) of aliased double;
   type Matx;
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   subtype Matx31d is Matx;

   type Matx;
   type Matx_val_array is array (0 .. 3) of aliased float;
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx_val_array is array (0 .. 3) of aliased float;
   type mat_type;
   type mat_type_val_array is array (0 .. 3) of aliased float;
   type Matx;
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   subtype Matx41f is Matx;

   type Matx;
   type Matx_val_array is array (0 .. 3) of aliased double;
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type Matx_val_array is array (0 .. 3) of aliased double;
   type mat_type;
   type mat_type_val_array is array (0 .. 3) of aliased double;
   type Matx;
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   type Matx is record
      val : aliased mat_type_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, Matx);
   type diag_type is null record;
   pragma Convention (C_Pass_By_Copy, diag_type);
   type mat_type is record
      val : aliased Matx_val_array;  -- /usr/include/opencv2/core/core.hpp:515
   end record;
   pragma Convention (C_Pass_By_Copy, mat_type);
   subtype Matx41d is Matx;

   --  skipped empty struct Matx61f

   --  skipped empty struct Matx61d

   --  skipped empty struct Matx22f

   --  skipped empty struct Matx22d

   --  skipped empty struct Matx23f

   --  skipped empty struct Matx23d

   --  skipped empty struct Matx32f

   --  skipped empty struct Matx32d

   --  skipped empty struct Matx33f

   --  skipped empty struct Matx33d

   --  skipped empty struct Matx34f

   --  skipped empty struct Matx34d

   --  skipped empty struct Matx43f

   --  skipped empty struct Matx43d

   --  skipped empty struct Matx44f

   --  skipped empty struct Matx44d

   --  skipped empty struct Matx66f

   --  skipped empty struct Matx66d

   --  skipped empty struct Vec2b

   --  skipped empty struct Vec3b

   --  skipped empty struct Vec4b

   --  skipped empty struct Vec2s

   --  skipped empty struct Vec3s

   --  skipped empty struct Vec4s

   --  skipped empty struct Vec2w

   --  skipped empty struct Vec3w

   --  skipped empty struct Vec4w

   type Vec;
   subtype Vec2i is Vec;

   --  skipped empty struct Vec3i

   type Vec;
   subtype Vec4i is Vec;

   --  skipped empty struct Vec6i

   --  skipped empty struct Vec8i

   type Vec;
   subtype Vec2f is Vec;

   type Vec;
   subtype Vec3f is Vec;

   type Vec;
   subtype Vec4f is Vec;

   --  skipped empty struct Vec6f

   --  skipped empty struct Vec2d

   type Vec;
   subtype Vec3d is Vec;

   type Vec;
   subtype Vec4d is Vec;

   --  skipped empty struct Vec6d

   --  skipped empty struct Complexf

   --  skipped empty struct Complexd

   type Point_u;
   subtype Point2i is Point_u;

   subtype Point is Point_u;

   type Size_u;
   subtype Size2i is Size_u;

   subtype Size is Size_u;

   type Rect_u;
   subtype Rect is Rect_u;

   type Point_u;
   subtype Point2f is Point_u;

   type Point_u;
   subtype Point2d is Point_u;

   type Size_u;
   subtype Size2f is Size_u;

   --  skipped empty struct Point3i

   type Point3_u;
   subtype Point3f is Point3_u;

   --  skipped empty struct Point3d

   package Class_RotatedRect is
      type RotatedRect is limited record
         center : aliased Point2f;  -- /usr/include/opencv2/core/core.hpp:893
         size : aliased Size2f;  -- /usr/include/opencv2/core/core.hpp:894
         angle : aliased float;  -- /usr/include/opencv2/core/core.hpp:895
      end record;
      pragma Import (CPP, RotatedRect);

      function New_RotatedRect return RotatedRect;  -- /usr/include/opencv2/core/operations.hpp:1766
      pragma CPP_Constructor (New_RotatedRect, "_ZN2cv11RotatedRectC1Ev");

      function New_RotatedRect
        (u_center : System.Address;
         u_size : System.Address;
         u_angle : float) return RotatedRect;  -- /usr/include/opencv2/core/operations.hpp:1767
      pragma CPP_Constructor (New_RotatedRect, "_ZN2cv11RotatedRectC1ERKNS_6Point_IfEERKNS_5Size_IfEEf");

      function New_RotatedRect (box : access constant opencv2_core_types_c_h.CvBox2D) return RotatedRect;  -- /usr/include/opencv2/core/operations.hpp:1769
      pragma CPP_Constructor (New_RotatedRect, "_ZN2cv11RotatedRectC1ERK7CvBox2D");

      procedure points (this : access constant RotatedRect; pts : access Point2f);  -- /usr/include/opencv2/core/core.hpp:887
      pragma Import (CPP, points, "_ZNK2cv11RotatedRect6pointsEPNS_6Point_IfEE");

      function boundingRect (this : access constant RotatedRect) return Rect;  -- /usr/include/opencv2/core/core.hpp:889
      pragma Import (CPP, boundingRect, "_ZNK2cv11RotatedRect12boundingRectEv");

      function operator_21 (this : access constant RotatedRect) return opencv2_core_types_c_h.CvBox2D;  -- /usr/include/opencv2/core/operations.hpp:1771
      pragma Import (CPP, operator_21, "_ZNK2cv11RotatedRectcv7CvBox2DEv");
   end;
   use Class_RotatedRect;
   package Scalar_u_float is
      type Scalar_u is limited record
         parent : aliased Vec;
      end record;
      pragma Import (CPP, Scalar_u);

      function New_Scalar_u return Scalar_u;  -- /usr/include/opencv2/core/operations.hpp:1779
      pragma CPP_Constructor (New_Scalar_u, "_ZN2cv7Scalar_IfEC1Ev");

      function New_Scalar_u
        (v0 : float;
         v1 : float;
         v2 : float;
         v3 : float) return Scalar_u;  -- /usr/include/opencv2/core/operations.hpp:1782
      pragma CPP_Constructor (New_Scalar_u, "_ZN2cv7Scalar_IfEC1Effff");

      function New_Scalar_u (s : access constant opencv2_core_types_c_h.CvScalar) return Scalar_u;  -- /usr/include/opencv2/core/operations.hpp:1785
      pragma CPP_Constructor (New_Scalar_u, "_ZN2cv7Scalar_IfEC1ERK8CvScalar");

      function New_Scalar_u (v0 : float) return Scalar_u;  -- /usr/include/opencv2/core/operations.hpp:1793
      pragma CPP_Constructor (New_Scalar_u, "_ZN2cv7Scalar_IfEC1Ef");

      function c_all (v0 : float) return Scalar_u;  -- /usr/include/opencv2/core/operations.hpp:1796
      pragma Import (CPP, c_all, "_ZN2cv7Scalar_IfE3allEf");

      function operator_6 (this : access constant Scalar_u) return opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/core/operations.hpp:1798
      pragma Import (CPP, operator_6, "_ZNK2cv7Scalar_IfEcv8CvScalarEv");

      function mul
        (this : access constant Scalar_u;
         t : access constant Scalar_u;
         scale : double) return Scalar_u;  -- /usr/include/opencv2/core/operations.hpp:1836
      pragma Import (CPP, mul, "_ZNK2cv7Scalar_IfE3mulERKS1_d");

      function conj (this : access constant Scalar_u) return Scalar_u;  -- /usr/include/opencv2/core/operations.hpp:1908
      pragma Import (CPP, conj, "_ZNK2cv7Scalar_IfE4conjEv");

      function isReal (this : access constant Scalar_u) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:1916
      pragma Import (CPP, isReal, "_ZNK2cv7Scalar_IfE6isRealEv");

   end;
   use Scalar_u_float;



   type Scalar_u;
   subtype Scalar is Scalar_u;

   procedure scalarToRawData
     (s : System.Address;
      buf : System.Address;
      c_type : int;
      unroll_to : int);  -- /usr/include/opencv2/core/core.hpp:935
   pragma Import (CPP, scalarToRawData, "_ZN2cv15scalarToRawDataERKNS_7Scalar_IdEEPvii");

   package Class_c_Range is
      type c_Range is limited record
         start : aliased int;  -- /usr/include/opencv2/core/core.hpp:955
         c_end : aliased int;  -- /usr/include/opencv2/core/core.hpp:955
      end record;
      pragma Import (CPP, c_Range);

      function operator_as (this : access c_Range; arg2 : access constant c_Range) return access c_Range;  -- /usr/include/opencv2/core/core.hpp:944
      pragma Import (CPP, operator_as, "_ZN2cv5RangeaSERKS0_");

      function New_c_Range return c_Range;  -- /usr/include/opencv2/core/operations.hpp:1973
      pragma CPP_Constructor (New_c_Range, "_ZN2cv5RangeC1Ev");

      function New_c_Range (u_start : int; u_end : int) return c_Range;  -- /usr/include/opencv2/core/operations.hpp:1974
      pragma CPP_Constructor (New_c_Range, "_ZN2cv5RangeC1Eii");

      function New_c_Range (slice : access constant opencv2_core_types_c_h.CvSlice) return c_Range;  -- /usr/include/opencv2/core/operations.hpp:1975
      pragma CPP_Constructor (New_c_Range, "_ZN2cv5RangeC1ERK7CvSlice");

      function size (this : access constant c_Range) return int;  -- /usr/include/opencv2/core/operations.hpp:1981
      pragma Import (CPP, size, "_ZNK2cv5Range4sizeEv");

      function empty (this : access constant c_Range) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:1982
      pragma Import (CPP, empty, "_ZNK2cv5Range5emptyEv");

      function c_all return c_Range;  -- /usr/include/opencv2/core/operations.hpp:1983
      pragma Import (CPP, c_all, "_ZN2cv5Range3allEv");

      function operator_26 (this : access constant c_Range) return opencv2_core_types_c_h.CvSlice;  -- /usr/include/opencv2/core/operations.hpp:2022
      pragma Import (CPP, operator_26, "_ZNK2cv5Rangecv7CvSliceEv");
   end;
   use Class_c_Range;
   package Ptr_CvDTreeSplit is
      type Ptr is limited record
         obj : access opencv2_ml_ml_hpp.CvDTreeSplit;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrI12CvDTreeSplitEC1Ev");

      function New_Ptr (u_obj : access opencv2_ml_ml_hpp.CvDTreeSplit) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrI12CvDTreeSplitEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrI12CvDTreeSplitED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrI12CvDTreeSplitEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrI12CvDTreeSplitE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrI12CvDTreeSplitE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/ml/ml.hpp:2155
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrI12CvDTreeSplitE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrI12CvDTreeSplitE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_ml_ml_hpp.CvDTreeSplit;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrI12CvDTreeSplitEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_ml_ml_hpp.CvDTreeSplit;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrI12CvDTreeSplitEptEv");

      function operator_120 (this : access Ptr) return access opencv2_ml_ml_hpp.CvDTreeSplit;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_120, "_ZN2cv3PtrI12CvDTreeSplitEcvPS1_Ev");

      function operator_121 (this : access constant Ptr) return access constant opencv2_ml_ml_hpp.CvDTreeSplit;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_121, "_ZNK2cv3PtrI12CvDTreeSplitEcvPKS1_Ev");

   end;
   use Ptr_CvDTreeSplit;

   package Ptr_CvStereoBMState is
      type Ptr is limited record
         obj : access opencv2_calib3d_calib3d_hpp.CvStereoBMState;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrI15CvStereoBMStateEC1Ev");

      function New_Ptr (u_obj : access opencv2_calib3d_calib3d_hpp.CvStereoBMState) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrI15CvStereoBMStateEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrI15CvStereoBMStateED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrI15CvStereoBMStateEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrI15CvStereoBMStateE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrI15CvStereoBMStateE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/calib3d/calib3d.hpp:665
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrI15CvStereoBMStateE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrI15CvStereoBMStateE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_calib3d_calib3d_hpp.CvStereoBMState;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrI15CvStereoBMStateEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_calib3d_calib3d_hpp.CvStereoBMState;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrI15CvStereoBMStateEptEv");

      function operator_118 (this : access Ptr) return access opencv2_calib3d_calib3d_hpp.CvStereoBMState;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_118, "_ZN2cv3PtrI15CvStereoBMStateEcvPS1_Ev");

      function operator_119 (this : access constant Ptr) return access constant opencv2_calib3d_calib3d_hpp.CvStereoBMState;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_119, "_ZNK2cv3PtrI15CvStereoBMStateEcvPKS1_Ev");

   end;
   use Ptr_CvStereoBMState;

   package Ptr_CvHaarClassifierCascade is
      type Ptr is limited record
         obj : access opencv2_objdetect_objdetect_hpp.CvHaarClassifierCascade;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrI23CvHaarClassifierCascadeEC1Ev");

      function New_Ptr (u_obj : access opencv2_objdetect_objdetect_hpp.CvHaarClassifierCascade) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrI23CvHaarClassifierCascadeEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrI23CvHaarClassifierCascadeED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrI23CvHaarClassifierCascadeEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrI23CvHaarClassifierCascadeE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrI23CvHaarClassifierCascadeE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/objdetect/objdetect.hpp:317
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrI23CvHaarClassifierCascadeE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrI23CvHaarClassifierCascadeE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_objdetect_objdetect_hpp.CvHaarClassifierCascade;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrI23CvHaarClassifierCascadeEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_objdetect_objdetect_hpp.CvHaarClassifierCascade;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrI23CvHaarClassifierCascadeEptEv");

      function operator_114 (this : access Ptr) return access opencv2_objdetect_objdetect_hpp.CvHaarClassifierCascade;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_114, "_ZN2cv3PtrI23CvHaarClassifierCascadeEcvPS1_Ev");

      function operator_115 (this : access constant Ptr) return access constant opencv2_objdetect_objdetect_hpp.CvHaarClassifierCascade;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_115, "_ZNK2cv3PtrI23CvHaarClassifierCascadeEcvPKS1_Ev");

   end;
   use Ptr_CvHaarClassifierCascade;

   package Ptr_Class_FeatureEvaluator.FeatureEvaluator is
      type Ptr is limited record
         obj : access opencv2_objdetect_objdetect_hpp.Class_FeatureEvaluator.FeatureEvaluator;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_16FeatureEvaluatorEEC1Ev");

      function New_Ptr (u_obj : access opencv2_objdetect_objdetect_hpp.Class_FeatureEvaluator.FeatureEvaluator) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_16FeatureEvaluatorEEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_16FeatureEvaluatorEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_16FeatureEvaluatorEEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_16FeatureEvaluatorEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_16FeatureEvaluatorEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_16FeatureEvaluatorEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_16FeatureEvaluatorEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_objdetect_objdetect_hpp.Class_FeatureEvaluator.FeatureEvaluator;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_16FeatureEvaluatorEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_objdetect_objdetect_hpp.Class_FeatureEvaluator.FeatureEvaluator;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_16FeatureEvaluatorEEptEv");

      function operator_116 (this : access Ptr) return access opencv2_objdetect_objdetect_hpp.Class_FeatureEvaluator.FeatureEvaluator;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_116, "_ZN2cv3PtrINS_16FeatureEvaluatorEEcvPS1_Ev");

      function operator_117 (this : access constant Ptr) return access constant opencv2_objdetect_objdetect_hpp.Class_FeatureEvaluator.FeatureEvaluator;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_117, "_ZNK2cv3PtrINS_16FeatureEvaluatorEEcvPKS1_Ev");

   end;
   use Ptr_Class_FeatureEvaluator.FeatureEvaluator;

   package Ptr_Class_FernClassifier.FernClassifier is
      type Ptr is limited record
         obj : access opencv2_features2d_features2d_hpp.Class_FernClassifier.FernClassifier;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_14FernClassifierEEC1Ev");

      function New_Ptr (u_obj : access opencv2_features2d_features2d_hpp.Class_FernClassifier.FernClassifier) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_14FernClassifierEEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_14FernClassifierEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_14FernClassifierEEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_14FernClassifierEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_14FernClassifierEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_14FernClassifierEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_14FernClassifierEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_FernClassifier.FernClassifier;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_14FernClassifierEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_FernClassifier.FernClassifier;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_14FernClassifierEEptEv");

      function operator_110 (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_FernClassifier.FernClassifier;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_110, "_ZN2cv3PtrINS_14FernClassifierEEcvPS1_Ev");

      function operator_111 (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_FernClassifier.FernClassifier;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_111, "_ZNK2cv3PtrINS_14FernClassifierEEcvPKS1_Ev");

   end;
   use Ptr_Class_FernClassifier.FernClassifier;

   package Ptr_Class_OneWayDescriptorBase.OneWayDescriptorBase is
      type Ptr is limited record
         obj : access opencv2_features2d_features2d_hpp.Class_OneWayDescriptorBase.OneWayDescriptorBase;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_20OneWayDescriptorBaseEEC1Ev");

      function New_Ptr (u_obj : access opencv2_features2d_features2d_hpp.Class_OneWayDescriptorBase.OneWayDescriptorBase) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_20OneWayDescriptorBaseEEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_20OneWayDescriptorBaseEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_20OneWayDescriptorBaseEEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_20OneWayDescriptorBaseEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_20OneWayDescriptorBaseEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_20OneWayDescriptorBaseEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_20OneWayDescriptorBaseEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_OneWayDescriptorBase.OneWayDescriptorBase;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_20OneWayDescriptorBaseEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_OneWayDescriptorBase.OneWayDescriptorBase;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_20OneWayDescriptorBaseEEptEv");

      function operator_108 (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_OneWayDescriptorBase.OneWayDescriptorBase;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_108, "_ZN2cv3PtrINS_20OneWayDescriptorBaseEEcvPS1_Ev");

      function operator_109 (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_OneWayDescriptorBase.OneWayDescriptorBase;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_109, "_ZNK2cv3PtrINS_20OneWayDescriptorBaseEEcvPKS1_Ev");

   end;
   use Ptr_Class_OneWayDescriptorBase.OneWayDescriptorBase;

   package Ptr_Class_GenericDescriptorMatcher.GenericDescriptorMatcher is
      type Ptr is limited record
         obj : access opencv2_features2d_features2d_hpp.Class_GenericDescriptorMatcher.GenericDescriptorMatcher;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_24GenericDescriptorMatcherEEC1Ev");

      function New_Ptr (u_obj : access opencv2_features2d_features2d_hpp.Class_GenericDescriptorMatcher.GenericDescriptorMatcher) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_24GenericDescriptorMatcherEEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_24GenericDescriptorMatcherEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_24GenericDescriptorMatcherEEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_24GenericDescriptorMatcherEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_24GenericDescriptorMatcherEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_24GenericDescriptorMatcherEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_24GenericDescriptorMatcherEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_GenericDescriptorMatcher.GenericDescriptorMatcher;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_24GenericDescriptorMatcherEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_GenericDescriptorMatcher.GenericDescriptorMatcher;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_24GenericDescriptorMatcherEEptEv");

      function operator_112 (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_GenericDescriptorMatcher.GenericDescriptorMatcher;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_112, "_ZN2cv3PtrINS_24GenericDescriptorMatcherEEcvPS1_Ev");

      function operator_113 (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_GenericDescriptorMatcher.GenericDescriptorMatcher;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_113, "_ZNK2cv3PtrINS_24GenericDescriptorMatcherEEcvPKS1_Ev");

   end;
   use Ptr_Class_GenericDescriptorMatcher.GenericDescriptorMatcher;

   package Ptr_Class_Index.Index is
      type Ptr is limited record
         obj : access opencv2_flann_miniflann_hpp.Class_Index.Index;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_5flann5IndexEEC1Ev");

      function New_Ptr (u_obj : access opencv2_flann_miniflann_hpp.Class_Index.Index) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_5flann5IndexEEC1EPS2_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_5flann5IndexEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_5flann5IndexEEaSERKS3_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_5flann5IndexEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_5flann5IndexEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_5flann5IndexEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_5flann5IndexEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_flann_miniflann_hpp.Class_Index.Index;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_5flann5IndexEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_flann_miniflann_hpp.Class_Index.Index;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_5flann5IndexEEptEv");

      function operator_106 (this : access Ptr) return access opencv2_flann_miniflann_hpp.Class_Index.Index;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_106, "_ZN2cv3PtrINS_5flann5IndexEEcvPS2_Ev");

      function operator_107 (this : access constant Ptr) return access constant opencv2_flann_miniflann_hpp.Class_Index.Index;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_107, "_ZNK2cv3PtrINS_5flann5IndexEEcvPKS2_Ev");

   end;
   use Ptr_Class_Index.Index;

   package Ptr_Class_SearchParams.SearchParams is
      type Ptr is limited record
         obj : access opencv2_flann_miniflann_hpp.Class_SearchParams.SearchParams;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_5flann12SearchParamsEEC1Ev");

      function New_Ptr (u_obj : access opencv2_flann_miniflann_hpp.Class_SearchParams.SearchParams) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_5flann12SearchParamsEEC1EPS2_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_5flann12SearchParamsEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_5flann12SearchParamsEEaSERKS3_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_5flann12SearchParamsEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_5flann12SearchParamsEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_5flann12SearchParamsEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_5flann12SearchParamsEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_flann_miniflann_hpp.Class_SearchParams.SearchParams;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_5flann12SearchParamsEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_flann_miniflann_hpp.Class_SearchParams.SearchParams;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_5flann12SearchParamsEEptEv");

      function operator_104 (this : access Ptr) return access opencv2_flann_miniflann_hpp.Class_SearchParams.SearchParams;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_104, "_ZN2cv3PtrINS_5flann12SearchParamsEEcvPS2_Ev");

      function operator_105 (this : access constant Ptr) return access constant opencv2_flann_miniflann_hpp.Class_SearchParams.SearchParams;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_105, "_ZNK2cv3PtrINS_5flann12SearchParamsEEcvPKS2_Ev");

   end;
   use Ptr_Class_SearchParams.SearchParams;

   package Ptr_Class_IndexParams.IndexParams is
      type Ptr is limited record
         obj : access opencv2_flann_miniflann_hpp.Class_IndexParams.IndexParams;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_5flann11IndexParamsEEC1Ev");

      function New_Ptr (u_obj : access opencv2_flann_miniflann_hpp.Class_IndexParams.IndexParams) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_5flann11IndexParamsEEC1EPS2_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_5flann11IndexParamsEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_5flann11IndexParamsEEaSERKS3_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_5flann11IndexParamsEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_5flann11IndexParamsEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_5flann11IndexParamsEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_5flann11IndexParamsEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_flann_miniflann_hpp.Class_IndexParams.IndexParams;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_5flann11IndexParamsEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_flann_miniflann_hpp.Class_IndexParams.IndexParams;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_5flann11IndexParamsEEptEv");

      function operator_102 (this : access Ptr) return access opencv2_flann_miniflann_hpp.Class_IndexParams.IndexParams;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_102, "_ZN2cv3PtrINS_5flann11IndexParamsEEcvPS2_Ev");

      function operator_103 (this : access constant Ptr) return access constant opencv2_flann_miniflann_hpp.Class_IndexParams.IndexParams;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_103, "_ZNK2cv3PtrINS_5flann11IndexParamsEEcvPKS2_Ev");

   end;
   use Ptr_Class_IndexParams.IndexParams;

   package Ptr_Class_DescriptorMatcher.DescriptorMatcher is
      type Ptr is limited record
         obj : access opencv2_features2d_features2d_hpp.Class_DescriptorMatcher.DescriptorMatcher;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_17DescriptorMatcherEEC1Ev");

      function New_Ptr (u_obj : access opencv2_features2d_features2d_hpp.Class_DescriptorMatcher.DescriptorMatcher) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_17DescriptorMatcherEEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_17DescriptorMatcherEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_17DescriptorMatcherEEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_17DescriptorMatcherEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_17DescriptorMatcherEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_17DescriptorMatcherEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_17DescriptorMatcherEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_DescriptorMatcher.DescriptorMatcher;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_17DescriptorMatcherEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_DescriptorMatcher.DescriptorMatcher;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_17DescriptorMatcherEEptEv");

      function operator_100 (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_DescriptorMatcher.DescriptorMatcher;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_100, "_ZN2cv3PtrINS_17DescriptorMatcherEEcvPS1_Ev");

      function operator_101 (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_DescriptorMatcher.DescriptorMatcher;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_101, "_ZNK2cv3PtrINS_17DescriptorMatcherEEcvPKS1_Ev");

   end;
   use Ptr_Class_DescriptorMatcher.DescriptorMatcher;

   package Ptr_Class_DescriptorExtractor.DescriptorExtractor is
      type Ptr is limited record
         obj : access opencv2_features2d_features2d_hpp.Class_DescriptorExtractor.DescriptorExtractor;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_19DescriptorExtractorEEC1Ev");

      function New_Ptr (u_obj : access opencv2_features2d_features2d_hpp.Class_DescriptorExtractor.DescriptorExtractor) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_19DescriptorExtractorEEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_19DescriptorExtractorEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_19DescriptorExtractorEEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_19DescriptorExtractorEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_19DescriptorExtractorEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_19DescriptorExtractorEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_19DescriptorExtractorEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_DescriptorExtractor.DescriptorExtractor;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_19DescriptorExtractorEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_DescriptorExtractor.DescriptorExtractor;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_19DescriptorExtractorEEptEv");

      function operator_98 (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_DescriptorExtractor.DescriptorExtractor;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_98, "_ZN2cv3PtrINS_19DescriptorExtractorEEcvPS1_Ev");

      function operator_99 (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_DescriptorExtractor.DescriptorExtractor;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_99, "_ZNK2cv3PtrINS_19DescriptorExtractorEEcvPKS1_Ev");

   end;
   use Ptr_Class_DescriptorExtractor.DescriptorExtractor;

   package Ptr_Class_AdjusterAdapter.AdjusterAdapter is
      type Ptr is limited record
         obj : access opencv2_features2d_features2d_hpp.Class_AdjusterAdapter.AdjusterAdapter;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_15AdjusterAdapterEEC1Ev");

      function New_Ptr (u_obj : access opencv2_features2d_features2d_hpp.Class_AdjusterAdapter.AdjusterAdapter) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_15AdjusterAdapterEEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_15AdjusterAdapterEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_15AdjusterAdapterEEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_15AdjusterAdapterEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_15AdjusterAdapterEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_15AdjusterAdapterEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_15AdjusterAdapterEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_AdjusterAdapter.AdjusterAdapter;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_15AdjusterAdapterEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_AdjusterAdapter.AdjusterAdapter;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_15AdjusterAdapterEEptEv");

      function operator_96 (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_AdjusterAdapter.AdjusterAdapter;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_96, "_ZN2cv3PtrINS_15AdjusterAdapterEEcvPS1_Ev");

      function operator_97 (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_AdjusterAdapter.AdjusterAdapter;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_97, "_ZNK2cv3PtrINS_15AdjusterAdapterEEcvPKS1_Ev");

   end;
   use Ptr_Class_AdjusterAdapter.AdjusterAdapter;

   package Ptr_Class_FeatureDetector.FeatureDetector is
      type Ptr is limited record
         obj : access opencv2_features2d_features2d_hpp.Class_FeatureDetector.FeatureDetector;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_15FeatureDetectorEEC1Ev");

      function New_Ptr (u_obj : access opencv2_features2d_features2d_hpp.Class_FeatureDetector.FeatureDetector) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrINS_15FeatureDetectorEEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrINS_15FeatureDetectorEED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrINS_15FeatureDetectorEEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrINS_15FeatureDetectorEE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrINS_15FeatureDetectorEE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrINS_15FeatureDetectorEE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrINS_15FeatureDetectorEE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_FeatureDetector.FeatureDetector;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrINS_15FeatureDetectorEEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_FeatureDetector.FeatureDetector;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrINS_15FeatureDetectorEEptEv");

      function operator_94 (this : access Ptr) return access opencv2_features2d_features2d_hpp.Class_FeatureDetector.FeatureDetector;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_94, "_ZN2cv3PtrINS_15FeatureDetectorEEcvPS1_Ev");

      function operator_95 (this : access constant Ptr) return access constant opencv2_features2d_features2d_hpp.Class_FeatureDetector.FeatureDetector;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_95, "_ZNK2cv3PtrINS_15FeatureDetectorEEcvPKS1_Ev");

   end;
   use Ptr_Class_FeatureDetector.FeatureDetector;

   package Ptr_CvHistogram is
      type Ptr is limited record
         obj : access opencv2_core_types_c_h.CvHistogram;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrI11CvHistogramEC1Ev");

      function New_Ptr (u_obj : access opencv2_core_types_c_h.CvHistogram) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrI11CvHistogramEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrI11CvHistogramED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrI11CvHistogramEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrI11CvHistogramE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrI11CvHistogramE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/imgproc/imgproc.hpp:652
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrI11CvHistogramE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrI11CvHistogramE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_core_types_c_h.CvHistogram;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrI11CvHistogramEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_core_types_c_h.CvHistogram;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrI11CvHistogramEptEv");

      function operator_90 (this : access Ptr) return access opencv2_core_types_c_h.CvHistogram;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_90, "_ZN2cv3PtrI11CvHistogramEcvPS1_Ev");

      function operator_91 (this : access constant Ptr) return access constant opencv2_core_types_c_h.CvHistogram;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_91, "_ZNK2cv3PtrI11CvHistogramEcvPKS1_Ev");

   end;
   use Ptr_CvHistogram;

   package Ptr_u_IplConvKernel is
      type Ptr is limited record
         obj : access opencv2_core_types_c_h.u_IplConvKernel;  -- /usr/include/opencv2/core/core.hpp:1254
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1255
      end record;
      pragma Import (CPP, Ptr);

      function New_Ptr return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2352
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrI14_IplConvKernelEC1Ev");

      function New_Ptr (u_obj : access opencv2_core_types_c_h.u_IplConvKernel) return Ptr;  -- /usr/include/opencv2/core/operations.hpp:2353
      pragma CPP_Constructor (New_Ptr, "_ZN2cv3PtrI14_IplConvKernelEC1EPS1_");

      procedure Delete_Ptr (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2383
      pragma Import (CPP, Delete_Ptr, "_ZN2cv3PtrI14_IplConvKernelED1Ev");

      function operator_as (this : access Ptr; ptr : access constant Ptr) return access Ptr;  -- /usr/include/opencv2/core/operations.hpp:2392
      pragma Import (CPP, operator_as, "_ZN2cv3PtrI14_IplConvKernelEaSERKS2_");

      procedure addref (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2364
      pragma Import (CPP, addref, "_ZN2cv3PtrI14_IplConvKernelE6addrefEv");

      procedure release (this : access Ptr);  -- /usr/include/opencv2/core/operations.hpp:2367
      pragma Import (CPP, release, "_ZN2cv3PtrI14_IplConvKernelE7releaseEv");

      procedure delete_obj (this : access Ptr);  -- /usr/include/opencv2/imgproc/imgproc.hpp:378
      pragma Import (CPP, delete_obj, "_ZN2cv3PtrI14_IplConvKernelE10delete_objEv");

      function empty (this : access constant Ptr) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2409
      pragma Import (CPP, empty, "_ZNK2cv3PtrI14_IplConvKernelE5emptyEv");

      function operator__gt (this : access Ptr) return access opencv2_core_types_c_h.u_IplConvKernel;  -- /usr/include/opencv2/core/operations.hpp:2403
      pragma Import (CPP, operator__gt, "_ZN2cv3PtrI14_IplConvKernelEptEv");

      function operator__gt (this : access constant Ptr) return access constant opencv2_core_types_c_h.u_IplConvKernel;  -- /usr/include/opencv2/core/operations.hpp:2404
      pragma Import (CPP, operator__gt, "_ZNK2cv3PtrI14_IplConvKernelEptEv");

      function operator_88 (this : access Ptr) return access opencv2_core_types_c_h.u_IplConvKernel;  -- /usr/include/opencv2/core/operations.hpp:2406
      pragma Import (CPP, operator_88, "_ZN2cv3PtrI14_IplConvKernelEcvPS1_Ev");

      function operator_89 (this : access constant Ptr) return access constant opencv2_core_types_c_h.u_IplConvKernel;  -- /usr/include/opencv2/core/operations.hpp:2407
      pragma Import (CPP, operator_89, "_ZNK2cv3PtrI14_IplConvKernelEcvPKS1_Ev");

   end;
   use Ptr_u_IplConvKernel;



   package Class_u_InputArray is
      type u_InputArray is tagged limited record
         flags : aliased int;  -- /usr/include/opencv2/core/core.hpp:1290
         obj : System.Address;  -- /usr/include/opencv2/core/core.hpp:1291
         sz : aliased Size;  -- /usr/include/opencv2/core/core.hpp:1292
      end record;
      pragma Import (CPP, u_InputArray);

      --  skipped func _InputArray

      --  skipped func _InputArray

      --  skipped func _InputArray

      --  skipped func _InputArray

      --  skipped func _InputArray

      --  skipped func _InputArray

      function getMat (this : access constant u_InputArray; i : int) return Mat;  -- /usr/include/opencv2/core/core.hpp:1280
      pragma Import (CPP, getMat, "_ZNK2cv11_InputArray6getMatEi");

      procedure getMatVector (this : access constant u_InputArray; mv : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/core/core.hpp:1281
      pragma Import (CPP, getMatVector, "_ZNK2cv11_InputArray12getMatVectorERSt6vectorINS_3MatESaIS2_EE");

      function kind (this : access constant u_InputArray) return int;  -- /usr/include/opencv2/core/core.hpp:1282
      pragma Import (CPP, kind, "_ZNK2cv11_InputArray4kindEv");

      function size (this : access constant u_InputArray; i : int) return Size;  -- /usr/include/opencv2/core/core.hpp:1283
      pragma Import (CPP, size, "_ZNK2cv11_InputArray4sizeEi");

      function total (this : access constant u_InputArray; i : int) return stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:1284
      pragma Import (CPP, total, "_ZNK2cv11_InputArray5totalEi");

      function c_type (this : access constant u_InputArray; i : int) return int;  -- /usr/include/opencv2/core/core.hpp:1285
      pragma Import (CPP, c_type, "_ZNK2cv11_InputArray4typeEi");

      function depth (this : access constant u_InputArray; i : int) return int;  -- /usr/include/opencv2/core/core.hpp:1286
      pragma Import (CPP, depth, "_ZNK2cv11_InputArray5depthEi");

      function channels (this : access constant u_InputArray; i : int) return int;  -- /usr/include/opencv2/core/core.hpp:1287
      pragma Import (CPP, channels, "_ZNK2cv11_InputArray8channelsEi");

      function empty (this : access constant u_InputArray) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:1288
      pragma Import (CPP, empty, "_ZNK2cv11_InputArray5emptyEv");
   end;
   use Class_u_InputArray;
   package Class_u_OutputArray is
      type u_OutputArray is limited new u_InputArray with record
         null;
      end record;
      pragma Import (CPP, u_OutputArray);

      --  skipped func _OutputArray

      --  skipped func _OutputArray

      --  skipped func _OutputArray

      function fixedSize (this : access constant u_OutputArray) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:1323
      pragma Import (CPP, fixedSize, "_ZNK2cv12_OutputArray9fixedSizeEv");

      function fixedType (this : access constant u_OutputArray) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:1324
      pragma Import (CPP, fixedType, "_ZNK2cv12_OutputArray9fixedTypeEv");

      function needed (this : access constant u_OutputArray) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:1325
      pragma Import (CPP, needed, "_ZNK2cv12_OutputArray6neededEv");

      function getMatRef (this : access constant u_OutputArray; i : int) return System.Address;  -- /usr/include/opencv2/core/core.hpp:1326
      pragma Import (CPP, getMatRef, "_ZNK2cv12_OutputArray9getMatRefEi");

      procedure create
        (this : access constant u_OutputArray;
         sz : Size;
         c_type : int;
         i : int;
         allocateVector : Extensions.bool;
         fixedDepthMask : int);  -- /usr/include/opencv2/core/core.hpp:1327
      pragma Import (CPP, create, "_ZNK2cv12_OutputArray6createENS_5Size_IiEEiibi");

      procedure create
        (this : access constant u_OutputArray;
         rows : int;
         cols : int;
         c_type : int;
         i : int;
         allowTransposed : Extensions.bool;
         fixedDepthMask : int);  -- /usr/include/opencv2/core/core.hpp:1328
      pragma Import (CPP, create, "_ZNK2cv12_OutputArray6createEiiiibi");

      procedure create
        (this : access constant u_OutputArray;
         dims : int;
         size : access int;
         c_type : int;
         i : int;
         allowTransposed : Extensions.bool;
         fixedDepthMask : int);  -- /usr/include/opencv2/core/core.hpp:1329
      pragma Import (CPP, create, "_ZNK2cv12_OutputArray6createEiPKiiibi");

      procedure release (this : access constant u_OutputArray);  -- /usr/include/opencv2/core/core.hpp:1330
      pragma Import (CPP, release, "_ZNK2cv12_OutputArray7releaseEv");

      procedure clear (this : access constant u_OutputArray);  -- /usr/include/opencv2/core/core.hpp:1331
      pragma Import (CPP, clear, "_ZNK2cv12_OutputArray5clearEv");
   end;
   use Class_u_OutputArray;
   type InputArray is access constant u_InputArray;  -- /usr/include/opencv2/core/core.hpp:1334

   subtype InputArrayOfArrays is InputArray;  -- /usr/include/opencv2/core/core.hpp:1335

   type OutputArray is access constant u_OutputArray;  -- /usr/include/opencv2/core/core.hpp:1336

   subtype OutputArrayOfArrays is OutputArray;  -- /usr/include/opencv2/core/core.hpp:1337

   subtype InputOutputArray is OutputArray;  -- /usr/include/opencv2/core/core.hpp:1338

   subtype InputOutputArrayOfArrays is OutputArray;  -- /usr/include/opencv2/core/core.hpp:1339

   function noArray return OutputArray;  -- /usr/include/opencv2/core/core.hpp:1341
   pragma Import (CPP, noArray, "_ZN2cv7noArrayEv");

   function getElemSize (c_type : int) return stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:1347
   pragma Import (CPP, getElemSize, "_ZN2cvL11getElemSizeEi");

   package Class_MatAllocator is
      type MatAllocator is abstract tagged limited record
         null;
      end record;
      pragma Import (CPP, MatAllocator);

      function New_MatAllocator return MatAllocator is abstract;  -- /usr/include/opencv2/core/core.hpp:1356
      pragma CPP_Constructor (New_MatAllocator, "_ZN2cv12MatAllocatorC1Ev");

      procedure Delete_MatAllocator (this : access MatAllocator);  -- /usr/include/opencv2/core/core.hpp:1357
      pragma Import (CPP, Delete_MatAllocator, "_ZN2cv12MatAllocatorD1Ev");

      procedure deleting_dtor (this : access MatAllocator);  -- /usr/include/opencv2/core/core.hpp:1357
      pragma Import (CPP, deleting_dtor, "_ZN2cv12MatAllocatorD0Ev");

      procedure allocate
        (this : access MatAllocator;
         dims : int;
         sizes : access int;
         c_type : int;
         refcount : System.Address;
         datastart : System.Address;
         data : System.Address;
         step : access stddef_h.size_t) is abstract;  -- /usr/include/opencv2/core/core.hpp:1358

      procedure deallocate
        (this : access MatAllocator;
         refcount : access int;
         datastart : access opencv2_core_types_c_h.uchar;
         data : access opencv2_core_types_c_h.uchar) is abstract;  -- /usr/include/opencv2/core/core.hpp:1360
   end;
   use Class_MatAllocator;
   package Class_Mat is
      type Mat is limited record
         flags : aliased int;  -- /usr/include/opencv2/core/core.hpp:1843
         dims : aliased int;  -- /usr/include/opencv2/core/core.hpp:1845
         rows : aliased int;  -- /usr/include/opencv2/core/core.hpp:1847
         cols : aliased int;  -- /usr/include/opencv2/core/core.hpp:1847
         data : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:1849
         refcount : access int;  -- /usr/include/opencv2/core/core.hpp:1853
         datastart : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:1856
         dataend : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:1857
         datalimit : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:1858
         allocator : access MatAllocator;  -- /usr/include/opencv2/core/core.hpp:1861
         size : aliased MSize;  -- /usr/include/opencv2/core/core.hpp:1891
         step : aliased MStep;  -- /usr/include/opencv2/core/core.hpp:1892
      end record;
      pragma Import (CPP, Mat);

      function New_Mat return Mat;  -- /usr/include/opencv2/core/mat.hpp:58
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1Ev");

      function New_Mat
        (u_rows : int;
         u_cols : int;
         u_type : int) return Mat;  -- /usr/include/opencv2/core/mat.hpp:64
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1Eiii");

      function New_Mat (u_sz : access Size; u_type : int) return Mat;  -- /usr/include/opencv2/core/mat.hpp:79
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1ENS_5Size_IiEEi");

      function New_Mat
        (u_rows : int;
         u_cols : int;
         u_type : int;
         u_s : System.Address) return Mat;  -- /usr/include/opencv2/core/mat.hpp:71
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1EiiiRKNS_7Scalar_IdEE");

      function New_Mat
        (u_sz : access Size;
         u_type : int;
         u_s : System.Address) return Mat;  -- /usr/include/opencv2/core/mat.hpp:86
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1ENS_5Size_IiEEiRKNS_7Scalar_IdEE");

      function New_Mat
        (u_dims : int;
         u_sz : access int;
         u_type : int) return Mat;  -- /usr/include/opencv2/core/mat.hpp:94
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1EiPKii");

      function New_Mat
        (u_dims : int;
         u_sz : access int;
         u_type : int;
         u_s : System.Address) return Mat;  -- /usr/include/opencv2/core/mat.hpp:101
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1EiPKiiRKNS_7Scalar_IdEE");

      function New_Mat
        (u_rows : int;
         u_cols : int;
         u_type : int;
         u_data : System.Address;
         u_step : stddef_h.size_t) return Mat;  -- /usr/include/opencv2/core/mat.hpp:127
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1EiiiPvm");

      function New_Mat
        (u_sz : access Size;
         u_type : int;
         u_data : System.Address;
         u_step : stddef_h.size_t) return Mat;  -- /usr/include/opencv2/core/mat.hpp:149
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1ENS_5Size_IiEEiPvm");

      function New_Mat
        (u_ndims : int;
         u_sizes : access int;
         u_type : int;
         u_data : System.Address;
         u_steps : access stddef_h.size_t) return Mat;  -- /usr/include/opencv2/core/core.hpp:1597
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1EiPKiiPvPKm");

      function New_Mat
        (m : System.Address;
         rowRange : access constant c_Range;
         colRange : access constant c_Range) return Mat;  -- /usr/include/opencv2/core/core.hpp:1600
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1ERKS0_RKNS_5RangeES5_");

      function New_Mat (m : System.Address; roi : System.Address) return Mat;  -- /usr/include/opencv2/core/core.hpp:1601
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1ERKS0_RKNS_5Rect_IiEE");

      function New_Mat (m : System.Address; ranges : access constant c_Range) return Mat;  -- /usr/include/opencv2/core/core.hpp:1602
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1ERKS0_PKNS_5RangeE");

      function New_Mat (m : access constant opencv2_core_types_c_h.CvMat; copyData : Extensions.bool) return Mat;  -- /usr/include/opencv2/core/mat.hpp:172
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1EPK5CvMatb");

      function New_Mat (m : access constant opencv2_core_types_c_h.CvMatND; copyData : Extensions.bool) return Mat;  -- /usr/include/opencv2/core/core.hpp:1606
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1EPK7CvMatNDb");

      function New_Mat (img : access constant opencv2_core_types_c_h.IplImage; copyData : Extensions.bool) return Mat;  -- /usr/include/opencv2/core/core.hpp:1608
      pragma CPP_Constructor (New_Mat, "_ZN2cv3MatC1EPK9_IplImageb");

      procedure Delete_Mat (this : access Mat);  -- /usr/include/opencv2/core/mat.hpp:293
      pragma Import (CPP, Delete_Mat, "_ZN2cv3MatD1Ev");

      function operator_as (this : access Mat; m : System.Address) return access Mat;  -- /usr/include/opencv2/core/mat.hpp:300
      pragma Import (CPP, operator_as, "_ZN2cv3MataSERKS0_");

      function operator_as (this : access Mat; e : access constant opencv2_core_mat_hpp.Class_MatExpr.MatExpr) return access Mat;  -- /usr/include/opencv2/core/mat.hpp:1371
      pragma Import (CPP, operator_as, "_ZN2cv3MataSERKNS_7MatExprE");

      function row (this : access constant Mat; y : int) return Mat;  -- /usr/include/opencv2/core/mat.hpp:328
      pragma Import (CPP, row, "_ZNK2cv3Mat3rowEi");

      function col (this : access constant Mat; x : int) return Mat;  -- /usr/include/opencv2/core/mat.hpp:329
      pragma Import (CPP, col, "_ZNK2cv3Mat3colEi");

      function rowRange
        (this : access constant Mat;
         startrow : int;
         endrow : int) return Mat;  -- /usr/include/opencv2/core/mat.hpp:330
      pragma Import (CPP, rowRange, "_ZNK2cv3Mat8rowRangeEii");

      function rowRange (this : access constant Mat; r : access constant c_Range) return Mat;  -- /usr/include/opencv2/core/mat.hpp:332
      pragma Import (CPP, rowRange, "_ZNK2cv3Mat8rowRangeERKNS_5RangeE");

      function colRange
        (this : access constant Mat;
         startcol : int;
         endcol : int) return Mat;  -- /usr/include/opencv2/core/mat.hpp:334
      pragma Import (CPP, colRange, "_ZNK2cv3Mat8colRangeEii");

      function colRange (this : access constant Mat; r : access constant c_Range) return Mat;  -- /usr/include/opencv2/core/mat.hpp:336
      pragma Import (CPP, colRange, "_ZNK2cv3Mat8colRangeERKNS_5RangeE");

      function diag (this : access constant Mat; d : int) return Mat;  -- /usr/include/opencv2/core/core.hpp:1643
      pragma Import (CPP, diag, "_ZNK2cv3Mat4diagEi");

      function diag (d : System.Address) return Mat;  -- /usr/include/opencv2/core/mat.hpp:339
      pragma Import (CPP, diag, "_ZN2cv3Mat4diagERKS0_");

      function clone (this : access constant Mat) return Mat;  -- /usr/include/opencv2/core/mat.hpp:347
      pragma Import (CPP, clone, "_ZNK2cv3Mat5cloneEv");

      procedure copyTo (this : access constant Mat; m : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:1651
      pragma Import (CPP, copyTo, "_ZNK2cv3Mat6copyToERKNS_12_OutputArrayE");

      procedure copyTo
        (this : access constant Mat;
         m : OutputArray'Class;
         mask : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:1653
      pragma Import (CPP, copyTo, "_ZNK2cv3Mat6copyToERKNS_12_OutputArrayERKNS_11_InputArrayE");

      procedure convertTo
        (this : access constant Mat;
         m : OutputArray'Class;
         rtype : int;
         alpha : double;
         beta : double);  -- /usr/include/opencv2/core/core.hpp:1655
      pragma Import (CPP, convertTo, "_ZNK2cv3Mat9convertToERKNS_12_OutputArrayEidd");

      procedure assignTo
        (this : access constant Mat;
         m : access Mat;
         c_type : int);  -- /usr/include/opencv2/core/mat.hpp:354
      pragma Import (CPP, assignTo, "_ZNK2cv3Mat8assignToERS0_i");

      function operator_as (this : access Mat; s : System.Address) return access Mat;  -- /usr/include/opencv2/core/core.hpp:1660
      pragma Import (CPP, operator_as, "_ZN2cv3MataSERKNS_7Scalar_IdEE");

      function setTo
        (this : access Mat;
         value : InputArray'Class;
         mask : InputArray'Class) return access Mat;  -- /usr/include/opencv2/core/core.hpp:1662
      pragma Import (CPP, setTo, "_ZN2cv3Mat5setToERKNS_11_InputArrayES3_");

      function reshape
        (this : access constant Mat;
         u_cn : int;
         u_rows : int) return Mat;  -- /usr/include/opencv2/core/core.hpp:1665
      pragma Import (CPP, reshape, "_ZNK2cv3Mat7reshapeEii");

      function reshape
        (this : access constant Mat;
         u_cn : int;
         u_newndims : int;
         u_newsz : access int) return Mat;  -- /usr/include/opencv2/core/core.hpp:1666
      pragma Import (CPP, reshape, "_ZNK2cv3Mat7reshapeEiiPKi");

      function t (this : access constant Mat) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1669
      pragma Import (CPP, t, "_ZNK2cv3Mat1tEv");

      function inv (this : access constant Mat; method : int) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1671
      pragma Import (CPP, inv, "_ZNK2cv3Mat3invEi");

      function mul
        (this : access constant Mat;
         m : InputArray'Class;
         scale : double) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1673
      pragma Import (CPP, mul, "_ZNK2cv3Mat3mulERKNS_11_InputArrayEd");

      function cross (this : access constant Mat; m : InputArray'Class) return Mat;  -- /usr/include/opencv2/core/core.hpp:1676
      pragma Import (CPP, cross, "_ZNK2cv3Mat5crossERKNS_11_InputArrayE");

      function dot (this : access constant Mat; m : InputArray'Class) return double;  -- /usr/include/opencv2/core/core.hpp:1678
      pragma Import (CPP, dot, "_ZNK2cv3Mat3dotERKNS_11_InputArrayE");

      function zeros
        (rows : int;
         cols : int;
         c_type : int) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1681
      pragma Import (CPP, zeros, "_ZN2cv3Mat5zerosEiii");

      function zeros (the_size : Size; c_type : int) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1682
      pragma Import (CPP, zeros, "_ZN2cv3Mat5zerosENS_5Size_IiEEi");

      function zeros
        (ndims : int;
         sz : access int;
         c_type : int) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1683
      pragma Import (CPP, zeros, "_ZN2cv3Mat5zerosEiPKii");

      function ones
        (rows : int;
         cols : int;
         c_type : int) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1684
      pragma Import (CPP, ones, "_ZN2cv3Mat4onesEiii");

      function ones (the_size : Size; c_type : int) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1685
      pragma Import (CPP, ones, "_ZN2cv3Mat4onesENS_5Size_IiEEi");

      function ones
        (ndims : int;
         sz : access int;
         c_type : int) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1686
      pragma Import (CPP, ones, "_ZN2cv3Mat4onesEiPKii");

      function eye
        (rows : int;
         cols : int;
         c_type : int) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1687
      pragma Import (CPP, eye, "_ZN2cv3Mat3eyeEiii");

      function eye (the_size : Size; c_type : int) return opencv2_core_mat_hpp.Class_MatExpr.MatExpr;  -- /usr/include/opencv2/core/core.hpp:1688
      pragma Import (CPP, eye, "_ZN2cv3Mat3eyeENS_5Size_IiEEi");

      procedure create
        (this : access Mat;
         u_rows : int;
         u_cols : int;
         u_type : int);  -- /usr/include/opencv2/core/mat.hpp:362
      pragma Import (CPP, create, "_ZN2cv3Mat6createEiii");

      procedure create
        (this : access Mat;
         u_sz : access Size;
         u_type : int);  -- /usr/include/opencv2/core/mat.hpp:371
      pragma Import (CPP, create, "_ZN2cv3Mat6createENS_5Size_IiEEi");

      procedure create
        (this : access Mat;
         u_ndims : int;
         u_sizes : access int;
         u_type : int);  -- /usr/include/opencv2/core/core.hpp:1694
      pragma Import (CPP, create, "_ZN2cv3Mat6createEiPKii");

      procedure addref (this : access Mat);  -- /usr/include/opencv2/core/mat.hpp:376
      pragma Import (CPP, addref, "_ZN2cv3Mat6addrefEv");

      procedure release (this : access Mat);  -- /usr/include/opencv2/core/mat.hpp:379
      pragma Import (CPP, release, "_ZN2cv3Mat7releaseEv");

      procedure deallocate (this : access Mat);  -- /usr/include/opencv2/core/core.hpp:1703
      pragma Import (CPP, deallocate, "_ZN2cv3Mat10deallocateEv");

      procedure copySize (this : access Mat; m : System.Address);  -- /usr/include/opencv2/core/core.hpp:1705
      pragma Import (CPP, copySize, "_ZN2cv3Mat8copySizeERKS0_");

      procedure reserve (this : access Mat; sz : stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:1708
      pragma Import (CPP, reserve, "_ZN2cv3Mat7reserveEm");

      procedure resize (this : access Mat; sz : stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:1710
      pragma Import (CPP, resize, "_ZN2cv3Mat6resizeEm");

      procedure resize
        (this : access Mat;
         sz : stddef_h.size_t;
         s : System.Address);  -- /usr/include/opencv2/core/core.hpp:1712
      pragma Import (CPP, resize, "_ZN2cv3Mat6resizeEmRKNS_7Scalar_IdEE");

      procedure push_back_u (this : access Mat; elem : System.Address);  -- /usr/include/opencv2/core/core.hpp:1714
      pragma Import (CPP, push_back_u, "_ZN2cv3Mat10push_back_EPKv");

      procedure push_back (this : access Mat; m : System.Address);  -- /usr/include/opencv2/core/core.hpp:1718
      pragma Import (CPP, push_back, "_ZN2cv3Mat9push_backERKS0_");

      procedure pop_back (this : access Mat; nelems : stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:1720
      pragma Import (CPP, pop_back, "_ZN2cv3Mat8pop_backEm");

      procedure locateROI
        (this : access constant Mat;
         wholeSize : access Size;
         ofs : access Point);  -- /usr/include/opencv2/core/core.hpp:1723
      pragma Import (CPP, locateROI, "_ZNK2cv3Mat9locateROIERNS_5Size_IiEERNS_6Point_IiEE");

      function adjustROI
        (this : access Mat;
         dtop : int;
         dbottom : int;
         dleft : int;
         dright : int) return access Mat;  -- /usr/include/opencv2/core/core.hpp:1725
      pragma Import (CPP, adjustROI, "_ZN2cv3Mat9adjustROIEiiii");

      function operator_op
        (this : access constant Mat;
         rowRange : c_Range;
         colRange : c_Range) return Mat;  -- /usr/include/opencv2/core/mat.hpp:388
      pragma Import (CPP, operator_op, "_ZNK2cv3MatclENS_5RangeES1_");

      function operator_op (this : access constant Mat; roi : System.Address) return Mat;  -- /usr/include/opencv2/core/mat.hpp:393
      pragma Import (CPP, operator_op, "_ZNK2cv3MatclERKNS_5Rect_IiEE");

      function operator_op (this : access constant Mat; ranges : access constant c_Range) return Mat;  -- /usr/include/opencv2/core/mat.hpp:396
      pragma Import (CPP, operator_op, "_ZNK2cv3MatclEPKNS_5RangeE");

      function operator_29 (this : access constant Mat) return opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/mat.hpp:401
      pragma Import (CPP, operator_29, "_ZNK2cv3Matcv5CvMatEv");

      function operator_30 (this : access constant Mat) return opencv2_core_types_c_h.CvMatND;  -- /usr/include/opencv2/core/core.hpp:1735
      pragma Import (CPP, operator_30, "_ZNK2cv3Matcv7CvMatNDEv");

      function operator_31 (this : access constant Mat) return opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/core/core.hpp:1737
      pragma Import (CPP, operator_31, "_ZNK2cv3Matcv9_IplImageEv");

      function isContinuous (this : access constant Mat) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:410
      pragma Import (CPP, isContinuous, "_ZNK2cv3Mat12isContinuousEv");

      function isSubmatrix (this : access constant Mat) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:411
      pragma Import (CPP, isSubmatrix, "_ZNK2cv3Mat11isSubmatrixEv");

      function elemSize (this : access constant Mat) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:412
      pragma Import (CPP, elemSize, "_ZNK2cv3Mat8elemSizeEv");

      function elemSize1 (this : access constant Mat) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:413
      pragma Import (CPP, elemSize1, "_ZNK2cv3Mat9elemSize1Ev");

      function c_type (this : access constant Mat) return int;  -- /usr/include/opencv2/core/mat.hpp:414
      pragma Import (CPP, c_type, "_ZNK2cv3Mat4typeEv");

      function depth (this : access constant Mat) return int;  -- /usr/include/opencv2/core/mat.hpp:415
      pragma Import (CPP, depth, "_ZNK2cv3Mat5depthEv");

      function channels (this : access constant Mat) return int;  -- /usr/include/opencv2/core/mat.hpp:416
      pragma Import (CPP, channels, "_ZNK2cv3Mat8channelsEv");

      function step1 (this : access constant Mat; i : int) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:417
      pragma Import (CPP, step1, "_ZNK2cv3Mat5step1Ei");

      function empty (this : access constant Mat) return Extensions.bool;  -- /usr/include/opencv2/core/mat.hpp:418
      pragma Import (CPP, empty, "_ZNK2cv3Mat5emptyEv");

      function total (this : access constant Mat) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:419
      pragma Import (CPP, total, "_ZNK2cv3Mat5totalEv");

      function checkVector
        (this : access constant Mat;
         elemChannels : int;
         depth : int;
         requireContinuous : Extensions.bool) return int;  -- /usr/include/opencv2/core/core.hpp:1770
      pragma Import (CPP, checkVector, "_ZNK2cv3Mat11checkVectorEiib");

      function ptr (this : access Mat; y : int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/mat.hpp:429
      pragma Import (CPP, ptr, "_ZN2cv3Mat3ptrEi");

      function ptr (this : access constant Mat; y : int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/mat.hpp:435
      pragma Import (CPP, ptr, "_ZNK2cv3Mat3ptrEi");

      function ptr
        (this : access Mat;
         i0 : int;
         i1 : int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/mat.hpp:454
      pragma Import (CPP, ptr, "_ZN2cv3Mat3ptrEii");

      function ptr
        (this : access constant Mat;
         i0 : int;
         i1 : int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/mat.hpp:462
      pragma Import (CPP, ptr, "_ZNK2cv3Mat3ptrEii");

      function ptr
        (this : access Mat;
         i0 : int;
         i1 : int;
         i2 : int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/mat.hpp:486
      pragma Import (CPP, ptr, "_ZN2cv3Mat3ptrEiii");

      function ptr
        (this : access constant Mat;
         i0 : int;
         i1 : int;
         i2 : int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/mat.hpp:495
      pragma Import (CPP, ptr, "_ZNK2cv3Mat3ptrEiii");

      function ptr (this : access Mat; idx : access int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/mat.hpp:522
      pragma Import (CPP, ptr, "_ZN2cv3Mat3ptrEPKi");

      function ptr (this : access constant Mat; idx : access int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/mat.hpp:535
      pragma Import (CPP, ptr, "_ZNK2cv3Mat3ptrEPKi");


   end;
   use Class_Mat;
   package Class_RNG is
      type RNG is limited record
         state : aliased opencv2_core_types_c_h.uint64;  -- /usr/include/opencv2/core/core.hpp:1932
      end record;
      pragma Import (CPP, RNG);

      function New_RNG return RNG;  -- /usr/include/opencv2/core/operations.hpp:2246
      pragma CPP_Constructor (New_RNG, "_ZN2cv3RNGC1Ev");

      function New_RNG (u_state : opencv2_core_types_c_h.uint64) return RNG;  -- /usr/include/opencv2/core/operations.hpp:2247
      pragma CPP_Constructor (New_RNG, "_ZN2cv3RNGC1Em");

      function next (this : access RNG) return unsigned;  -- /usr/include/opencv2/core/operations.hpp:2248
      pragma Import (CPP, next, "_ZN2cv3RNG4nextEv");

      function operator_37 (this : access RNG) return opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/operations.hpp:2254
      pragma Import (CPP, operator_37, "_ZN2cv3RNGcvhEv");

      function operator_38 (this : access RNG) return opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/core/operations.hpp:2255
      pragma Import (CPP, operator_38, "_ZN2cv3RNGcvaEv");

      function operator_39 (this : access RNG) return opencv2_core_types_c_h.ushort;  -- /usr/include/opencv2/core/operations.hpp:2256
      pragma Import (CPP, operator_39, "_ZN2cv3RNGcvtEv");

      function operator_40 (this : access RNG) return short;  -- /usr/include/opencv2/core/operations.hpp:2257
      pragma Import (CPP, operator_40, "_ZN2cv3RNGcvsEv");

      function operator_41 (this : access RNG) return unsigned;  -- /usr/include/opencv2/core/operations.hpp:2258
      pragma Import (CPP, operator_41, "_ZN2cv3RNGcvjEv");

      function operator_op (this : access RNG; N : unsigned) return unsigned;  -- /usr/include/opencv2/core/operations.hpp:2259
      pragma Import (CPP, operator_op, "_ZN2cv3RNGclEj");

      function operator_op (this : access RNG) return unsigned;  -- /usr/include/opencv2/core/operations.hpp:2260
      pragma Import (CPP, operator_op, "_ZN2cv3RNGclEv");

      function operator_42 (this : access RNG) return int;  -- /usr/include/opencv2/core/operations.hpp:2261
      pragma Import (CPP, operator_42, "_ZN2cv3RNGcviEv");

      function operator_43 (this : access RNG) return float;  -- /usr/include/opencv2/core/operations.hpp:2263
      pragma Import (CPP, operator_43, "_ZN2cv3RNGcvfEv");

      function operator_44 (this : access RNG) return double;  -- /usr/include/opencv2/core/operations.hpp:2264
      pragma Import (CPP, operator_44, "_ZN2cv3RNGcvdEv");

      function uniform
        (this : access RNG;
         a : int;
         b : int) return int;  -- /usr/include/opencv2/core/operations.hpp:2269
      pragma Import (CPP, uniform, "_ZN2cv3RNG7uniformEii");

      function uniform
        (this : access RNG;
         a : float;
         b : float) return float;  -- /usr/include/opencv2/core/operations.hpp:2270
      pragma Import (CPP, uniform, "_ZN2cv3RNG7uniformEff");

      function uniform
        (this : access RNG;
         a : double;
         b : double) return double;  -- /usr/include/opencv2/core/operations.hpp:2271
      pragma Import (CPP, uniform, "_ZN2cv3RNG7uniformEdd");

      procedure fill
        (this : access RNG;
         mat : InputOutputArray'Class;
         distType : int;
         a : InputArray'Class;
         b : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:1928
      pragma Import (CPP, fill, "_ZN2cv3RNG4fillERKNS_12_OutputArrayEiRKNS_11_InputArrayES6_");

      function gaussian (this : access RNG; sigma : double) return double;  -- /usr/include/opencv2/core/core.hpp:1930
      pragma Import (CPP, gaussian, "_ZN2cv3RNG8gaussianEd");
   end;
   use Class_RNG;
   package Class_TermCriteria is
      type TermCriteria is limited record
         c_type : aliased int;  -- /usr/include/opencv2/core/core.hpp:1958
         maxCount : aliased int;  -- /usr/include/opencv2/core/core.hpp:1959
         epsilon : aliased double;  -- /usr/include/opencv2/core/core.hpp:1960
      end record;
      pragma Import (CPP, TermCriteria);

      function New_TermCriteria return TermCriteria;  -- /usr/include/opencv2/core/operations.hpp:2273
      pragma CPP_Constructor (New_TermCriteria, "_ZN2cv12TermCriteriaC1Ev");

      function New_TermCriteria
        (u_type : int;
         u_maxCount : int;
         u_epsilon : double) return TermCriteria;  -- /usr/include/opencv2/core/operations.hpp:2274
      pragma CPP_Constructor (New_TermCriteria, "_ZN2cv12TermCriteriaC1Eiid");

      function New_TermCriteria (criteria : access constant opencv2_core_types_c_h.CvTermCriteria) return TermCriteria;  -- /usr/include/opencv2/core/operations.hpp:2276
      pragma CPP_Constructor (New_TermCriteria, "_ZN2cv12TermCriteriaC1ERK14CvTermCriteria");

      function operator_45 (this : access constant TermCriteria) return opencv2_core_types_c_h.CvTermCriteria;  -- /usr/include/opencv2/core/operations.hpp:2278
      pragma Import (CPP, operator_45, "_ZNK2cv12TermCriteriacv14CvTermCriteriaEv");
   end;
   use Class_TermCriteria;
   procedure swap (a : access Mat; b : access Mat);  -- /usr/include/opencv2/core/core.hpp:1965
   pragma Import (CPP, swap, "_ZN2cv4swapERNS_3MatES1_");

   function cvarrToMat
     (arr : System.Address;
      copyData : Extensions.bool;
      allowND : Extensions.bool;
      coiMode : int) return Mat;  -- /usr/include/opencv2/core/core.hpp:1968
   pragma Import (CPP, cvarrToMat, "_ZN2cv10cvarrToMatEPKvbbi");

   procedure extractImageCOI
     (arr : System.Address;
      coiimg : OutputArray'Class;
      coi : int);  -- /usr/include/opencv2/core/core.hpp:1971
   pragma Import (CPP, extractImageCOI, "_ZN2cv15extractImageCOIEPKvRKNS_12_OutputArrayEi");

   procedure insertImageCOI
     (coiimg : InputArray'Class;
      arr : System.Address;
      coi : int);  -- /usr/include/opencv2/core/core.hpp:1973
   pragma Import (CPP, insertImageCOI, "_ZN2cv14insertImageCOIERKNS_11_InputArrayEPvi");

   procedure add
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class;
      mask : InputArray'Class;
      dtype : int);  -- /usr/include/opencv2/core/core.hpp:1976
   pragma Import (CPP, add, "_ZN2cv3addERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_i");

   procedure subtract
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class;
      mask : InputArray'Class;
      dtype : int);  -- /usr/include/opencv2/core/core.hpp:1979
   pragma Import (CPP, subtract, "_ZN2cv8subtractERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_i");

   procedure multiply
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class;
      scale : double;
      dtype : int);  -- /usr/include/opencv2/core/core.hpp:1983
   pragma Import (CPP, multiply, "_ZN2cv8multiplyERKNS_11_InputArrayES2_RKNS_12_OutputArrayEdi");

   procedure divide
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class;
      scale : double;
      dtype : int);  -- /usr/include/opencv2/core/core.hpp:1987
   pragma Import (CPP, divide, "_ZN2cv6divideERKNS_11_InputArrayES2_RKNS_12_OutputArrayEdi");

   procedure divide
     (scale : double;
      src2 : InputArray'Class;
      dst : OutputArray'Class;
      dtype : int);  -- /usr/include/opencv2/core/core.hpp:1991
   pragma Import (CPP, divide, "_ZN2cv6divideEdRKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure scaleAdd
     (src1 : InputArray'Class;
      alpha : double;
      src2 : InputArray'Class;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:1995
   pragma Import (CPP, scaleAdd, "_ZN2cv8scaleAddERKNS_11_InputArrayEdS2_RKNS_12_OutputArrayE");

   procedure addWeighted
     (src1 : InputArray'Class;
      alpha : double;
      src2 : InputArray'Class;
      beta : double;
      gamma : double;
      dst : OutputArray'Class;
      dtype : int);  -- /usr/include/opencv2/core/core.hpp:1998
   pragma Import (CPP, addWeighted, "_ZN2cv11addWeightedERKNS_11_InputArrayEdS2_ddRKNS_12_OutputArrayEi");

   procedure convertScaleAbs
     (src : InputArray'Class;
      dst : OutputArray'Class;
      alpha : double;
      beta : double);  -- /usr/include/opencv2/core/core.hpp:2002
   pragma Import (CPP, convertScaleAbs, "_ZN2cv15convertScaleAbsERKNS_11_InputArrayERKNS_12_OutputArrayEdd");

   procedure LUT
     (src : InputArray'Class;
      lut : InputArray'Class;
      dst : OutputArray'Class;
      interpolation : int);  -- /usr/include/opencv2/core/core.hpp:2005
   pragma Import (CPP, LUT, "_ZN2cv3LUTERKNS_11_InputArrayES2_RKNS_12_OutputArrayEi");

   function sum (src : InputArray'Class) return Scalar;  -- /usr/include/opencv2/core/core.hpp:2009
   pragma Import (CPP, sum, "_ZN2cv3sumERKNS_11_InputArrayE");

   function countNonZero (src : InputArray'Class) return int;  -- /usr/include/opencv2/core/core.hpp:2011
   pragma Import (CPP, countNonZero, "_ZN2cv12countNonZeroERKNS_11_InputArrayE");

   function mean (src : InputArray'Class; mask : InputArray'Class) return Scalar;  -- /usr/include/opencv2/core/core.hpp:2013
   pragma Import (CPP, mean, "_ZN2cv4meanERKNS_11_InputArrayES2_");

   procedure meanStdDev
     (src : InputArray'Class;
      mean : OutputArray'Class;
      stddev : OutputArray'Class;
      mask : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2015
   pragma Import (CPP, meanStdDev, "_ZN2cv10meanStdDevERKNS_11_InputArrayERKNS_12_OutputArrayES5_S2_");

   function norm
     (src1 : InputArray'Class;
      normType : int;
      mask : InputArray'Class) return double;  -- /usr/include/opencv2/core/core.hpp:2018
   pragma Import (CPP, norm, "_ZN2cv4normERKNS_11_InputArrayEiS2_");

   function norm
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      normType : int;
      mask : InputArray'Class) return double;  -- /usr/include/opencv2/core/core.hpp:2020
   pragma Import (CPP, norm, "_ZN2cv4normERKNS_11_InputArrayES2_iS2_");

   procedure normalize
     (src : InputArray'Class;
      dst : OutputArray'Class;
      alpha : double;
      beta : double;
      norm_type : int;
      dtype : int;
      mask : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2023
   pragma Import (CPP, normalize, "_ZN2cv9normalizeERKNS_11_InputArrayERKNS_12_OutputArrayEddiiS2_");

   procedure minMaxLoc
     (src : InputArray'Class;
      minVal : access double;
      maxVal : access double;
      minLoc : access Point;
      maxLoc : access Point;
      mask : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2027
   pragma Import (CPP, minMaxLoc, "_ZN2cv9minMaxLocERKNS_11_InputArrayEPdS3_PNS_6Point_IiEES6_S2_");

   procedure minMaxIdx
     (src : InputArray'Class;
      minVal : access double;
      maxVal : access double;
      minIdx : access int;
      maxIdx : access int;
      mask : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2030
   pragma Import (CPP, minMaxIdx, "_ZN2cv9minMaxIdxERKNS_11_InputArrayEPdS3_PiS4_S2_");

   procedure reduce
     (src : InputArray'Class;
      dst : OutputArray'Class;
      dim : int;
      rtype : int;
      dtype : int);  -- /usr/include/opencv2/core/core.hpp:2034
   pragma Import (CPP, reduce, "_ZN2cv6reduceERKNS_11_InputArrayERKNS_12_OutputArrayEiii");

   procedure merge
     (mv : access constant Mat;
      count : stddef_h.size_t;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2037
   pragma Import (CPP, merge, "_ZN2cv5mergeEPKNS_3MatEmRKNS_12_OutputArrayE");

   procedure merge (mv : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector; dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2039
   pragma Import (CPP, merge, "_ZN2cv5mergeERKSt6vectorINS_3MatESaIS1_EERKNS_12_OutputArrayE");

   procedure split (src : access constant Mat; mvbegin : access Mat);  -- /usr/include/opencv2/core/core.hpp:2042
   pragma Import (CPP, split, "_ZN2cv5splitERKNS_3MatEPS0_");

   procedure split (m : access constant Mat; mv : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/core/core.hpp:2044
   pragma Import (CPP, split, "_ZN2cv5splitERKNS_3MatERSt6vectorIS0_SaIS0_EE");

   procedure mixChannels
     (src : access constant Mat;
      nsrcs : stddef_h.size_t;
      dst : access Mat;
      ndsts : stddef_h.size_t;
      fromTo : access int;
      npairs : stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:2047
   pragma Import (CPP, mixChannels, "_ZN2cv11mixChannelsEPKNS_3MatEmPS0_mPKim");

   procedure mixChannels
     (src : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      dst : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      fromTo : access int;
      npairs : stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:2049
   pragma Import (CPP, mixChannels, "_ZN2cv11mixChannelsERKSt6vectorINS_3MatESaIS1_EERS3_PKim");

   procedure mixChannels
     (src : InputArrayOfArrays'Class;
      dst : InputArrayOfArrays'Class;
      fromTo : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/core/core.hpp:2051
   pragma Import (CPP, mixChannels, "_ZN2cv11mixChannelsERKNS_11_InputArrayES2_RKSt6vectorIiSaIiEE");

   procedure extractChannel
     (src : InputArray'Class;
      dst : OutputArray'Class;
      coi : int);  -- /usr/include/opencv2/core/core.hpp:2055
   pragma Import (CPP, extractChannel, "_ZN2cv14extractChannelERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure insertChannel
     (src : InputArray'Class;
      dst : InputOutputArray'Class;
      coi : int);  -- /usr/include/opencv2/core/core.hpp:2058
   pragma Import (CPP, insertChannel, "_ZN2cv13insertChannelERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure flip
     (src : InputArray'Class;
      dst : OutputArray'Class;
      flipCode : int);  -- /usr/include/opencv2/core/core.hpp:2061
   pragma Import (CPP, flip, "_ZN2cv4flipERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure repeat
     (src : InputArray'Class;
      ny : int;
      nx : int;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2064
   pragma Import (CPP, repeat, "_ZN2cv6repeatERKNS_11_InputArrayEiiRKNS_12_OutputArrayE");

   function repeat
     (src : access constant Mat;
      ny : int;
      nx : int) return Mat;  -- /usr/include/opencv2/core/core.hpp:2065
   pragma Import (CPP, repeat, "_ZN2cv6repeatERKNS_3MatEii");

   procedure hconcat
     (src : access constant Mat;
      nsrc : stddef_h.size_t;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2067
   pragma Import (CPP, hconcat, "_ZN2cv7hconcatEPKNS_3MatEmRKNS_12_OutputArrayE");

   procedure hconcat
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2068
   pragma Import (CPP, hconcat, "_ZN2cv7hconcatERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   procedure hconcat (src : InputArray'Class; dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2069
   pragma Import (CPP, hconcat, "_ZN2cv7hconcatERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure vconcat
     (src : access constant Mat;
      nsrc : stddef_h.size_t;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2071
   pragma Import (CPP, vconcat, "_ZN2cv7vconcatEPKNS_3MatEmRKNS_12_OutputArrayE");

   procedure vconcat
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2072
   pragma Import (CPP, vconcat, "_ZN2cv7vconcatERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   procedure vconcat (src : InputArray'Class; dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2073
   pragma Import (CPP, vconcat, "_ZN2cv7vconcatERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure bitwise_and
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class;
      mask : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2076
   pragma Import (CPP, bitwise_and, "_ZN2cv11bitwise_andERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_");

   procedure bitwise_or
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class;
      mask : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2079
   pragma Import (CPP, bitwise_or, "_ZN2cv10bitwise_orERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_");

   procedure bitwise_xor
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class;
      mask : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2082
   pragma Import (CPP, bitwise_xor, "_ZN2cv11bitwise_xorERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_");

   procedure bitwise_not
     (src : InputArray'Class;
      dst : OutputArray'Class;
      mask : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2085
   pragma Import (CPP, bitwise_not, "_ZN2cv11bitwise_notERKNS_11_InputArrayERKNS_12_OutputArrayES2_");

   procedure absdiff
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2088
   pragma Import (CPP, absdiff, "_ZN2cv7absdiffERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   procedure inRange
     (src : InputArray'Class;
      lowerb : InputArray'Class;
      upperb : InputArray'Class;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2090
   pragma Import (CPP, inRange, "_ZN2cv7inRangeERKNS_11_InputArrayES2_S2_RKNS_12_OutputArrayE");

   procedure compare
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class;
      cmpop : int);  -- /usr/include/opencv2/core/core.hpp:2093
   pragma Import (CPP, compare, "_ZN2cv7compareERKNS_11_InputArrayES2_RKNS_12_OutputArrayEi");

   procedure min
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2095
   pragma Import (CPP, min, "_ZN2cv3minERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   procedure max
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2097
   pragma Import (CPP, max, "_ZN2cv3maxERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   procedure min
     (src1 : access constant Mat;
      src2 : access constant Mat;
      dst : access Mat);  -- /usr/include/opencv2/core/core.hpp:2100
   pragma Import (CPP, min, "_ZN2cv3minERKNS_3MatES2_RS0_");

   procedure min
     (src1 : access constant Mat;
      src2 : double;
      dst : access Mat);  -- /usr/include/opencv2/core/core.hpp:2102
   pragma Import (CPP, min, "_ZN2cv3minERKNS_3MatEdRS0_");

   procedure max
     (src1 : access constant Mat;
      src2 : access constant Mat;
      dst : access Mat);  -- /usr/include/opencv2/core/core.hpp:2104
   pragma Import (CPP, max, "_ZN2cv3maxERKNS_3MatES2_RS0_");

   procedure max
     (src1 : access constant Mat;
      src2 : double;
      dst : access Mat);  -- /usr/include/opencv2/core/core.hpp:2106
   pragma Import (CPP, max, "_ZN2cv3maxERKNS_3MatEdRS0_");

   procedure sqrt (src : InputArray'Class; dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2109
   pragma Import (CPP, sqrt, "_ZN2cv4sqrtERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure pow
     (src : InputArray'Class;
      power : double;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2111
   pragma Import (CPP, pow, "_ZN2cv3powERKNS_11_InputArrayEdRKNS_12_OutputArrayE");

   procedure exp (src : InputArray'Class; dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2113
   pragma Import (CPP, exp, "_ZN2cv3expERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure log (src : InputArray'Class; dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2115
   pragma Import (CPP, log, "_ZN2cv3logERKNS_11_InputArrayERKNS_12_OutputArrayE");

   function cubeRoot (val : float) return float;  -- /usr/include/opencv2/core/core.hpp:2117
   pragma Import (CPP, cubeRoot, "_ZN2cv8cubeRootEf");

   function fastAtan2 (y : float; x : float) return float;  -- /usr/include/opencv2/core/core.hpp:2119
   pragma Import (CPP, fastAtan2, "_ZN2cv9fastAtan2Eff");

   procedure polarToCart
     (magnitude : InputArray'Class;
      angle : InputArray'Class;
      x : OutputArray'Class;
      y : OutputArray'Class;
      angleInDegrees : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:2121
   pragma Import (CPP, polarToCart, "_ZN2cv11polarToCartERKNS_11_InputArrayES2_RKNS_12_OutputArrayES5_b");

   procedure cartToPolar
     (x : InputArray'Class;
      y : InputArray'Class;
      magnitude : OutputArray'Class;
      angle : OutputArray'Class;
      angleInDegrees : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:2124
   pragma Import (CPP, cartToPolar, "_ZN2cv11cartToPolarERKNS_11_InputArrayES2_RKNS_12_OutputArrayES5_b");

   procedure phase
     (x : InputArray'Class;
      y : InputArray'Class;
      angle : OutputArray'Class;
      angleInDegrees : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:2128
   pragma Import (CPP, phase, "_ZN2cv5phaseERKNS_11_InputArrayES2_RKNS_12_OutputArrayEb");

   procedure magnitude
     (x : InputArray'Class;
      y : InputArray'Class;
      magnitude : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2131
   pragma Import (CPP, magnitude, "_ZN2cv9magnitudeERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   function checkRange
     (a : InputArray'Class;
      quiet : Extensions.bool;
      pt : access Point;
      minVal : double;
      maxVal : double) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:2133
   pragma Import (CPP, checkRange, "_ZN2cv10checkRangeERKNS_11_InputArrayEbPNS_6Point_IiEEdd");

   procedure gemm
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      alpha : double;
      src3 : InputArray'Class;
      gamma : double;
      dst : OutputArray'Class;
      flags : int);  -- /usr/include/opencv2/core/core.hpp:2136
   pragma Import (CPP, gemm, "_ZN2cv4gemmERKNS_11_InputArrayES2_dS2_dRKNS_12_OutputArrayEi");

   procedure mulTransposed
     (src : InputArray'Class;
      dst : OutputArray'Class;
      aTa : Extensions.bool;
      c_delta : InputArray'Class;
      scale : double;
      dtype : int);  -- /usr/include/opencv2/core/core.hpp:2139
   pragma Import (CPP, mulTransposed, "_ZN2cv13mulTransposedERKNS_11_InputArrayERKNS_12_OutputArrayEbS2_di");

   procedure transpose (src : InputArray'Class; dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2143
   pragma Import (CPP, transpose, "_ZN2cv9transposeERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure transform
     (src : InputArray'Class;
      dst : OutputArray'Class;
      m : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2145
   pragma Import (CPP, transform, "_ZN2cv9transformERKNS_11_InputArrayERKNS_12_OutputArrayES2_");

   procedure perspectiveTransform
     (src : InputArray'Class;
      dst : OutputArray'Class;
      m : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2147
   pragma Import (CPP, perspectiveTransform, "_ZN2cv20perspectiveTransformERKNS_11_InputArrayERKNS_12_OutputArrayES2_");

   procedure completeSymm (mtx : InputOutputArray'Class; lowerToUpper : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:2150
   pragma Import (CPP, completeSymm, "_ZN2cv12completeSymmERKNS_12_OutputArrayEb");

   procedure setIdentity (mtx : InputOutputArray'Class; s : System.Address);  -- /usr/include/opencv2/core/core.hpp:2152
   pragma Import (CPP, setIdentity, "_ZN2cv11setIdentityERKNS_12_OutputArrayERKNS_7Scalar_IdEE");

   function determinant (mtx : InputArray'Class) return double;  -- /usr/include/opencv2/core/core.hpp:2154
   pragma Import (CPP, determinant, "_ZN2cv11determinantERKNS_11_InputArrayE");

   function trace (mtx : InputArray'Class) return Scalar;  -- /usr/include/opencv2/core/core.hpp:2156
   pragma Import (CPP, trace, "_ZN2cv5traceERKNS_11_InputArrayE");

   function invert
     (src : InputArray'Class;
      dst : OutputArray'Class;
      flags : int) return double;  -- /usr/include/opencv2/core/core.hpp:2158
   pragma Import (CPP, invert, "_ZN2cv6invertERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   function solve
     (src1 : InputArray'Class;
      src2 : InputArray'Class;
      dst : OutputArray'Class;
      flags : int) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:2160
   pragma Import (CPP, solve, "_ZN2cv5solveERKNS_11_InputArrayES2_RKNS_12_OutputArrayEi");

   procedure sort
     (src : InputArray'Class;
      dst : OutputArray'Class;
      flags : int);  -- /usr/include/opencv2/core/core.hpp:2172
   pragma Import (CPP, sort, "_ZN2cv4sortERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure sortIdx
     (src : InputArray'Class;
      dst : OutputArray'Class;
      flags : int);  -- /usr/include/opencv2/core/core.hpp:2174
   pragma Import (CPP, sortIdx, "_ZN2cv7sortIdxERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   function solveCubic (coeffs : InputArray'Class; roots : OutputArray'Class) return int;  -- /usr/include/opencv2/core/core.hpp:2176
   pragma Import (CPP, solveCubic, "_ZN2cv10solveCubicERKNS_11_InputArrayERKNS_12_OutputArrayE");

   function solvePoly
     (coeffs : InputArray'Class;
      roots : OutputArray'Class;
      maxIters : int) return double;  -- /usr/include/opencv2/core/core.hpp:2178
   pragma Import (CPP, solvePoly, "_ZN2cv9solvePolyERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   function eigen
     (src : InputArray'Class;
      eigenvalues : OutputArray'Class;
      lowindex : int;
      highindex : int) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:2180
   pragma Import (CPP, eigen, "_ZN2cv5eigenERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   function eigen
     (src : InputArray'Class;
      eigenvalues : OutputArray'Class;
      eigenvectors : OutputArray'Class;
      lowindex : int;
      highindex : int) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:2183
   pragma Import (CPP, eigen, "_ZN2cv5eigenERKNS_11_InputArrayERKNS_12_OutputArrayES5_ii");

   function eigen
     (src : InputArray'Class;
      computeEigenvectors : Extensions.bool;
      eigenvalues : OutputArray'Class;
      eigenvectors : OutputArray'Class) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:2186
   pragma Import (CPP, eigen, "_ZN2cv5eigenERKNS_11_InputArrayEbRKNS_12_OutputArrayES5_");

   procedure calcCovarMatrix
     (samples : access constant Mat;
      nsamples : int;
      covar : access Mat;
      mean : access Mat;
      flags : int;
      ctype : int);  -- /usr/include/opencv2/core/core.hpp:2200
   pragma Import (CPP, calcCovarMatrix, "_ZN2cv15calcCovarMatrixEPKNS_3MatEiRS0_S3_ii");

   procedure calcCovarMatrix
     (samples : InputArray'Class;
      covar : OutputArray'Class;
      mean : OutputArray'Class;
      flags : int;
      ctype : int);  -- /usr/include/opencv2/core/core.hpp:2203
   pragma Import (CPP, calcCovarMatrix, "_ZN2cv15calcCovarMatrixERKNS_11_InputArrayERKNS_12_OutputArrayES5_ii");

   package Class_PCA is
      type PCA is limited record
         eigenvectors : aliased Mat;  -- /usr/include/opencv2/core/core.hpp:2278
         eigenvalues : aliased Mat;  -- /usr/include/opencv2/core/core.hpp:2279
         mean : aliased Mat;  -- /usr/include/opencv2/core/core.hpp:2280
      end record;
      pragma Import (CPP, PCA);

      function New_PCA return PCA;  -- /usr/include/opencv2/core/core.hpp:2264
      pragma CPP_Constructor (New_PCA, "_ZN2cv3PCAC1Ev");

      function New_PCA
        (data : InputArray;
         mean : InputArray'Class;
         flags : int;
         maxComponents : int) return PCA;  -- /usr/include/opencv2/core/core.hpp:2266
      pragma CPP_Constructor (New_PCA, "_ZN2cv3PCAC1ERKNS_11_InputArrayES3_ii");

      function operator_op
        (this : access PCA;
         data : InputArray'Class;
         mean : InputArray'Class;
         flags : int;
         maxComponents : int) return access PCA;  -- /usr/include/opencv2/core/core.hpp:2268
      pragma Import (CPP, operator_op, "_ZN2cv3PCAclERKNS_11_InputArrayES3_ii");

      function project (this : access constant PCA; vec : InputArray'Class) return Mat;  -- /usr/include/opencv2/core/core.hpp:2270
      pragma Import (CPP, project, "_ZNK2cv3PCA7projectERKNS_11_InputArrayE");

      procedure project
        (this : access constant PCA;
         vec : InputArray'Class;
         result : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2272
      pragma Import (CPP, project, "_ZNK2cv3PCA7projectERKNS_11_InputArrayERKNS_12_OutputArrayE");

      function backProject (this : access constant PCA; vec : InputArray'Class) return Mat;  -- /usr/include/opencv2/core/core.hpp:2274
      pragma Import (CPP, backProject, "_ZNK2cv3PCA11backProjectERKNS_11_InputArrayE");

      procedure backProject
        (this : access constant PCA;
         vec : InputArray'Class;
         result : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2276
      pragma Import (CPP, backProject, "_ZNK2cv3PCA11backProjectERKNS_11_InputArrayERKNS_12_OutputArrayE");
   end;
   use Class_PCA;
   procedure PCACompute
     (data : InputArray'Class;
      mean : InputOutputArray'Class;
      eigenvectors : OutputArray'Class;
      maxComponents : int);  -- /usr/include/opencv2/core/core.hpp:2283
   pragma Import (CPP, PCACompute, "_ZN2cv10PCAComputeERKNS_11_InputArrayERKNS_12_OutputArrayES5_i");

   procedure PCAProject
     (data : InputArray'Class;
      mean : InputArray'Class;
      eigenvectors : InputArray'Class;
      result : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2286
   pragma Import (CPP, PCAProject, "_ZN2cv10PCAProjectERKNS_11_InputArrayES2_S2_RKNS_12_OutputArrayE");

   procedure PCABackProject
     (data : InputArray'Class;
      mean : InputArray'Class;
      eigenvectors : InputArray'Class;
      result : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2289
   pragma Import (CPP, PCABackProject, "_ZN2cv14PCABackProjectERKNS_11_InputArrayES2_S2_RKNS_12_OutputArrayE");

   package Class_SVD is
      type SVD is limited record
         u : aliased Mat;  -- /usr/include/opencv2/core/core.hpp:2339
         w : aliased Mat;  -- /usr/include/opencv2/core/core.hpp:2339
         vt : aliased Mat;  -- /usr/include/opencv2/core/core.hpp:2339
      end record;
      pragma Import (CPP, SVD);

      procedure Delete_SVD (this : access SVD);  -- /usr/include/opencv2/core/core.hpp:2306
      pragma Import (CPP, Delete_SVD, "_ZN2cv3SVDD1Ev");

      function New_SVD return SVD;  -- /usr/include/opencv2/core/mat.hpp:753
      pragma CPP_Constructor (New_SVD, "_ZN2cv3SVDC1Ev");

      function New_SVD (m : InputArray; flags : int) return SVD;  -- /usr/include/opencv2/core/mat.hpp:754
      pragma CPP_Constructor (New_SVD, "_ZN2cv3SVDC1ERKNS_11_InputArrayEi");

      function operator_op
        (this : access SVD;
         src : InputArray'Class;
         flags : int) return access SVD;  -- /usr/include/opencv2/core/core.hpp:2315
      pragma Import (CPP, operator_op, "_ZN2cv3SVDclERKNS_11_InputArrayEi");

      procedure compute
        (src : InputArray'Class;
         w : OutputArray'Class;
         u : OutputArray'Class;
         vt : OutputArray'Class;
         flags : int);  -- /usr/include/opencv2/core/core.hpp:2318
      pragma Import (CPP, compute, "_ZN2cv3SVD7computeERKNS_11_InputArrayERKNS_12_OutputArrayES6_S6_i");

      procedure compute
        (src : InputArray'Class;
         w : OutputArray'Class;
         flags : int);  -- /usr/include/opencv2/core/core.hpp:2321
      pragma Import (CPP, compute, "_ZN2cv3SVD7computeERKNS_11_InputArrayERKNS_12_OutputArrayEi");

      procedure backSubst
        (w : InputArray'Class;
         u : InputArray'Class;
         vt : InputArray'Class;
         rhs : InputArray'Class;
         dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2323
      pragma Import (CPP, backSubst, "_ZN2cv3SVD9backSubstERKNS_11_InputArrayES3_S3_S3_RKNS_12_OutputArrayE");

      procedure solveZ (m : InputArray'Class; u_dst : OutputArray'Class);  -- /usr/include/opencv2/core/mat.hpp:755
      pragma Import (CPP, solveZ, "_ZN2cv3SVD6solveZERKNS_11_InputArrayERKNS_12_OutputArrayE");

      procedure backSubst
        (this : access constant SVD;
         rhs : InputArray'Class;
         dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2337
      pragma Import (CPP, backSubst, "_ZNK2cv3SVD9backSubstERKNS_11_InputArrayERKNS_12_OutputArrayE");
   end;
   use Class_SVD;
   procedure SVDecomp
     (src : InputArray'Class;
      w : OutputArray'Class;
      u : OutputArray'Class;
      vt : OutputArray'Class;
      flags : int);  -- /usr/include/opencv2/core/core.hpp:2343
   pragma Import (CPP, SVDecomp, "_ZN2cv8SVDecompERKNS_11_InputArrayERKNS_12_OutputArrayES5_S5_i");

   procedure SVBackSubst
     (w : InputArray'Class;
      u : InputArray'Class;
      vt : InputArray'Class;
      rhs : InputArray'Class;
      dst : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2347
   pragma Import (CPP, SVBackSubst, "_ZN2cv11SVBackSubstERKNS_11_InputArrayES2_S2_S2_RKNS_12_OutputArrayE");

   function Mahalanobis
     (v1 : InputArray'Class;
      v2 : InputArray'Class;
      icovar : InputArray'Class) return double;  -- /usr/include/opencv2/core/core.hpp:2351
   pragma Import (CPP, Mahalanobis, "_ZN2cv11MahalanobisERKNS_11_InputArrayES2_S2_");

   function Mahalonobis
     (v1 : InputArray'Class;
      v2 : InputArray'Class;
      icovar : InputArray'Class) return double;  -- /usr/include/opencv2/core/core.hpp:2353
   pragma Import (CPP, Mahalonobis, "_ZN2cv11MahalonobisERKNS_11_InputArrayES2_S2_");

   procedure dft
     (src : InputArray'Class;
      dst : OutputArray'Class;
      flags : int;
      nonzeroRows : int);  -- /usr/include/opencv2/core/core.hpp:2356
   pragma Import (CPP, dft, "_ZN2cv3dftERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   procedure idft
     (src : InputArray'Class;
      dst : OutputArray'Class;
      flags : int;
      nonzeroRows : int);  -- /usr/include/opencv2/core/core.hpp:2358
   pragma Import (CPP, idft, "_ZN2cv4idftERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   procedure dct
     (src : InputArray'Class;
      dst : OutputArray'Class;
      flags : int);  -- /usr/include/opencv2/core/core.hpp:2360
   pragma Import (CPP, dct, "_ZN2cv3dctERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure idct
     (src : InputArray'Class;
      dst : OutputArray'Class;
      flags : int);  -- /usr/include/opencv2/core/core.hpp:2362
   pragma Import (CPP, idct, "_ZN2cv4idctERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure mulSpectrums
     (a : InputArray'Class;
      b : InputArray'Class;
      c : OutputArray'Class;
      flags : int;
      conjB : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:2364
   pragma Import (CPP, mulSpectrums, "_ZN2cv12mulSpectrumsERKNS_11_InputArrayES2_RKNS_12_OutputArrayEib");

   function getOptimalDFTSize (vecsize : int) return int;  -- /usr/include/opencv2/core/core.hpp:2367
   pragma Import (CPP, getOptimalDFTSize, "_ZN2cv17getOptimalDFTSizeEi");

   function kmeans
     (data : InputArray'Class;
      K : int;
      bestLabels : InputOutputArray'Class;
      criteria : TermCriteria;
      attempts : int;
      flags : int;
      centers : OutputArray'Class) return double;  -- /usr/include/opencv2/core/core.hpp:2379
   pragma Import (CPP, kmeans, "_ZN2cv6kmeansERKNS_11_InputArrayEiRKNS_12_OutputArrayENS_12TermCriteriaEiiS5_");

   function theRNG return access RNG;  -- /usr/include/opencv2/core/core.hpp:2384
   pragma Import (CPP, theRNG, "_ZN2cv6theRNGEv");

   procedure randu
     (dst : InputOutputArray'Class;
      low : InputArray'Class;
      high : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2390
   pragma Import (CPP, randu, "_ZN2cv5randuERKNS_12_OutputArrayERKNS_11_InputArrayES5_");

   procedure randn
     (dst : InputOutputArray'Class;
      mean : InputArray'Class;
      stddev : InputArray'Class);  -- /usr/include/opencv2/core/core.hpp:2393
   pragma Import (CPP, randn, "_ZN2cv5randnERKNS_12_OutputArrayERKNS_11_InputArrayES5_");

   procedure randShuffle
     (dst : InputOutputArray'Class;
      iterFactor : double;
      the_rng : access RNG);  -- /usr/include/opencv2/core/core.hpp:2396
   pragma Import (CPP, randShuffle, "_ZN2cv11randShuffleERKNS_12_OutputArrayEdPNS_3RNGE");

   procedure randShuffle_u (dst : InputOutputArray'Class; iterFactor : double);  -- /usr/include/opencv2/core/core.hpp:2397
   pragma Import (CPP, randShuffle_u, "_ZN2cv12randShuffle_ERKNS_12_OutputArrayEd");

   procedure line
     (img : access Mat;
      pt1 : Point;
      pt2 : Point;
      color : System.Address;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/include/opencv2/core/core.hpp:2400
   pragma Import (CPP, line, "_ZN2cv4lineERNS_3MatENS_6Point_IiEES3_RKNS_7Scalar_IdEEiii");

   procedure rectangle
     (img : access Mat;
      pt1 : Point;
      pt2 : Point;
      color : System.Address;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/include/opencv2/core/core.hpp:2404
   pragma Import (CPP, rectangle, "_ZN2cv9rectangleERNS_3MatENS_6Point_IiEES3_RKNS_7Scalar_IdEEiii");

   procedure rectangle
     (img : access Mat;
      rec : Rect;
      color : System.Address;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/include/opencv2/core/core.hpp:2409
   pragma Import (CPP, rectangle, "_ZN2cv9rectangleERNS_3MatENS_5Rect_IiEERKNS_7Scalar_IdEEiii");

   procedure circle
     (img : access Mat;
      center : Point;
      radius : int;
      color : System.Address;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/include/opencv2/core/core.hpp:2414
   pragma Import (CPP, circle, "_ZN2cv6circleERNS_3MatENS_6Point_IiEEiRKNS_7Scalar_IdEEiii");

   procedure ellipse
     (img : access Mat;
      center : Point;
      axes : Size;
      angle : double;
      startAngle : double;
      endAngle : double;
      color : System.Address;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/include/opencv2/core/core.hpp:2419
   pragma Import (CPP, ellipse, "_ZN2cv7ellipseERNS_3MatENS_6Point_IiEENS_5Size_IiEEdddRKNS_7Scalar_IdEEiii");

   procedure ellipse
     (img : access Mat;
      box : access constant RotatedRect;
      color : System.Address;
      thickness : int;
      lineType : int);  -- /usr/include/opencv2/core/core.hpp:2425
   pragma Import (CPP, ellipse, "_ZN2cv7ellipseERNS_3MatERKNS_11RotatedRectERKNS_7Scalar_IdEEii");

   procedure fillConvexPoly
     (img : access Mat;
      pts : System.Address;
      npts : int;
      color : System.Address;
      lineType : int;
      shift : int);  -- /usr/include/opencv2/core/core.hpp:2429
   pragma Import (CPP, fillConvexPoly, "_ZN2cv14fillConvexPolyERNS_3MatEPKNS_6Point_IiEEiRKNS_7Scalar_IdEEii");

   procedure fillConvexPoly
     (img : InputOutputArray'Class;
      points : InputArray'Class;
      color : System.Address;
      lineType : int;
      shift : int);  -- /usr/include/opencv2/core/core.hpp:2432
   pragma Import (CPP, fillConvexPoly, "_ZN2cv14fillConvexPolyERKNS_12_OutputArrayERKNS_11_InputArrayERKNS_7Scalar_IdEEii");

   procedure fillPoly
     (img : access Mat;
      pts : System.Address;
      npts : access int;
      ncontours : int;
      color : System.Address;
      lineType : int;
      shift : int;
      offset : Point);  -- /usr/include/opencv2/core/core.hpp:2437
   pragma Import (CPP, fillPoly, "_ZN2cv8fillPolyERNS_3MatEPPKNS_6Point_IiEEPKiiRKNS_7Scalar_IdEEiiS3_");

   procedure fillPoly
     (img : InputOutputArray'Class;
      pts : InputArrayOfArrays'Class;
      color : System.Address;
      lineType : int;
      shift : int;
      offset : Point);  -- /usr/include/opencv2/core/core.hpp:2442
   pragma Import (CPP, fillPoly, "_ZN2cv8fillPolyERKNS_12_OutputArrayERKNS_11_InputArrayERKNS_7Scalar_IdEEiiNS_6Point_IiEE");

   procedure polylines
     (img : access Mat;
      pts : System.Address;
      npts : access int;
      ncontours : int;
      isClosed : Extensions.bool;
      color : System.Address;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/include/opencv2/core/core.hpp:2447
   pragma Import (CPP, polylines, "_ZN2cv9polylinesERNS_3MatEPPKNS_6Point_IiEEPKiibRKNS_7Scalar_IdEEiii");

   procedure polylines
     (img : InputOutputArray'Class;
      pts : InputArrayOfArrays'Class;
      isClosed : Extensions.bool;
      color : System.Address;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/include/opencv2/core/core.hpp:2451
   pragma Import (CPP, polylines, "_ZN2cv9polylinesERKNS_12_OutputArrayERKNS_11_InputArrayEbRKNS_7Scalar_IdEEiii");

   function clipLine
     (imgSize : Size;
      pt1 : access Point;
      pt2 : access Point) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:2456
   pragma Import (CPP, clipLine, "_ZN2cv8clipLineENS_5Size_IiEERNS_6Point_IiEES4_");

   function clipLine
     (imgRect : Rect;
      pt1 : access Point;
      pt2 : access Point) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:2459
   pragma Import (CPP, clipLine, "_ZN2cv8clipLineENS_5Rect_IiEERNS_6Point_IiEES4_");

   package Class_LineIterator is
      type LineIterator is limited record
         ptr : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:2482
         ptr0 : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:2483
         step : aliased int;  -- /usr/include/opencv2/core/core.hpp:2484
         elemSize : aliased int;  -- /usr/include/opencv2/core/core.hpp:2484
         err : aliased int;  -- /usr/include/opencv2/core/core.hpp:2485
         count : aliased int;  -- /usr/include/opencv2/core/core.hpp:2485
         minusDelta : aliased int;  -- /usr/include/opencv2/core/core.hpp:2486
         plusDelta : aliased int;  -- /usr/include/opencv2/core/core.hpp:2486
         minusStep : aliased int;  -- /usr/include/opencv2/core/core.hpp:2487
         plusStep : aliased int;  -- /usr/include/opencv2/core/core.hpp:2487
      end record;
      pragma Import (CPP, LineIterator);

      function New_LineIterator
        (img : access constant Mat;
         pt1 : Point;
         pt2 : Point;
         connectivity : int;
         leftToRight : Extensions.bool) return LineIterator;  -- /usr/include/opencv2/core/core.hpp:2471
      pragma CPP_Constructor (New_LineIterator, "_ZN2cv12LineIteratorC1ERKNS_3MatENS_6Point_IiEES5_ib");

      function operator_t (this : access LineIterator) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/operations.hpp:2281
      pragma Import (CPP, operator_t, "_ZN2cv12LineIteratordeEv");

      function operator_pp (this : access LineIterator) return access LineIterator;  -- /usr/include/opencv2/core/operations.hpp:2282
      pragma Import (CPP, operator_pp, "_ZN2cv12LineIteratorppEv");

      function operator_pp (this : access LineIterator; arg2 : int) return LineIterator;  -- /usr/include/opencv2/core/operations.hpp:2289
      pragma Import (CPP, operator_pp, "_ZN2cv12LineIteratorppEi");

      function pos (this : access constant LineIterator) return Point;  -- /usr/include/opencv2/core/operations.hpp:2295
      pragma Import (CPP, pos, "_ZNK2cv12LineIterator3posEv");
   end;
   use Class_LineIterator;
   procedure ellipse2Poly
     (center : Point;
      axes : Size;
      angle : int;
      arcStart : int;
      arcEnd : int;
      c_delta : int;
      pts : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/core/core.hpp:2491
   pragma Import (CPP, ellipse2Poly, "_ZN2cv12ellipse2PolyENS_6Point_IiEENS_5Size_IiEEiiiiRSt6vectorIS1_SaIS1_EE");

   procedure putText
     (img : access Mat;
      text : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      org : Point;
      fontFace : int;
      fontScale : double;
      color : Scalar;
      thickness : int;
      linetype : int;
      bottomLeftOrigin : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:2509
   pragma Import (CPP, putText, "_ZN2cv7putTextERNS_3MatERKSsNS_6Point_IiEEidNS_7Scalar_IdEEiib");

   function getTextSize
     (text : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      fontFace : int;
      fontScale : double;
      thickness : int;
      baseLine : access int) return Size;  -- /usr/include/opencv2/core/core.hpp:2515
   pragma Import (CPP, getTextSize, "_ZN2cv11getTextSizeERKSsidiPi");

   --  skipped empty struct Mat1b

   --  skipped empty struct Mat2b

   --  skipped empty struct Mat3b

   --  skipped empty struct Mat4b

   --  skipped empty struct Mat1s

   --  skipped empty struct Mat2s

   --  skipped empty struct Mat3s

   --  skipped empty struct Mat4s

   --  skipped empty struct Mat1w

   --  skipped empty struct Mat2w

   --  skipped empty struct Mat3w

   --  skipped empty struct Mat4w

   --  skipped empty struct Mat1i

   --  skipped empty struct Mat2i

   --  skipped empty struct Mat3i

   --  skipped empty struct Mat4i

   --  skipped empty struct Mat1f

   --  skipped empty struct Mat2f

   --  skipped empty struct Mat3f

   --  skipped empty struct Mat4f

   --  skipped empty struct Mat1d

   --  skipped empty struct Mat2d

   --  skipped empty struct Mat3d

   --  skipped empty struct Mat4d

   type MatConstIterator;
   type iterator_category;
   type cpp_4_7_4_bits_stl_iterator_base_types_h.random_access_iterator_tag is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, cpp_4_7_4_bits_stl_iterator_base_types_h.random_access_iterator_tag);
   type iterator_category is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, iterator_category);
   package Class_MatConstIterator is
      type MatConstIterator is limited record
         m : access constant Mat;  -- /usr/include/opencv2/core/core.hpp:2787
         elemSize : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:2788
         ptr : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:2789
         sliceStart : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:2790
         sliceEnd : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:2791
      end record;
      pragma Import (CPP, MatConstIterator);

      function New_MatConstIterator return MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1663
      pragma CPP_Constructor (New_MatConstIterator, "_ZN2cv16MatConstIteratorC1Ev");

      function New_MatConstIterator (u_m : access constant Mat) return MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1666
      pragma CPP_Constructor (New_MatConstIterator, "_ZN2cv16MatConstIteratorC1EPKNS_3MatE");

      function New_MatConstIterator
        (u_m : access constant Mat;
         u_row : int;
         u_col : int) return MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1677
      pragma CPP_Constructor (New_MatConstIterator, "_ZN2cv16MatConstIteratorC1EPKNS_3MatEii");

      function New_MatConstIterator (u_m : access constant Mat; u_pt : access Point) return MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1690
      pragma CPP_Constructor (New_MatConstIterator, "_ZN2cv16MatConstIteratorC1EPKNS_3MatENS_6Point_IiEE");

      function New_MatConstIterator (u_m : access constant Mat; u_idx : access int) return MatConstIterator;  -- /usr/include/opencv2/core/core.hpp:2756
      pragma CPP_Constructor (New_MatConstIterator, "_ZN2cv16MatConstIteratorC1EPKNS_3MatEPKi");

      function operator_as (this : access MatConstIterator; it : System.Address) return access MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1707
      pragma Import (CPP, operator_as, "_ZN2cv16MatConstIteratoraSERKS0_");

      function operator_t (this : access constant MatConstIterator) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/mat.hpp:1714
      pragma Import (CPP, operator_t, "_ZNK2cv16MatConstIteratordeEv");

      function operator_ob (this : access constant MatConstIterator; i : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/mat.hpp:1973
      pragma Import (CPP, operator_ob, "_ZNK2cv16MatConstIteratorixEl");

      function operator_pa (this : access MatConstIterator; ofs : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t) return access MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1716
      pragma Import (CPP, operator_pa, "_ZN2cv16MatConstIteratorpLEl");

      function operator_ma (this : access MatConstIterator; ofs : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t) return access MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1730
      pragma Import (CPP, operator_ma, "_ZN2cv16MatConstIteratormIEl");

      function operator_mm (this : access MatConstIterator) return access MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1733
      pragma Import (CPP, operator_mm, "_ZN2cv16MatConstIteratormmEv");

      function operator_mm (this : access MatConstIterator; arg2 : int) return MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1743
      pragma Import (CPP, operator_mm, "_ZN2cv16MatConstIteratormmEi");

      function operator_pp (this : access MatConstIterator) return access MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1750
      pragma Import (CPP, operator_pp, "_ZN2cv16MatConstIteratorppEv");

      function operator_pp (this : access MatConstIterator; arg2 : int) return MatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:1760
      pragma Import (CPP, operator_pp, "_ZN2cv16MatConstIteratorppEi");

      function pos (this : access constant MatConstIterator) return Point;  -- /usr/include/opencv2/core/core.hpp:2780
      pragma Import (CPP, pos, "_ZNK2cv16MatConstIterator3posEv");

      procedure pos (this : access constant MatConstIterator; u_idx : access int);  -- /usr/include/opencv2/core/core.hpp:2782
      pragma Import (CPP, pos, "_ZNK2cv16MatConstIterator3posEPi");

      function lpos (this : access constant MatConstIterator) return cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t;  -- /usr/include/opencv2/core/core.hpp:2783
      pragma Import (CPP, lpos, "_ZNK2cv16MatConstIterator4lposEv");

      procedure seek
        (this : access MatConstIterator;
         ofs : cpp_4_7_4_x86_64_pc_linux_gnu_bits_cppconfig_h.ptrdiff_t;
         relative : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:2784
      pragma Import (CPP, seek, "_ZN2cv16MatConstIterator4seekElb");

      procedure seek
        (this : access MatConstIterator;
         u_idx : access int;
         relative : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:2785
      pragma Import (CPP, seek, "_ZN2cv16MatConstIterator4seekEPKib");
   end;
   use Class_MatConstIterator;
   package Class_NAryMatIterator is
      type NAryMatIterator is limited record
         arrays : System.Address;  -- /usr/include/opencv2/core/core.hpp:3068
         planes : access Mat;  -- /usr/include/opencv2/core/core.hpp:3070
         ptrs : System.Address;  -- /usr/include/opencv2/core/core.hpp:3072
         narrays : aliased int;  -- /usr/include/opencv2/core/core.hpp:3074
         nplanes : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3076
         size : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3078
         iterdepth : aliased int;  -- /usr/include/opencv2/core/core.hpp:3080
         idx : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3081
      end record;
      pragma Import (CPP, NAryMatIterator);

      function New_NAryMatIterator return NAryMatIterator;  -- /usr/include/opencv2/core/core.hpp:3054
      pragma CPP_Constructor (New_NAryMatIterator, "_ZN2cv15NAryMatIteratorC1Ev");

      function New_NAryMatIterator
        (arrays : System.Address;
         ptrs : System.Address;
         narrays : int) return NAryMatIterator;  -- /usr/include/opencv2/core/core.hpp:3056
      pragma CPP_Constructor (New_NAryMatIterator, "_ZN2cv15NAryMatIteratorC1EPPKNS_3MatEPPhi");

      function New_NAryMatIterator
        (arrays : System.Address;
         planes : access Mat;
         narrays : int) return NAryMatIterator;  -- /usr/include/opencv2/core/core.hpp:3058
      pragma CPP_Constructor (New_NAryMatIterator, "_ZN2cv15NAryMatIteratorC1EPPKNS_3MatEPS1_i");

      procedure init
        (this : access NAryMatIterator;
         arrays : System.Address;
         planes : access Mat;
         ptrs : System.Address;
         narrays : int);  -- /usr/include/opencv2/core/core.hpp:3060
      pragma Import (CPP, init, "_ZN2cv15NAryMatIterator4initEPPKNS_3MatEPS1_PPhi");

      function operator_pp (this : access NAryMatIterator) return access NAryMatIterator;  -- /usr/include/opencv2/core/core.hpp:3063
      pragma Import (CPP, operator_pp, "_ZN2cv15NAryMatIteratorppEv");

      function operator_pp (this : access NAryMatIterator; arg2 : int) return NAryMatIterator;  -- /usr/include/opencv2/core/core.hpp:3065
      pragma Import (CPP, operator_pp, "_ZN2cv15NAryMatIteratorppEi");
   end;
   use Class_NAryMatIterator;
   type ConvertData is access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : int);
   pragma Convention (C, ConvertData);  -- /usr/include/opencv2/core/core.hpp:3086

   type ConvertScaleData is access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : int;
         arg4 : double;
         arg5 : double);
   pragma Convention (C, ConvertScaleData);  -- /usr/include/opencv2/core/core.hpp:3087

   function getConvertElem (fromType : int; toType : int) return ConvertData;  -- /usr/include/opencv2/core/core.hpp:3090
   pragma Import (CPP, getConvertElem, "_ZN2cv14getConvertElemEii");

   function getConvertScaleElem (fromType : int; toType : int) return ConvertScaleData;  -- /usr/include/opencv2/core/core.hpp:3092
   pragma Import (CPP, getConvertScaleElem, "_ZN2cv19getConvertScaleElemEii");

   type SparseMat;
   type iterator;
   type SparseMatIterator is record
      parent : aliased SparseMatConstIterator;
   end record;
   pragma Convention (C_Pass_By_Copy, SparseMatIterator);
   type iterator is record
      parent : aliased SparseMatConstIterator;
   end record;
   pragma Convention (C_Pass_By_Copy, iterator);
   type const_iterator;
   type SparseMatConstIterator is record
      m : access constant SparseMat;  -- /usr/include/opencv2/core/core.hpp:3491
      hashidx : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3492
      ptr : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:3493
   end record;
   pragma Convention (C_Pass_By_Copy, SparseMatConstIterator);
   type const_iterator is record
      m : access constant SparseMat;  -- /usr/include/opencv2/core/core.hpp:3491
      hashidx : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3492
      ptr : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:3493
   end record;
   pragma Convention (C_Pass_By_Copy, const_iterator);
   type SparseMat_size_array is array (0 .. 31) of aliased int;
   type Hdr is record
      refcount : aliased int;  -- /usr/include/opencv2/core/core.hpp:3198
      dims : aliased int;  -- /usr/include/opencv2/core/core.hpp:3199
      valueOffset : aliased int;  -- /usr/include/opencv2/core/core.hpp:3200
      nodeSize : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3201
      nodeCount : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3202
      freeList : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3203
      pool : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/core/core.hpp:3204
      hashtab : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/core/core.hpp:3205
      size : aliased SparseMat_size_array;  -- /usr/include/opencv2/core/core.hpp:3206
   end record;
   pragma Convention (C_Pass_By_Copy, Hdr);
   type SparseMat_idx_array is array (0 .. 31) of aliased int;
   type Node is record
      hashval : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3213
      next : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3215
      idx : aliased SparseMat_idx_array;  -- /usr/include/opencv2/core/core.hpp:3217
   end record;
   pragma Convention (C_Pass_By_Copy, Node);
   package Class_SparseMat is
      type SparseMat is limited record
         flags : aliased int;  -- /usr/include/opencv2/core/core.hpp:3437
         the_hdr : access Hdr;  -- /usr/include/opencv2/core/core.hpp:3438
      end record;
      pragma Import (CPP, SparseMat);

      function New_SparseMat return SparseMat;  -- /usr/include/opencv2/core/mat.hpp:2037
      pragma CPP_Constructor (New_SparseMat, "_ZN2cv9SparseMatC1Ev");

      function New_SparseMat
        (u_dims : int;
         u_sizes : access int;
         u_type : int) return SparseMat;  -- /usr/include/opencv2/core/mat.hpp:2042
      pragma CPP_Constructor (New_SparseMat, "_ZN2cv9SparseMatC1EiPKii");

      function New_SparseMat (m : access constant Mat) return SparseMat;  -- /usr/include/opencv2/core/core.hpp:3232
      pragma CPP_Constructor (New_SparseMat, "_ZN2cv9SparseMatC1ERKNS_3MatE");

      function New_SparseMat (m : access constant opencv2_core_types_c_h.CvSparseMat) return SparseMat;  -- /usr/include/opencv2/core/core.hpp:3234
      pragma CPP_Constructor (New_SparseMat, "_ZN2cv9SparseMatC1EPK11CvSparseMat");

      procedure Delete_SparseMat (this : access SparseMat);  -- /usr/include/opencv2/core/mat.hpp:2054
      pragma Import (CPP, Delete_SparseMat, "_ZN2cv9SparseMatD1Ev");

      function operator_as (this : access SparseMat; m : System.Address) return access SparseMat;  -- /usr/include/opencv2/core/mat.hpp:2059
      pragma Import (CPP, operator_as, "_ZN2cv9SparseMataSERKS0_");

      function operator_as (this : access SparseMat; m : access constant Mat) return access SparseMat;  -- /usr/include/opencv2/core/mat.hpp:2072
      pragma Import (CPP, operator_as, "_ZN2cv9SparseMataSERKNS_3MatE");

      function clone (this : access constant SparseMat) return SparseMat;  -- /usr/include/opencv2/core/mat.hpp:2075
      pragma Import (CPP, clone, "_ZNK2cv9SparseMat5cloneEv");

      procedure copyTo (this : access constant SparseMat; m : access SparseMat);  -- /usr/include/opencv2/core/core.hpp:3247
      pragma Import (CPP, copyTo, "_ZNK2cv9SparseMat6copyToERS0_");

      procedure copyTo (this : access constant SparseMat; m : access Mat);  -- /usr/include/opencv2/core/core.hpp:3249
      pragma Import (CPP, copyTo, "_ZNK2cv9SparseMat6copyToERNS_3MatE");

      procedure convertTo
        (this : access constant SparseMat;
         m : access SparseMat;
         rtype : int;
         alpha : double);  -- /usr/include/opencv2/core/core.hpp:3251
      pragma Import (CPP, convertTo, "_ZNK2cv9SparseMat9convertToERS0_id");

      procedure convertTo
        (this : access constant SparseMat;
         m : access Mat;
         rtype : int;
         alpha : double;
         beta : double);  -- /usr/include/opencv2/core/core.hpp:3258
      pragma Import (CPP, convertTo, "_ZNK2cv9SparseMat9convertToERNS_3MatEidd");

      procedure assignTo
        (this : access constant SparseMat;
         m : access SparseMat;
         c_type : int);  -- /usr/include/opencv2/core/mat.hpp:2083
      pragma Import (CPP, assignTo, "_ZNK2cv9SparseMat8assignToERS0_i");

      procedure create
        (this : access SparseMat;
         dims : int;
         u_sizes : access int;
         u_type : int);  -- /usr/include/opencv2/core/core.hpp:3269
      pragma Import (CPP, create, "_ZN2cv9SparseMat6createEiPKii");

      procedure clear (this : access SparseMat);  -- /usr/include/opencv2/core/core.hpp:3271
      pragma Import (CPP, clear, "_ZN2cv9SparseMat5clearEv");

      procedure addref (this : access SparseMat);  -- /usr/include/opencv2/core/mat.hpp:2091
      pragma Import (CPP, addref, "_ZN2cv9SparseMat6addrefEv");

      procedure release (this : access SparseMat);  -- /usr/include/opencv2/core/mat.hpp:2094
      pragma Import (CPP, release, "_ZN2cv9SparseMat7releaseEv");

      function operator_56 (this : access constant SparseMat) return access opencv2_core_types_c_h.CvSparseMat;  -- /usr/include/opencv2/core/core.hpp:3278
      pragma Import (CPP, operator_56, "_ZNK2cv9SparseMatcvP11CvSparseMatEv");

      function elemSize (this : access constant SparseMat) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:2101
      pragma Import (CPP, elemSize, "_ZNK2cv9SparseMat8elemSizeEv");

      function elemSize1 (this : access constant SparseMat) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:2104
      pragma Import (CPP, elemSize1, "_ZNK2cv9SparseMat9elemSize1Ev");

      function c_type (this : access constant SparseMat) return int;  -- /usr/include/opencv2/core/mat.hpp:2107
      pragma Import (CPP, c_type, "_ZNK2cv9SparseMat4typeEv");

      function depth (this : access constant SparseMat) return int;  -- /usr/include/opencv2/core/mat.hpp:2110
      pragma Import (CPP, depth, "_ZNK2cv9SparseMat5depthEv");

      function channels (this : access constant SparseMat) return int;  -- /usr/include/opencv2/core/mat.hpp:2113
      pragma Import (CPP, channels, "_ZNK2cv9SparseMat8channelsEv");

      function size (this : access constant SparseMat) return access int;  -- /usr/include/opencv2/core/mat.hpp:2116
      pragma Import (CPP, size, "_ZNK2cv9SparseMat4sizeEv");

      function size (this : access constant SparseMat; i : int) return int;  -- /usr/include/opencv2/core/mat.hpp:2121
      pragma Import (CPP, size, "_ZNK2cv9SparseMat4sizeEi");

      function dims (this : access constant SparseMat) return int;  -- /usr/include/opencv2/core/mat.hpp:2131
      pragma Import (CPP, dims, "_ZNK2cv9SparseMat4dimsEv");

      function nzcount (this : access constant SparseMat) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:2136
      pragma Import (CPP, nzcount, "_ZNK2cv9SparseMat7nzcountEv");

      function hash (this : access constant SparseMat; i0 : int) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:2141
      pragma Import (CPP, hash, "_ZNK2cv9SparseMat4hashEi");

      function hash
        (this : access constant SparseMat;
         i0 : int;
         i1 : int) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:2146
      pragma Import (CPP, hash, "_ZNK2cv9SparseMat4hashEii");

      function hash
        (this : access constant SparseMat;
         i0 : int;
         i1 : int;
         i2 : int) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:2151
      pragma Import (CPP, hash, "_ZNK2cv9SparseMat4hashEiii");

      function hash (this : access constant SparseMat; idx : access int) return stddef_h.size_t;  -- /usr/include/opencv2/core/mat.hpp:2156
      pragma Import (CPP, hash, "_ZNK2cv9SparseMat4hashEPKi");

      function ptr
        (this : access SparseMat;
         i0 : int;
         createMissing : Extensions.bool;
         hashval : access stddef_h.size_t) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:3324
      pragma Import (CPP, ptr, "_ZN2cv9SparseMat3ptrEibPm");

      function ptr
        (this : access SparseMat;
         i0 : int;
         i1 : int;
         createMissing : Extensions.bool;
         hashval : access stddef_h.size_t) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:3326
      pragma Import (CPP, ptr, "_ZN2cv9SparseMat3ptrEiibPm");

      function ptr
        (this : access SparseMat;
         i0 : int;
         i1 : int;
         i2 : int;
         createMissing : Extensions.bool;
         hashval : access stddef_h.size_t) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:3328
      pragma Import (CPP, ptr, "_ZN2cv9SparseMat3ptrEiiibPm");

      function ptr
        (this : access SparseMat;
         idx : access int;
         createMissing : Extensions.bool;
         hashval : access stddef_h.size_t) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:3330
      pragma Import (CPP, ptr, "_ZN2cv9SparseMat3ptrEPKibPm");

      procedure erase
        (this : access SparseMat;
         i0 : int;
         i1 : int;
         hashval : access stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:3391
      pragma Import (CPP, erase, "_ZN2cv9SparseMat5eraseEiiPm");

      procedure erase
        (this : access SparseMat;
         i0 : int;
         i1 : int;
         i2 : int;
         hashval : access stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:3393
      pragma Import (CPP, erase, "_ZN2cv9SparseMat5eraseEiiiPm");

      procedure erase
        (this : access SparseMat;
         idx : access int;
         hashval : access stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:3395
      pragma Import (CPP, erase, "_ZN2cv9SparseMat5eraseEPKiPm");

      function c_begin (this : access SparseMat) return SparseMatIterator;  -- /usr/include/opencv2/core/mat.hpp:2227
      pragma Import (CPP, c_begin, "_ZN2cv9SparseMat5beginEv");

      function c_begin (this : access constant SparseMat) return SparseMatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:2230
      pragma Import (CPP, c_begin, "_ZNK2cv9SparseMat5beginEv");

      function c_end (this : access SparseMat) return SparseMatIterator;  -- /usr/include/opencv2/core/mat.hpp:2233
      pragma Import (CPP, c_end, "_ZN2cv9SparseMat3endEv");

      function c_end (this : access constant SparseMat) return SparseMatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:2236
      pragma Import (CPP, c_end, "_ZNK2cv9SparseMat3endEv");

      function node (this : access SparseMat; nidx : stddef_h.size_t) return access Node;  -- /usr/include/opencv2/core/mat.hpp:2221
      pragma Import (CPP, node, "_ZN2cv9SparseMat4nodeEm");

      function node (this : access constant SparseMat; nidx : stddef_h.size_t) return access constant Node;  -- /usr/include/opencv2/core/mat.hpp:2224
      pragma Import (CPP, node, "_ZNK2cv9SparseMat4nodeEm");

      function newNode
        (this : access SparseMat;
         idx : access int;
         hashval : stddef_h.size_t) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:3431
      pragma Import (CPP, newNode, "_ZN2cv9SparseMat7newNodeEPKim");

      procedure removeNode
        (this : access SparseMat;
         hidx : stddef_h.size_t;
         nidx : stddef_h.size_t;
         previdx : stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:3432
      pragma Import (CPP, removeNode, "_ZN2cv9SparseMat10removeNodeEmmm");

      procedure resizeHashTab (this : access SparseMat; newsize : stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:3433
      pragma Import (CPP, resizeHashTab, "_ZN2cv9SparseMat13resizeHashTabEm");
   end;
   use Class_SparseMat;
   procedure minMaxLoc
     (a : access constant SparseMat;
      minVal : access double;
      maxVal : access double;
      minIdx : access int;
      maxIdx : access int);  -- /usr/include/opencv2/core/core.hpp:3442
   pragma Import (CPP, minMaxLoc, "_ZN2cv9minMaxLocERKNS_9SparseMatEPdS3_PiS4_");

   function norm (src : access constant SparseMat; normType : int) return double;  -- /usr/include/opencv2/core/core.hpp:3445
   pragma Import (CPP, norm, "_ZN2cv4normERKNS_9SparseMatEi");

   procedure normalize
     (src : access constant SparseMat;
      dst : access SparseMat;
      alpha : double;
      normType : int);  -- /usr/include/opencv2/core/core.hpp:3447
   pragma Import (CPP, normalize, "_ZN2cv9normalizeERKNS_9SparseMatERS0_di");

   package Class_SparseMatConstIterator is
      type SparseMatConstIterator is limited record
         m : access constant SparseMat;  -- /usr/include/opencv2/core/core.hpp:3491
         hashidx : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:3492
         ptr : access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core.hpp:3493
      end record;
      pragma Import (CPP, SparseMatConstIterator);

      function New_SparseMatConstIterator return SparseMatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:2252
      pragma CPP_Constructor (New_SparseMatConstIterator, "_ZN2cv22SparseMatConstIteratorC1Ev");

      function New_SparseMatConstIterator (u_m : access constant SparseMat) return SparseMatConstIterator;  -- /usr/include/opencv2/core/core.hpp:3467
      pragma CPP_Constructor (New_SparseMatConstIterator, "_ZN2cv22SparseMatConstIteratorC1EPKNS_9SparseMatE");

      function operator_as (this : access SparseMatConstIterator; it : access constant SparseMatConstIterator) return access SparseMatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:2269
      pragma Import (CPP, operator_as, "_ZN2cv22SparseMatConstIteratoraSERKS0_");

      function node (this : access constant SparseMatConstIterator) return access constant Node;  -- /usr/include/opencv2/core/mat.hpp:2283
      pragma Import (CPP, node, "_ZNK2cv22SparseMatConstIterator4nodeEv");

      function operator_mm (this : access SparseMatConstIterator) return access SparseMatConstIterator;  -- /usr/include/opencv2/core/core.hpp:3480
      pragma Import (CPP, operator_mm, "_ZN2cv22SparseMatConstIteratormmEv");

      function operator_mm (this : access SparseMatConstIterator; arg2 : int) return SparseMatConstIterator;  -- /usr/include/opencv2/core/core.hpp:3482
      pragma Import (CPP, operator_mm, "_ZN2cv22SparseMatConstIteratormmEi");

      function operator_pp (this : access SparseMatConstIterator) return access SparseMatConstIterator;  -- /usr/include/opencv2/core/core.hpp:3484
      pragma Import (CPP, operator_pp, "_ZN2cv22SparseMatConstIteratorppEv");

      function operator_pp (this : access SparseMatConstIterator; arg2 : int) return SparseMatConstIterator;  -- /usr/include/opencv2/core/mat.hpp:2289
      pragma Import (CPP, operator_pp, "_ZN2cv22SparseMatConstIteratorppEi");

      procedure seekEnd (this : access SparseMatConstIterator);  -- /usr/include/opencv2/core/mat.hpp:2297
      pragma Import (CPP, seekEnd, "_ZN2cv22SparseMatConstIterator7seekEndEv");
   end;
   use Class_SparseMatConstIterator;
   package Class_SparseMatIterator is
      type SparseMatIterator is limited record
         parent : aliased SparseMatConstIterator;
      end record;
      pragma Import (CPP, SparseMatIterator);

      function New_SparseMatIterator return SparseMatIterator;  -- /usr/include/opencv2/core/mat.hpp:2306
      pragma CPP_Constructor (New_SparseMatIterator, "_ZN2cv17SparseMatIteratorC1Ev");

      function New_SparseMatIterator (u_m : access SparseMat) return SparseMatIterator;  -- /usr/include/opencv2/core/mat.hpp:2309
      pragma CPP_Constructor (New_SparseMatIterator, "_ZN2cv17SparseMatIteratorC1EPNS_9SparseMatE");

      function New_SparseMatIterator (u_m : access SparseMat; idx : access int) return SparseMatIterator;  -- /usr/include/opencv2/core/core.hpp:3510
      pragma CPP_Constructor (New_SparseMatIterator, "_ZN2cv17SparseMatIteratorC1EPNS_9SparseMatEPKi");

      function operator_as (this : access SparseMatIterator; it : access constant SparseMatIterator) return access SparseMatIterator;  -- /usr/include/opencv2/core/mat.hpp:2318
      pragma Import (CPP, operator_as, "_ZN2cv17SparseMatIteratoraSERKS0_");

      function node (this : access constant SparseMatIterator) return access Node;  -- /usr/include/opencv2/core/mat.hpp:2327
      pragma Import (CPP, node, "_ZNK2cv17SparseMatIterator4nodeEv");

      function operator_pp (this : access SparseMatIterator) return access SparseMatIterator;  -- /usr/include/opencv2/core/mat.hpp:2332
      pragma Import (CPP, operator_pp, "_ZN2cv17SparseMatIteratorppEv");

      function operator_pp (this : access SparseMatIterator; arg2 : int) return SparseMatIterator;  -- /usr/include/opencv2/core/mat.hpp:2338
      pragma Import (CPP, operator_pp, "_ZN2cv17SparseMatIteratorppEi");
   end;
   use Class_SparseMatIterator;
   type KDTree;
   type Node is record
      idx : aliased int;  -- /usr/include/opencv2/core/core.hpp:3704
      left : aliased int;  -- /usr/include/opencv2/core/core.hpp:3706
      right : aliased int;  -- /usr/include/opencv2/core/core.hpp:3706
      boundary : aliased float;  -- /usr/include/opencv2/core/core.hpp:3708
   end record;
   pragma Convention (C_Pass_By_Copy, Node);
   package Class_KDTree is
      type KDTree is limited record
         nodes : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/core/core.hpp:3743
         points : aliased Mat;  -- /usr/include/opencv2/core/core.hpp:3744
         labels : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/core/core.hpp:3745
         maxDepth : aliased int;  -- /usr/include/opencv2/core/core.hpp:3746
         normType : aliased int;  -- /usr/include/opencv2/core/core.hpp:3747
      end record;
      pragma Import (CPP, KDTree);

      function New_KDTree return KDTree;  -- /usr/include/opencv2/core/core.hpp:3712
      pragma CPP_Constructor (New_KDTree, "_ZN2cv6KDTreeC1Ev");

      function New_KDTree (points : InputArray; copyAndReorderPoints : Extensions.bool) return KDTree;  -- /usr/include/opencv2/core/core.hpp:3714
      pragma CPP_Constructor (New_KDTree, "_ZN2cv6KDTreeC1ERKNS_11_InputArrayEb");

      function New_KDTree
        (points : InputArray;
         u_labels : InputArray'Class;
         copyAndReorderPoints : Extensions.bool) return KDTree;  -- /usr/include/opencv2/core/core.hpp:3716
      pragma CPP_Constructor (New_KDTree, "_ZN2cv6KDTreeC1ERKNS_11_InputArrayES3_b");

      procedure build
        (this : access KDTree;
         points : InputArray'Class;
         copyAndReorderPoints : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:3719
      pragma Import (CPP, build, "_ZN2cv6KDTree5buildERKNS_11_InputArrayEb");

      procedure build
        (this : access KDTree;
         points : InputArray'Class;
         labels : InputArray'Class;
         copyAndReorderPoints : Extensions.bool);  -- /usr/include/opencv2/core/core.hpp:3721
      pragma Import (CPP, build, "_ZN2cv6KDTree5buildERKNS_11_InputArrayES3_b");

      function findNearest
        (this : access constant KDTree;
         vec : InputArray'Class;
         K : int;
         Emax : int;
         neighborsIdx : OutputArray'Class;
         neighbors : OutputArray'Class;
         dist : OutputArray'Class;
         labels : OutputArray'Class) return int;  -- /usr/include/opencv2/core/core.hpp:3724
      pragma Import (CPP, findNearest, "_ZNK2cv6KDTree11findNearestERKNS_11_InputArrayEiiRKNS_12_OutputArrayES6_S6_S6_");

      procedure findOrthoRange
        (this : access constant KDTree;
         minBounds : InputArray'Class;
         maxBounds : InputArray'Class;
         neighborsIdx : OutputArray'Class;
         neighbors : OutputArray'Class;
         labels : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:3730
      pragma Import (CPP, findOrthoRange, "_ZNK2cv6KDTree14findOrthoRangeERKNS_11_InputArrayES3_RKNS_12_OutputArrayES6_S6_");

      procedure getPoints
        (this : access constant KDTree;
         idx : InputArray'Class;
         pts : OutputArray'Class;
         labels : OutputArray'Class);  -- /usr/include/opencv2/core/core.hpp:3736
      pragma Import (CPP, getPoints, "_ZNK2cv6KDTree9getPointsERKNS_11_InputArrayERKNS_12_OutputArrayES6_");

      function getPoint
        (this : access constant KDTree;
         ptidx : int;
         label : access int) return access float;  -- /usr/include/opencv2/core/core.hpp:3739
      pragma Import (CPP, getPoint, "_ZNK2cv6KDTree8getPointEiPi");

      function dims (this : access constant KDTree) return int;  -- /usr/include/opencv2/core/core.hpp:3741
      pragma Import (CPP, dims, "_ZNK2cv6KDTree4dimsEv");
   end;
   use Class_KDTree;
   package Class_FileStorage is
      type FileStorage is tagged limited record
         fs : aliased Ptr;  -- /usr/include/opencv2/core/core.hpp:3905
         elname : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:3906
         structs : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/core/core.hpp:3907
         state : aliased int;  -- /usr/include/opencv2/core/core.hpp:3908
      end record;
      pragma Import (CPP, FileStorage);

      function New_FileStorage return FileStorage;  -- /usr/include/opencv2/core/core.hpp:3869
      pragma CPP_Constructor (New_FileStorage, "_ZN2cv11FileStorageC1Ev");

      function New_FileStorage
        (filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         flags : int;
         encoding : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return FileStorage;  -- /usr/include/opencv2/core/core.hpp:3871
      pragma CPP_Constructor (New_FileStorage, "_ZN2cv11FileStorageC1ERKSsiS2_");

      function New_FileStorage (fs : System.Address) return FileStorage;  -- /usr/include/opencv2/core/core.hpp:3873
      pragma CPP_Constructor (New_FileStorage, "_ZN2cv11FileStorageC1EP13CvFileStorage");

      procedure Delete_FileStorage (this : access FileStorage);  -- /usr/include/opencv2/core/core.hpp:3875
      pragma Import (CPP, Delete_FileStorage, "_ZN2cv11FileStorageD1Ev");

      procedure deleting_dtor (this : access FileStorage);  -- /usr/include/opencv2/core/core.hpp:3875
      pragma Import (CPP, deleting_dtor, "_ZN2cv11FileStorageD0Ev");

      function open
        (this : access FileStorage;
         filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         flags : int;
         encoding : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:3878
      pragma Import (CPP, open, "_ZN2cv11FileStorage4openERKSsiS2_");

      function isOpened (this : access constant FileStorage) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:3880
      pragma Import (CPP, isOpened, "_ZNK2cv11FileStorage8isOpenedEv");

      procedure release (this : access FileStorage);  -- /usr/include/opencv2/core/core.hpp:3882
      pragma Import (CPP, release, "_ZN2cv11FileStorage7releaseEv");

      function getFirstTopLevelNode (this : access constant FileStorage'Class) return FileNode;  -- /usr/include/opencv2/core/operations.hpp:2851
      pragma Import (CPP, getFirstTopLevelNode, "_ZNK2cv11FileStorage20getFirstTopLevelNodeEv");

      function root (this : access constant FileStorage'Class; streamidx : int) return FileNode;  -- /usr/include/opencv2/core/core.hpp:3887
      pragma Import (CPP, root, "_ZNK2cv11FileStorage4rootEi");

      function operator_ob (this : access constant FileStorage'Class; nodename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return FileNode;  -- /usr/include/opencv2/core/core.hpp:3889
      pragma Import (CPP, operator_ob, "_ZNK2cv11FileStorageixERKSs");

      function operator_ob (this : access constant FileStorage'Class; nodename : Interfaces.C.Strings.chars_ptr) return FileNode;  -- /usr/include/opencv2/core/core.hpp:3891
      pragma Import (CPP, operator_ob, "_ZNK2cv11FileStorageixEPKc");

      function operator_t (this : access FileStorage'Class) return System.Address;  -- /usr/include/opencv2/core/core.hpp:3894
      pragma Import (CPP, operator_t, "_ZN2cv11FileStoragedeEv");

      function operator_t (this : access constant FileStorage'Class) return System.Address;  -- /usr/include/opencv2/core/core.hpp:3896
      pragma Import (CPP, operator_t, "_ZNK2cv11FileStoragedeEv");

      procedure writeRaw
        (this : access FileStorage'Class;
         fmt : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         vec : access opencv2_core_types_c_h.uchar;
         len : stddef_h.size_t);  -- /usr/include/opencv2/core/core.hpp:3898
      pragma Import (CPP, writeRaw, "_ZN2cv11FileStorage8writeRawERKSsPKhm");

      procedure writeObj
        (this : access FileStorage'Class;
         name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         obj : System.Address);  -- /usr/include/opencv2/core/core.hpp:3900
      pragma Import (CPP, writeObj, "_ZN2cv11FileStorage8writeObjERKSsPKv");

      function getDefaultObjectName (filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:3903
      pragma Import (CPP, getDefaultObjectName, "_ZN2cv11FileStorage20getDefaultObjectNameERKSs");
   end;
   use Class_FileStorage;
   package Class_FileNode is
      type FileNode is limited record
         fs : System.Address;  -- /usr/include/opencv2/core/core.hpp:4004
         node : access constant opencv2_core_types_c_h.CvFileNode;  -- /usr/include/opencv2/core/core.hpp:4005
      end record;
      pragma Import (CPP, FileNode);

      function New_FileNode return FileNode;  -- /usr/include/opencv2/core/operations.hpp:2639
      pragma CPP_Constructor (New_FileNode, "_ZN2cv8FileNodeC1Ev");

      function New_FileNode (u_fs : System.Address; u_node : access constant opencv2_core_types_c_h.CvFileNode) return FileNode;  -- /usr/include/opencv2/core/operations.hpp:2640
      pragma CPP_Constructor (New_FileNode, "_ZN2cv8FileNodeC1EPK13CvFileStoragePK10CvFileNode");

      function operator_ob (this : access constant FileNode; nodename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return FileNode;  -- /usr/include/opencv2/core/core.hpp:3951
      pragma Import (CPP, operator_ob, "_ZNK2cv8FileNodeixERKSs");

      function operator_ob (this : access constant FileNode; nodename : Interfaces.C.Strings.chars_ptr) return FileNode;  -- /usr/include/opencv2/core/core.hpp:3953
      pragma Import (CPP, operator_ob, "_ZNK2cv8FileNodeixEPKc");

      function operator_ob (this : access constant FileNode; i : int) return FileNode;  -- /usr/include/opencv2/core/core.hpp:3955
      pragma Import (CPP, operator_ob, "_ZNK2cv8FileNodeixEi");

      function c_type (this : access constant FileNode) return int;  -- /usr/include/opencv2/core/operations.hpp:2645
      pragma Import (CPP, c_type, "_ZNK2cv8FileNode4typeEv");

      function empty (this : access constant FileNode) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2646
      pragma Import (CPP, empty, "_ZNK2cv8FileNode5emptyEv");

      function isNone (this : access constant FileNode) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2647
      pragma Import (CPP, isNone, "_ZNK2cv8FileNode6isNoneEv");

      function isSeq (this : access constant FileNode) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2648
      pragma Import (CPP, isSeq, "_ZNK2cv8FileNode5isSeqEv");

      function isMap (this : access constant FileNode) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2649
      pragma Import (CPP, isMap, "_ZNK2cv8FileNode5isMapEv");

      function isInt (this : access constant FileNode) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2650
      pragma Import (CPP, isInt, "_ZNK2cv8FileNode5isIntEv");

      function isReal (this : access constant FileNode) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2651
      pragma Import (CPP, isReal, "_ZNK2cv8FileNode6isRealEv");

      function isString (this : access constant FileNode) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2652
      pragma Import (CPP, isString, "_ZNK2cv8FileNode8isStringEv");

      function isNamed (this : access constant FileNode) return Extensions.bool;  -- /usr/include/opencv2/core/operations.hpp:2653
      pragma Import (CPP, isNamed, "_ZNK2cv8FileNode7isNamedEv");

      function name (this : access constant FileNode) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:3976
      pragma Import (CPP, name, "_ZNK2cv8FileNode4nameEv");

      function size (this : access constant FileNode) return stddef_h.size_t;  -- /usr/include/opencv2/core/operations.hpp:2654
      pragma Import (CPP, size, "_ZNK2cv8FileNode4sizeEv");

      function operator_42 (this : access constant FileNode) return int;  -- /usr/include/opencv2/core/operations.hpp:2723
      pragma Import (CPP, operator_42, "_ZNK2cv8FileNodecviEv");

      function operator_43 (this : access constant FileNode) return float;  -- /usr/include/opencv2/core/operations.hpp:2729
      pragma Import (CPP, operator_43, "_ZNK2cv8FileNodecvfEv");

      function operator_44 (this : access constant FileNode) return double;  -- /usr/include/opencv2/core/operations.hpp:2735
      pragma Import (CPP, operator_44, "_ZNK2cv8FileNodecvdEv");

      function operator_59 (this : access constant FileNode) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/operations.hpp:2741
      pragma Import (CPP, operator_59, "_ZNK2cv8FileNodecvSsEv");

      function operator_t (this : access FileNode) return access opencv2_core_types_c_h.CvFileNode;  -- /usr/include/opencv2/core/operations.hpp:2661
      pragma Import (CPP, operator_t, "_ZN2cv8FileNodedeEv");

      function operator_t (this : access constant FileNode) return access constant opencv2_core_types_c_h.CvFileNode;  -- /usr/include/opencv2/core/operations.hpp:2662
      pragma Import (CPP, operator_t, "_ZNK2cv8FileNodedeEv");

      function c_begin (this : access constant FileNode) return FileNodeIterator;  -- /usr/include/opencv2/core/operations.hpp:2797
      pragma Import (CPP, c_begin, "_ZNK2cv8FileNode5beginEv");

      function c_end (this : access constant FileNode) return FileNodeIterator;  -- /usr/include/opencv2/core/operations.hpp:2802
      pragma Import (CPP, c_end, "_ZNK2cv8FileNode3endEv");

      procedure readRaw
        (this : access constant FileNode;
         fmt : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         vec : access opencv2_core_types_c_h.uchar;
         len : stddef_h.size_t);  -- /usr/include/opencv2/core/operations.hpp:2748
      pragma Import (CPP, readRaw, "_ZNK2cv8FileNode7readRawERKSsPhm");

      function readObj (this : access constant FileNode) return System.Address;  -- /usr/include/opencv2/core/core.hpp:4001
      pragma Import (CPP, readObj, "_ZNK2cv8FileNode7readObjEv");
   end;
   use Class_FileNode;
   package Class_FileNodeIterator is
      type FileNodeIterator is limited record
         fs : System.Address;  -- /usr/include/opencv2/core/core.hpp:4045
         container : access constant opencv2_core_types_c_h.CvFileNode;  -- /usr/include/opencv2/core/core.hpp:4046
         reader : aliased opencv2_core_types_c_h.CvSeqReader;  -- /usr/include/opencv2/core/core.hpp:4047
         remaining : aliased stddef_h.size_t;  -- /usr/include/opencv2/core/core.hpp:4048
      end record;
      pragma Import (CPP, FileNodeIterator);

      function New_FileNodeIterator return FileNodeIterator;  -- /usr/include/opencv2/core/core.hpp:4018
      pragma CPP_Constructor (New_FileNodeIterator, "_ZN2cv16FileNodeIteratorC1Ev");

      function New_FileNodeIterator
        (fs : System.Address;
         node : access constant opencv2_core_types_c_h.CvFileNode;
         ofs : stddef_h.size_t) return FileNodeIterator;  -- /usr/include/opencv2/core/core.hpp:4020
      pragma CPP_Constructor (New_FileNodeIterator, "_ZN2cv16FileNodeIteratorC1EPK13CvFileStoragePK10CvFileNodem");

      function operator_t (this : access constant FileNodeIterator) return FileNode;  -- /usr/include/opencv2/core/operations.hpp:2807
      pragma Import (CPP, operator_t, "_ZNK2cv16FileNodeIteratordeEv");

      function operator__gt (this : access constant FileNodeIterator) return FileNode;  -- /usr/include/opencv2/core/operations.hpp:2810
      pragma Import (CPP, operator__gt, "_ZNK2cv16FileNodeIteratorptEv");

      function operator_pp (this : access FileNodeIterator) return access FileNodeIterator;  -- /usr/include/opencv2/core/core.hpp:4029
      pragma Import (CPP, operator_pp, "_ZN2cv16FileNodeIteratorppEv");

      function operator_pp (this : access FileNodeIterator; arg2 : int) return FileNodeIterator;  -- /usr/include/opencv2/core/core.hpp:4031
      pragma Import (CPP, operator_pp, "_ZN2cv16FileNodeIteratorppEi");

      function operator_mm (this : access FileNodeIterator) return access FileNodeIterator;  -- /usr/include/opencv2/core/core.hpp:4033
      pragma Import (CPP, operator_mm, "_ZN2cv16FileNodeIteratormmEv");

      function operator_mm (this : access FileNodeIterator; arg2 : int) return FileNodeIterator;  -- /usr/include/opencv2/core/core.hpp:4035
      pragma Import (CPP, operator_mm, "_ZN2cv16FileNodeIteratormmEi");

      function operator_pa (this : access FileNodeIterator; arg2 : int) return access FileNodeIterator;  -- /usr/include/opencv2/core/core.hpp:4037
      pragma Import (CPP, operator_pa, "_ZN2cv16FileNodeIteratorpLEi");

      function operator_ma (this : access FileNodeIterator; arg2 : int) return access FileNodeIterator;  -- /usr/include/opencv2/core/core.hpp:4039
      pragma Import (CPP, operator_ma, "_ZN2cv16FileNodeIteratormIEi");

      function readRaw
        (this : access FileNodeIterator;
         fmt : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         vec : access opencv2_core_types_c_h.uchar;
         maxCount : stddef_h.size_t) return access FileNodeIterator;  -- /usr/include/opencv2/core/core.hpp:4042
      pragma Import (CPP, readRaw, "_ZN2cv16FileNodeIterator7readRawERKSsPhm");
   end;
   use Class_FileNodeIterator;
   type Ptr;
   subtype MemStorage is Ptr;

   package Class_CommandLineParser is
      type CommandLineParser is limited record
         data : aliased cpp_4_7_4_bits_stl_map_h.Class_map.map;  -- /usr/include/opencv2/core/core.hpp:4297
      end record;
      pragma Import (CPP, CommandLineParser);

      function New_CommandLineParser
        (argc : int;
         argv : System.Address;
         key_map : Interfaces.C.Strings.chars_ptr) return CommandLineParser;  -- /usr/include/opencv2/core/core.hpp:4279
      pragma CPP_Constructor (New_CommandLineParser, "_ZN2cv17CommandLineParserC1EiPPKcS2_");

      procedure printParams (this : access CommandLineParser);  -- /usr/include/opencv2/core/core.hpp:4294
      pragma Import (CPP, printParams, "_ZN2cv17CommandLineParser11printParamsEv");

      function getString (this : access CommandLineParser; name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/core/core.hpp:4298
      pragma Import (CPP, getString, "_ZN2cv17CommandLineParser9getStringERKSs");

      function has (this : access CommandLineParser; keys : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return Extensions.bool;  -- /usr/include/opencv2/core/core.hpp:4300
      pragma Import (CPP, has, "_ZN2cv17CommandLineParser3hasERKSs");


   end;
   use Class_CommandLineParser;
end opencv2_core_core_hpp;
