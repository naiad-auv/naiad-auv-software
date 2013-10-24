pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_types_c_h;
with System;
with opencv2_core_core_hpp;
with cpp_4_7_4_bits_stl_vector_h;
with Interfaces.C.Extensions;
with opencv2_imgproc_types_c_h;

package opencv2_imgproc_imgproc_hpp is

   function borderInterpolate
     (p : int;
      len : int;
      borderType : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:69
   pragma Import (CPP, borderInterpolate, "_ZN2cv17borderInterpolateEiii");

   package Class_BaseRowFilter is
      type BaseRowFilter is abstract tagged limited record
         ksize : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:90
         anchor : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:90
      end record;
      pragma Import (CPP, BaseRowFilter);

      function New_BaseRowFilter return BaseRowFilter is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:84
      pragma CPP_Constructor (New_BaseRowFilter, "_ZN2cv13BaseRowFilterC1Ev");

      procedure Delete_BaseRowFilter (this : access BaseRowFilter);  -- /usr/include/opencv2/imgproc/imgproc.hpp:86
      pragma Import (CPP, Delete_BaseRowFilter, "_ZN2cv13BaseRowFilterD1Ev");

      procedure deleting_dtor (this : access BaseRowFilter);  -- /usr/include/opencv2/imgproc/imgproc.hpp:86
      pragma Import (CPP, deleting_dtor, "_ZN2cv13BaseRowFilterD0Ev");

      procedure operator_op
        (this : access BaseRowFilter;
         src : access opencv2_core_types_c_h.uchar;
         dst : access opencv2_core_types_c_h.uchar;
         width : int;
         cn : int) is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:88
   end;
   use Class_BaseRowFilter;
   package Class_BaseColumnFilter is
      type BaseColumnFilter is abstract tagged limited record
         ksize : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:119
         anchor : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:119
      end record;
      pragma Import (CPP, BaseColumnFilter);

      function New_BaseColumnFilter return BaseColumnFilter is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:111
      pragma CPP_Constructor (New_BaseColumnFilter, "_ZN2cv16BaseColumnFilterC1Ev");

      procedure Delete_BaseColumnFilter (this : access BaseColumnFilter);  -- /usr/include/opencv2/imgproc/imgproc.hpp:113
      pragma Import (CPP, Delete_BaseColumnFilter, "_ZN2cv16BaseColumnFilterD1Ev");

      procedure deleting_dtor (this : access BaseColumnFilter);  -- /usr/include/opencv2/imgproc/imgproc.hpp:113
      pragma Import (CPP, deleting_dtor, "_ZN2cv16BaseColumnFilterD0Ev");

      procedure operator_op
        (this : access BaseColumnFilter;
         src : System.Address;
         dst : access opencv2_core_types_c_h.uchar;
         dststep : int;
         dstcount : int;
         width : int) is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:115

      procedure reset (this : access BaseColumnFilter);  -- /usr/include/opencv2/imgproc/imgproc.hpp:118
      pragma Import (CPP, reset, "_ZN2cv16BaseColumnFilter5resetEv");
   end;
   use Class_BaseColumnFilter;
   package Class_BaseFilter is
      type BaseFilter is abstract tagged limited record
         ksize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/imgproc/imgproc.hpp:145
         anchor : aliased opencv2_core_core_hpp.Class_Point.Point;  -- /usr/include/opencv2/imgproc/imgproc.hpp:146
      end record;
      pragma Import (CPP, BaseFilter);

      function New_BaseFilter return BaseFilter is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:137
      pragma CPP_Constructor (New_BaseFilter, "_ZN2cv10BaseFilterC1Ev");

      procedure Delete_BaseFilter (this : access BaseFilter);  -- /usr/include/opencv2/imgproc/imgproc.hpp:139
      pragma Import (CPP, Delete_BaseFilter, "_ZN2cv10BaseFilterD1Ev");

      procedure deleting_dtor (this : access BaseFilter);  -- /usr/include/opencv2/imgproc/imgproc.hpp:139
      pragma Import (CPP, deleting_dtor, "_ZN2cv10BaseFilterD0Ev");

      procedure operator_op
        (this : access BaseFilter;
         src : System.Address;
         dst : access opencv2_core_types_c_h.uchar;
         dststep : int;
         dstcount : int;
         width : int;
         cn : int) is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:141

      procedure reset (this : access BaseFilter);  -- /usr/include/opencv2/imgproc/imgproc.hpp:144
      pragma Import (CPP, reset, "_ZN2cv10BaseFilter5resetEv");
   end;
   use Class_BaseFilter;
   package Class_FilterEngine is
      type FilterEngine is tagged limited record
         srcType : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:263
         dstType : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:263
         bufType : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:263
         ksize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/imgproc/imgproc.hpp:264
         anchor : aliased opencv2_core_core_hpp.Class_Point.Point;  -- /usr/include/opencv2/imgproc/imgproc.hpp:265
         maxWidth : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:266
         wholeSize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/imgproc/imgproc.hpp:267
         roi : aliased opencv2_core_core_hpp.Class_Rect.Rect;  -- /usr/include/opencv2/imgproc/imgproc.hpp:268
         dx1 : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:269
         dx2 : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:269
         rowBorderType : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:270
         columnBorderType : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:270
         borderTab : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/imgproc/imgproc.hpp:271
         borderElemSize : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:272
         ringBuf : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/imgproc/imgproc.hpp:273
         srcRow : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/imgproc/imgproc.hpp:274
         constBorderValue : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/imgproc/imgproc.hpp:275
         constBorderRow : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/imgproc/imgproc.hpp:276
         bufStep : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:277
         startY : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:277
         startY0 : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:277
         endY : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:277
         rowCount : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:277
         dstY : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:277
         rows : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/imgproc/imgproc.hpp:278
         filter2D : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:280
         rowFilter : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:281
         columnFilter : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:282
      end record;
      pragma Import (CPP, FilterEngine);

      function New_FilterEngine return FilterEngine;  -- /usr/include/opencv2/imgproc/imgproc.hpp:226
      pragma CPP_Constructor (New_FilterEngine, "_ZN2cv12FilterEngineC1Ev");

      function New_FilterEngine
        (u_filter2D : access constant opencv2_core_core_hpp.Class_Ptr.Ptr;
         u_rowFilter : access constant opencv2_core_core_hpp.Class_Ptr.Ptr;
         u_columnFilter : access constant opencv2_core_core_hpp.Class_Ptr.Ptr;
         srcType : int;
         dstType : int;
         bufType : int;
         u_rowBorderType : int;
         u_columnBorderType : int;
         u_borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return FilterEngine;  -- /usr/include/opencv2/imgproc/imgproc.hpp:228
      pragma CPP_Constructor (New_FilterEngine, "_ZN2cv12FilterEngineC1ERKNS_3PtrINS_10BaseFilterEEERKNS1_INS_13BaseRowFilterEEERKNS1_INS_16BaseColumnFilterEEEiiiiiRKNS_7Scalar_IdEE");

      procedure Delete_FilterEngine (this : access FilterEngine);  -- /usr/include/opencv2/imgproc/imgproc.hpp:236
      pragma Import (CPP, Delete_FilterEngine, "_ZN2cv12FilterEngineD1Ev");

      procedure deleting_dtor (this : access FilterEngine);  -- /usr/include/opencv2/imgproc/imgproc.hpp:236
      pragma Import (CPP, deleting_dtor, "_ZN2cv12FilterEngineD0Ev");

      procedure init
        (this : access FilterEngine'Class;
         u_filter2D : access constant opencv2_core_core_hpp.Class_Ptr.Ptr;
         u_rowFilter : access constant opencv2_core_core_hpp.Class_Ptr.Ptr;
         u_columnFilter : access constant opencv2_core_core_hpp.Class_Ptr.Ptr;
         srcType : int;
         dstType : int;
         bufType : int;
         u_rowBorderType : int;
         u_columnBorderType : int;
         u_borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar);  -- /usr/include/opencv2/imgproc/imgproc.hpp:238
      pragma Import (CPP, init, "_ZN2cv12FilterEngine4initERKNS_3PtrINS_10BaseFilterEEERKNS1_INS_13BaseRowFilterEEERKNS1_INS_16BaseColumnFilterEEEiiiiiRKNS_7Scalar_IdEE");

      function start
        (this : access FilterEngine;
         wholeSize : opencv2_core_core_hpp.Class_Size.Size;
         roi : opencv2_core_core_hpp.Class_Rect.Rect;
         maxBufRows : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:245
      pragma Import (CPP, start, "_ZN2cv12FilterEngine5startENS_5Size_IiEENS_5Rect_IiEEi");

      function start
        (this : access FilterEngine;
         src : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         srcRoi : access constant opencv2_core_core_hpp.Class_Rect.Rect;
         isolated : Extensions.bool;
         maxBufRows : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:247
      pragma Import (CPP, start, "_ZN2cv12FilterEngine5startERKNS_3MatERKNS_5Rect_IiEEbi");

      function proceed
        (this : access FilterEngine;
         src : access opencv2_core_types_c_h.uchar;
         srcStep : int;
         srcCount : int;
         dst : access opencv2_core_types_c_h.uchar;
         dstStep : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:250
      pragma Import (CPP, proceed, "_ZN2cv12FilterEngine7proceedEPKhiiPhi");

      procedure apply
        (this : access FilterEngine;
         src : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         dst : access opencv2_core_core_hpp.Class_Mat.Mat;
         srcRoi : access constant opencv2_core_core_hpp.Class_Rect.Rect;
         dstOfs : opencv2_core_core_hpp.Class_Point.Point;
         isolated : Extensions.bool);  -- /usr/include/opencv2/imgproc/imgproc.hpp:253
      pragma Import (CPP, apply, "_ZN2cv12FilterEngine5applyERKNS_3MatERS1_RKNS_5Rect_IiEENS_6Point_IiEEb");

      function isSeparable (this : access constant FilterEngine'Class) return Extensions.bool;  -- /usr/include/opencv2/imgproc/imgproc.hpp:258
      pragma Import (CPP, isSeparable, "_ZNK2cv12FilterEngine11isSeparableEv");

      function remainingInputRows (this : access constant FilterEngine'Class) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:260
      pragma Import (CPP, remainingInputRows, "_ZNK2cv12FilterEngine18remainingInputRowsEv");

      function remainingOutputRows (this : access constant FilterEngine'Class) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:261
      pragma Import (CPP, remainingOutputRows, "_ZNK2cv12FilterEngine19remainingOutputRowsEv");
   end;
   use Class_FilterEngine;
   function getKernelType (kernel : opencv2_core_core_hpp.InputArray'Class; anchor : opencv2_core_core_hpp.Class_Point.Point) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:290
   pragma Import (CPP, getKernelType, "_ZN2cv13getKernelTypeERKNS_11_InputArrayENS_6Point_IiEE");

   function getLinearRowFilter
     (srcType : int;
      bufType : int;
      kernel : opencv2_core_core_hpp.InputArray'Class;
      anchor : int;
      symmetryType : int) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:293
   pragma Import (CPP, getLinearRowFilter, "_ZN2cv18getLinearRowFilterEiiRKNS_11_InputArrayEii");

   function getLinearColumnFilter
     (bufType : int;
      dstType : int;
      kernel : opencv2_core_core_hpp.InputArray'Class;
      anchor : int;
      symmetryType : int;
      c_delta : double;
      bits : int) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:298
   pragma Import (CPP, getLinearColumnFilter, "_ZN2cv21getLinearColumnFilterEiiRKNS_11_InputArrayEiidi");

   function getLinearFilter
     (srcType : int;
      dstType : int;
      kernel : opencv2_core_core_hpp.InputArray'Class;
      anchor : opencv2_core_core_hpp.Class_Point.Point;
      c_delta : double;
      bits : int) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:304
   pragma Import (CPP, getLinearFilter, "_ZN2cv15getLinearFilterEiiRKNS_11_InputArrayENS_6Point_IiEEdi");

   function createSeparableLinearFilter
     (srcType : int;
      dstType : int;
      rowKernel : opencv2_core_core_hpp.InputArray'Class;
      columnKernel : opencv2_core_core_hpp.InputArray'Class;
      u_anchor : opencv2_core_core_hpp.Class_Point.Point;
      c_delta : double;
      u_rowBorderType : int;
      u_columnBorderType : int;
      u_borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return opencv2_core_core_hpp.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:310
   pragma Import (CPP, createSeparableLinearFilter, "_ZN2cv27createSeparableLinearFilterEiiRKNS_11_InputArrayES2_NS_6Point_IiEEdiiRKNS_7Scalar_IdEE");

   function createLinearFilter
     (srcType : int;
      dstType : int;
      kernel : opencv2_core_core_hpp.InputArray'Class;
      u_anchor : opencv2_core_core_hpp.Class_Point.Point;
      c_delta : double;
      u_rowBorderType : int;
      u_columnBorderType : int;
      u_borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return opencv2_core_core_hpp.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:318
   pragma Import (CPP, createLinearFilter, "_ZN2cv18createLinearFilterEiiRKNS_11_InputArrayENS_6Point_IiEEdiiRKNS_7Scalar_IdEE");

   function getGaussianKernel
     (ksize : int;
      sigma : double;
      ktype : int) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/imgproc/imgproc.hpp:324
   pragma Import (CPP, getGaussianKernel, "_ZN2cv17getGaussianKernelEidi");

   function createGaussianFilter
     (c_type : int;
      ksize : opencv2_core_core_hpp.Class_Size.Size;
      sigma1 : double;
      sigma2 : double;
      borderType : int) return opencv2_core_core_hpp.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:327
   pragma Import (CPP, createGaussianFilter, "_ZN2cv20createGaussianFilterEiNS_5Size_IiEEddi");

   procedure getDerivKernels
     (kx : opencv2_core_core_hpp.OutputArray'Class;
      ky : opencv2_core_core_hpp.OutputArray'Class;
      dx : int;
      dy : int;
      ksize : int;
      normalize : Extensions.bool;
      ktype : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:331
   pragma Import (CPP, getDerivKernels, "_ZN2cv15getDerivKernelsERKNS_12_OutputArrayES2_iiibi");

   function createDerivFilter
     (srcType : int;
      dstType : int;
      dx : int;
      dy : int;
      ksize : int;
      borderType : int) return opencv2_core_core_hpp.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:335
   pragma Import (CPP, createDerivFilter, "_ZN2cv17createDerivFilterEiiiiii");

   function getRowSumFilter
     (srcType : int;
      sumType : int;
      ksize : int;
      anchor : int) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:339
   pragma Import (CPP, getRowSumFilter, "_ZN2cv15getRowSumFilterEiiii");

   function getColumnSumFilter
     (sumType : int;
      dstType : int;
      ksize : int;
      anchor : int;
      scale : double) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:342
   pragma Import (CPP, getColumnSumFilter, "_ZN2cv18getColumnSumFilterEiiiid");

   function createBoxFilter
     (srcType : int;
      dstType : int;
      ksize : opencv2_core_core_hpp.Class_Size.Size;
      anchor : opencv2_core_core_hpp.Class_Point.Point;
      normalize : Extensions.bool;
      borderType : int) return opencv2_core_core_hpp.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:346
   pragma Import (CPP, createBoxFilter, "_ZN2cv15createBoxFilterEiiNS_5Size_IiEENS_6Point_IiEEbi");

   function getMorphologyRowFilter
     (op : int;
      c_type : int;
      ksize : int;
      anchor : int) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:357
   pragma Import (CPP, getMorphologyRowFilter, "_ZN2cv22getMorphologyRowFilterEiiii");

   function getMorphologyColumnFilter
     (op : int;
      c_type : int;
      ksize : int;
      anchor : int) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:359
   pragma Import (CPP, getMorphologyColumnFilter, "_ZN2cv25getMorphologyColumnFilterEiiii");

   function getMorphologyFilter
     (op : int;
      c_type : int;
      kernel : opencv2_core_core_hpp.InputArray'Class;
      anchor : opencv2_core_core_hpp.Class_Point.Point) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:361
   pragma Import (CPP, getMorphologyFilter, "_ZN2cv19getMorphologyFilterEiiRKNS_11_InputArrayENS_6Point_IiEE");

   function morphologyDefaultBorderValue return opencv2_core_core_hpp.Class_Scalar.Scalar;  -- /usr/include/opencv2/imgproc/imgproc.hpp:365
   pragma Import (CPP, morphologyDefaultBorderValue, "_ZN2cvL28morphologyDefaultBorderValueEv");

   function createMorphologyFilter
     (op : int;
      c_type : int;
      kernel : opencv2_core_core_hpp.InputArray'Class;
      anchor : opencv2_core_core_hpp.Class_Point.Point;
      u_rowBorderType : int;
      u_columnBorderType : int;
      u_borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar) return opencv2_core_core_hpp.Ptr;  -- /usr/include/opencv2/imgproc/imgproc.hpp:368
   pragma Import (CPP, createMorphologyFilter, "_ZN2cv22createMorphologyFilterEiiRKNS_11_InputArrayENS_6Point_IiEEiiRKNS_7Scalar_IdEE");

   function getStructuringElement
     (shape : int;
      ksize : opencv2_core_core_hpp.Class_Size.Size;
      anchor : opencv2_core_core_hpp.Class_Point.Point) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/imgproc/imgproc.hpp:376
   pragma Import (CPP, getStructuringElement, "_ZN2cv21getStructuringElementEiNS_5Size_IiEENS_6Point_IiEE");

   procedure copyMakeBorder
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      top : int;
      bottom : int;
      left : int;
      right : int;
      borderType : int;
      value : access constant opencv2_core_core_hpp.Class_Scalar.Scalar);  -- /usr/include/opencv2/imgproc/imgproc.hpp:381
   pragma Import (CPP, copyMakeBorder, "_ZN2cv14copyMakeBorderERKNS_11_InputArrayERKNS_12_OutputArrayEiiiiiRKNS_7Scalar_IdEE");

   procedure medianBlur
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ksize : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:386
   pragma Import (CPP, medianBlur, "_ZN2cv10medianBlurERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure GaussianBlur
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ksize : opencv2_core_core_hpp.Class_Size.Size;
      sigma1 : double;
      sigma2 : double;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:388
   pragma Import (CPP, GaussianBlur, "_ZN2cv12GaussianBlurERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Size_IiEEddi");

   procedure bilateralFilter
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      d : int;
      sigmaColor : double;
      sigmaSpace : double;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:393
   pragma Import (CPP, bilateralFilter, "_ZN2cv15bilateralFilterERKNS_11_InputArrayERKNS_12_OutputArrayEiddi");

   procedure boxFilter
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ddepth : int;
      ksize : opencv2_core_core_hpp.Class_Size.Size;
      anchor : opencv2_core_core_hpp.Class_Point.Point;
      normalize : Extensions.bool;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:397
   pragma Import (CPP, boxFilter, "_ZN2cv9boxFilterERKNS_11_InputArrayERKNS_12_OutputArrayEiNS_5Size_IiEENS_6Point_IiEEbi");

   procedure blur
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ksize : opencv2_core_core_hpp.Class_Size.Size;
      anchor : opencv2_core_core_hpp.Class_Point.Point;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:402
   pragma Import (CPP, blur, "_ZN2cv4blurERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Size_IiEENS_6Point_IiEEi");

   procedure filter2D
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ddepth : int;
      kernel : opencv2_core_core_hpp.InputArray'Class;
      anchor : opencv2_core_core_hpp.Class_Point.Point;
      c_delta : double;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:407
   pragma Import (CPP, filter2D, "_ZN2cv8filter2DERKNS_11_InputArrayERKNS_12_OutputArrayEiS2_NS_6Point_IiEEdi");

   procedure sepFilter2D
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ddepth : int;
      kernelX : opencv2_core_core_hpp.InputArray'Class;
      kernelY : opencv2_core_core_hpp.InputArray'Class;
      anchor : opencv2_core_core_hpp.Class_Point.Point;
      c_delta : double;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:412
   pragma Import (CPP, sepFilter2D, "_ZN2cv11sepFilter2DERKNS_11_InputArrayERKNS_12_OutputArrayEiS2_S2_NS_6Point_IiEEdi");

   procedure Sobel
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ddepth : int;
      dx : int;
      dy : int;
      ksize : int;
      scale : double;
      c_delta : double;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:418
   pragma Import (CPP, Sobel, "_ZN2cv5SobelERKNS_11_InputArrayERKNS_12_OutputArrayEiiiiddi");

   procedure Scharr
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ddepth : int;
      dx : int;
      dy : int;
      scale : double;
      c_delta : double;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:424
   pragma Import (CPP, Scharr, "_ZN2cv6ScharrERKNS_11_InputArrayERKNS_12_OutputArrayEiiiddi");

   procedure Laplacian
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ddepth : int;
      ksize : int;
      scale : double;
      c_delta : double;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:429
   pragma Import (CPP, Laplacian, "_ZN2cv9LaplacianERKNS_11_InputArrayERKNS_12_OutputArrayEiiddi");

   procedure Canny
     (image : opencv2_core_core_hpp.InputArray'Class;
      edges : opencv2_core_core_hpp.OutputArray'Class;
      threshold1 : double;
      threshold2 : double;
      apertureSize : int;
      L2gradient : Extensions.bool);  -- /usr/include/opencv2/imgproc/imgproc.hpp:434
   pragma Import (CPP, Canny, "_ZN2cv5CannyERKNS_11_InputArrayERKNS_12_OutputArrayEddib");

   procedure cornerMinEigenVal
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      blockSize : int;
      ksize : int;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:439
   pragma Import (CPP, cornerMinEigenVal, "_ZN2cv17cornerMinEigenValERKNS_11_InputArrayERKNS_12_OutputArrayEiii");

   procedure cornerHarris
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      blockSize : int;
      ksize : int;
      k : double;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:444
   pragma Import (CPP, cornerHarris, "_ZN2cv12cornerHarrisERKNS_11_InputArrayERKNS_12_OutputArrayEiidi");

   procedure cornerEigenValsAndVecs
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      blockSize : int;
      ksize : int;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:449
   pragma Import (CPP, cornerEigenValsAndVecs, "_ZN2cv22cornerEigenValsAndVecsERKNS_11_InputArrayERKNS_12_OutputArrayEiii");

   procedure preCornerDetect
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ksize : int;
      borderType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:454
   pragma Import (CPP, preCornerDetect, "_ZN2cv15preCornerDetectERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   procedure cornerSubPix
     (image : opencv2_core_core_hpp.InputArray'Class;
      corners : opencv2_core_core_hpp.InputOutputArray'Class;
      winSize : opencv2_core_core_hpp.Class_Size.Size;
      zeroZone : opencv2_core_core_hpp.Class_Size.Size;
      criteria : opencv2_core_core_hpp.Class_TermCriteria.TermCriteria);  -- /usr/include/opencv2/imgproc/imgproc.hpp:458
   pragma Import (CPP, cornerSubPix, "_ZN2cv12cornerSubPixERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Size_IiEES7_NS_12TermCriteriaE");

   procedure goodFeaturesToTrack
     (image : opencv2_core_core_hpp.InputArray'Class;
      corners : opencv2_core_core_hpp.OutputArray'Class;
      maxCorners : int;
      qualityLevel : double;
      minDistance : double;
      mask : opencv2_core_core_hpp.InputArray'Class;
      blockSize : int;
      useHarrisDetector : Extensions.bool;
      k : double);  -- /usr/include/opencv2/imgproc/imgproc.hpp:463
   pragma Import (CPP, goodFeaturesToTrack, "_ZN2cv19goodFeaturesToTrackERKNS_11_InputArrayERKNS_12_OutputArrayEiddS2_ibd");

   procedure HoughLines
     (image : opencv2_core_core_hpp.InputArray'Class;
      lines : opencv2_core_core_hpp.OutputArray'Class;
      rho : double;
      theta : double;
      threshold : int;
      srn : double;
      stn : double);  -- /usr/include/opencv2/imgproc/imgproc.hpp:469
   pragma Import (CPP, HoughLines, "_ZN2cv10HoughLinesERKNS_11_InputArrayERKNS_12_OutputArrayEddidd");

   procedure HoughLinesP
     (image : opencv2_core_core_hpp.InputArray'Class;
      lines : opencv2_core_core_hpp.OutputArray'Class;
      rho : double;
      theta : double;
      threshold : int;
      minLineLength : double;
      maxLineGap : double);  -- /usr/include/opencv2/imgproc/imgproc.hpp:474
   pragma Import (CPP, HoughLinesP, "_ZN2cv11HoughLinesPERKNS_11_InputArrayERKNS_12_OutputArrayEddidd");

   procedure HoughCircles
     (image : opencv2_core_core_hpp.InputArray'Class;
      circles : opencv2_core_core_hpp.OutputArray'Class;
      method : int;
      dp : double;
      minDist : double;
      param1 : double;
      param2 : double;
      minRadius : int;
      maxRadius : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:479
   pragma Import (CPP, HoughCircles, "_ZN2cv12HoughCirclesERKNS_11_InputArrayERKNS_12_OutputArrayEiddddii");

   procedure erode
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      kernel : opencv2_core_core_hpp.InputArray'Class;
      anchor : opencv2_core_core_hpp.Class_Point.Point;
      iterations : int;
      borderType : int;
      borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar);  -- /usr/include/opencv2/imgproc/imgproc.hpp:485
   pragma Import (CPP, erode, "_ZN2cv5erodeERKNS_11_InputArrayERKNS_12_OutputArrayES2_NS_6Point_IiEEiiRKNS_7Scalar_IdEE");

   procedure dilate
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      kernel : opencv2_core_core_hpp.InputArray'Class;
      anchor : opencv2_core_core_hpp.Class_Point.Point;
      iterations : int;
      borderType : int;
      borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar);  -- /usr/include/opencv2/imgproc/imgproc.hpp:491
   pragma Import (CPP, dilate, "_ZN2cv6dilateERKNS_11_InputArrayERKNS_12_OutputArrayES2_NS_6Point_IiEEiiRKNS_7Scalar_IdEE");

   procedure morphologyEx
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      op : int;
      kernel : opencv2_core_core_hpp.InputArray'Class;
      anchor : opencv2_core_core_hpp.Class_Point.Point;
      iterations : int;
      borderType : int;
      borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar);  -- /usr/include/opencv2/imgproc/imgproc.hpp:497
   pragma Import (CPP, morphologyEx, "_ZN2cv12morphologyExERKNS_11_InputArrayERKNS_12_OutputArrayEiS2_NS_6Point_IiEEiiRKNS_7Scalar_IdEE");

   procedure resize
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      dsize : opencv2_core_core_hpp.Class_Size.Size;
      fx : double;
      fy : double;
      interpolation : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:516
   pragma Import (CPP, resize, "_ZN2cv6resizeERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Size_IiEEddi");

   procedure warpAffine
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      M : opencv2_core_core_hpp.InputArray'Class;
      dsize : opencv2_core_core_hpp.Class_Size.Size;
      flags : int;
      borderMode : int;
      borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar);  -- /usr/include/opencv2/imgproc/imgproc.hpp:521
   pragma Import (CPP, warpAffine, "_ZN2cv10warpAffineERKNS_11_InputArrayERKNS_12_OutputArrayES2_NS_5Size_IiEEiiRKNS_7Scalar_IdEE");

   procedure warpPerspective
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      M : opencv2_core_core_hpp.InputArray'Class;
      dsize : opencv2_core_core_hpp.Class_Size.Size;
      flags : int;
      borderMode : int;
      borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar);  -- /usr/include/opencv2/imgproc/imgproc.hpp:528
   pragma Import (CPP, warpPerspective, "_ZN2cv15warpPerspectiveERKNS_11_InputArrayERKNS_12_OutputArrayES2_NS_5Size_IiEEiiRKNS_7Scalar_IdEE");

   procedure remap
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      map1 : opencv2_core_core_hpp.InputArray'Class;
      map2 : opencv2_core_core_hpp.InputArray'Class;
      interpolation : int;
      borderMode : int;
      borderValue : access constant opencv2_core_core_hpp.Class_Scalar.Scalar);  -- /usr/include/opencv2/imgproc/imgproc.hpp:542
   pragma Import (CPP, remap, "_ZN2cv5remapERKNS_11_InputArrayERKNS_12_OutputArrayES2_S2_iiRKNS_7Scalar_IdEE");

   procedure convertMaps
     (map1 : opencv2_core_core_hpp.InputArray'Class;
      map2 : opencv2_core_core_hpp.InputArray'Class;
      dstmap1 : opencv2_core_core_hpp.OutputArray'Class;
      dstmap2 : opencv2_core_core_hpp.OutputArray'Class;
      dstmap1type : int;
      nninterpolation : Extensions.bool);  -- /usr/include/opencv2/imgproc/imgproc.hpp:548
   pragma Import (CPP, convertMaps, "_ZN2cv11convertMapsERKNS_11_InputArrayES2_RKNS_12_OutputArrayES5_ib");

   function getRotationMatrix2D
     (center : opencv2_core_core_hpp.Class_Point2f.Point2f;
      angle : double;
      scale : double) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/imgproc/imgproc.hpp:553
   pragma Import (CPP, getRotationMatrix2D, "_ZN2cv19getRotationMatrix2DENS_6Point_IfEEdd");

   function getPerspectiveTransform (src : access constant opencv2_core_core_hpp.Class_Point2f.Point2f; dst : access constant opencv2_core_core_hpp.Class_Point2f.Point2f) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/imgproc/imgproc.hpp:555
   pragma Import (CPP, getPerspectiveTransform, "_ZN2cv23getPerspectiveTransformEPKNS_6Point_IfEES3_");

   function getAffineTransform (src : access constant opencv2_core_core_hpp.Class_Point2f.Point2f; dst : access constant opencv2_core_core_hpp.Class_Point2f.Point2f) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/imgproc/imgproc.hpp:557
   pragma Import (CPP, getAffineTransform, "_ZN2cv18getAffineTransformEPKNS_6Point_IfEES3_");

   procedure invertAffineTransform (M : opencv2_core_core_hpp.InputArray'Class; iM : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:559
   pragma Import (CPP, invertAffineTransform, "_ZN2cv21invertAffineTransformERKNS_11_InputArrayERKNS_12_OutputArrayE");

   function getPerspectiveTransform (src : opencv2_core_core_hpp.InputArray'Class; dst : opencv2_core_core_hpp.InputArray'Class) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/imgproc/imgproc.hpp:561
   pragma Import (CPP, getPerspectiveTransform, "_ZN2cv23getPerspectiveTransformERKNS_11_InputArrayES2_");

   function getAffineTransform (src : opencv2_core_core_hpp.InputArray'Class; dst : opencv2_core_core_hpp.InputArray'Class) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/imgproc/imgproc.hpp:562
   pragma Import (CPP, getAffineTransform, "_ZN2cv18getAffineTransformERKNS_11_InputArrayES2_");

   procedure getRectSubPix
     (image : opencv2_core_core_hpp.InputArray'Class;
      patchSize : opencv2_core_core_hpp.Class_Size.Size;
      center : opencv2_core_core_hpp.Class_Point2f.Point2f;
      patch : opencv2_core_core_hpp.OutputArray'Class;
      patchType : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:565
   pragma Import (CPP, getRectSubPix, "_ZN2cv13getRectSubPixERKNS_11_InputArrayENS_5Size_IiEENS_6Point_IfEERKNS_12_OutputArrayEi");

   procedure integral
     (src : opencv2_core_core_hpp.InputArray'Class;
      sum : opencv2_core_core_hpp.OutputArray'Class;
      sdepth : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:569
   pragma Import (CPP, integral, "_ZN2cv8integralERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure integral
     (src : opencv2_core_core_hpp.InputArray'Class;
      sum : opencv2_core_core_hpp.OutputArray'Class;
      sqsum : opencv2_core_core_hpp.OutputArray'Class;
      sdepth : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:572
   pragma Import (CPP, integral, "_ZN2cv8integralERKNS_11_InputArrayERKNS_12_OutputArrayES5_i");

   procedure integral
     (src : opencv2_core_core_hpp.InputArray'Class;
      sum : opencv2_core_core_hpp.OutputArray'Class;
      sqsum : opencv2_core_core_hpp.OutputArray'Class;
      tilted : opencv2_core_core_hpp.OutputArray'Class;
      sdepth : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:575
   pragma Import (CPP, integral, "_ZN2cv8integralERKNS_11_InputArrayERKNS_12_OutputArrayES5_S5_i");

   procedure accumulate
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.InputOutputArray'Class;
      mask : opencv2_core_core_hpp.InputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:580
   pragma Import (CPP, accumulate, "_ZN2cv10accumulateERKNS_11_InputArrayERKNS_12_OutputArrayES2_");

   procedure accumulateSquare
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.InputOutputArray'Class;
      mask : opencv2_core_core_hpp.InputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:583
   pragma Import (CPP, accumulateSquare, "_ZN2cv16accumulateSquareERKNS_11_InputArrayERKNS_12_OutputArrayES2_");

   procedure accumulateProduct
     (src1 : opencv2_core_core_hpp.InputArray'Class;
      src2 : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.InputOutputArray'Class;
      mask : opencv2_core_core_hpp.InputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:586
   pragma Import (CPP, accumulateProduct, "_ZN2cv17accumulateProductERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_");

   procedure accumulateWeighted
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.InputOutputArray'Class;
      alpha : double;
      mask : opencv2_core_core_hpp.InputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:589
   pragma Import (CPP, accumulateWeighted, "_ZN2cv18accumulateWeightedERKNS_11_InputArrayERKNS_12_OutputArrayEdS2_");

   function threshold
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      thresh : double;
      maxval : double;
      c_type : int) return double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:599
   pragma Import (CPP, threshold, "_ZN2cv9thresholdERKNS_11_InputArrayERKNS_12_OutputArrayEddi");

   procedure adaptiveThreshold
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      maxValue : double;
      adaptiveMethod : int;
      thresholdType : int;
      blockSize : int;
      C : double);  -- /usr/include/opencv2/imgproc/imgproc.hpp:606
   pragma Import (CPP, adaptiveThreshold, "_ZN2cv17adaptiveThresholdERKNS_11_InputArrayERKNS_12_OutputArrayEdiiid");

   procedure pyrDown
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      dstsize : access constant opencv2_core_core_hpp.Class_Size.Size);  -- /usr/include/opencv2/imgproc/imgproc.hpp:611
   pragma Import (CPP, pyrDown, "_ZN2cv7pyrDownERKNS_11_InputArrayERKNS_12_OutputArrayERKNS_5Size_IiEE");

   procedure pyrUp
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      dstsize : access constant opencv2_core_core_hpp.Class_Size.Size);  -- /usr/include/opencv2/imgproc/imgproc.hpp:614
   pragma Import (CPP, pyrUp, "_ZN2cv5pyrUpERKNS_11_InputArrayERKNS_12_OutputArrayERKNS_5Size_IiEE");

   procedure buildPyramid
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArrayOfArrays'Class;
      maxlevel : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:618
   pragma Import (CPP, buildPyramid, "_ZN2cv12buildPyramidERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure undistort
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      cameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs : opencv2_core_core_hpp.InputArray'Class;
      newCameraMatrix : opencv2_core_core_hpp.InputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:621
   pragma Import (CPP, undistort, "_ZN2cv9undistortERKNS_11_InputArrayERKNS_12_OutputArrayES2_S2_S2_");

   procedure initUndistortRectifyMap
     (cameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs : opencv2_core_core_hpp.InputArray'Class;
      R : opencv2_core_core_hpp.InputArray'Class;
      newCameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      the_size : opencv2_core_core_hpp.Class_Size.Size;
      m1type : int;
      map1 : opencv2_core_core_hpp.OutputArray'Class;
      map2 : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:627
   pragma Import (CPP, initUndistortRectifyMap, "_ZN2cv23initUndistortRectifyMapERKNS_11_InputArrayES2_S2_S2_NS_5Size_IiEEiRKNS_12_OutputArrayES7_");

   function initWideAngleProjMap
     (cameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs : opencv2_core_core_hpp.InputArray'Class;
      imageSize : opencv2_core_core_hpp.Class_Size.Size;
      destImageWidth : int;
      m1type : int;
      map1 : opencv2_core_core_hpp.OutputArray'Class;
      map2 : opencv2_core_core_hpp.OutputArray'Class;
      projType : int;
      alpha : double) return float;  -- /usr/include/opencv2/imgproc/imgproc.hpp:638
   pragma Import (CPP, initWideAngleProjMap, "_ZN2cv20initWideAngleProjMapERKNS_11_InputArrayES2_NS_5Size_IiEEiiRKNS_12_OutputArrayES7_id");

   function getDefaultNewCameraMatrix
     (cameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      imgsize : opencv2_core_core_hpp.Class_Size.Size;
      centerPrincipalPoint : Extensions.bool) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/imgproc/imgproc.hpp:644
   pragma Import (CPP, getDefaultNewCameraMatrix, "_ZN2cv25getDefaultNewCameraMatrixERKNS_11_InputArrayENS_5Size_IiEEb");

   procedure undistortPoints
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      cameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs : opencv2_core_core_hpp.InputArray'Class;
      R : opencv2_core_core_hpp.InputArray'Class;
      P : opencv2_core_core_hpp.InputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:648
   pragma Import (CPP, undistortPoints, "_ZN2cv15undistortPointsERKNS_11_InputArrayERKNS_12_OutputArrayES2_S2_S2_S2_");

   procedure calcHist
     (images : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      nimages : int;
      channels : access int;
      mask : opencv2_core_core_hpp.InputArray'Class;
      hist : opencv2_core_core_hpp.OutputArray'Class;
      dims : int;
      histSize : access int;
      ranges : System.Address;
      uniform : Extensions.bool;
      accumulate : Extensions.bool);  -- /usr/include/opencv2/imgproc/imgproc.hpp:655
   pragma Import (CPP, calcHist, "_ZN2cv8calcHistEPKNS_3MatEiPKiRKNS_11_InputArrayERKNS_12_OutputArrayEiS4_PPKfbb");

   procedure calcHist
     (images : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      nimages : int;
      channels : access int;
      mask : opencv2_core_core_hpp.InputArray'Class;
      hist : access opencv2_core_core_hpp.Class_SparseMat.SparseMat;
      dims : int;
      histSize : access int;
      ranges : System.Address;
      uniform : Extensions.bool;
      accumulate : Extensions.bool);  -- /usr/include/opencv2/imgproc/imgproc.hpp:661
   pragma Import (CPP, calcHist, "_ZN2cv8calcHistEPKNS_3MatEiPKiRKNS_11_InputArrayERNS_9SparseMatEiS4_PPKfbb");

   procedure calcHist
     (images : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      channels : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      mask : opencv2_core_core_hpp.InputArray'Class;
      hist : opencv2_core_core_hpp.OutputArray'Class;
      histSize : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      ranges : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      accumulate : Extensions.bool);  -- /usr/include/opencv2/imgproc/imgproc.hpp:667
   pragma Import (CPP, calcHist, "_ZN2cv8calcHistERKNS_11_InputArrayERKSt6vectorIiSaIiEES2_RKNS_12_OutputArrayES7_RKS3_IfSaIfEEb");

   procedure calcBackProject
     (images : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      nimages : int;
      channels : access int;
      hist : opencv2_core_core_hpp.InputArray'Class;
      backProject : opencv2_core_core_hpp.OutputArray'Class;
      ranges : System.Address;
      scale : double;
      uniform : Extensions.bool);  -- /usr/include/opencv2/imgproc/imgproc.hpp:675
   pragma Import (CPP, calcBackProject, "_ZN2cv15calcBackProjectEPKNS_3MatEiPKiRKNS_11_InputArrayERKNS_12_OutputArrayEPPKfdb");

   procedure calcBackProject
     (images : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      nimages : int;
      channels : access int;
      hist : access constant opencv2_core_core_hpp.Class_SparseMat.SparseMat;
      backProject : opencv2_core_core_hpp.OutputArray'Class;
      ranges : System.Address;
      scale : double;
      uniform : Extensions.bool);  -- /usr/include/opencv2/imgproc/imgproc.hpp:681
   pragma Import (CPP, calcBackProject, "_ZN2cv15calcBackProjectEPKNS_3MatEiPKiRKNS_9SparseMatERKNS_12_OutputArrayEPPKfdb");

   procedure calcBackProject
     (images : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      channels : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      hist : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      ranges : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      scale : double);  -- /usr/include/opencv2/imgproc/imgproc.hpp:686
   pragma Import (CPP, calcBackProject, "_ZN2cv15calcBackProjectERKNS_11_InputArrayERKSt6vectorIiSaIiEES2_RKNS_12_OutputArrayERKS3_IfSaIfEEd");

   function compareHist
     (H1 : opencv2_core_core_hpp.InputArray'Class;
      H2 : opencv2_core_core_hpp.InputArray'Class;
      method : int) return double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:692
   pragma Import (CPP, compareHist, "_ZN2cv11compareHistERKNS_11_InputArrayES2_i");

   function compareHist
     (H1 : access constant opencv2_core_core_hpp.Class_SparseMat.SparseMat;
      H2 : access constant opencv2_core_core_hpp.Class_SparseMat.SparseMat;
      method : int) return double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:695
   pragma Import (CPP, compareHist, "_ZN2cv11compareHistERKNS_9SparseMatES2_i");

   procedure equalizeHist (src : opencv2_core_core_hpp.InputArray'Class; dst : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:698
   pragma Import (CPP, equalizeHist, "_ZN2cv12equalizeHistERKNS_11_InputArrayERKNS_12_OutputArrayE");

   function EMD
     (signature1 : opencv2_core_core_hpp.InputArray'Class;
      signature2 : opencv2_core_core_hpp.InputArray'Class;
      distType : int;
      cost : opencv2_core_core_hpp.InputArray'Class;
      lowerBound : access float;
      flow : opencv2_core_core_hpp.OutputArray'Class) return float;  -- /usr/include/opencv2/imgproc/imgproc.hpp:700
   pragma Import (CPP, EMD, "_ZN2cv3EMDERKNS_11_InputArrayES2_iS2_PfRKNS_12_OutputArrayE");

   procedure watershed (image : opencv2_core_core_hpp.InputArray'Class; markers : opencv2_core_core_hpp.InputOutputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:705
   pragma Import (CPP, watershed, "_ZN2cv9watershedERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure pyrMeanShiftFiltering
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      sp : double;
      sr : double;
      maxLevel : int;
      termcrit : opencv2_core_core_hpp.Class_TermCriteria.TermCriteria);  -- /usr/include/opencv2/imgproc/imgproc.hpp:708
   pragma Import (CPP, pyrMeanShiftFiltering, "_ZN2cv21pyrMeanShiftFilteringERKNS_11_InputArrayERKNS_12_OutputArrayEddiNS_12TermCriteriaE");

   procedure grabCut
     (img : opencv2_core_core_hpp.InputArray'Class;
      mask : opencv2_core_core_hpp.InputOutputArray'Class;
      the_rect : opencv2_core_core_hpp.Class_Rect.Rect;
      bgdModel : opencv2_core_core_hpp.InputOutputArray'Class;
      fgdModel : opencv2_core_core_hpp.InputOutputArray'Class;
      iterCount : int;
      mode : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:731
   pragma Import (CPP, grabCut, "_ZN2cv7grabCutERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Rect_IiEES5_S5_ii");

   procedure inpaint
     (src : opencv2_core_core_hpp.InputArray'Class;
      inpaintMask : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      inpaintRange : double;
      flags : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:743
   pragma Import (CPP, inpaint, "_ZN2cv7inpaintERKNS_11_InputArrayES2_RKNS_12_OutputArrayEdi");

   procedure distanceTransform
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      labels : opencv2_core_core_hpp.OutputArray'Class;
      distanceType : int;
      maskSize : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:747
   pragma Import (CPP, distanceTransform, "_ZN2cv17distanceTransformERKNS_11_InputArrayERKNS_12_OutputArrayES5_ii");

   procedure distanceTransform
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      distanceType : int;
      maskSize : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:751
   pragma Import (CPP, distanceTransform, "_ZN2cv17distanceTransformERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   function floodFill
     (image : opencv2_core_core_hpp.InputOutputArray'Class;
      seedPoint : opencv2_core_core_hpp.Class_Point.Point;
      newVal : opencv2_core_core_hpp.Class_Scalar.Scalar;
      the_rect : access opencv2_core_core_hpp.Class_Rect.Rect;
      loDiff : opencv2_core_core_hpp.Class_Scalar.Scalar;
      upDiff : opencv2_core_core_hpp.Class_Scalar.Scalar;
      flags : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:757
   pragma Import (CPP, floodFill, "_ZN2cv9floodFillERKNS_12_OutputArrayENS_6Point_IiEENS_7Scalar_IdEEPNS_5Rect_IiEES6_S6_i");

   function floodFill
     (image : opencv2_core_core_hpp.InputOutputArray'Class;
      mask : opencv2_core_core_hpp.InputOutputArray'Class;
      seedPoint : opencv2_core_core_hpp.Class_Point.Point;
      newVal : opencv2_core_core_hpp.Class_Scalar.Scalar;
      the_rect : access opencv2_core_core_hpp.Class_Rect.Rect;
      loDiff : opencv2_core_core_hpp.Class_Scalar.Scalar;
      upDiff : opencv2_core_core_hpp.Class_Scalar.Scalar;
      flags : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:763
   pragma Import (CPP, floodFill, "_ZN2cv9floodFillERKNS_12_OutputArrayES2_NS_6Point_IiEENS_7Scalar_IdEEPNS_5Rect_IiEES6_S6_i");

   procedure cvtColor
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      code : int;
      dstCn : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:913
   pragma Import (CPP, cvtColor, "_ZN2cv8cvtColorERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   package Class_Moments is
      type Moments is limited record
         m00 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:930
         m10 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:930
         m01 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:930
         m20 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:930
         m11 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:930
         m02 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:930
         m30 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:930
         m21 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:930
         m12 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:930
         m03 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:930
         mu20 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:932
         mu11 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:932
         mu02 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:932
         mu30 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:932
         mu21 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:932
         mu12 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:932
         mu03 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:932
         nu20 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:934
         nu11 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:934
         nu02 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:934
         nu30 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:934
         nu21 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:934
         nu12 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:934
         nu03 : aliased double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:934
      end record;
      pragma Import (CPP, Moments);

      function New_Moments return Moments;  -- /usr/include/opencv2/imgproc/imgproc.hpp:920
      pragma CPP_Constructor (New_Moments, "_ZN2cv7MomentsC1Ev");

      function New_Moments
        (m00 : double;
         m10 : double;
         m01 : double;
         m20 : double;
         m11 : double;
         m02 : double;
         m30 : double;
         m21 : double;
         m12 : double;
         m03 : double) return Moments;  -- /usr/include/opencv2/imgproc/imgproc.hpp:922
      pragma CPP_Constructor (New_Moments, "_ZN2cv7MomentsC1Edddddddddd");

      function New_Moments (moments : access constant opencv2_imgproc_types_c_h.CvMoments) return Moments;  -- /usr/include/opencv2/imgproc/imgproc.hpp:925
      pragma CPP_Constructor (New_Moments, "_ZN2cv7MomentsC1ERK9CvMoments");

      function operator_92 (this : access constant Moments) return opencv2_imgproc_types_c_h.CvMoments;  -- /usr/include/opencv2/imgproc/imgproc.hpp:927
      pragma Import (CPP, operator_92, "_ZNK2cv7Momentscv9CvMomentsEv");
   end;
   use Class_Moments;
   function moments (c_array : opencv2_core_core_hpp.InputArray'Class; binaryImage : Extensions.bool) return Moments;  -- /usr/include/opencv2/imgproc/imgproc.hpp:938
   pragma Import (CPP, moments, "_ZN2cv7momentsERKNS_11_InputArrayEb");

   procedure HuMoments (moments : access constant Moments; hu : access double);  -- /usr/include/opencv2/imgproc/imgproc.hpp:941
   pragma Import (CPP, HuMoments, "_ZN2cv9HuMomentsERKNS_7MomentsEPd");

   procedure HuMoments (m : access constant Moments; hu : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/imgproc/imgproc.hpp:942
   pragma Import (CPP, HuMoments, "_ZN2cv9HuMomentsERKNS_7MomentsERKNS_12_OutputArrayE");

   procedure matchTemplate
     (image : opencv2_core_core_hpp.InputArray'Class;
      templ : opencv2_core_core_hpp.InputArray'Class;
      result : opencv2_core_core_hpp.OutputArray'Class;
      method : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:948
   pragma Import (CPP, matchTemplate, "_ZN2cv13matchTemplateERKNS_11_InputArrayES2_RKNS_12_OutputArrayEi");

   procedure findContours
     (image : opencv2_core_core_hpp.InputOutputArray'Class;
      contours : opencv2_core_core_hpp.OutputArrayOfArrays'Class;
      hierarchy : opencv2_core_core_hpp.OutputArray'Class;
      mode : int;
      method : int;
      offset : opencv2_core_core_hpp.Class_Point.Point);  -- /usr/include/opencv2/imgproc/imgproc.hpp:970
   pragma Import (CPP, findContours, "_ZN2cv12findContoursERKNS_12_OutputArrayES2_S2_iiNS_6Point_IiEE");

   procedure findContours
     (image : opencv2_core_core_hpp.InputOutputArray'Class;
      contours : opencv2_core_core_hpp.OutputArrayOfArrays'Class;
      mode : int;
      method : int;
      offset : opencv2_core_core_hpp.Class_Point.Point);  -- /usr/include/opencv2/imgproc/imgproc.hpp:975
   pragma Import (CPP, findContours, "_ZN2cv12findContoursERKNS_12_OutputArrayES2_iiNS_6Point_IiEE");

   procedure drawContours
     (image : opencv2_core_core_hpp.InputOutputArray'Class;
      contours : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      contourIdx : int;
      color : access constant opencv2_core_core_hpp.Class_Scalar.Scalar;
      thickness : int;
      lineType : int;
      hierarchy : opencv2_core_core_hpp.InputArray'Class;
      maxLevel : int;
      offset : opencv2_core_core_hpp.Class_Point.Point);  -- /usr/include/opencv2/imgproc/imgproc.hpp:979
   pragma Import (CPP, drawContours, "_ZN2cv12drawContoursERKNS_12_OutputArrayERKNS_11_InputArrayEiRKNS_7Scalar_IdEEiiS5_iNS_6Point_IiEE");

   procedure approxPolyDP
     (curve : opencv2_core_core_hpp.InputArray'Class;
      approxCurve : opencv2_core_core_hpp.OutputArray'Class;
      epsilon : double;
      closed : Extensions.bool);  -- /usr/include/opencv2/imgproc/imgproc.hpp:986
   pragma Import (CPP, approxPolyDP, "_ZN2cv12approxPolyDPERKNS_11_InputArrayERKNS_12_OutputArrayEdb");

   function arcLength (curve : opencv2_core_core_hpp.InputArray'Class; closed : Extensions.bool) return double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:991
   pragma Import (CPP, arcLength, "_ZN2cv9arcLengthERKNS_11_InputArrayEb");

   function boundingRect (points : opencv2_core_core_hpp.InputArray'Class) return opencv2_core_core_hpp.Class_Rect.Rect;  -- /usr/include/opencv2/imgproc/imgproc.hpp:993
   pragma Import (CPP, boundingRect, "_ZN2cv12boundingRectERKNS_11_InputArrayE");

   function contourArea (contour : opencv2_core_core_hpp.InputArray'Class; oriented : Extensions.bool) return double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:995
   pragma Import (CPP, contourArea, "_ZN2cv11contourAreaERKNS_11_InputArrayEb");

   function minAreaRect (points : opencv2_core_core_hpp.InputArray'Class) return opencv2_core_core_hpp.Class_RotatedRect.RotatedRect;  -- /usr/include/opencv2/imgproc/imgproc.hpp:997
   pragma Import (CPP, minAreaRect, "_ZN2cv11minAreaRectERKNS_11_InputArrayE");

   procedure minEnclosingCircle
     (points : opencv2_core_core_hpp.InputArray'Class;
      center : access opencv2_core_core_hpp.Class_Point2f.Point2f;
      radius : access float);  -- /usr/include/opencv2/imgproc/imgproc.hpp:999
   pragma Import (CPP, minEnclosingCircle, "_ZN2cv18minEnclosingCircleERKNS_11_InputArrayERNS_6Point_IfEERf");

   function matchShapes
     (contour1 : opencv2_core_core_hpp.InputArray'Class;
      contour2 : opencv2_core_core_hpp.InputArray'Class;
      method : int;
      parameter : double) return double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1002
   pragma Import (CPP, matchShapes, "_ZN2cv11matchShapesERKNS_11_InputArrayES2_id");

   procedure convexHull
     (points : opencv2_core_core_hpp.InputArray'Class;
      hull : opencv2_core_core_hpp.OutputArray'Class;
      clockwise : Extensions.bool;
      returnPoints : Extensions.bool);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1005
   pragma Import (CPP, convexHull, "_ZN2cv10convexHullERKNS_11_InputArrayERKNS_12_OutputArrayEbb");

   function isContourConvex (contour : opencv2_core_core_hpp.InputArray'Class) return Extensions.bool;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1009
   pragma Import (CPP, isContourConvex, "_ZN2cv15isContourConvexERKNS_11_InputArrayE");

   function fitEllipse (points : opencv2_core_core_hpp.InputArray'Class) return opencv2_core_core_hpp.Class_RotatedRect.RotatedRect;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1012
   pragma Import (CPP, fitEllipse, "_ZN2cv10fitEllipseERKNS_11_InputArrayE");

   procedure fitLine
     (points : opencv2_core_core_hpp.InputArray'Class;
      line : opencv2_core_core_hpp.OutputArray'Class;
      distType : int;
      param : double;
      reps : double;
      aeps : double);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1015
   pragma Import (CPP, fitLine, "_ZN2cv7fitLineERKNS_11_InputArrayERKNS_12_OutputArrayEiddd");

   function pointPolygonTest
     (contour : opencv2_core_core_hpp.InputArray'Class;
      pt : opencv2_core_core_hpp.Class_Point2f.Point2f;
      measureDist : Extensions.bool) return double;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1018
   pragma Import (CPP, pointPolygonTest, "_ZN2cv16pointPolygonTestERKNS_11_InputArrayENS_6Point_IfEEb");

   type Subdiv2D;
   type Vertex is record
      firstEdge : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1088
      c_type : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1089
      pt : aliased opencv2_core_core_hpp.Class_Point2f.Point2f;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1090
   end record;
   pragma Convention (C_Pass_By_Copy, Vertex);
   type Subdiv2D_next_array is array (0 .. 3) of aliased int;
   type Subdiv2D_pt_array is array (0 .. 3) of aliased int;
   type QuadEdge is record
      next : aliased Subdiv2D_next_array;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1097
      pt : aliased Subdiv2D_pt_array;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1098
   end record;
   pragma Convention (C_Pass_By_Copy, QuadEdge);
   package Class_Subdiv2D is
      type Subdiv2D is limited record
         vtx : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1101
         qedges : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1102
         freeQEdge : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1103
         freePoint : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1104
         validGeometry : aliased Extensions.bool;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1105
         recentEdge : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1107
         topLeft : aliased opencv2_core_core_hpp.Class_Point2f.Point2f;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1108
         bottomRight : aliased opencv2_core_core_hpp.Class_Point2f.Point2f;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1109
      end record;
      pragma Import (CPP, Subdiv2D);

      function New_Subdiv2D return Subdiv2D;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1045
      pragma CPP_Constructor (New_Subdiv2D, "_ZN2cv8Subdiv2DC1Ev");

      function New_Subdiv2D (the_rect : opencv2_core_core_hpp.Class_Rect.Rect) return Subdiv2D;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1046
      pragma CPP_Constructor (New_Subdiv2D, "_ZN2cv8Subdiv2DC1ENS_5Rect_IiEE");

      procedure initDelaunay (this : access Subdiv2D; the_rect : opencv2_core_core_hpp.Class_Rect.Rect);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1047
      pragma Import (CPP, initDelaunay, "_ZN2cv8Subdiv2D12initDelaunayENS_5Rect_IiEE");

      function insert (this : access Subdiv2D; pt : opencv2_core_core_hpp.Class_Point2f.Point2f) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1049
      pragma Import (CPP, insert, "_ZN2cv8Subdiv2D6insertENS_6Point_IfEE");

      procedure insert (this : access Subdiv2D; ptvec : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1050
      pragma Import (CPP, insert, "_ZN2cv8Subdiv2D6insertERKSt6vectorINS_6Point_IfEESaIS3_EE");

      function locate
        (this : access Subdiv2D;
         pt : opencv2_core_core_hpp.Class_Point2f.Point2f;
         edge : access int;
         vertex : access int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1051
      pragma Import (CPP, locate, "_ZN2cv8Subdiv2D6locateENS_6Point_IfEERiS3_");

      function findNearest
        (this : access Subdiv2D;
         pt : opencv2_core_core_hpp.Class_Point2f.Point2f;
         nearestPt : access opencv2_core_core_hpp.Class_Point2f.Point2f) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1053
      pragma Import (CPP, findNearest, "_ZN2cv8Subdiv2D11findNearestENS_6Point_IfEEPS2_");

      procedure getEdgeList (this : access constant Subdiv2D; edgeList : System.Address);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1054
      pragma Import (CPP, getEdgeList, "_ZNK2cv8Subdiv2D11getEdgeListERSt6vectorINS_3VecIfLi4EEESaIS3_EE");

      procedure getTriangleList (this : access constant Subdiv2D; triangleList : System.Address);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1055
      pragma Import (CPP, getTriangleList, "_ZNK2cv8Subdiv2D15getTriangleListERSt6vectorINS_3VecIfLi6EEESaIS3_EE");

      procedure getVoronoiFacetList
        (this : access Subdiv2D;
         idx : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         facetList : System.Address;
         facetCenters : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1056
      pragma Import (CPP, getVoronoiFacetList, "_ZN2cv8Subdiv2D19getVoronoiFacetListERKSt6vectorIiSaIiEERS1_IS1_INS_6Point_IfEESaIS7_EESaIS9_EERS9_");

      function getVertex
        (this : access constant Subdiv2D;
         vertex : int;
         firstEdge : access int) return opencv2_core_core_hpp.Class_Point2f.Point2f;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1059
      pragma Import (CPP, getVertex, "_ZNK2cv8Subdiv2D9getVertexEiPi");

      function getEdge
        (this : access constant Subdiv2D;
         edge : int;
         nextEdgeType : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1061
      pragma Import (CPP, getEdge, "_ZNK2cv8Subdiv2D7getEdgeEii");

      function nextEdge (this : access constant Subdiv2D; edge : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1062
      pragma Import (CPP, nextEdge, "_ZNK2cv8Subdiv2D8nextEdgeEi");

      function rotateEdge
        (this : access constant Subdiv2D;
         edge : int;
         rotate : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1063
      pragma Import (CPP, rotateEdge, "_ZNK2cv8Subdiv2D10rotateEdgeEii");

      function symEdge (this : access constant Subdiv2D; edge : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1064
      pragma Import (CPP, symEdge, "_ZNK2cv8Subdiv2D7symEdgeEi");

      function edgeOrg
        (this : access constant Subdiv2D;
         edge : int;
         orgpt : access opencv2_core_core_hpp.Class_Point2f.Point2f) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1065
      pragma Import (CPP, edgeOrg, "_ZNK2cv8Subdiv2D7edgeOrgEiPNS_6Point_IfEE");

      function edgeDst
        (this : access constant Subdiv2D;
         edge : int;
         dstpt : access opencv2_core_core_hpp.Class_Point2f.Point2f) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1066
      pragma Import (CPP, edgeDst, "_ZNK2cv8Subdiv2D7edgeDstEiPNS_6Point_IfEE");

      function newEdge (this : access Subdiv2D) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1069
      pragma Import (CPP, newEdge, "_ZN2cv8Subdiv2D7newEdgeEv");

      procedure deleteEdge (this : access Subdiv2D; edge : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1070
      pragma Import (CPP, deleteEdge, "_ZN2cv8Subdiv2D10deleteEdgeEi");

      function newPoint
        (this : access Subdiv2D;
         pt : opencv2_core_core_hpp.Class_Point2f.Point2f;
         isvirtual : Extensions.bool;
         firstEdge : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1071
      pragma Import (CPP, newPoint, "_ZN2cv8Subdiv2D8newPointENS_6Point_IfEEbi");

      procedure deletePoint (this : access Subdiv2D; vtx : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1072
      pragma Import (CPP, deletePoint, "_ZN2cv8Subdiv2D11deletePointEi");

      procedure setEdgePoints
        (this : access Subdiv2D;
         edge : int;
         orgPt : int;
         dstPt : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1073
      pragma Import (CPP, setEdgePoints, "_ZN2cv8Subdiv2D13setEdgePointsEiii");

      procedure splice
        (this : access Subdiv2D;
         edgeA : int;
         edgeB : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1074
      pragma Import (CPP, splice, "_ZN2cv8Subdiv2D6spliceEii");

      function connectEdges
        (this : access Subdiv2D;
         edgeA : int;
         edgeB : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1075
      pragma Import (CPP, connectEdges, "_ZN2cv8Subdiv2D12connectEdgesEii");

      procedure swapEdges (this : access Subdiv2D; edge : int);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1076
      pragma Import (CPP, swapEdges, "_ZN2cv8Subdiv2D9swapEdgesEi");

      function isRightOf
        (this : access constant Subdiv2D;
         pt : opencv2_core_core_hpp.Class_Point2f.Point2f;
         edge : int) return int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1077
      pragma Import (CPP, isRightOf, "_ZNK2cv8Subdiv2D9isRightOfENS_6Point_IfEEi");

      procedure calcVoronoi (this : access Subdiv2D);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1078
      pragma Import (CPP, calcVoronoi, "_ZN2cv8Subdiv2D11calcVoronoiEv");

      procedure clearVoronoi (this : access Subdiv2D);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1079
      pragma Import (CPP, clearVoronoi, "_ZN2cv8Subdiv2D12clearVoronoiEv");

      procedure check (this : access constant Subdiv2D);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1080
      pragma Import (CPP, check, "_ZNK2cv8Subdiv2D5checkEv");
   end;
   use Class_Subdiv2D;
   type lsh_hash is record
      h1 : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1117
      h2 : aliased int;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1117
   end record;
   pragma Convention (C_Pass_By_Copy, lsh_hash);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1116

   package Class_CvLSHOperations is
      type CvLSHOperations is abstract tagged limited record
         null;
      end record;
      pragma Import (CPP, CvLSHOperations);

      procedure Delete_CvLSHOperations (this : access CvLSHOperations);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1122
      pragma Import (CPP, Delete_CvLSHOperations, "_ZN15CvLSHOperationsD1Ev");

      procedure deleting_dtor (this : access CvLSHOperations);  -- /usr/include/opencv2/imgproc/imgproc.hpp:1122
      pragma Import (CPP, deleting_dtor, "_ZN15CvLSHOperationsD0Ev");

      function vector_add (this : access CvLSHOperations; data : System.Address) return int is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1124

      procedure vector_remove (this : access CvLSHOperations; i : int) is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1125

      function vector_lookup (this : access CvLSHOperations; i : int) return System.Address is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1126

      procedure vector_reserve (this : access CvLSHOperations; n : int) is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1127

      function vector_count (this : access CvLSHOperations) return unsigned is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1128

      procedure hash_insert
        (this : access CvLSHOperations;
         h : lsh_hash;
         l : int;
         i : int) is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1130

      procedure hash_remove
        (this : access CvLSHOperations;
         h : lsh_hash;
         l : int;
         i : int) is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1131

      function hash_lookup
        (this : access CvLSHOperations;
         h : lsh_hash;
         l : int;
         ret_i : access int;
         ret_i_max : int) return int is abstract;  -- /usr/include/opencv2/imgproc/imgproc.hpp:1132
   end;
   use Class_CvLSHOperations;
end opencv2_imgproc_imgproc_hpp;
