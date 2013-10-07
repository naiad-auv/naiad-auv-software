pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with cpp_4_7_4_exception;
with opencv2_core_cvstd_hpp;
with Interfaces.C.Strings;
with opencv2_core_mat_hpp;
with opencv2_core_types_hpp;
with Interfaces.C.Extensions;
with stddef_h;
with cpp_4_7_4_bits_stl_vector_h;
with System;
limited with opencv2_core_persistence_hpp;
with opencv2_core_cvdef_h;

package opencv2_core_hpp is

   package Class_c_Exception is
      type c_Exception is limited new cpp_4_7_4_exception.Class_c_exception.c_exception with record
         msg : aliased opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core.hpp:89
         code : aliased int;  -- /usr/local/include/opencv2/core.hpp:91
         err : aliased opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core.hpp:92
         func : aliased opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core.hpp:93
         file : aliased opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core.hpp:94
         line : aliased int;  -- /usr/local/include/opencv2/core.hpp:95
      end record;
      pragma Import (CPP, c_Exception);

      function New_c_Exception return c_Exception;  -- /usr/local/include/opencv2/core.hpp:75
      pragma CPP_Constructor (New_c_Exception, "_ZN2cv9ExceptionC1Ev");

      function New_c_Exception
        (u_code : int;
         u_err : access constant opencv2_core_cvstd_hpp.Class_String.String;
         u_func : access constant opencv2_core_cvstd_hpp.Class_String.String;
         u_file : access constant opencv2_core_cvstd_hpp.Class_String.String;
         u_line : int) return c_Exception;  -- /usr/local/include/opencv2/core.hpp:80
      pragma CPP_Constructor (New_c_Exception, "_ZN2cv9ExceptionC1EiRKNS_6StringES3_S3_i");

      procedure Delete_c_Exception (this : access c_Exception);  -- /usr/local/include/opencv2/core.hpp:81
      pragma Import (CPP, Delete_c_Exception, "_ZN2cv9ExceptionD1Ev");

      procedure deleting_dtor (this : access c_Exception);  -- /usr/local/include/opencv2/core.hpp:81
      pragma Import (CPP, deleting_dtor, "_ZN2cv9ExceptionD0Ev");

      function what (this : access constant c_Exception) return Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/opencv2/core.hpp:86
      pragma Import (CPP, what, "_ZNK2cv9Exception4whatEv");

      procedure formatMessage (this : access c_Exception'Class);  -- /usr/local/include/opencv2/core.hpp:87
      pragma Import (CPP, formatMessage, "_ZN2cv9Exception13formatMessageEv");
   end;
   use Class_c_Exception;
   procedure error (exc : access constant c_Exception'Class);  -- /usr/local/include/opencv2/core.hpp:109
   pragma Import (CPP, error, "_ZN2cv5errorERKNS_9ExceptionE");

   procedure swap (a : access opencv2_core_mat_hpp.Class_Mat.Mat; b : access opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/core.hpp:159
   pragma Import (CPP, swap, "_ZN2cv4swapERNS_3MatES1_");

   function borderInterpolate
     (p : int;
      len : int;
      borderType : int) return int;  -- /usr/local/include/opencv2/core.hpp:162
   pragma Import (CPP, borderInterpolate, "_ZN2cv17borderInterpolateEiii");

   procedure copyMakeBorder
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      top : int;
      bottom : int;
      left : int;
      right : int;
      borderType : int;
      value : access constant opencv2_core_types_hpp.Class_Scalar.Scalar);  -- /usr/local/include/opencv2/core.hpp:165
   pragma Import (CPP, copyMakeBorder, "_ZN2cv14copyMakeBorderERKNS_11_InputArrayERKNS_12_OutputArrayEiiiiiRKNS_7Scalar_IdEE");

   procedure add
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      mask : opencv2_core_mat_hpp.InputArray'Class;
      dtype : int);  -- /usr/local/include/opencv2/core.hpp:170
   pragma Import (CPP, add, "_ZN2cv3addERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_i");

   procedure subtract
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      mask : opencv2_core_mat_hpp.InputArray'Class;
      dtype : int);  -- /usr/local/include/opencv2/core.hpp:174
   pragma Import (CPP, subtract, "_ZN2cv8subtractERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_i");

   procedure multiply
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      scale : double;
      dtype : int);  -- /usr/local/include/opencv2/core.hpp:178
   pragma Import (CPP, multiply, "_ZN2cv8multiplyERKNS_11_InputArrayES2_RKNS_12_OutputArrayEdi");

   procedure divide
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      scale : double;
      dtype : int);  -- /usr/local/include/opencv2/core.hpp:182
   pragma Import (CPP, divide, "_ZN2cv6divideERKNS_11_InputArrayES2_RKNS_12_OutputArrayEdi");

   procedure divide
     (scale : double;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      dtype : int);  -- /usr/local/include/opencv2/core.hpp:186
   pragma Import (CPP, divide, "_ZN2cv6divideEdRKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure scaleAdd
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      alpha : double;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:190
   pragma Import (CPP, scaleAdd, "_ZN2cv8scaleAddERKNS_11_InputArrayEdS2_RKNS_12_OutputArrayE");

   procedure addWeighted
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      alpha : double;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      beta : double;
      gamma : double;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      dtype : int);  -- /usr/local/include/opencv2/core.hpp:193
   pragma Import (CPP, addWeighted, "_ZN2cv11addWeightedERKNS_11_InputArrayEdS2_ddRKNS_12_OutputArrayEi");

   procedure convertScaleAbs
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      alpha : double;
      beta : double);  -- /usr/local/include/opencv2/core.hpp:197
   pragma Import (CPP, convertScaleAbs, "_ZN2cv15convertScaleAbsERKNS_11_InputArrayERKNS_12_OutputArrayEdd");

   procedure LUT
     (src : opencv2_core_mat_hpp.InputArray'Class;
      lut : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:201
   pragma Import (CPP, LUT, "_ZN2cv3LUTERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   function sum (src : opencv2_core_mat_hpp.InputArray'Class) return opencv2_core_types_hpp.Class_Scalar.Scalar;  -- /usr/local/include/opencv2/core.hpp:204
   pragma Import (CPP, sum, "_ZN2cv3sumERKNS_11_InputArrayE");

   function countNonZero (src : opencv2_core_mat_hpp.InputArray'Class) return int;  -- /usr/local/include/opencv2/core.hpp:207
   pragma Import (CPP, countNonZero, "_ZN2cv12countNonZeroERKNS_11_InputArrayE");

   procedure findNonZero (src : opencv2_core_mat_hpp.InputArray'Class; idx : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:210
   pragma Import (CPP, findNonZero, "_ZN2cv11findNonZeroERKNS_11_InputArrayERKNS_12_OutputArrayE");

   function mean (src : opencv2_core_mat_hpp.InputArray'Class; mask : opencv2_core_mat_hpp.InputArray'Class) return opencv2_core_types_hpp.Class_Scalar.Scalar;  -- /usr/local/include/opencv2/core.hpp:213
   pragma Import (CPP, mean, "_ZN2cv4meanERKNS_11_InputArrayES2_");

   procedure meanStdDev
     (src : opencv2_core_mat_hpp.InputArray'Class;
      mean : opencv2_core_mat_hpp.OutputArray'Class;
      stddev : opencv2_core_mat_hpp.OutputArray'Class;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:216
   pragma Import (CPP, meanStdDev, "_ZN2cv10meanStdDevERKNS_11_InputArrayERKNS_12_OutputArrayES5_S2_");

   function norm
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      normType : int;
      mask : opencv2_core_mat_hpp.InputArray'Class) return double;  -- /usr/local/include/opencv2/core.hpp:220
   pragma Import (CPP, norm, "_ZN2cv4normERKNS_11_InputArrayEiS2_");

   function norm
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      normType : int;
      mask : opencv2_core_mat_hpp.InputArray'Class) return double;  -- /usr/local/include/opencv2/core.hpp:223
   pragma Import (CPP, norm, "_ZN2cv4normERKNS_11_InputArrayES2_iS2_");

   function PSNR (src1 : opencv2_core_mat_hpp.InputArray'Class; src2 : opencv2_core_mat_hpp.InputArray'Class) return double;  -- /usr/local/include/opencv2/core.hpp:227
   pragma Import (CPP, PSNR, "_ZN2cv4PSNRERKNS_11_InputArrayES2_");

   function norm (src : access constant opencv2_core_mat_hpp.Class_SparseMat.SparseMat; normType : int) return double;  -- /usr/local/include/opencv2/core.hpp:230
   pragma Import (CPP, norm, "_ZN2cv4normERKNS_9SparseMatEi");

   procedure batchDistance
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dist : opencv2_core_mat_hpp.OutputArray'Class;
      dtype : int;
      nidx : opencv2_core_mat_hpp.OutputArray'Class;
      normType : int;
      K : int;
      mask : opencv2_core_mat_hpp.InputArray'Class;
      update : int;
      crosscheck : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:233
   pragma Import (CPP, batchDistance, "_ZN2cv13batchDistanceERKNS_11_InputArrayES2_RKNS_12_OutputArrayEiS5_iiS2_ib");

   procedure normalize
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      alpha : double;
      beta : double;
      norm_type : int;
      dtype : int;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:240
   pragma Import (CPP, normalize, "_ZN2cv9normalizeERKNS_11_InputArrayERKNS_12_OutputArrayEddiiS2_");

   procedure normalize
     (src : access constant opencv2_core_mat_hpp.Class_SparseMat.SparseMat;
      dst : access opencv2_core_mat_hpp.Class_SparseMat.SparseMat;
      alpha : double;
      normType : int);  -- /usr/local/include/opencv2/core.hpp:244
   pragma Import (CPP, normalize, "_ZN2cv9normalizeERKNS_9SparseMatERS0_di");

   procedure minMaxLoc
     (src : opencv2_core_mat_hpp.InputArray'Class;
      minVal : access double;
      maxVal : access double;
      minLoc : access opencv2_core_types_hpp.Class_Point.Point;
      maxLoc : access opencv2_core_types_hpp.Class_Point.Point;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:247
   pragma Import (CPP, minMaxLoc, "_ZN2cv9minMaxLocERKNS_11_InputArrayEPdS3_PNS_6Point_IiEES6_S2_");

   procedure minMaxIdx
     (src : opencv2_core_mat_hpp.InputArray'Class;
      minVal : access double;
      maxVal : access double;
      minIdx : access int;
      maxIdx : access int;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:251
   pragma Import (CPP, minMaxIdx, "_ZN2cv9minMaxIdxERKNS_11_InputArrayEPdS3_PiS4_S2_");

   procedure minMaxLoc
     (a : access constant opencv2_core_mat_hpp.Class_SparseMat.SparseMat;
      minVal : access double;
      maxVal : access double;
      minIdx : access int;
      maxIdx : access int);  -- /usr/local/include/opencv2/core.hpp:255
   pragma Import (CPP, minMaxLoc, "_ZN2cv9minMaxLocERKNS_9SparseMatEPdS3_PiS4_");

   procedure reduce
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      dim : int;
      rtype : int;
      dtype : int);  -- /usr/local/include/opencv2/core.hpp:259
   pragma Import (CPP, reduce, "_ZN2cv6reduceERKNS_11_InputArrayERKNS_12_OutputArrayEiii");

   procedure merge
     (mv : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      count : stddef_h.size_t;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:262
   pragma Import (CPP, merge, "_ZN2cv5mergeEPKNS_3MatEmRKNS_12_OutputArrayE");

   procedure merge (mv : opencv2_core_mat_hpp.InputArrayOfArrays'Class; dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:265
   pragma Import (CPP, merge, "_ZN2cv5mergeERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure split (src : access constant opencv2_core_mat_hpp.Class_Mat.Mat; mvbegin : access opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/core.hpp:268
   pragma Import (CPP, split, "_ZN2cv5splitERKNS_3MatEPS0_");

   procedure split (m : opencv2_core_mat_hpp.InputArray'Class; mv : opencv2_core_mat_hpp.OutputArrayOfArrays'Class);  -- /usr/local/include/opencv2/core.hpp:271
   pragma Import (CPP, split, "_ZN2cv5splitERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure mixChannels
     (src : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      nsrcs : stddef_h.size_t;
      dst : access opencv2_core_mat_hpp.Class_Mat.Mat;
      ndsts : stddef_h.size_t;
      fromTo : access int;
      npairs : stddef_h.size_t);  -- /usr/local/include/opencv2/core.hpp:274
   pragma Import (CPP, mixChannels, "_ZN2cv11mixChannelsEPKNS_3MatEmPS0_mPKim");

   procedure mixChannels
     (src : opencv2_core_mat_hpp.InputArrayOfArrays'Class;
      dst : opencv2_core_mat_hpp.InputOutputArrayOfArrays'Class;
      fromTo : access int;
      npairs : stddef_h.size_t);  -- /usr/local/include/opencv2/core.hpp:277
   pragma Import (CPP, mixChannels, "_ZN2cv11mixChannelsERKNS_11_InputArrayERKNS_12_OutputArrayEPKim");

   procedure mixChannels
     (src : opencv2_core_mat_hpp.InputArrayOfArrays'Class;
      dst : opencv2_core_mat_hpp.InputOutputArrayOfArrays'Class;
      fromTo : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/local/include/opencv2/core.hpp:280
   pragma Import (CPP, mixChannels, "_ZN2cv11mixChannelsERKNS_11_InputArrayERKNS_12_OutputArrayERKSt6vectorIiSaIiEE");

   procedure extractChannel
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      coi : int);  -- /usr/local/include/opencv2/core.hpp:284
   pragma Import (CPP, extractChannel, "_ZN2cv14extractChannelERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure insertChannel
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.InputOutputArray'Class;
      coi : int);  -- /usr/local/include/opencv2/core.hpp:287
   pragma Import (CPP, insertChannel, "_ZN2cv13insertChannelERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure flip
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      flipCode : int);  -- /usr/local/include/opencv2/core.hpp:290
   pragma Import (CPP, flip, "_ZN2cv4flipERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure repeat
     (src : opencv2_core_mat_hpp.InputArray'Class;
      ny : int;
      nx : int;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:293
   pragma Import (CPP, repeat, "_ZN2cv6repeatERKNS_11_InputArrayEiiRKNS_12_OutputArrayE");

   function repeat
     (src : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      ny : int;
      nx : int) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:295
   pragma Import (CPP, repeat, "_ZN2cv6repeatERKNS_3MatEii");

   procedure hconcat
     (src : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      nsrc : stddef_h.size_t;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:297
   pragma Import (CPP, hconcat, "_ZN2cv7hconcatEPKNS_3MatEmRKNS_12_OutputArrayE");

   procedure hconcat
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:299
   pragma Import (CPP, hconcat, "_ZN2cv7hconcatERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   procedure hconcat (src : opencv2_core_mat_hpp.InputArrayOfArrays'Class; dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:301
   pragma Import (CPP, hconcat, "_ZN2cv7hconcatERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure vconcat
     (src : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      nsrc : stddef_h.size_t;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:303
   pragma Import (CPP, vconcat, "_ZN2cv7vconcatEPKNS_3MatEmRKNS_12_OutputArrayE");

   procedure vconcat
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:305
   pragma Import (CPP, vconcat, "_ZN2cv7vconcatERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   procedure vconcat (src : opencv2_core_mat_hpp.InputArrayOfArrays'Class; dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:307
   pragma Import (CPP, vconcat, "_ZN2cv7vconcatERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure bitwise_and
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:310
   pragma Import (CPP, bitwise_and, "_ZN2cv11bitwise_andERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_");

   procedure bitwise_or
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:314
   pragma Import (CPP, bitwise_or, "_ZN2cv10bitwise_orERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_");

   procedure bitwise_xor
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:318
   pragma Import (CPP, bitwise_xor, "_ZN2cv11bitwise_xorERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_");

   procedure bitwise_not
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:322
   pragma Import (CPP, bitwise_not, "_ZN2cv11bitwise_notERKNS_11_InputArrayERKNS_12_OutputArrayES2_");

   procedure absdiff
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:326
   pragma Import (CPP, absdiff, "_ZN2cv7absdiffERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   procedure inRange
     (src : opencv2_core_mat_hpp.InputArray'Class;
      lowerb : opencv2_core_mat_hpp.InputArray'Class;
      upperb : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:329
   pragma Import (CPP, inRange, "_ZN2cv7inRangeERKNS_11_InputArrayES2_S2_RKNS_12_OutputArrayE");

   procedure compare
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      cmpop : int);  -- /usr/local/include/opencv2/core.hpp:333
   pragma Import (CPP, compare, "_ZN2cv7compareERKNS_11_InputArrayES2_RKNS_12_OutputArrayEi");

   procedure min
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:336
   pragma Import (CPP, min, "_ZN2cv3minERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   procedure max
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:339
   pragma Import (CPP, max, "_ZN2cv3maxERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   procedure min
     (src1 : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      src2 : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      dst : access opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/core.hpp:344
   pragma Import (CPP, min, "_ZN2cv3minERKNS_3MatES2_RS0_");

   procedure max
     (src1 : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      src2 : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      dst : access opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/core.hpp:346
   pragma Import (CPP, max, "_ZN2cv3maxERKNS_3MatES2_RS0_");

   procedure sqrt (src : opencv2_core_mat_hpp.InputArray'Class; dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:349
   pragma Import (CPP, sqrt, "_ZN2cv4sqrtERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure pow
     (src : opencv2_core_mat_hpp.InputArray'Class;
      power : double;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:352
   pragma Import (CPP, pow, "_ZN2cv3powERKNS_11_InputArrayEdRKNS_12_OutputArrayE");

   procedure exp (src : opencv2_core_mat_hpp.InputArray'Class; dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:355
   pragma Import (CPP, exp, "_ZN2cv3expERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure log (src : opencv2_core_mat_hpp.InputArray'Class; dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:358
   pragma Import (CPP, log, "_ZN2cv3logERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure polarToCart
     (magnitude : opencv2_core_mat_hpp.InputArray'Class;
      angle : opencv2_core_mat_hpp.InputArray'Class;
      x : opencv2_core_mat_hpp.OutputArray'Class;
      y : opencv2_core_mat_hpp.OutputArray'Class;
      angleInDegrees : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:361
   pragma Import (CPP, polarToCart, "_ZN2cv11polarToCartERKNS_11_InputArrayES2_RKNS_12_OutputArrayES5_b");

   procedure cartToPolar
     (x : opencv2_core_mat_hpp.InputArray'Class;
      y : opencv2_core_mat_hpp.InputArray'Class;
      magnitude : opencv2_core_mat_hpp.OutputArray'Class;
      angle : opencv2_core_mat_hpp.OutputArray'Class;
      angleInDegrees : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:365
   pragma Import (CPP, cartToPolar, "_ZN2cv11cartToPolarERKNS_11_InputArrayES2_RKNS_12_OutputArrayES5_b");

   procedure phase
     (x : opencv2_core_mat_hpp.InputArray'Class;
      y : opencv2_core_mat_hpp.InputArray'Class;
      angle : opencv2_core_mat_hpp.OutputArray'Class;
      angleInDegrees : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:370
   pragma Import (CPP, phase, "_ZN2cv5phaseERKNS_11_InputArrayES2_RKNS_12_OutputArrayEb");

   procedure magnitude
     (x : opencv2_core_mat_hpp.InputArray'Class;
      y : opencv2_core_mat_hpp.InputArray'Class;
      magnitude : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:374
   pragma Import (CPP, magnitude, "_ZN2cv9magnitudeERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   function checkRange
     (a : opencv2_core_mat_hpp.InputArray'Class;
      quiet : Extensions.bool;
      pos : access opencv2_core_types_hpp.Class_Point.Point;
      minVal : double;
      maxVal : double) return Extensions.bool;  -- /usr/local/include/opencv2/core.hpp:377
   pragma Import (CPP, checkRange, "_ZN2cv10checkRangeERKNS_11_InputArrayEbPNS_6Point_IiEEdd");

   procedure patchNaNs (a : opencv2_core_mat_hpp.InputOutputArray'Class; val : double);  -- /usr/local/include/opencv2/core.hpp:381
   pragma Import (CPP, patchNaNs, "_ZN2cv9patchNaNsERKNS_12_OutputArrayEd");

   procedure gemm
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      alpha : double;
      src3 : opencv2_core_mat_hpp.InputArray'Class;
      gamma : double;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int);  -- /usr/local/include/opencv2/core.hpp:384
   pragma Import (CPP, gemm, "_ZN2cv4gemmERKNS_11_InputArrayES2_dS2_dRKNS_12_OutputArrayEi");

   procedure mulTransposed
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      aTa : Extensions.bool;
      c_delta : opencv2_core_mat_hpp.InputArray'Class;
      scale : double;
      dtype : int);  -- /usr/local/include/opencv2/core.hpp:388
   pragma Import (CPP, mulTransposed, "_ZN2cv13mulTransposedERKNS_11_InputArrayERKNS_12_OutputArrayEbS2_di");

   procedure transpose (src : opencv2_core_mat_hpp.InputArray'Class; dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:393
   pragma Import (CPP, transpose, "_ZN2cv9transposeERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure transform
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      m : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:396
   pragma Import (CPP, transform, "_ZN2cv9transformERKNS_11_InputArrayERKNS_12_OutputArrayES2_");

   procedure perspectiveTransform
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      m : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:399
   pragma Import (CPP, perspectiveTransform, "_ZN2cv20perspectiveTransformERKNS_11_InputArrayERKNS_12_OutputArrayES2_");

   procedure completeSymm (mtx : opencv2_core_mat_hpp.InputOutputArray'Class; lowerToUpper : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:402
   pragma Import (CPP, completeSymm, "_ZN2cv12completeSymmERKNS_12_OutputArrayEb");

   procedure setIdentity (mtx : opencv2_core_mat_hpp.InputOutputArray'Class; s : access constant opencv2_core_types_hpp.Class_Scalar.Scalar);  -- /usr/local/include/opencv2/core.hpp:405
   pragma Import (CPP, setIdentity, "_ZN2cv11setIdentityERKNS_12_OutputArrayERKNS_7Scalar_IdEE");

   function determinant (mtx : opencv2_core_mat_hpp.InputArray'Class) return double;  -- /usr/local/include/opencv2/core.hpp:408
   pragma Import (CPP, determinant, "_ZN2cv11determinantERKNS_11_InputArrayE");

   function trace (mtx : opencv2_core_mat_hpp.InputArray'Class) return opencv2_core_types_hpp.Class_Scalar.Scalar;  -- /usr/local/include/opencv2/core.hpp:411
   pragma Import (CPP, trace, "_ZN2cv5traceERKNS_11_InputArrayE");

   function invert
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int) return double;  -- /usr/local/include/opencv2/core.hpp:414
   pragma Import (CPP, invert, "_ZN2cv6invertERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   function solve
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int) return Extensions.bool;  -- /usr/local/include/opencv2/core.hpp:417
   pragma Import (CPP, solve, "_ZN2cv5solveERKNS_11_InputArrayES2_RKNS_12_OutputArrayEi");

   procedure sort
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int);  -- /usr/local/include/opencv2/core.hpp:421
   pragma Import (CPP, sort, "_ZN2cv4sortERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure sortIdx
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int);  -- /usr/local/include/opencv2/core.hpp:424
   pragma Import (CPP, sortIdx, "_ZN2cv7sortIdxERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   function solveCubic (coeffs : opencv2_core_mat_hpp.InputArray'Class; roots : opencv2_core_mat_hpp.OutputArray'Class) return int;  -- /usr/local/include/opencv2/core.hpp:427
   pragma Import (CPP, solveCubic, "_ZN2cv10solveCubicERKNS_11_InputArrayERKNS_12_OutputArrayE");

   function solvePoly
     (coeffs : opencv2_core_mat_hpp.InputArray'Class;
      roots : opencv2_core_mat_hpp.OutputArray'Class;
      maxIters : int) return double;  -- /usr/local/include/opencv2/core.hpp:430
   pragma Import (CPP, solvePoly, "_ZN2cv9solvePolyERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   function eigen
     (src : opencv2_core_mat_hpp.InputArray'Class;
      eigenvalues : opencv2_core_mat_hpp.OutputArray'Class;
      eigenvectors : opencv2_core_mat_hpp.OutputArray'Class) return Extensions.bool;  -- /usr/local/include/opencv2/core.hpp:433
   pragma Import (CPP, eigen, "_ZN2cv5eigenERKNS_11_InputArrayERKNS_12_OutputArrayES5_");

   procedure calcCovarMatrix
     (samples : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      nsamples : int;
      covar : access opencv2_core_mat_hpp.Class_Mat.Mat;
      mean : access opencv2_core_mat_hpp.Class_Mat.Mat;
      flags : int;
      ctype : int);  -- /usr/local/include/opencv2/core.hpp:437
   pragma Import (CPP, calcCovarMatrix, "_ZN2cv15calcCovarMatrixEPKNS_3MatEiRS0_S3_ii");

   procedure calcCovarMatrix
     (samples : opencv2_core_mat_hpp.InputArray'Class;
      covar : opencv2_core_mat_hpp.OutputArray'Class;
      mean : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int;
      ctype : int);  -- /usr/local/include/opencv2/core.hpp:441
   pragma Import (CPP, calcCovarMatrix, "_ZN2cv15calcCovarMatrixERKNS_11_InputArrayERKNS_12_OutputArrayES5_ii");

   procedure PCACompute
     (data : opencv2_core_mat_hpp.InputArray'Class;
      mean : opencv2_core_mat_hpp.InputOutputArray'Class;
      eigenvectors : opencv2_core_mat_hpp.OutputArray'Class;
      maxComponents : int);  -- /usr/local/include/opencv2/core.hpp:444
   pragma Import (CPP, PCACompute, "_ZN2cv10PCAComputeERKNS_11_InputArrayERKNS_12_OutputArrayES5_i");

   procedure PCACompute
     (data : opencv2_core_mat_hpp.InputArray'Class;
      mean : opencv2_core_mat_hpp.InputOutputArray'Class;
      eigenvectors : opencv2_core_mat_hpp.OutputArray'Class;
      retainedVariance : double);  -- /usr/local/include/opencv2/core.hpp:447
   pragma Import (CPP, PCACompute, "_ZN2cv10PCAComputeERKNS_11_InputArrayERKNS_12_OutputArrayES5_d");

   procedure PCAProject
     (data : opencv2_core_mat_hpp.InputArray'Class;
      mean : opencv2_core_mat_hpp.InputArray'Class;
      eigenvectors : opencv2_core_mat_hpp.InputArray'Class;
      result : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:450
   pragma Import (CPP, PCAProject, "_ZN2cv10PCAProjectERKNS_11_InputArrayES2_S2_RKNS_12_OutputArrayE");

   procedure PCABackProject
     (data : opencv2_core_mat_hpp.InputArray'Class;
      mean : opencv2_core_mat_hpp.InputArray'Class;
      eigenvectors : opencv2_core_mat_hpp.InputArray'Class;
      result : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:453
   pragma Import (CPP, PCABackProject, "_ZN2cv14PCABackProjectERKNS_11_InputArrayES2_S2_RKNS_12_OutputArrayE");

   procedure SVDecomp
     (src : opencv2_core_mat_hpp.InputArray'Class;
      w : opencv2_core_mat_hpp.OutputArray'Class;
      u : opencv2_core_mat_hpp.OutputArray'Class;
      vt : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int);  -- /usr/local/include/opencv2/core.hpp:457
   pragma Import (CPP, SVDecomp, "_ZN2cv8SVDecompERKNS_11_InputArrayERKNS_12_OutputArrayES5_S5_i");

   procedure SVBackSubst
     (w : opencv2_core_mat_hpp.InputArray'Class;
      u : opencv2_core_mat_hpp.InputArray'Class;
      vt : opencv2_core_mat_hpp.InputArray'Class;
      rhs : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:460
   pragma Import (CPP, SVBackSubst, "_ZN2cv11SVBackSubstERKNS_11_InputArrayES2_S2_S2_RKNS_12_OutputArrayE");

   function Mahalanobis
     (v1 : opencv2_core_mat_hpp.InputArray'Class;
      v2 : opencv2_core_mat_hpp.InputArray'Class;
      icovar : opencv2_core_mat_hpp.InputArray'Class) return double;  -- /usr/local/include/opencv2/core.hpp:464
   pragma Import (CPP, Mahalanobis, "_ZN2cv11MahalanobisERKNS_11_InputArrayES2_S2_");

   procedure dft
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int;
      nonzeroRows : int);  -- /usr/local/include/opencv2/core.hpp:467
   pragma Import (CPP, dft, "_ZN2cv3dftERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   procedure idft
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int;
      nonzeroRows : int);  -- /usr/local/include/opencv2/core.hpp:470
   pragma Import (CPP, idft, "_ZN2cv4idftERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   procedure dct
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int);  -- /usr/local/include/opencv2/core.hpp:473
   pragma Import (CPP, dct, "_ZN2cv3dctERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure idct
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int);  -- /usr/local/include/opencv2/core.hpp:476
   pragma Import (CPP, idct, "_ZN2cv4idctERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure mulSpectrums
     (a : opencv2_core_mat_hpp.InputArray'Class;
      b : opencv2_core_mat_hpp.InputArray'Class;
      c : opencv2_core_mat_hpp.OutputArray'Class;
      flags : int;
      conjB : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:479
   pragma Import (CPP, mulSpectrums, "_ZN2cv12mulSpectrumsERKNS_11_InputArrayES2_RKNS_12_OutputArrayEib");

   function getOptimalDFTSize (vecsize : int) return int;  -- /usr/local/include/opencv2/core.hpp:483
   pragma Import (CPP, getOptimalDFTSize, "_ZN2cv17getOptimalDFTSizeEi");

   function kmeans
     (data : opencv2_core_mat_hpp.InputArray'Class;
      K : int;
      bestLabels : opencv2_core_mat_hpp.InputOutputArray'Class;
      criteria : opencv2_core_types_hpp.Class_TermCriteria.TermCriteria;
      attempts : int;
      flags : int;
      centers : opencv2_core_mat_hpp.OutputArray'Class) return double;  -- /usr/local/include/opencv2/core.hpp:486
   pragma Import (CPP, kmeans, "_ZN2cv6kmeansERKNS_11_InputArrayEiRKNS_12_OutputArrayENS_12TermCriteriaEiiS5_");

   function theRNG return System.Address;  -- /usr/local/include/opencv2/core.hpp:491
   pragma Import (CPP, theRNG, "_ZN2cv6theRNGEv");

   procedure randu
     (dst : opencv2_core_mat_hpp.InputOutputArray'Class;
      low : opencv2_core_mat_hpp.InputArray'Class;
      high : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:494
   pragma Import (CPP, randu, "_ZN2cv5randuERKNS_12_OutputArrayERKNS_11_InputArrayES5_");

   procedure randn
     (dst : opencv2_core_mat_hpp.InputOutputArray'Class;
      mean : opencv2_core_mat_hpp.InputArray'Class;
      stddev : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/core.hpp:497
   pragma Import (CPP, randn, "_ZN2cv5randnERKNS_12_OutputArrayERKNS_11_InputArrayES5_");

   procedure randShuffle
     (dst : opencv2_core_mat_hpp.InputOutputArray'Class;
      iterFactor : double;
      the_rng : System.Address);  -- /usr/local/include/opencv2/core.hpp:500
   pragma Import (CPP, randShuffle, "_ZN2cv11randShuffleERKNS_12_OutputArrayEdPNS_3RNGE");

   procedure line
     (img : access opencv2_core_mat_hpp.Class_Mat.Mat;
      pt1 : opencv2_core_types_hpp.Class_Point.Point;
      pt2 : opencv2_core_types_hpp.Class_Point.Point;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/local/include/opencv2/core.hpp:503
   pragma Import (CPP, line, "_ZN2cv4lineERNS_3MatENS_6Point_IiEES3_RKNS_7Scalar_IdEEiii");

   procedure rectangle
     (img : access opencv2_core_mat_hpp.Class_Mat.Mat;
      pt1 : opencv2_core_types_hpp.Class_Point.Point;
      pt2 : opencv2_core_types_hpp.Class_Point.Point;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/local/include/opencv2/core.hpp:507
   pragma Import (CPP, rectangle, "_ZN2cv9rectangleERNS_3MatENS_6Point_IiEES3_RKNS_7Scalar_IdEEiii");

   procedure rectangle
     (img : access opencv2_core_mat_hpp.Class_Mat.Mat;
      rec : opencv2_core_types_hpp.Class_Rect.Rect;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/local/include/opencv2/core.hpp:512
   pragma Import (CPP, rectangle, "_ZN2cv9rectangleERNS_3MatENS_5Rect_IiEERKNS_7Scalar_IdEEiii");

   procedure circle
     (img : access opencv2_core_mat_hpp.Class_Mat.Mat;
      center : opencv2_core_types_hpp.Class_Point.Point;
      radius : int;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/local/include/opencv2/core.hpp:517
   pragma Import (CPP, circle, "_ZN2cv6circleERNS_3MatENS_6Point_IiEEiRKNS_7Scalar_IdEEiii");

   procedure ellipse
     (img : access opencv2_core_mat_hpp.Class_Mat.Mat;
      center : opencv2_core_types_hpp.Class_Point.Point;
      axes : opencv2_core_types_hpp.Class_Size.Size;
      angle : double;
      startAngle : double;
      endAngle : double;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/local/include/opencv2/core.hpp:522
   pragma Import (CPP, ellipse, "_ZN2cv7ellipseERNS_3MatENS_6Point_IiEENS_5Size_IiEEdddRKNS_7Scalar_IdEEiii");

   procedure ellipse
     (img : access opencv2_core_mat_hpp.Class_Mat.Mat;
      box : access constant opencv2_core_types_hpp.Class_RotatedRect.RotatedRect;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int);  -- /usr/local/include/opencv2/core.hpp:528
   pragma Import (CPP, ellipse, "_ZN2cv7ellipseERNS_3MatERKNS_11RotatedRectERKNS_7Scalar_IdEEii");

   procedure fillConvexPoly
     (img : access opencv2_core_mat_hpp.Class_Mat.Mat;
      pts : access constant opencv2_core_types_hpp.Class_Point.Point;
      npts : int;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      lineType : int;
      shift : int);  -- /usr/local/include/opencv2/core.hpp:532
   pragma Import (CPP, fillConvexPoly, "_ZN2cv14fillConvexPolyERNS_3MatEPKNS_6Point_IiEEiRKNS_7Scalar_IdEEii");

   procedure fillConvexPoly
     (img : opencv2_core_mat_hpp.InputOutputArray'Class;
      points : opencv2_core_mat_hpp.InputArray'Class;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      lineType : int;
      shift : int);  -- /usr/local/include/opencv2/core.hpp:536
   pragma Import (CPP, fillConvexPoly, "_ZN2cv14fillConvexPolyERKNS_12_OutputArrayERKNS_11_InputArrayERKNS_7Scalar_IdEEii");

   procedure fillPoly
     (img : access opencv2_core_mat_hpp.Class_Mat.Mat;
      pts : System.Address;
      npts : access int;
      ncontours : int;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      lineType : int;
      shift : int;
      offset : opencv2_core_types_hpp.Class_Point.Point);  -- /usr/local/include/opencv2/core.hpp:541
   pragma Import (CPP, fillPoly, "_ZN2cv8fillPolyERNS_3MatEPPKNS_6Point_IiEEPKiiRKNS_7Scalar_IdEEiiS3_");

   procedure fillPoly
     (img : opencv2_core_mat_hpp.InputOutputArray'Class;
      pts : opencv2_core_mat_hpp.InputArrayOfArrays'Class;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      lineType : int;
      shift : int;
      offset : opencv2_core_types_hpp.Class_Point.Point);  -- /usr/local/include/opencv2/core.hpp:546
   pragma Import (CPP, fillPoly, "_ZN2cv8fillPolyERKNS_12_OutputArrayERKNS_11_InputArrayERKNS_7Scalar_IdEEiiNS_6Point_IiEE");

   procedure polylines
     (img : access opencv2_core_mat_hpp.Class_Mat.Mat;
      pts : System.Address;
      npts : access int;
      ncontours : int;
      isClosed : Extensions.bool;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/local/include/opencv2/core.hpp:551
   pragma Import (CPP, polylines, "_ZN2cv9polylinesERNS_3MatEPKPKNS_6Point_IiEEPKiibRKNS_7Scalar_IdEEiii");

   procedure polylines
     (img : opencv2_core_mat_hpp.InputOutputArray'Class;
      pts : opencv2_core_mat_hpp.InputArrayOfArrays'Class;
      isClosed : Extensions.bool;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int;
      shift : int);  -- /usr/local/include/opencv2/core.hpp:555
   pragma Import (CPP, polylines, "_ZN2cv9polylinesERKNS_12_OutputArrayERKNS_11_InputArrayEbRKNS_7Scalar_IdEEiii");

   procedure drawContours
     (image : opencv2_core_mat_hpp.InputOutputArray'Class;
      contours : opencv2_core_mat_hpp.InputArrayOfArrays'Class;
      contourIdx : int;
      color : access constant opencv2_core_types_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int;
      hierarchy : opencv2_core_mat_hpp.InputArray'Class;
      maxLevel : int;
      offset : opencv2_core_types_hpp.Class_Point.Point);  -- /usr/local/include/opencv2/core.hpp:560
   pragma Import (CPP, drawContours, "_ZN2cv12drawContoursERKNS_12_OutputArrayERKNS_11_InputArrayEiRKNS_7Scalar_IdEEiiS5_iNS_6Point_IiEE");

   function clipLine
     (imgSize : opencv2_core_types_hpp.Class_Size.Size;
      pt1 : access opencv2_core_types_hpp.Class_Point.Point;
      pt2 : access opencv2_core_types_hpp.Class_Point.Point) return Extensions.bool;  -- /usr/local/include/opencv2/core.hpp:567
   pragma Import (CPP, clipLine, "_ZN2cv8clipLineENS_5Size_IiEERNS_6Point_IiEES4_");

   function clipLine
     (imgRect : opencv2_core_types_hpp.Class_Rect.Rect;
      pt1 : access opencv2_core_types_hpp.Class_Point.Point;
      pt2 : access opencv2_core_types_hpp.Class_Point.Point) return Extensions.bool;  -- /usr/local/include/opencv2/core.hpp:570
   pragma Import (CPP, clipLine, "_ZN2cv8clipLineENS_5Rect_IiEERNS_6Point_IiEES4_");

   procedure ellipse2Poly
     (center : opencv2_core_types_hpp.Class_Point.Point;
      axes : opencv2_core_types_hpp.Class_Size.Size;
      angle : int;
      arcStart : int;
      arcEnd : int;
      c_delta : int;
      pts : System.Address);  -- /usr/local/include/opencv2/core.hpp:573
   pragma Import (CPP, ellipse2Poly, "_ZN2cv12ellipse2PolyENS_6Point_IiEENS_5Size_IiEEiiiiRSt6vectorIS1_SaIS1_EE");

   procedure putText
     (img : access opencv2_core_mat_hpp.Class_Mat.Mat;
      text : access constant opencv2_core_cvstd_hpp.Class_String.String;
      org : opencv2_core_types_hpp.Class_Point.Point;
      fontFace : int;
      fontScale : double;
      color : opencv2_core_types_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int;
      bottomLeftOrigin : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:578
   pragma Import (CPP, putText, "_ZN2cv7putTextERNS_3MatERKNS_6StringENS_6Point_IiEEidNS_7Scalar_IdEEiib");

   function getTextSize
     (text : access constant opencv2_core_cvstd_hpp.Class_String.String;
      fontFace : int;
      fontScale : double;
      thickness : int;
      baseLine : access int) return opencv2_core_types_hpp.Class_Size.Size;  -- /usr/local/include/opencv2/core.hpp:584
   pragma Import (CPP, getTextSize, "_ZN2cv11getTextSizeERKNS_6StringEidiPi");

   package Class_PCA is
      type PCA is limited record
         eigenvectors : aliased opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:677
         eigenvalues : aliased opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:678
         mean : aliased opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:679
      end record;
      pragma Import (CPP, PCA);

      function New_PCA return PCA;  -- /usr/local/include/opencv2/core.hpp:651
      pragma CPP_Constructor (New_PCA, "_ZN2cv3PCAC1Ev");

      function New_PCA
        (data : opencv2_core_mat_hpp.InputArray;
         mean : opencv2_core_mat_hpp.InputArray'Class;
         flags : int;
         maxComponents : int) return PCA;  -- /usr/local/include/opencv2/core.hpp:654
      pragma CPP_Constructor (New_PCA, "_ZN2cv3PCAC1ERKNS_11_InputArrayES3_ii");

      function New_PCA
        (data : opencv2_core_mat_hpp.InputArray;
         mean : opencv2_core_mat_hpp.InputArray'Class;
         flags : int;
         retainedVariance : double) return PCA;  -- /usr/local/include/opencv2/core.hpp:655
      pragma CPP_Constructor (New_PCA, "_ZN2cv3PCAC1ERKNS_11_InputArrayES3_id");

      function operator_op
        (this : access PCA;
         data : opencv2_core_mat_hpp.InputArray'Class;
         mean : opencv2_core_mat_hpp.InputArray'Class;
         flags : int;
         maxComponents : int) return access PCA;  -- /usr/local/include/opencv2/core.hpp:658
      pragma Import (CPP, operator_op, "_ZN2cv3PCAclERKNS_11_InputArrayES3_ii");

      function operator_op
        (this : access PCA;
         data : opencv2_core_mat_hpp.InputArray'Class;
         mean : opencv2_core_mat_hpp.InputArray'Class;
         flags : int;
         retainedVariance : double) return access PCA;  -- /usr/local/include/opencv2/core.hpp:659
      pragma Import (CPP, operator_op, "_ZN2cv3PCAclERKNS_11_InputArrayES3_id");

      function project (this : access constant PCA; vec : opencv2_core_mat_hpp.InputArray'Class) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:662
      pragma Import (CPP, project, "_ZNK2cv3PCA7projectERKNS_11_InputArrayE");

      procedure project
        (this : access constant PCA;
         vec : opencv2_core_mat_hpp.InputArray'Class;
         result : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:665
      pragma Import (CPP, project, "_ZNK2cv3PCA7projectERKNS_11_InputArrayERKNS_12_OutputArrayE");

      function backProject (this : access constant PCA; vec : opencv2_core_mat_hpp.InputArray'Class) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:668
      pragma Import (CPP, backProject, "_ZNK2cv3PCA11backProjectERKNS_11_InputArrayE");

      procedure backProject
        (this : access constant PCA;
         vec : opencv2_core_mat_hpp.InputArray'Class;
         result : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:671
      pragma Import (CPP, backProject, "_ZNK2cv3PCA11backProjectERKNS_11_InputArrayERKNS_12_OutputArrayE");

      procedure write (this : access constant PCA; fs : access opencv2_core_persistence_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/local/include/opencv2/core.hpp:674
      pragma Import (CPP, write, "_ZNK2cv3PCA5writeERNS_11FileStorageE");

      procedure read (this : access PCA; fs : access constant opencv2_core_persistence_hpp.Class_FileNode.FileNode);  -- /usr/local/include/opencv2/core.hpp:675
      pragma Import (CPP, read, "_ZN2cv3PCA4readERKNS_8FileNodeE");
   end;
   use Class_PCA;
   package Class_SVD is
      type SVD is limited record
         u : aliased opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:741
         w : aliased opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:741
         vt : aliased opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:741
      end record;
      pragma Import (CPP, SVD);

      procedure Delete_SVD (this : access SVD);  -- /usr/local/include/opencv2/core.hpp:697
      pragma Import (CPP, Delete_SVD, "_ZN2cv3SVDD1Ev");

      function New_SVD return SVD;  -- /usr/local/include/opencv2/core/operations.hpp:284
      pragma CPP_Constructor (New_SVD, "_ZN2cv3SVDC1Ev");

      function New_SVD (m : opencv2_core_mat_hpp.InputArray; flags : int) return SVD;  -- /usr/local/include/opencv2/core/operations.hpp:285
      pragma CPP_Constructor (New_SVD, "_ZN2cv3SVDC1ERKNS_11_InputArrayEi");

      function operator_op
        (this : access SVD;
         src : opencv2_core_mat_hpp.InputArray'Class;
         flags : int) return access SVD;  -- /usr/local/include/opencv2/core.hpp:712
      pragma Import (CPP, operator_op, "_ZN2cv3SVDclERKNS_11_InputArrayEi");

      procedure compute
        (src : opencv2_core_mat_hpp.InputArray'Class;
         w : opencv2_core_mat_hpp.OutputArray'Class;
         u : opencv2_core_mat_hpp.OutputArray'Class;
         vt : opencv2_core_mat_hpp.OutputArray'Class;
         flags : int);  -- /usr/local/include/opencv2/core.hpp:715
      pragma Import (CPP, compute, "_ZN2cv3SVD7computeERKNS_11_InputArrayERKNS_12_OutputArrayES6_S6_i");

      procedure compute
        (src : opencv2_core_mat_hpp.InputArray'Class;
         w : opencv2_core_mat_hpp.OutputArray'Class;
         flags : int);  -- /usr/local/include/opencv2/core.hpp:719
      pragma Import (CPP, compute, "_ZN2cv3SVD7computeERKNS_11_InputArrayERKNS_12_OutputArrayEi");

      procedure backSubst
        (w : opencv2_core_mat_hpp.InputArray'Class;
         u : opencv2_core_mat_hpp.InputArray'Class;
         vt : opencv2_core_mat_hpp.InputArray'Class;
         rhs : opencv2_core_mat_hpp.InputArray'Class;
         dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:722
      pragma Import (CPP, backSubst, "_ZN2cv3SVD9backSubstERKNS_11_InputArrayES3_S3_S3_RKNS_12_OutputArrayE");

      procedure solveZ (m : opencv2_core_mat_hpp.InputArray'Class; u_dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core/operations.hpp:286
      pragma Import (CPP, solveZ, "_ZN2cv3SVD6solveZERKNS_11_InputArrayERKNS_12_OutputArrayE");

      procedure backSubst
        (this : access constant SVD;
         rhs : opencv2_core_mat_hpp.InputArray'Class;
         dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:730
      pragma Import (CPP, backSubst, "_ZNK2cv3SVD9backSubstERKNS_11_InputArrayERKNS_12_OutputArrayE");


   end;
   use Class_SVD;
   package Class_LineIterator is
      type LineIterator is limited record
         ptr : access opencv2_core_cvdef_h.uchar;  -- /usr/local/include/opencv2/core.hpp:767
         ptr0 : access opencv2_core_cvdef_h.uchar;  -- /usr/local/include/opencv2/core.hpp:768
         step : aliased int;  -- /usr/local/include/opencv2/core.hpp:769
         elemSize : aliased int;  -- /usr/local/include/opencv2/core.hpp:769
         err : aliased int;  -- /usr/local/include/opencv2/core.hpp:770
         count : aliased int;  -- /usr/local/include/opencv2/core.hpp:770
         minusDelta : aliased int;  -- /usr/local/include/opencv2/core.hpp:771
         plusDelta : aliased int;  -- /usr/local/include/opencv2/core.hpp:771
         minusStep : aliased int;  -- /usr/local/include/opencv2/core.hpp:772
         plusStep : aliased int;  -- /usr/local/include/opencv2/core.hpp:772
      end record;
      pragma Import (CPP, LineIterator);

      function New_LineIterator
        (img : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
         pt1 : opencv2_core_types_hpp.Class_Point.Point;
         pt2 : opencv2_core_types_hpp.Class_Point.Point;
         connectivity : int;
         leftToRight : Extensions.bool) return LineIterator;  -- /usr/local/include/opencv2/core.hpp:756
      pragma CPP_Constructor (New_LineIterator, "_ZN2cv12LineIteratorC1ERKNS_3MatENS_6Point_IiEES5_ib");

      function operator_t (this : access LineIterator) return access opencv2_core_cvdef_h.uchar;  -- /usr/local/include/opencv2/core/operations.hpp:358
      pragma Import (CPP, operator_t, "_ZN2cv12LineIteratordeEv");

      function operator_pp (this : access LineIterator) return access LineIterator;  -- /usr/local/include/opencv2/core/operations.hpp:364
      pragma Import (CPP, operator_pp, "_ZN2cv12LineIteratorppEv");

      function operator_pp (this : access LineIterator; arg2 : int) return LineIterator;  -- /usr/local/include/opencv2/core/operations.hpp:373
      pragma Import (CPP, operator_pp, "_ZN2cv12LineIteratorppEi");

      function pos (this : access constant LineIterator) return opencv2_core_types_hpp.Class_Point.Point;  -- /usr/local/include/opencv2/core/operations.hpp:381
      pragma Import (CPP, pos, "_ZNK2cv12LineIterator3posEv");
   end;
   use Class_LineIterator;
   type KDTree;
   type Node is record
      idx : aliased int;  -- /usr/local/include/opencv2/core.hpp:814
      left : aliased int;  -- /usr/local/include/opencv2/core.hpp:816
      right : aliased int;  -- /usr/local/include/opencv2/core.hpp:816
      boundary : aliased float;  -- /usr/local/include/opencv2/core.hpp:818
   end record;
   pragma Convention (C_Pass_By_Copy, Node);
   package Class_KDTree is
      type KDTree is limited record
         nodes : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/core.hpp:853
         points : aliased opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:854
         labels : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/core.hpp:855
         maxDepth : aliased int;  -- /usr/local/include/opencv2/core.hpp:856
         normType : aliased int;  -- /usr/local/include/opencv2/core.hpp:857
      end record;
      pragma Import (CPP, KDTree);

      function New_KDTree return KDTree;  -- /usr/local/include/opencv2/core.hpp:822
      pragma CPP_Constructor (New_KDTree, "_ZN2cv6KDTreeC1Ev");

      function New_KDTree (points : opencv2_core_mat_hpp.InputArray; copyAndReorderPoints : Extensions.bool) return KDTree;  -- /usr/local/include/opencv2/core.hpp:824
      pragma CPP_Constructor (New_KDTree, "_ZN2cv6KDTreeC1ERKNS_11_InputArrayEb");

      function New_KDTree
        (points : opencv2_core_mat_hpp.InputArray;
         u_labels : opencv2_core_mat_hpp.InputArray'Class;
         copyAndReorderPoints : Extensions.bool) return KDTree;  -- /usr/local/include/opencv2/core.hpp:826
      pragma CPP_Constructor (New_KDTree, "_ZN2cv6KDTreeC1ERKNS_11_InputArrayES3_b");

      procedure build
        (this : access KDTree;
         points : opencv2_core_mat_hpp.InputArray'Class;
         copyAndReorderPoints : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:829
      pragma Import (CPP, build, "_ZN2cv6KDTree5buildERKNS_11_InputArrayEb");

      procedure build
        (this : access KDTree;
         points : opencv2_core_mat_hpp.InputArray'Class;
         labels : opencv2_core_mat_hpp.InputArray'Class;
         copyAndReorderPoints : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:831
      pragma Import (CPP, build, "_ZN2cv6KDTree5buildERKNS_11_InputArrayES3_b");

      function findNearest
        (this : access constant KDTree;
         vec : opencv2_core_mat_hpp.InputArray'Class;
         K : int;
         Emax : int;
         neighborsIdx : opencv2_core_mat_hpp.OutputArray'Class;
         neighbors : opencv2_core_mat_hpp.OutputArray'Class;
         dist : opencv2_core_mat_hpp.OutputArray'Class;
         labels : opencv2_core_mat_hpp.OutputArray'Class) return int;  -- /usr/local/include/opencv2/core.hpp:834
      pragma Import (CPP, findNearest, "_ZNK2cv6KDTree11findNearestERKNS_11_InputArrayEiiRKNS_12_OutputArrayES6_S6_S6_");

      procedure findOrthoRange
        (this : access constant KDTree;
         minBounds : opencv2_core_mat_hpp.InputArray'Class;
         maxBounds : opencv2_core_mat_hpp.InputArray'Class;
         neighborsIdx : opencv2_core_mat_hpp.OutputArray'Class;
         neighbors : opencv2_core_mat_hpp.OutputArray'Class;
         labels : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:840
      pragma Import (CPP, findOrthoRange, "_ZNK2cv6KDTree14findOrthoRangeERKNS_11_InputArrayES3_RKNS_12_OutputArrayES6_S6_");

      procedure getPoints
        (this : access constant KDTree;
         idx : opencv2_core_mat_hpp.InputArray'Class;
         pts : opencv2_core_mat_hpp.OutputArray'Class;
         labels : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/core.hpp:846
      pragma Import (CPP, getPoints, "_ZNK2cv6KDTree9getPointsERKNS_11_InputArrayERKNS_12_OutputArrayES6_");

      function getPoint
        (this : access constant KDTree;
         ptidx : int;
         label : access int) return access float;  -- /usr/local/include/opencv2/core.hpp:849
      pragma Import (CPP, getPoint, "_ZNK2cv6KDTree8getPointEiPi");

      function dims (this : access constant KDTree) return int;  -- /usr/local/include/opencv2/core.hpp:851
      pragma Import (CPP, dims, "_ZNK2cv6KDTree4dimsEv");
   end;
   use Class_KDTree;
   package Class_RNG is
      type RNG is limited record
         state : aliased opencv2_core_cvdef_h.uint64;  -- /usr/local/include/opencv2/core.hpp:900
      end record;
      pragma Import (CPP, RNG);

      function New_RNG return RNG;  -- /usr/local/include/opencv2/core/operations.hpp:328
      pragma CPP_Constructor (New_RNG, "_ZN2cv3RNGC1Ev");

      function New_RNG (u_state : opencv2_core_cvdef_h.uint64) return RNG;  -- /usr/local/include/opencv2/core/operations.hpp:329
      pragma CPP_Constructor (New_RNG, "_ZN2cv3RNGC1Em");

      function next (this : access RNG) return unsigned;  -- /usr/local/include/opencv2/core/operations.hpp:347
      pragma Import (CPP, next, "_ZN2cv3RNG4nextEv");

      function operator_42 (this : access RNG) return opencv2_core_cvdef_h.uchar;  -- /usr/local/include/opencv2/core/operations.hpp:331
      pragma Import (CPP, operator_42, "_ZN2cv3RNGcvhEv");

      function operator_43 (this : access RNG) return opencv2_core_cvdef_h.schar;  -- /usr/local/include/opencv2/core/operations.hpp:332
      pragma Import (CPP, operator_43, "_ZN2cv3RNGcvaEv");

      function operator_44 (this : access RNG) return opencv2_core_cvdef_h.ushort;  -- /usr/local/include/opencv2/core/operations.hpp:333
      pragma Import (CPP, operator_44, "_ZN2cv3RNGcvtEv");

      function operator_45 (this : access RNG) return short;  -- /usr/local/include/opencv2/core/operations.hpp:334
      pragma Import (CPP, operator_45, "_ZN2cv3RNGcvsEv");

      function operator_46 (this : access RNG) return unsigned;  -- /usr/local/include/opencv2/core/operations.hpp:336
      pragma Import (CPP, operator_46, "_ZN2cv3RNGcvjEv");

      function operator_op (this : access RNG; N : unsigned) return unsigned;  -- /usr/local/include/opencv2/core/operations.hpp:340
      pragma Import (CPP, operator_op, "_ZN2cv3RNGclEj");

      function operator_op (this : access RNG) return unsigned;  -- /usr/local/include/opencv2/core/operations.hpp:341
      pragma Import (CPP, operator_op, "_ZN2cv3RNGclEv");

      function operator_38 (this : access RNG) return int;  -- /usr/local/include/opencv2/core/operations.hpp:335
      pragma Import (CPP, operator_38, "_ZN2cv3RNGcviEv");

      function operator_39 (this : access RNG) return float;  -- /usr/local/include/opencv2/core/operations.hpp:337
      pragma Import (CPP, operator_39, "_ZN2cv3RNGcvfEv");

      function operator_40 (this : access RNG) return double;  -- /usr/local/include/opencv2/core/operations.hpp:338
      pragma Import (CPP, operator_40, "_ZN2cv3RNGcvdEv");

      function uniform
        (this : access RNG;
         a : int;
         b : int) return int;  -- /usr/local/include/opencv2/core/operations.hpp:343
      pragma Import (CPP, uniform, "_ZN2cv3RNG7uniformEii");

      function uniform
        (this : access RNG;
         a : float;
         b : float) return float;  -- /usr/local/include/opencv2/core/operations.hpp:344
      pragma Import (CPP, uniform, "_ZN2cv3RNG7uniformEff");

      function uniform
        (this : access RNG;
         a : double;
         b : double) return double;  -- /usr/local/include/opencv2/core/operations.hpp:345
      pragma Import (CPP, uniform, "_ZN2cv3RNG7uniformEdd");

      procedure fill
        (this : access RNG;
         mat : opencv2_core_mat_hpp.InputOutputArray'Class;
         distType : int;
         a : opencv2_core_mat_hpp.InputArray'Class;
         b : opencv2_core_mat_hpp.InputArray'Class;
         saturateRange : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:896
      pragma Import (CPP, fill, "_ZN2cv3RNG4fillERKNS_12_OutputArrayEiRKNS_11_InputArrayES6_b");

      function gaussian (this : access RNG; sigma : double) return double;  -- /usr/local/include/opencv2/core.hpp:898
      pragma Import (CPP, gaussian, "_ZN2cv3RNG8gaussianEd");
   end;
   use Class_RNG;
   type RNG_MT19937_state_array is array (0 .. 623) of aliased unsigned;
   package Class_RNG_MT19937 is
      type RNG_MT19937 is limited record
         state : aliased RNG_MT19937_state_array;  -- /usr/local/include/opencv2/core.hpp:929
         mti : aliased int;  -- /usr/local/include/opencv2/core.hpp:930
      end record;
      pragma Import (CPP, RNG_MT19937);

      function New_RNG_MT19937 return RNG_MT19937;  -- /usr/local/include/opencv2/core.hpp:906
      pragma CPP_Constructor (New_RNG_MT19937, "_ZN2cv11RNG_MT19937C1Ev");

      function New_RNG_MT19937 (s : unsigned) return RNG_MT19937;  -- /usr/local/include/opencv2/core.hpp:907
      pragma CPP_Constructor (New_RNG_MT19937, "_ZN2cv11RNG_MT19937C1Ej");

      procedure seed (this : access RNG_MT19937; s : unsigned);  -- /usr/local/include/opencv2/core.hpp:908
      pragma Import (CPP, seed, "_ZN2cv11RNG_MT199374seedEj");

      function next (this : access RNG_MT19937) return unsigned;  -- /usr/local/include/opencv2/core.hpp:910
      pragma Import (CPP, next, "_ZN2cv11RNG_MT199374nextEv");

      function operator_38 (this : access RNG_MT19937) return int;  -- /usr/local/include/opencv2/core.hpp:912
      pragma Import (CPP, operator_38, "_ZN2cv11RNG_MT19937cviEv");

      function operator_46 (this : access RNG_MT19937) return unsigned;  -- /usr/local/include/opencv2/core.hpp:913
      pragma Import (CPP, operator_46, "_ZN2cv11RNG_MT19937cvjEv");

      function operator_39 (this : access RNG_MT19937) return float;  -- /usr/local/include/opencv2/core.hpp:914
      pragma Import (CPP, operator_39, "_ZN2cv11RNG_MT19937cvfEv");

      function operator_40 (this : access RNG_MT19937) return double;  -- /usr/local/include/opencv2/core.hpp:915
      pragma Import (CPP, operator_40, "_ZN2cv11RNG_MT19937cvdEv");

      function operator_op (this : access RNG_MT19937; N : unsigned) return unsigned;  -- /usr/local/include/opencv2/core.hpp:917
      pragma Import (CPP, operator_op, "_ZN2cv11RNG_MT19937clEj");

      function operator_op (this : access RNG_MT19937) return unsigned;  -- /usr/local/include/opencv2/core.hpp:918
      pragma Import (CPP, operator_op, "_ZN2cv11RNG_MT19937clEv");

      function uniform
        (this : access RNG_MT19937;
         a : int;
         b : int) return int;  -- /usr/local/include/opencv2/core.hpp:921
      pragma Import (CPP, uniform, "_ZN2cv11RNG_MT199377uniformEii");

      function uniform
        (this : access RNG_MT19937;
         a : float;
         b : float) return float;  -- /usr/local/include/opencv2/core.hpp:923
      pragma Import (CPP, uniform, "_ZN2cv11RNG_MT199377uniformEff");

      function uniform
        (this : access RNG_MT19937;
         a : double;
         b : double) return double;  -- /usr/local/include/opencv2/core.hpp:925
      pragma Import (CPP, uniform, "_ZN2cv11RNG_MT199377uniformEdd");
   end;
   use Class_RNG_MT19937;
   package Class_Formatted is
      type Formatted is abstract tagged limited record
         null;
      end record;
      pragma Import (CPP, Formatted);

      function next (this : access Formatted) return Interfaces.C.Strings.chars_ptr is abstract;  -- /usr/local/include/opencv2/core.hpp:940

      procedure reset (this : access Formatted) is abstract;  -- /usr/local/include/opencv2/core.hpp:941

      procedure Delete_Formatted (this : access Formatted);  -- /usr/local/include/opencv2/core.hpp:942
      pragma Import (CPP, Delete_Formatted, "_ZN2cv9FormattedD1Ev");

      procedure deleting_dtor (this : access Formatted);  -- /usr/local/include/opencv2/core.hpp:942
      pragma Import (CPP, deleting_dtor, "_ZN2cv9FormattedD0Ev");
   end;
   use Class_Formatted;
   package Class_Formatter is
      type Formatter is abstract tagged limited record
         null;
      end record;
      pragma Import (CPP, Formatter);

      procedure Delete_Formatter (this : access Formatter);  -- /usr/local/include/opencv2/core.hpp:957
      pragma Import (CPP, Delete_Formatter, "_ZN2cv9FormatterD1Ev");

      procedure deleting_dtor (this : access Formatter);  -- /usr/local/include/opencv2/core.hpp:957
      pragma Import (CPP, deleting_dtor, "_ZN2cv9FormatterD0Ev");

      function format (this : access constant Formatter; mtx : access constant opencv2_core_mat_hpp.Class_Mat.Mat) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr is abstract;  -- /usr/local/include/opencv2/core.hpp:959

      procedure set32fPrecision (this : access Formatter; p : int) is abstract;  -- /usr/local/include/opencv2/core.hpp:961

      procedure set64fPrecision (this : access Formatter; p : int) is abstract;  -- /usr/local/include/opencv2/core.hpp:962

      procedure setMultiline (this : access Formatter; ml : Extensions.bool) is abstract;  -- /usr/local/include/opencv2/core.hpp:963

      function get (fmt : int) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/core.hpp:965
      pragma Import (CPP, get, "_ZN2cv9Formatter3getEi");
   end;
   use Class_Formatter;
   --  skipped empty struct AlgorithmInfoData

   type Algorithm;
   type Getter is record
      uu_pfn : System.Address;  -- /usr/local/include/opencv2/core.hpp:1046
      uu_delta : aliased long;  -- /usr/local/include/opencv2/core.hpp:1046
   end record;
   pragma Convention (C_Pass_By_Copy, Getter);
   type Setter is record
      uu_pfn : System.Address;  -- /usr/local/include/opencv2/core.hpp:1047
      uu_delta : aliased long;  -- /usr/local/include/opencv2/core.hpp:1047
   end record;
   pragma Convention (C_Pass_By_Copy, Setter);
   package Class_Algorithm is
      type Algorithm is tagged limited record
         null;
      end record;
      pragma Import (CPP, Algorithm);

      function New_Algorithm return Algorithm;  -- /usr/local/include/opencv2/core.hpp:985
      pragma CPP_Constructor (New_Algorithm, "_ZN2cv9AlgorithmC1Ev");

      procedure Delete_Algorithm (this : access Algorithm);  -- /usr/local/include/opencv2/core.hpp:986
      pragma Import (CPP, Delete_Algorithm, "_ZN2cv9AlgorithmD1Ev");

      procedure deleting_dtor (this : access Algorithm);  -- /usr/local/include/opencv2/core.hpp:986
      pragma Import (CPP, deleting_dtor, "_ZN2cv9AlgorithmD0Ev");

      function name (this : access constant Algorithm'Class) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core.hpp:987
      pragma Import (CPP, name, "_ZNK2cv9Algorithm4nameEv");

      function getInt (this : access constant Algorithm'Class; name : access constant opencv2_core_cvstd_hpp.Class_String.String) return int;  -- /usr/local/include/opencv2/core.hpp:992
      pragma Import (CPP, getInt, "_ZNK2cv9Algorithm6getIntERKNS_6StringE");

      function getDouble (this : access constant Algorithm'Class; name : access constant opencv2_core_cvstd_hpp.Class_String.String) return double;  -- /usr/local/include/opencv2/core.hpp:993
      pragma Import (CPP, getDouble, "_ZNK2cv9Algorithm9getDoubleERKNS_6StringE");

      function getBool (this : access constant Algorithm'Class; name : access constant opencv2_core_cvstd_hpp.Class_String.String) return Extensions.bool;  -- /usr/local/include/opencv2/core.hpp:994
      pragma Import (CPP, getBool, "_ZNK2cv9Algorithm7getBoolERKNS_6StringE");

      function getString (this : access constant Algorithm'Class; name : access constant opencv2_core_cvstd_hpp.Class_String.String) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core.hpp:995
      pragma Import (CPP, getString, "_ZNK2cv9Algorithm9getStringERKNS_6StringE");

      function getMat (this : access constant Algorithm'Class; name : access constant opencv2_core_cvstd_hpp.Class_String.String) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/core.hpp:996
      pragma Import (CPP, getMat, "_ZNK2cv9Algorithm6getMatERKNS_6StringE");

      function getMatVector (this : access constant Algorithm'Class; name : access constant opencv2_core_cvstd_hpp.Class_String.String) return cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/core.hpp:997
      pragma Import (CPP, getMatVector, "_ZNK2cv9Algorithm12getMatVectorERKNS_6StringE");

      function getAlgorithm (this : access constant Algorithm'Class; name : access constant opencv2_core_cvstd_hpp.Class_String.String) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/core.hpp:998
      pragma Import (CPP, getAlgorithm, "_ZNK2cv9Algorithm12getAlgorithmERKNS_6StringE");

      procedure set
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : int);  -- /usr/local/include/opencv2/core.hpp:1000
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setERKNS_6StringEi");

      procedure set
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : double);  -- /usr/local/include/opencv2/core.hpp:1001
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setERKNS_6StringEd");

      procedure set
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:1002
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setERKNS_6StringEb");

      procedure set
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1003
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setERKNS_6StringES3_");

      procedure set
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : access constant opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/core.hpp:1004
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setERKNS_6StringERKNS_3MatE");

      procedure set
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/local/include/opencv2/core.hpp:1005
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setERKNS_6StringERKSt6vectorINS_3MatESaIS5_EE");

      procedure set
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : access constant opencv2_core_cvstd_hpp.Class_Ptr.Ptr);  -- /usr/local/include/opencv2/core.hpp:1006
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setERKNS_6StringERKNS_3PtrIS0_EE");

      procedure setInt
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : int);  -- /usr/local/include/opencv2/core.hpp:1009
      pragma Import (CPP, setInt, "_ZN2cv9Algorithm6setIntERKNS_6StringEi");

      procedure setDouble
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : double);  -- /usr/local/include/opencv2/core.hpp:1010
      pragma Import (CPP, setDouble, "_ZN2cv9Algorithm9setDoubleERKNS_6StringEd");

      procedure setBool
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:1011
      pragma Import (CPP, setBool, "_ZN2cv9Algorithm7setBoolERKNS_6StringEb");

      procedure setString
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1012
      pragma Import (CPP, setString, "_ZN2cv9Algorithm9setStringERKNS_6StringES3_");

      procedure setMat
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : access constant opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/core.hpp:1013
      pragma Import (CPP, setMat, "_ZN2cv9Algorithm6setMatERKNS_6StringERKNS_3MatE");

      procedure setMatVector
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/local/include/opencv2/core.hpp:1014
      pragma Import (CPP, setMatVector, "_ZN2cv9Algorithm12setMatVectorERKNS_6StringERKSt6vectorINS_3MatESaIS5_EE");

      procedure setAlgorithm
        (this : access Algorithm'Class;
         name : access constant opencv2_core_cvstd_hpp.Class_String.String;
         value : access constant opencv2_core_cvstd_hpp.Class_Ptr.Ptr);  -- /usr/local/include/opencv2/core.hpp:1015
      pragma Import (CPP, setAlgorithm, "_ZN2cv9Algorithm12setAlgorithmERKNS_6StringERKNS_3PtrIS0_EE");

      procedure set
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : int);  -- /usr/local/include/opencv2/core.hpp:1018
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setEPKci");

      procedure set
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : double);  -- /usr/local/include/opencv2/core.hpp:1019
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setEPKcd");

      procedure set
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:1020
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setEPKcb");

      procedure set
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1021
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setEPKcRKNS_6StringE");

      procedure set
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access constant opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/core.hpp:1022
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setEPKcRKNS_3MatE");

      procedure set
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/local/include/opencv2/core.hpp:1023
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setEPKcRKSt6vectorINS_3MatESaIS4_EE");

      procedure set
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access constant opencv2_core_cvstd_hpp.Class_Ptr.Ptr);  -- /usr/local/include/opencv2/core.hpp:1024
      pragma Import (CPP, set, "_ZN2cv9Algorithm3setEPKcRKNS_3PtrIS0_EE");

      procedure setInt
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : int);  -- /usr/local/include/opencv2/core.hpp:1027
      pragma Import (CPP, setInt, "_ZN2cv9Algorithm6setIntEPKci");

      procedure setDouble
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : double);  -- /usr/local/include/opencv2/core.hpp:1028
      pragma Import (CPP, setDouble, "_ZN2cv9Algorithm9setDoubleEPKcd");

      procedure setBool
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:1029
      pragma Import (CPP, setBool, "_ZN2cv9Algorithm7setBoolEPKcb");

      procedure setString
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1030
      pragma Import (CPP, setString, "_ZN2cv9Algorithm9setStringEPKcRKNS_6StringE");

      procedure setMat
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access constant opencv2_core_mat_hpp.Class_Mat.Mat);  -- /usr/local/include/opencv2/core.hpp:1031
      pragma Import (CPP, setMat, "_ZN2cv9Algorithm6setMatEPKcRKNS_3MatE");

      procedure setMatVector
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/local/include/opencv2/core.hpp:1032
      pragma Import (CPP, setMatVector, "_ZN2cv9Algorithm12setMatVectorEPKcRKSt6vectorINS_3MatESaIS4_EE");

      procedure setAlgorithm
        (this : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access constant opencv2_core_cvstd_hpp.Class_Ptr.Ptr);  -- /usr/local/include/opencv2/core.hpp:1033
      pragma Import (CPP, setAlgorithm, "_ZN2cv9Algorithm12setAlgorithmEPKcRKNS_3PtrIS0_EE");

      function paramHelp (this : access constant Algorithm'Class; name : access constant opencv2_core_cvstd_hpp.Class_String.String) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core.hpp:1036
      pragma Import (CPP, paramHelp, "_ZNK2cv9Algorithm9paramHelpERKNS_6StringE");

      function paramType (this : access constant Algorithm'Class; name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/local/include/opencv2/core.hpp:1037
      pragma Import (CPP, paramType, "_ZNK2cv9Algorithm9paramTypeEPKc");

      function paramType (this : access constant Algorithm'Class; name : access constant opencv2_core_cvstd_hpp.Class_String.String) return int;  -- /usr/local/include/opencv2/core.hpp:1038
      pragma Import (CPP, paramType, "_ZNK2cv9Algorithm9paramTypeERKNS_6StringE");

      procedure getParams (this : access constant Algorithm'Class; names : System.Address);  -- /usr/local/include/opencv2/core.hpp:1039
      pragma Import (CPP, getParams, "_ZNK2cv9Algorithm9getParamsERSt6vectorINS_6StringESaIS2_EE");

      procedure write (this : access constant Algorithm; fs : access opencv2_core_persistence_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/local/include/opencv2/core.hpp:1042
      pragma Import (CPP, write, "_ZNK2cv9Algorithm5writeERNS_11FileStorageE");

      procedure read (this : access Algorithm; fn : access constant opencv2_core_persistence_hpp.Class_FileNode.FileNode);  -- /usr/local/include/opencv2/core.hpp:1043
      pragma Import (CPP, read, "_ZN2cv9Algorithm4readERKNS_8FileNodeE");

      procedure getList (algorithms : System.Address);  -- /usr/local/include/opencv2/core.hpp:1049
      pragma Import (CPP, getList, "_ZN2cv9Algorithm7getListERSt6vectorINS_6StringESaIS2_EE");

      --  skipped func _create

      function info (this : access constant Algorithm) return System.Address;  -- /usr/local/include/opencv2/core.hpp:1053
      pragma Import (CPP, info, "_ZNK2cv9Algorithm4infoEv");
   end;
   use Class_Algorithm;
   package Class_AlgorithmInfo is
      type AlgorithmInfo is limited record
         data : System.Address;  -- /usr/local/include/opencv2/core.hpp:1142
      end record;
      pragma Import (CPP, AlgorithmInfo);

      function New_AlgorithmInfo (name : access constant opencv2_core_cvstd_hpp.Class_String.String; create : Constructor) return AlgorithmInfo;  -- /usr/local/include/opencv2/core.hpp:1061
      pragma CPP_Constructor (New_AlgorithmInfo, "_ZN2cv13AlgorithmInfoC1ERKNS_6StringEPFPNS_9AlgorithmEvE");

      procedure Delete_AlgorithmInfo (this : access AlgorithmInfo);  -- /usr/local/include/opencv2/core.hpp:1062
      pragma Import (CPP, Delete_AlgorithmInfo, "_ZN2cv13AlgorithmInfoD1Ev");

      procedure get
        (this : access constant AlgorithmInfo;
         algo : access constant Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         argType : int;
         value : System.Address);  -- /usr/local/include/opencv2/core.hpp:1063
      pragma Import (CPP, get, "_ZNK2cv13AlgorithmInfo3getEPKNS_9AlgorithmEPKciPv");

      procedure addParam_u
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         argType : int;
         value : System.Address;
         readOnly : Extensions.bool;
         the_getter : Getter;
         the_setter : Setter;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1064
      pragma Import (CPP, addParam_u, "_ZN2cv13AlgorithmInfo9addParam_ERNS_9AlgorithmEPKciPvbMS1_KFivEMS1_FviERKNS_6StringE");

      function paramHelp (this : access constant AlgorithmInfo; name : Interfaces.C.Strings.chars_ptr) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core.hpp:1068
      pragma Import (CPP, paramHelp, "_ZNK2cv13AlgorithmInfo9paramHelpEPKc");

      function paramType (this : access constant AlgorithmInfo; name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/local/include/opencv2/core.hpp:1069
      pragma Import (CPP, paramType, "_ZNK2cv13AlgorithmInfo9paramTypeEPKc");

      procedure getParams (this : access constant AlgorithmInfo; names : System.Address);  -- /usr/local/include/opencv2/core.hpp:1070
      pragma Import (CPP, getParams, "_ZNK2cv13AlgorithmInfo9getParamsERSt6vectorINS_6StringESaIS2_EE");

      procedure write
        (this : access constant AlgorithmInfo;
         algo : access constant Algorithm'Class;
         fs : access opencv2_core_persistence_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/local/include/opencv2/core.hpp:1072
      pragma Import (CPP, write, "_ZNK2cv13AlgorithmInfo5writeEPKNS_9AlgorithmERNS_11FileStorageE");

      procedure read
        (this : access constant AlgorithmInfo;
         algo : access Algorithm'Class;
         fn : access constant opencv2_core_persistence_hpp.Class_FileNode.FileNode);  -- /usr/local/include/opencv2/core.hpp:1073
      pragma Import (CPP, read, "_ZNK2cv13AlgorithmInfo4readEPNS_9AlgorithmERKNS_8FileNodeE");

      function name (this : access constant AlgorithmInfo) return opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core.hpp:1074
      pragma Import (CPP, name, "_ZNK2cv13AlgorithmInfo4nameEv");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access int;
         readOnly : Extensions.bool;
         getter : anon_31157;
         setter : anon_31101;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1076
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRibMS1_FivEMS1_FviERKNS_6StringE");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access Extensions.bool;
         readOnly : Extensions.bool;
         getter : anon_31157;
         setter : anon_31101;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1081
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRbbMS1_FivEMS1_FviERKNS_6StringE");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access double;
         readOnly : Extensions.bool;
         getter : anon_31175;
         setter : anon_31179;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1086
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRdbMS1_FdvEMS1_FvdERKNS_6StringE");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access opencv2_core_cvstd_hpp.Class_String.String;
         readOnly : Extensions.bool;
         getter : anon_31187;
         setter : anon_31191;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1091
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRNS_6StringEbMS1_FS5_vEMS1_FvRKS5_ESA_");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access opencv2_core_mat_hpp.Class_Mat.Mat;
         readOnly : Extensions.bool;
         getter : anon_31199;
         setter : anon_31203;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1096
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRNS_3MatEbMS1_FS5_vEMS1_FvRKS5_ERKNS_6StringE");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         readOnly : Extensions.bool;
         getter : anon_31211;
         setter : anon_31215;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1101
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRSt6vectorINS_3MatESaIS6_EEbMS1_FS8_vEMS1_FvRKS8_ERKNS_6StringE");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access opencv2_core_cvstd_hpp.Class_Ptr.Ptr;
         readOnly : Extensions.bool;
         getter : anon_31224;
         setter : anon_31228;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1106
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRNS_3PtrIS1_EEbMS1_FS6_vEMS1_FvRKS6_ERKNS_6StringE");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access float;
         readOnly : Extensions.bool;
         getter : anon_31236;
         setter : anon_31240;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1111
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRfbMS1_FfvEMS1_FvfERKNS_6StringE");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access unsigned;
         readOnly : Extensions.bool;
         getter : anon_31249;
         setter : anon_31253;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1116
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRjbMS1_FjvEMS1_FvjERKNS_6StringE");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access opencv2_core_cvdef_h.uint64;
         readOnly : Extensions.bool;
         getter : anon_31265;
         setter : anon_31273;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1121
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRmbMS1_FmvEMS1_FvmERKNS_6StringE");

      procedure addParam
        (this : access AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         value : access opencv2_core_cvdef_h.uchar;
         readOnly : Extensions.bool;
         getter : anon_31285;
         setter : anon_31293;
         help : access constant opencv2_core_cvstd_hpp.Class_String.String);  -- /usr/local/include/opencv2/core.hpp:1126
      pragma Import (CPP, addParam, "_ZN2cv13AlgorithmInfo8addParamERNS_9AlgorithmEPKcRhbMS1_FhvEMS1_FvhERKNS_6StringE");

      procedure set
        (this : access constant AlgorithmInfo;
         algo : access Algorithm'Class;
         name : Interfaces.C.Strings.chars_ptr;
         argType : int;
         value : System.Address;
         force : Extensions.bool);  -- /usr/local/include/opencv2/core.hpp:1143
      pragma Import (CPP, set, "_ZNK2cv13AlgorithmInfo3setEPNS_9AlgorithmEPKciPKvb");
   end;
   use Class_AlgorithmInfo;
   package Class_Param is
      type Param is limited record
         c_type : aliased int;  -- /usr/local/include/opencv2/core.hpp:1157
         offset : aliased int;  -- /usr/local/include/opencv2/core.hpp:1158
         readonly : aliased Extensions.bool;  -- /usr/local/include/opencv2/core.hpp:1159
         the_getter : aliased Getter;  -- /usr/local/include/opencv2/core.hpp:1160
         the_setter : aliased Setter;  -- /usr/local/include/opencv2/core.hpp:1161
         help : aliased opencv2_core_cvstd_hpp.Class_String.String;  -- /usr/local/include/opencv2/core.hpp:1162
      end record;
      pragma Import (CPP, Param);

      function New_Param return Param;  -- /usr/local/include/opencv2/core.hpp:1152
      pragma CPP_Constructor (New_Param, "_ZN2cv5ParamC1Ev");

      function New_Param
        (u_type : int;
         u_readonly : Extensions.bool;
         u_offset : int;
         u_getter : Getter;
         u_setter : Setter;
         u_help : access constant opencv2_core_cvstd_hpp.Class_String.String) return Param;  -- /usr/local/include/opencv2/core.hpp:1153
      pragma CPP_Constructor (New_Param, "_ZN2cv5ParamC1EibiMNS_9AlgorithmEKFivEMS1_FviERKNS_6StringE");


   end;
   use Class_Param;
end opencv2_core_hpp;
