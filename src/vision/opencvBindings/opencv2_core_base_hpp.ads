pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with opencv2_core_cvstd_hpp;
with Interfaces.C.Strings;
with stddef_h;
with Interfaces.C.Extensions;
with opencv2_core_cvdef_h;
with opencv2_core_mat_hpp;

package opencv2_core_base_hpp is

   --  unsupported macro: CVAUX_CONCAT_EXP(a,b) a ##b
   --  arg-macro: procedure CVAUX_CONCAT (a, b)
   --    CVAUX_CONCAT_EXP(a,b)
   --  unsupported macro: CV_StaticAssert(condition,reason) ({ extern int __attribute__((error("CV_StaticAssert: " reason " " #condition))) CV_StaticAssert(); ((condition) ? 0 : CV_StaticAssert()); })
   --  arg-macro: procedure CV_Error (code, msg)
   --    cv.error( code, msg, __func__, __FILE__, __LINE__ )
   --  arg-macro: procedure CV_Error_ (code, args)
   --    cv.error( code, cv.format args, __func__, __FILE__, __LINE__ )
   --  unsupported macro: CV_Assert(expr) if(!!(expr)) ; else cv::error( cv::Error::StsAssert, #expr, __func__, __FILE__, __LINE__ )
   procedure error
     (u_code : int;
      u_err : access constant opencv2_core_cvstd_hpp.Class_String.String;
      u_func : Interfaces.C.Strings.chars_ptr;
      u_file : Interfaces.C.Strings.chars_ptr;
      u_line : int);  -- /usr/local/include/opencv2/core/base.hpp:220
   pragma Import (CPP, error, "_ZN2cv5errorEiRKNS_6StringEPKcS4_i");

   function LU
     (A : access float;
      astep : stddef_h.size_t;
      m : int;
      b : access float;
      bstep : stddef_h.size_t;
      n : int) return int;  -- /usr/local/include/opencv2/core/base.hpp:291
   pragma Import (CPP, LU, "_ZN2cv2LUEPfmiS0_mi");

   function LU
     (A : access double;
      astep : stddef_h.size_t;
      m : int;
      b : access double;
      bstep : stddef_h.size_t;
      n : int) return int;  -- /usr/local/include/opencv2/core/base.hpp:292
   pragma Import (CPP, LU, "_ZN2cv2LUEPdmiS0_mi");

   function Cholesky
     (A : access float;
      astep : stddef_h.size_t;
      m : int;
      b : access float;
      bstep : stddef_h.size_t;
      n : int) return Extensions.bool;  -- /usr/local/include/opencv2/core/base.hpp:293
   pragma Import (CPP, Cholesky, "_ZN2cv8CholeskyEPfmiS0_mi");

   function Cholesky
     (A : access double;
      astep : stddef_h.size_t;
      m : int;
      b : access double;
      bstep : stddef_h.size_t;
      n : int) return Extensions.bool;  -- /usr/local/include/opencv2/core/base.hpp:294
   pragma Import (CPP, Cholesky, "_ZN2cv8CholeskyEPdmiS0_mi");

   function normL1_u
     (a : access opencv2_core_cvdef_h.uchar;
      b : access opencv2_core_cvdef_h.uchar;
      n : int) return int;  -- /usr/local/include/opencv2/core/base.hpp:296
   pragma Import (CPP, normL1_u, "_ZN2cv7normL1_EPKhS1_i");

   function normHamming
     (a : access opencv2_core_cvdef_h.uchar;
      b : access opencv2_core_cvdef_h.uchar;
      n : int) return int;  -- /usr/local/include/opencv2/core/base.hpp:297
   pragma Import (CPP, normHamming, "_ZN2cv11normHammingEPKhS1_i");

   function normHamming
     (a : access opencv2_core_cvdef_h.uchar;
      b : access opencv2_core_cvdef_h.uchar;
      n : int;
      cellSize : int) return int;  -- /usr/local/include/opencv2/core/base.hpp:298
   pragma Import (CPP, normHamming, "_ZN2cv11normHammingEPKhS1_ii");

   function normL1_u
     (a : access float;
      b : access float;
      n : int) return float;  -- /usr/local/include/opencv2/core/base.hpp:299
   pragma Import (CPP, normL1_u, "_ZN2cv7normL1_EPKfS1_i");

   function normL2Sqr_u
     (a : access float;
      b : access float;
      n : int) return float;  -- /usr/local/include/opencv2/core/base.hpp:300
   pragma Import (CPP, normL2Sqr_u, "_ZN2cv10normL2Sqr_EPKfS1_i");

   procedure exp
     (src : access float;
      dst : access float;
      n : int);  -- /usr/local/include/opencv2/core/base.hpp:302
   pragma Import (CPP, exp, "_ZN2cv3expEPKfPfi");

   procedure log
     (src : access float;
      dst : access float;
      n : int);  -- /usr/local/include/opencv2/core/base.hpp:303
   pragma Import (CPP, log, "_ZN2cv3logEPKfPfi");

   procedure fastAtan2
     (y : access float;
      x : access float;
      dst : access float;
      n : int;
      angleInDegrees : Extensions.bool);  -- /usr/local/include/opencv2/core/base.hpp:304
   pragma Import (CPP, fastAtan2, "_ZN2cv9fastAtan2EPKfS1_Pfib");

   procedure magnitude
     (x : access float;
      y : access float;
      dst : access float;
      n : int);  -- /usr/local/include/opencv2/core/base.hpp:305
   pragma Import (CPP, magnitude, "_ZN2cv9magnitudeEPKfS1_Pfi");

   function cubeRoot (val : float) return float;  -- /usr/local/include/opencv2/core/base.hpp:308
   pragma Import (CPP, cubeRoot, "_ZN2cv8cubeRootEf");

   function fastAtan2 (y : float; x : float) return float;  -- /usr/local/include/opencv2/core/base.hpp:310
   pragma Import (CPP, fastAtan2, "_ZN2cv9fastAtan2Eff");

   subtype MatND is opencv2_core_mat_hpp.Class_Mat.Mat;

   --  skipped empty struct Buffer

   --  skipped empty struct Texture2D

   --  skipped empty struct Arrays

   --  skipped empty struct GpuMat

   --  skipped empty struct CudaMem

   --  skipped empty struct Stream

   --  skipped empty struct Event

end opencv2_core_base_hpp;
