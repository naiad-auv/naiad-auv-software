pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_types_h;
with stdint_h;

package opencv2_core_cvdef_h is


   CV_ENABLE_UNROLLED : constant := 1;  --  /usr/local/include/opencv2/core/cvdef.h:73
   --  unsupported macro: CV_EXPORTS __attribute__ ((visibility ("default")))
   --  unsupported macro: CV_INLINE static inline
   --  unsupported macro: CV_EXTERN_C extern "C"

   CV_CPU_NONE : constant := 0;  --  /usr/local/include/opencv2/core/cvdef.h:103
   CV_CPU_MMX : constant := 1;  --  /usr/local/include/opencv2/core/cvdef.h:104
   CV_CPU_SSE : constant := 2;  --  /usr/local/include/opencv2/core/cvdef.h:105
   CV_CPU_SSE2 : constant := 3;  --  /usr/local/include/opencv2/core/cvdef.h:106
   CV_CPU_SSE3 : constant := 4;  --  /usr/local/include/opencv2/core/cvdef.h:107
   CV_CPU_SSSE3 : constant := 5;  --  /usr/local/include/opencv2/core/cvdef.h:108
   CV_CPU_SSE4_1 : constant := 6;  --  /usr/local/include/opencv2/core/cvdef.h:109
   CV_CPU_SSE4_2 : constant := 7;  --  /usr/local/include/opencv2/core/cvdef.h:110
   CV_CPU_POPCNT : constant := 8;  --  /usr/local/include/opencv2/core/cvdef.h:111
   CV_CPU_AVX : constant := 10;  --  /usr/local/include/opencv2/core/cvdef.h:112
   CV_CPU_NEON : constant := 11;  --  /usr/local/include/opencv2/core/cvdef.h:113
   CV_HARDWARE_MAX_FEATURE : constant := 255;  --  /usr/local/include/opencv2/core/cvdef.h:114

   CV_SSE : constant := 1;  --  /usr/local/include/opencv2/core/cvdef.h:121
   CV_SSE2 : constant := 1;  --  /usr/local/include/opencv2/core/cvdef.h:122

   CV_SSE3 : constant := 0;  --  /usr/local/include/opencv2/core/cvdef.h:171

   CV_SSSE3 : constant := 0;  --  /usr/local/include/opencv2/core/cvdef.h:174

   CV_SSE4_1 : constant := 0;  --  /usr/local/include/opencv2/core/cvdef.h:177

   CV_SSE4_2 : constant := 0;  --  /usr/local/include/opencv2/core/cvdef.h:180

   CV_AVX : constant := 0;  --  /usr/local/include/opencv2/core/cvdef.h:183

   CV_NEON : constant := 0;  --  /usr/local/include/opencv2/core/cvdef.h:186
   --  unsupported macro: CV_BIG_INT(n) n ##LL
   --  unsupported macro: CV_BIG_UINT(n) n ##ULL
   --  unsupported macro: CV_EXPORTS_W CV_EXPORTS
   --  unsupported macro: CV_EXPORTS_W_SIMPLE CV_EXPORTS
   --  arg-macro: procedure CV_EXPORTS_AS (synonym)
   --    CV_EXPORTS
   --  unsupported macro: CV_EXPORTS_W_MAP CV_EXPORTS

   CV_PI : constant := 3.1415926535897932384626433832795;  --  /usr/local/include/opencv2/core/cvdef.h:245
   CV_LOG2 : constant := 8#.69314718055994530941723212145818#;  --  /usr/local/include/opencv2/core/cvdef.h:246

   CV_CN_MAX : constant := 512;  --  /usr/local/include/opencv2/core/cvdef.h:252
   CV_CN_SHIFT : constant := 3;  --  /usr/local/include/opencv2/core/cvdef.h:253
   --  unsupported macro: CV_DEPTH_MAX (1 << CV_CN_SHIFT)

   CV_8U : constant := 0;  --  /usr/local/include/opencv2/core/cvdef.h:256
   CV_8S : constant := 1;  --  /usr/local/include/opencv2/core/cvdef.h:257
   CV_16U : constant := 2;  --  /usr/local/include/opencv2/core/cvdef.h:258
   CV_16S : constant := 3;  --  /usr/local/include/opencv2/core/cvdef.h:259
   CV_32S : constant := 4;  --  /usr/local/include/opencv2/core/cvdef.h:260
   CV_32F : constant := 5;  --  /usr/local/include/opencv2/core/cvdef.h:261
   CV_64F : constant := 6;  --  /usr/local/include/opencv2/core/cvdef.h:262
   CV_USRTYPE1 : constant := 7;  --  /usr/local/include/opencv2/core/cvdef.h:263
   --  unsupported macro: CV_MAT_DEPTH_MASK (CV_DEPTH_MAX - 1)
   --  arg-macro: function CV_MAT_DEPTH (flags)
   --    return (flags) and CV_MAT_DEPTH_MASK;
   --  arg-macro: function CV_MAKETYPE (depth, cn)
   --    return CV_MAT_DEPTH(depth) + (((cn)-1) << CV_CN_SHIFT);
   --  unsupported macro: CV_MAKE_TYPE CV_MAKETYPE
   --  unsupported macro: CV_8UC1 CV_MAKETYPE(CV_8U,1)
   --  unsupported macro: CV_8UC2 CV_MAKETYPE(CV_8U,2)
   --  unsupported macro: CV_8UC3 CV_MAKETYPE(CV_8U,3)
   --  unsupported macro: CV_8UC4 CV_MAKETYPE(CV_8U,4)
   --  arg-macro: procedure CV_8UC (n)
   --    CV_MAKETYPE(CV_8U,(n))
   --  unsupported macro: CV_8SC1 CV_MAKETYPE(CV_8S,1)
   --  unsupported macro: CV_8SC2 CV_MAKETYPE(CV_8S,2)
   --  unsupported macro: CV_8SC3 CV_MAKETYPE(CV_8S,3)
   --  unsupported macro: CV_8SC4 CV_MAKETYPE(CV_8S,4)
   --  arg-macro: procedure CV_8SC (n)
   --    CV_MAKETYPE(CV_8S,(n))
   --  unsupported macro: CV_16UC1 CV_MAKETYPE(CV_16U,1)
   --  unsupported macro: CV_16UC2 CV_MAKETYPE(CV_16U,2)
   --  unsupported macro: CV_16UC3 CV_MAKETYPE(CV_16U,3)
   --  unsupported macro: CV_16UC4 CV_MAKETYPE(CV_16U,4)
   --  arg-macro: procedure CV_16UC (n)
   --    CV_MAKETYPE(CV_16U,(n))
   --  unsupported macro: CV_16SC1 CV_MAKETYPE(CV_16S,1)
   --  unsupported macro: CV_16SC2 CV_MAKETYPE(CV_16S,2)
   --  unsupported macro: CV_16SC3 CV_MAKETYPE(CV_16S,3)
   --  unsupported macro: CV_16SC4 CV_MAKETYPE(CV_16S,4)
   --  arg-macro: procedure CV_16SC (n)
   --    CV_MAKETYPE(CV_16S,(n))
   --  unsupported macro: CV_32SC1 CV_MAKETYPE(CV_32S,1)
   --  unsupported macro: CV_32SC2 CV_MAKETYPE(CV_32S,2)
   --  unsupported macro: CV_32SC3 CV_MAKETYPE(CV_32S,3)
   --  unsupported macro: CV_32SC4 CV_MAKETYPE(CV_32S,4)
   --  arg-macro: procedure CV_32SC (n)
   --    CV_MAKETYPE(CV_32S,(n))
   --  unsupported macro: CV_32FC1 CV_MAKETYPE(CV_32F,1)
   --  unsupported macro: CV_32FC2 CV_MAKETYPE(CV_32F,2)
   --  unsupported macro: CV_32FC3 CV_MAKETYPE(CV_32F,3)
   --  unsupported macro: CV_32FC4 CV_MAKETYPE(CV_32F,4)
   --  arg-macro: procedure CV_32FC (n)
   --    CV_MAKETYPE(CV_32F,(n))
   --  unsupported macro: CV_64FC1 CV_MAKETYPE(CV_64F,1)
   --  unsupported macro: CV_64FC2 CV_MAKETYPE(CV_64F,2)
   --  unsupported macro: CV_64FC3 CV_MAKETYPE(CV_64F,3)
   --  unsupported macro: CV_64FC4 CV_MAKETYPE(CV_64F,4)
   --  arg-macro: procedure CV_64FC (n)
   --    CV_MAKETYPE(CV_64F,(n))
   --  unsupported macro: CV_MAT_CN_MASK ((CV_CN_MAX - 1) << CV_CN_SHIFT)
   --  arg-macro: function CV_MAT_CN (flags)
   --    return (((flags) and CV_MAT_CN_MASK) >> CV_CN_SHIFT) + 1;
   --  unsupported macro: CV_MAT_TYPE_MASK (CV_DEPTH_MAX*CV_CN_MAX - 1)
   --  arg-macro: function CV_MAT_TYPE (flags)
   --    return (flags) and CV_MAT_TYPE_MASK;

   CV_MAT_CONT_FLAG_SHIFT : constant := 14;  --  /usr/local/include/opencv2/core/cvdef.h:317
   --  unsupported macro: CV_MAT_CONT_FLAG (1 << CV_MAT_CONT_FLAG_SHIFT)
   --  arg-macro: function CV_IS_MAT_CONT (flags)
   --    return (flags) and CV_MAT_CONT_FLAG;
   --  unsupported macro: CV_IS_CONT_MAT CV_IS_MAT_CONT

   CV_SUBMAT_FLAG_SHIFT : constant := 15;  --  /usr/local/include/opencv2/core/cvdef.h:321
   --  unsupported macro: CV_SUBMAT_FLAG (1 << CV_SUBMAT_FLAG_SHIFT)
   --  arg-macro: function CV_IS_SUBMAT (flags)
   --    return (flags) and CV_MAT_SUBMAT_FLAG;
   --  arg-macro: function CV_ELEM_SIZE1 (type)
   --    return (((sizeof(size_t)<<28)or16#8442211#) >> CV_MAT_DEPTH(type)*4) and 15;
   --  arg-macro: function CV_ELEM_SIZE (type)
   --    return CV_MAT_CN(type) << ((((sizeof(size_t)/4+1)*16384or16#3a50#) >> CV_MAT_DEPTH(type)*2) and 3);
   --  arg-macro: function MIN (a, b)
   --    return (a) > (b) ? (b) : (a);
   --  arg-macro: function MAX (a, b)
   --    return (a) < (b) ? (b) : (a);
   --  arg-macro: function CV_XADD (addr, delta)
   --    return int)__atomic_fetch_add((unsigned*)(addr), (unsigned)(delta), __ATOMIC_ACQ_REL;

   subtype uint is unsigned;  -- /usr/local/include/opencv2/core/cvdef.h:207

   subtype schar is signed_char;  -- /usr/local/include/opencv2/core/cvdef.h:213

   subtype uchar is unsigned_char;  -- /usr/local/include/opencv2/core/cvdef.h:216

   subtype ushort is unsigned_short;  -- /usr/local/include/opencv2/core/cvdef.h:217

   subtype int64 is sys_types_h.int64_t;  -- /usr/local/include/opencv2/core/cvdef.h:226

   subtype uint64 is stdint_h.uint64_t;  -- /usr/local/include/opencv2/core/cvdef.h:227

   function cvRound (value : double) return int;  -- /usr/local/include/opencv2/core/cvdef.h:359
   pragma Import (CPP, cvRound, "_ZL7cvRoundd");

   function cvFloor (value : double) return int;  -- /usr/local/include/opencv2/core/cvdef.h:390
   pragma Import (CPP, cvFloor, "_ZL7cvFloord");

   function cvCeil (value : double) return int;  -- /usr/local/include/opencv2/core/cvdef.h:406
   pragma Import (CPP, cvCeil, "_ZL6cvCeild");

   function cvIsNaN (value : double) return int;  -- /usr/local/include/opencv2/core/cvdef.h:422
   pragma Import (CPP, cvIsNaN, "_ZL7cvIsNaNd");

   function cvIsInf (value : double) return int;  -- /usr/local/include/opencv2/core/cvdef.h:430
   pragma Import (CPP, cvIsInf, "_ZL7cvIsInfd");

end opencv2_core_cvdef_h;
