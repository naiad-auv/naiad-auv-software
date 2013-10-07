pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_mat_hpp;
limited with opencv2_core_types_hpp;
with opencv2_core_cvstd_hpp;
limited with stdio_h;

package opencv2_core_operations_hpp is

   function operator_pa (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:234
   pragma Import (CPP, operator_pa, "_ZN2cvpLERKNS_3MatES2_");

   function operator_pa (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:234
   pragma Import (CPP, operator_pa, "_ZN2cvpLERNS_3MatERKS0_");

   function operator_pa (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:235
   pragma Import (CPP, operator_pa, "_ZN2cvpLERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_pa (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:235
   pragma Import (CPP, operator_pa, "_ZN2cvpLERNS_3MatERKNS_7Scalar_IdEE");

   function operator_ma (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:240
   pragma Import (CPP, operator_ma, "_ZN2cvmIERKNS_3MatES2_");

   function operator_ma (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:240
   pragma Import (CPP, operator_ma, "_ZN2cvmIERNS_3MatERKS0_");

   function operator_ma (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:241
   pragma Import (CPP, operator_ma, "_ZN2cvmIERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_ma (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:241
   pragma Import (CPP, operator_ma, "_ZN2cvmIERNS_3MatERKNS_7Scalar_IdEE");

   function operator_ta (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:246
   pragma Import (CPP, operator_ta, "_ZN2cvmLERKNS_3MatES2_");

   function operator_ta (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:246
   pragma Import (CPP, operator_ta, "_ZN2cvmLERNS_3MatERKS0_");

   function operator_ta (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access double) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:249
   pragma Import (CPP, operator_ta, "_ZN2cvmLERKNS_3MatERKd");

   function operator_ta (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access double) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:249
   pragma Import (CPP, operator_ta, "_ZN2cvmLERNS_3MatERKd");

   function operator_da (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:252
   pragma Import (CPP, operator_da, "_ZN2cvdVERKNS_3MatES2_");

   function operator_da (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:252
   pragma Import (CPP, operator_da, "_ZN2cvdVERNS_3MatERKS0_");

   function operator_da (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access double) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:255
   pragma Import (CPP, operator_da, "_ZN2cvdVERKNS_3MatERKd");

   function operator_da (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access double) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:255
   pragma Import (CPP, operator_da, "_ZN2cvdVERNS_3MatERKd");

   function operator_ae (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:258
   pragma Import (CPP, operator_ae, "_ZN2cvaNERKNS_3MatES2_");

   function operator_ae (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:258
   pragma Import (CPP, operator_ae, "_ZN2cvaNERNS_3MatERKS0_");

   function operator_ae (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:259
   pragma Import (CPP, operator_ae, "_ZN2cvaNERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_ae (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:259
   pragma Import (CPP, operator_ae, "_ZN2cvaNERNS_3MatERKNS_7Scalar_IdEE");

   function operator_oe (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:264
   pragma Import (CPP, operator_oe, "_ZN2cvoRERKNS_3MatES2_");

   function operator_oe (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:264
   pragma Import (CPP, operator_oe, "_ZN2cvoRERNS_3MatERKS0_");

   function operator_oe (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:265
   pragma Import (CPP, operator_oe, "_ZN2cvoRERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_oe (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:265
   pragma Import (CPP, operator_oe, "_ZN2cvoRERNS_3MatERKNS_7Scalar_IdEE");

   function operator_xe (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:270
   pragma Import (CPP, operator_xe, "_ZN2cveOERKNS_3MatES2_");

   function operator_xe (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:270
   pragma Import (CPP, operator_xe, "_ZN2cveOERNS_3MatERKS0_");

   function operator_xe (a : access constant opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return access constant opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:271
   pragma Import (CPP, operator_xe, "_ZN2cveOERKNS_3MatERKNS_7Scalar_IdEE");

   function operator_xe (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return access opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core/operations.hpp:271
   pragma Import (CPP, operator_xe, "_ZN2cveOERNS_3MatERKNS_7Scalar_IdEE");

   function format (mtx : opencv2_core_mat_hpp.InputArray'Class; fmt : int) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/core/operations.hpp:401
   pragma Import (CPP, format, "_ZN2cvL6formatERKNS_11_InputArrayEi");

   function print (fmtd : access opencv2_core_cvstd_hpp.Class_Ptr.Ptr; stream : access stdio_h.FILE) return int;  -- /usr/local/include/opencv2/core/operations.hpp:407
   pragma Import (CPP, print, "_ZN2cvL5printENS_3PtrINS_9FormattedEEEP8_IO_FILE");

   function print (mtx : access constant opencv2_core_mat_hpp.Class_Mat.Mat; stream : access stdio_h.FILE) return int;  -- /usr/local/include/opencv2/core/operations.hpp:418
   pragma Import (CPP, print, "_ZN2cvL5printERKNS_3MatEP8_IO_FILE");

end opencv2_core_operations_hpp;
