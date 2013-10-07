pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with opencv2_core_types_hpp;
with cpp_4_7_4_bits_stl_vector_h;
with opencv2_core_base_hpp;
with stddef_h;
with Interfaces.C.Extensions;
with opencv2_core_cvdef_h;
with cpp_4_7_4_bits_stl_iterator_base_types_h;

package opencv2_core_mat_hpp is

   package Class_u_InputArray is
      type u_InputArray is tagged limited record
         flags : aliased int;  -- /usr/local/include/opencv2/core/mat.hpp:116
         obj : System.Address;  -- /usr/local/include/opencv2/core/mat.hpp:117
         sz : aliased opencv2_core_types_hpp.Class_Size.Size;  -- /usr/local/include/opencv2/core/mat.hpp:118
      end record;
      pragma Import (CPP, u_InputArray);

      --  skipped func _InputArray

      --  skipped func _InputArray

      --  skipped func _InputArray

      --  skipped func _InputArray

      --  skipped func _InputArray

      --  skipped func _InputArray

      --  skipped func _InputArray

      --  skipped func _InputArray

      function getMat (this : access constant u_InputArray; i : int) return Mat;  -- /usr/local/include/opencv2/core/mat.hpp:101
      pragma Import (CPP, getMat, "_ZNK2cv11_InputArray6getMatEi");

      procedure getMatVector (this : access constant u_InputArray; mv : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/local/include/opencv2/core/mat.hpp:102
      pragma Import (CPP, getMatVector, "_ZNK2cv11_InputArray12getMatVectorERSt6vectorINS_3MatESaIS2_EE");

      function getGpuMat (this : access constant u_InputArray) return opencv2_core_base_hpp.GpuMat;  -- /usr/local/include/opencv2/core/mat.hpp:103
      pragma Import (CPP, getGpuMat, "_ZNK2cv11_InputArray9getGpuMatEv");

      function getOGlBuffer (this : access constant u_InputArray) return opencv2_core_base_hpp.Buffer;  -- /usr/local/include/opencv2/core/mat.hpp:104
      pragma Import (CPP, getOGlBuffer, "_ZNK2cv11_InputArray12getOGlBufferEv");

      function kind (this : access constant u_InputArray) return int;  -- /usr/local/include/opencv2/core/mat.hpp:106
      pragma Import (CPP, kind, "_ZNK2cv11_InputArray4kindEv");

      function size (this : access constant u_InputArray; i : int) return opencv2_core_types_hpp.Class_Size.Size;  -- /usr/local/include/opencv2/core/mat.hpp:107
      pragma Import (CPP, size, "_ZNK2cv11_InputArray4sizeEi");

      function total (this : access constant u_InputArray; i : int) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/mat.hpp:108
      pragma Import (CPP, total, "_ZNK2cv11_InputArray5totalEi");

      function c_type (this : access constant u_InputArray; i : int) return int;  -- /usr/local/include/opencv2/core/mat.hpp:109
      pragma Import (CPP, c_type, "_ZNK2cv11_InputArray4typeEi");

      function depth (this : access constant u_InputArray; i : int) return int;  -- /usr/local/include/opencv2/core/mat.hpp:110
      pragma Import (CPP, depth, "_ZNK2cv11_InputArray5depthEi");

      function channels (this : access constant u_InputArray; i : int) return int;  -- /usr/local/include/opencv2/core/mat.hpp:111
      pragma Import (CPP, channels, "_ZNK2cv11_InputArray8channelsEi");

      function empty (this : access constant u_InputArray) return Extensions.bool;  -- /usr/local/include/opencv2/core/mat.hpp:112
      pragma Import (CPP, empty, "_ZNK2cv11_InputArray5emptyEv");

      procedure nputArrayend opencv2_core_mat_hpp;
