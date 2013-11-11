pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_types_c_h;
with System;
with Interfaces.C.Strings;
with cpp_4_7_4_bits_stl_vector_h;
with Interfaces.C.Extensions;
with opencv2_core_core_hpp;
limited with cpp_4_7_4_bits_stringfwd_h;
with stddef_h;
with opencv2_features2d_features2d_hpp;
with cpp_4_7_4_bits_stl_deque_h;

package opencv2_objdetect_objdetect_hpp is


   CV_HAAR_MAGIC_VAL : constant := 16#42500000#;  --  /usr/include/opencv2/objdetect/objdetect.hpp:57
   CV_TYPE_NAME_HAAR : aliased constant String := "opencv-haar-classifier" & ASCII.NUL;  --  /usr/include/opencv2/objdetect/objdetect.hpp:58
   --  arg-macro: function CV_IS_HAAR_CLASSIFIER (haar)
   --    return (haar) /= NULL  and then  (((const CvHaarClassifierCascade*)(haar)).flags and CV_MAGIC_MASK)=CV_HAAR_MAGIC_VAL;

   CV_HAAR_FEATURE_MAX : constant := 3;  --  /usr/include/opencv2/objdetect/objdetect.hpp:64

   CV_HAAR_DO_CANNY_PRUNING : constant := 1;  --  /usr/include/opencv2/objdetect/objdetect.hpp:123
   CV_HAAR_SCALE_IMAGE : constant := 2;  --  /usr/include/opencv2/objdetect/objdetect.hpp:124
   CV_HAAR_FIND_BIGGEST_OBJECT : constant := 4;  --  /usr/include/opencv2/objdetect/objdetect.hpp:125
   CV_HAAR_DO_ROUGH_SEARCH : constant := 8;  --  /usr/include/opencv2/objdetect/objdetect.hpp:126

   type CvHaarFeature_rect_array is array (0 .. 2) of aliased anon_214;
   type CvHaarFeature;
   type anon_214 is record
      r : aliased opencv2_core_types_c_h.CvRect;  -- /usr/include/opencv2/objdetect/objdetect.hpp:71
      weight : aliased float;  -- /usr/include/opencv2/objdetect/objdetect.hpp:72
   end record;
   pragma Convention (C_Pass_By_Copy, anon_214);
   type CvHaarFeature is record
      tilted : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:68
      rect : aliased CvHaarFeature_rect_array;  -- /usr/include/opencv2/objdetect/objdetect.hpp:73
   end record;
   pragma Convention (C_Pass_By_Copy, CvHaarFeature);  -- /usr/include/opencv2/objdetect/objdetect.hpp:66

   type CvHaarClassifier is record
      count : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:78
      haar_feature : access CvHaarFeature;  -- /usr/include/opencv2/objdetect/objdetect.hpp:79
      threshold : access float;  -- /usr/include/opencv2/objdetect/objdetect.hpp:80
      left : access int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:81
      right : access int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:82
      alpha : access float;  -- /usr/include/opencv2/objdetect/objdetect.hpp:83
   end record;
   pragma Convention (C_Pass_By_Copy, CvHaarClassifier);  -- /usr/include/opencv2/objdetect/objdetect.hpp:76

   type CvHaarStageClassifier is record
      count : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:88
      threshold : aliased float;  -- /usr/include/opencv2/objdetect/objdetect.hpp:89
      classifier : access CvHaarClassifier;  -- /usr/include/opencv2/objdetect/objdetect.hpp:90
      next : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:92
      child : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:93
      parent : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:94
   end record;
   pragma Convention (C_Pass_By_Copy, CvHaarStageClassifier);  -- /usr/include/opencv2/objdetect/objdetect.hpp:86

   --  skipped empty struct CvHidHaarClassifierCascade

   type CvHaarClassifierCascade is record
      flags : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:101
      count : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:102
      orig_window_size : aliased opencv2_core_types_c_h.Class_CvSize.CvSize;  -- /usr/include/opencv2/objdetect/objdetect.hpp:103
      real_window_size : aliased opencv2_core_types_c_h.Class_CvSize.CvSize;  -- /usr/include/opencv2/objdetect/objdetect.hpp:104
      scale : aliased double;  -- /usr/include/opencv2/objdetect/objdetect.hpp:105
      stage_classifier : access CvHaarStageClassifier;  -- /usr/include/opencv2/objdetect/objdetect.hpp:106
      hid_cascade : System.Address;  -- /usr/include/opencv2/objdetect/objdetect.hpp:107
   end record;
   pragma Convention (C_Pass_By_Copy, CvHaarClassifierCascade);  -- /usr/include/opencv2/objdetect/objdetect.hpp:99

   type CvAvgComp is record
      rect : aliased opencv2_core_types_c_h.CvRect;  -- /usr/include/opencv2/objdetect/objdetect.hpp:112
      neighbors : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:113
   end record;
   pragma Convention (C_Pass_By_Copy, CvAvgComp);  -- /usr/include/opencv2/objdetect/objdetect.hpp:110

   function cvLoadHaarClassifierCascade (directory : Interfaces.C.Strings.chars_ptr; orig_window_size : opencv2_core_types_c_h.Class_CvSize.CvSize) return access CvHaarClassifierCascade;  -- /usr/include/opencv2/objdetect/objdetect.hpp:118
   pragma Import (C, cvLoadHaarClassifierCascade, "cvLoadHaarClassifierCascade");

   procedure cvReleaseHaarClassifierCascade (cascade : System.Address);  -- /usr/include/opencv2/objdetect/objdetect.hpp:121
   pragma Import (C, cvReleaseHaarClassifierCascade, "cvReleaseHaarClassifierCascade");

   function cvHaarDetectObjects
     (image : System.Address;
      cascade : access CvHaarClassifierCascade;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      scale_factor : double;
      min_neighbors : int;
      flags : int;
      min_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      max_size : opencv2_core_types_c_h.Class_CvSize.CvSize) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/objdetect/objdetect.hpp:137
   pragma Import (C, cvHaarDetectObjects, "cvHaarDetectObjects");

   procedure cvSetImagesForHaarClassifierCascade
     (cascade : access CvHaarClassifierCascade;
      sum : System.Address;
      sqsum : System.Address;
      tilted_sum : System.Address;
      scale : double);  -- /usr/include/opencv2/objdetect/objdetect.hpp:144
   pragma Import (C, cvSetImagesForHaarClassifierCascade, "cvSetImagesForHaarClassifierCascade");

   function cvRunHaarClassifierCascade
     (cascade : System.Address;
      pt : opencv2_core_types_c_h.CvPoint;
      start_stage : int) return int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:149
   pragma Import (C, cvRunHaarClassifierCascade, "cvRunHaarClassifierCascade");

   type CvLSVMFilterPosition is record
      x : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:163
      y : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:164
      l : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:165
   end record;
   pragma Convention (C_Pass_By_Copy, CvLSVMFilterPosition);  -- /usr/include/opencv2/objdetect/objdetect.hpp:166

   --  skipped anonymous struct anon_215

   type CvLSVMFilterObject_fineFunction_array is array (0 .. 3) of aliased float;
   type CvLSVMFilterObject is record
      V : aliased CvLSVMFilterPosition;  -- /usr/include/opencv2/objdetect/objdetect.hpp:183
      fineFunction : aliased CvLSVMFilterObject_fineFunction_array;  -- /usr/include/opencv2/objdetect/objdetect.hpp:184
      sizeX : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:185
      sizeY : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:186
      numFeatures : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:187
      H : access float;  -- /usr/include/opencv2/objdetect/objdetect.hpp:188
   end record;
   pragma Convention (C_Pass_By_Copy, CvLSVMFilterObject);  -- /usr/include/opencv2/objdetect/objdetect.hpp:189

   --  skipped anonymous struct anon_216

   type CvLatentSvmDetector is record
      num_filters : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:201
      num_components : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:202
      num_part_filters : access int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:203
      filters : System.Address;  -- /usr/include/opencv2/objdetect/objdetect.hpp:204
      b : access float;  -- /usr/include/opencv2/objdetect/objdetect.hpp:205
      score_threshold : aliased float;  -- /usr/include/opencv2/objdetect/objdetect.hpp:206
   end record;
   pragma Convention (C_Pass_By_Copy, CvLatentSvmDetector);  -- /usr/include/opencv2/objdetect/objdetect.hpp:199

   type CvObjectDetection is record
      rect : aliased opencv2_core_types_c_h.CvRect;  -- /usr/include/opencv2/objdetect/objdetect.hpp:216
      score : aliased float;  -- /usr/include/opencv2/objdetect/objdetect.hpp:217
   end record;
   pragma Convention (C_Pass_By_Copy, CvObjectDetection);  -- /usr/include/opencv2/objdetect/objdetect.hpp:214

   function cvLoadLatentSvmDetector (filename : Interfaces.C.Strings.chars_ptr) return access CvLatentSvmDetector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:234
   pragma Import (C, cvLoadLatentSvmDetector, "cvLoadLatentSvmDetector");

   procedure cvReleaseLatentSvmDetector (detector : System.Address);  -- /usr/include/opencv2/objdetect/objdetect.hpp:245
   pragma Import (C, cvReleaseLatentSvmDetector, "cvReleaseLatentSvmDetector");

   function cvLatentSvmDetectObjects
     (image : access opencv2_core_types_c_h.IplImage;
      detector : access CvLatentSvmDetector;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      overlap_threshold : float;
      numThreads : int) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/objdetect/objdetect.hpp:267
   pragma Import (C, cvLatentSvmDetectObjects, "cvLatentSvmDetectObjects");

   function cvHaarDetectObjectsForROC
     (image : System.Address;
      cascade : access CvHaarClassifierCascade;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      rejectLevels : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      levelWeightds : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      scale_factor : double;
      min_neighbors : int;
      flags : int;
      min_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      max_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      outputRejectLevels : Extensions.bool) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/objdetect/objdetect.hpp:276
   pragma Import (CPP, cvHaarDetectObjectsForROC, "_Z25cvHaarDetectObjectsForROCPKvP23CvHaarClassifierCascadeP12CvMemStorageRSt6vectorIiSaIiEERS5_IdSaIdEEdii6CvSizeSC_b");

   procedure groupRectangles
     (rectList : System.Address;
      groupThreshold : int;
      eps : double);  -- /usr/include/opencv2/objdetect/objdetect.hpp:289
   pragma Import (CPP, groupRectangles, "_ZN2cv15groupRectanglesERSt6vectorINS_5Rect_IiEESaIS2_EEid");

   procedure groupRectangles
     (rectList : System.Address;
      weights : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      groupThreshold : int;
      eps : double);  -- /usr/include/opencv2/objdetect/objdetect.hpp:290
   pragma Import (CPP, groupRectangles, "_ZN2cv15groupRectanglesERSt6vectorINS_5Rect_IiEESaIS2_EERS0_IiSaIiEEid");

   procedure groupRectangles
     (rectList : System.Address;
      groupThreshold : int;
      eps : double;
      weights : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      levelWeights : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/objdetect/objdetect.hpp:291
   pragma Import (CPP, groupRectangles, "_ZN2cv15groupRectanglesERSt6vectorINS_5Rect_IiEESaIS2_EEidPS0_IiSaIiEEPS0_IdSaIdEE");

   procedure groupRectangles
     (rectList : System.Address;
      rejectLevels : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      levelWeights : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      groupThreshold : int;
      eps : double);  -- /usr/include/opencv2/objdetect/objdetect.hpp:292
   pragma Import (CPP, groupRectangles, "_ZN2cv15groupRectanglesERSt6vectorINS_5Rect_IiEESaIS2_EERS0_IiSaIiEERS0_IdSaIdEEid");

   procedure groupRectangles_meanshift
     (rectList : System.Address;
      foundWeights : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      foundScales : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      detectThreshold : double;
      winDetSize : opencv2_core_core_hpp.Class_Size.Size);  -- /usr/include/opencv2/objdetect/objdetect.hpp:294
   pragma Import (CPP, groupRectangles_meanshift, "_ZN2cv25groupRectangles_meanshiftERSt6vectorINS_5Rect_IiEESaIS2_EERS0_IdSaIdEES8_dNS_5Size_IiEE");

   package Class_FeatureEvaluator is
      type FeatureEvaluator is tagged limited record
         null;
      end record;
      pragma Import (CPP, FeatureEvaluator);

      procedure Delete_FeatureEvaluator (this : access FeatureEvaluator);  -- /usr/include/opencv2/objdetect/objdetect.hpp:302
      pragma Import (CPP, Delete_FeatureEvaluator, "_ZN2cv16FeatureEvaluatorD1Ev");

      procedure deleting_dtor (this : access FeatureEvaluator);  -- /usr/include/opencv2/objdetect/objdetect.hpp:302
      pragma Import (CPP, deleting_dtor, "_ZN2cv16FeatureEvaluatorD0Ev");

      function read (this : access FeatureEvaluator; node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:304
      pragma Import (CPP, read, "_ZN2cv16FeatureEvaluator4readERKNS_8FileNodeE");

      function clone (this : access constant FeatureEvaluator) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/objdetect/objdetect.hpp:305
      pragma Import (CPP, clone, "_ZNK2cv16FeatureEvaluator5cloneEv");

      function getFeatureType (this : access constant FeatureEvaluator) return int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:306
      pragma Import (CPP, getFeatureType, "_ZNK2cv16FeatureEvaluator14getFeatureTypeEv");

      function setImage
        (this : access FeatureEvaluator;
         arg2 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         origWinSize : opencv2_core_core_hpp.Class_Size.Size) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:308
      pragma Import (CPP, setImage, "_ZN2cv16FeatureEvaluator8setImageERKNS_3MatENS_5Size_IiEE");

      function setWindow (this : access FeatureEvaluator; p : opencv2_core_core_hpp.Class_Point.Point) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:309
      pragma Import (CPP, setWindow, "_ZN2cv16FeatureEvaluator9setWindowENS_6Point_IiEE");

      function calcOrd (this : access constant FeatureEvaluator; featureIdx : int) return double;  -- /usr/include/opencv2/objdetect/objdetect.hpp:311
      pragma Import (CPP, calcOrd, "_ZNK2cv16FeatureEvaluator7calcOrdEi");

      function calcCat (this : access constant FeatureEvaluator; featureIdx : int) return int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:312
      pragma Import (CPP, calcCat, "_ZNK2cv16FeatureEvaluator7calcCatEi");

      function create (c_type : int) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/objdetect/objdetect.hpp:314
      pragma Import (CPP, create, "_ZN2cv16FeatureEvaluator6createEi");
   end;
   use Class_FeatureEvaluator;
   --  skipped empty struct CascadeClassifierInvoker

   type CascadeClassifier;
   type Data;
   type DTreeNode is record
      featureIdx : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:395
      threshold : aliased float;  -- /usr/include/opencv2/objdetect/objdetect.hpp:396
      left : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:397
      right : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:398
   end record;
   pragma Convention (C_Pass_By_Copy, DTreeNode);
   type DTree is record
      nodeCount : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:403
   end record;
   pragma Convention (C_Pass_By_Copy, DTree);
   type Stage is record
      first : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:408
      ntrees : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:409
      threshold : aliased float;  -- /usr/include/opencv2/objdetect/objdetect.hpp:410
   end record;
   pragma Convention (C_Pass_By_Copy, Stage);
   type Data is record
      isStumpBased : aliased Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:415
      stageType : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:417
      featureType : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:418
      ncategories : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:419
      origWinSize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/objdetect/objdetect.hpp:420
      stages : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:422
      classifiers : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:423
      nodes : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:424
      leaves : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:425
      subsets : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:426
   end record;
   pragma Convention (C_Pass_By_Copy, Data);
   package Class_CascadeClassifier is
      type CascadeClassifier is tagged limited record
         the_data : aliased Data;  -- /usr/include/opencv2/objdetect/objdetect.hpp:429
         featureEvaluator : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/objdetect/objdetect.hpp:430
         oldCascade : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/objdetect/objdetect.hpp:431
      end record;
      pragma Import (CPP, CascadeClassifier);

      function New_CascadeClassifier return CascadeClassifier;  -- /usr/include/opencv2/objdetect/objdetect.hpp:330
      pragma CPP_Constructor (New_CascadeClassifier, "_ZN2cv17CascadeClassifierC1Ev");

      function New_CascadeClassifier (filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return CascadeClassifier;  -- /usr/include/opencv2/objdetect/objdetect.hpp:331
      pragma CPP_Constructor (New_CascadeClassifier, "_ZN2cv17CascadeClassifierC1ERKSs");

      procedure Delete_CascadeClassifier (this : access CascadeClassifier);  -- /usr/include/opencv2/objdetect/objdetect.hpp:332
      pragma Import (CPP, Delete_CascadeClassifier, "_ZN2cv17CascadeClassifierD1Ev");

      procedure deleting_dtor (this : access CascadeClassifier);  -- /usr/include/opencv2/objdetect/objdetect.hpp:332
      pragma Import (CPP, deleting_dtor, "_ZN2cv17CascadeClassifierD0Ev");

      function empty (this : access constant CascadeClassifier) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:334
      pragma Import (CPP, empty, "_ZNK2cv17CascadeClassifier5emptyEv");

      function load (this : access CascadeClassifier'Class; filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:335
      pragma Import (CPP, load, "_ZN2cv17CascadeClassifier4loadERKSs");

      function read (this : access CascadeClassifier; node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:336
      pragma Import (CPP, read, "_ZN2cv17CascadeClassifier4readERKNS_8FileNodeE");

      procedure detectMultiScale
        (this : access CascadeClassifier;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         objects : System.Address;
         scaleFactor : double;
         minNeighbors : int;
         flags : int;
         minSize : opencv2_core_core_hpp.Class_Size.Size;
         maxSize : opencv2_core_core_hpp.Class_Size.Size);  -- /usr/include/opencv2/objdetect/objdetect.hpp:337
      pragma Import (CPP, detectMultiScale, "_ZN2cv17CascadeClassifier16detectMultiScaleERKNS_3MatERSt6vectorINS_5Rect_IiEESaIS6_EEdiiNS_5Size_IiEESB_");

      procedure detectMultiScale
        (this : access CascadeClassifier;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         objects : System.Address;
         rejectLevels : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         levelWeights : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         scaleFactor : double;
         minNeighbors : int;
         flags : int;
         minSize : opencv2_core_core_hpp.Class_Size.Size;
         maxSize : opencv2_core_core_hpp.Class_Size.Size;
         outputRejectLevels : Extensions.bool);  -- /usr/include/opencv2/objdetect/objdetect.hpp:344
      pragma Import (CPP, detectMultiScale, "_ZN2cv17CascadeClassifier16detectMultiScaleERKNS_3MatERSt6vectorINS_5Rect_IiEESaIS6_EERS4_IiSaIiEERS4_IdSaIdEEdiiNS_5Size_IiEESH_b");

      function isOldFormatCascade (this : access constant CascadeClassifier'Class) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:355
      pragma Import (CPP, isOldFormatCascade, "_ZNK2cv17CascadeClassifier18isOldFormatCascadeEv");

      function getOriginalWindowSize (this : access constant CascadeClassifier) return opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/objdetect/objdetect.hpp:356
      pragma Import (CPP, getOriginalWindowSize, "_ZNK2cv17CascadeClassifier21getOriginalWindowSizeEv");

      function getFeatureType (this : access constant CascadeClassifier'Class) return int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:357
      pragma Import (CPP, getFeatureType, "_ZNK2cv17CascadeClassifier14getFeatureTypeEv");

      function setImage (this : access CascadeClassifier'Class; arg2 : access constant opencv2_core_core_hpp.Class_Mat.Mat) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:358
      pragma Import (CPP, setImage, "_ZN2cv17CascadeClassifier8setImageERKNS_3MatE");

      function detectSingleScale
        (this : access CascadeClassifier;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         stripCount : int;
         processingRectSize : opencv2_core_core_hpp.Class_Size.Size;
         stripSize : int;
         yStep : int;
         factor : double;
         candidates : System.Address;
         rejectLevels : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         levelWeights : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         outputRejectLevels : Extensions.bool) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:364
      pragma Import (CPP, detectSingleScale, "_ZN2cv17CascadeClassifier17detectSingleScaleERKNS_3MatEiNS_5Size_IiEEiidRSt6vectorINS_5Rect_IiEESaIS8_EERS6_IiSaIiEERS6_IdSaIdEEb");

      function setImage
        (this : access CascadeClassifier'Class;
         arg2 : access opencv2_core_core_hpp.Class_Ptr.Ptr;
         arg3 : access constant opencv2_core_core_hpp.Class_Mat.Mat) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:387
      pragma Import (CPP, setImage, "_ZN2cv17CascadeClassifier8setImageERNS_3PtrINS_16FeatureEvaluatorEEERKNS_3MatE");

      function runAt
        (this : access CascadeClassifier;
         arg2 : access opencv2_core_core_hpp.Class_Ptr.Ptr;
         arg3 : opencv2_core_core_hpp.Class_Point.Point;
         weight : access double) return int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:388
      pragma Import (CPP, runAt, "_ZN2cv17CascadeClassifier5runAtERNS_3PtrINS_16FeatureEvaluatorEEENS_6Point_IiEERd");
   end;
   use Class_CascadeClassifier;
   package Class_HOGDescriptor is
      type HOGDescriptor is tagged limited record
         winSize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/objdetect/objdetect.hpp:517
         blockSize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/objdetect/objdetect.hpp:518
         blockStride : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/objdetect/objdetect.hpp:519
         cellSize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/objdetect/objdetect.hpp:520
         nbins : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:521
         derivAperture : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:522
         winSigma : aliased double;  -- /usr/include/opencv2/objdetect/objdetect.hpp:523
         histogramNormType : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:524
         L2HysThreshold : aliased double;  -- /usr/include/opencv2/objdetect/objdetect.hpp:525
         gammaCorrection : aliased Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:526
         svmDetector : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:527
         nlevels : aliased int;  -- /usr/include/opencv2/objdetect/objdetect.hpp:528
      end record;
      pragma Import (CPP, HOGDescriptor);

      function New_HOGDescriptor return HOGDescriptor;  -- /usr/include/opencv2/objdetect/objdetect.hpp:443
      pragma CPP_Constructor (New_HOGDescriptor, "_ZN2cv13HOGDescriptorC1Ev");

      function New_HOGDescriptor
        (u_winSize : access opencv2_core_core_hpp.Class_Size.Size;
         u_blockSize : access opencv2_core_core_hpp.Class_Size.Size;
         u_blockStride : access opencv2_core_core_hpp.Class_Size.Size;
         u_cellSize : access opencv2_core_core_hpp.Class_Size.Size;
         u_nbins : int;
         u_derivAperture : int;
         u_winSigma : double;
         u_histogramNormType : int;
         u_L2HysThreshold : double;
         u_gammaCorrection : Extensions.bool;
         u_nlevels : int) return HOGDescriptor;  -- /usr/include/opencv2/objdetect/objdetect.hpp:449
      pragma CPP_Constructor (New_HOGDescriptor, "_ZN2cv13HOGDescriptorC1ENS_5Size_IiEES2_S2_S2_iididbi");

      function New_HOGDescriptor (filename : access constant opencv2_core_core_hpp.Class_String.String) return HOGDescriptor;  -- /usr/include/opencv2/objdetect/objdetect.hpp:460
      pragma CPP_Constructor (New_HOGDescriptor, "_ZN2cv13HOGDescriptorC1ERKSs");

      procedure Delete_HOGDescriptor (this : access HOGDescriptor);  -- /usr/include/opencv2/objdetect/objdetect.hpp:470
      pragma Import (CPP, Delete_HOGDescriptor, "_ZN2cv13HOGDescriptorD1Ev");

      procedure deleting_dtor (this : access HOGDescriptor);  -- /usr/include/opencv2/objdetect/objdetect.hpp:470
      pragma Import (CPP, deleting_dtor, "_ZN2cv13HOGDescriptorD0Ev");

      function getDescriptorSize (this : access constant HOGDescriptor'Class) return stddef_h.size_t;  -- /usr/include/opencv2/objdetect/objdetect.hpp:472
      pragma Import (CPP, getDescriptorSize, "_ZNK2cv13HOGDescriptor17getDescriptorSizeEv");

      function checkDetectorSize (this : access constant HOGDescriptor'Class) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:473
      pragma Import (CPP, checkDetectorSize, "_ZNK2cv13HOGDescriptor17checkDetectorSizeEv");

      function getWinSigma (this : access constant HOGDescriptor'Class) return double;  -- /usr/include/opencv2/objdetect/objdetect.hpp:474
      pragma Import (CPP, getWinSigma, "_ZNK2cv13HOGDescriptor11getWinSigmaEv");

      procedure setSVMDetector (this : access HOGDescriptor; u_svmdetector : opencv2_core_core_hpp.InputArray'Class);  -- /usr/include/opencv2/objdetect/objdetect.hpp:476
      pragma Import (CPP, setSVMDetector, "_ZN2cv13HOGDescriptor14setSVMDetectorERKNS_11_InputArrayE");

      function read (this : access HOGDescriptor; fn : access opencv2_core_core_hpp.Class_FileNode.FileNode) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:478
      pragma Import (CPP, read, "_ZN2cv13HOGDescriptor4readERNS_8FileNodeE");

      procedure write
        (this : access constant HOGDescriptor;
         fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
         objname : access constant opencv2_core_core_hpp.Class_String.String);  -- /usr/include/opencv2/objdetect/objdetect.hpp:479
      pragma Import (CPP, write, "_ZNK2cv13HOGDescriptor5writeERNS_11FileStorageERKSs");

      function load
        (this : access HOGDescriptor;
         filename : access constant opencv2_core_core_hpp.Class_String.String;
         objname : access constant opencv2_core_core_hpp.Class_String.String) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:481
      pragma Import (CPP, load, "_ZN2cv13HOGDescriptor4loadERKSsS2_");

      procedure save
        (this : access constant HOGDescriptor;
         filename : access constant opencv2_core_core_hpp.Class_String.String;
         objname : access constant opencv2_core_core_hpp.Class_String.String);  -- /usr/include/opencv2/objdetect/objdetect.hpp:482
      pragma Import (CPP, save, "_ZNK2cv13HOGDescriptor4saveERKSsS2_");

      procedure copyTo (this : access constant HOGDescriptor; c : access HOGDescriptor'Class);  -- /usr/include/opencv2/objdetect/objdetect.hpp:483
      pragma Import (CPP, copyTo, "_ZNK2cv13HOGDescriptor6copyToERS0_");

      procedure compute
        (this : access constant HOGDescriptor;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         descriptors : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         winStride : opencv2_core_core_hpp.Class_Size.Size;
         padding : opencv2_core_core_hpp.Class_Size.Size;
         locations : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/objdetect/objdetect.hpp:485
      pragma Import (CPP, compute, "_ZNK2cv13HOGDescriptor7computeERKNS_3MatERSt6vectorIfSaIfEENS_5Size_IiEES9_RKS4_INS_6Point_IiEESaISB_EE");

      procedure detect
        (this : access constant HOGDescriptor;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         foundLocations : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         weights : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         hitThreshold : double;
         winStride : opencv2_core_core_hpp.Class_Size.Size;
         padding : opencv2_core_core_hpp.Class_Size.Size;
         searchLocations : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/objdetect/objdetect.hpp:490
      pragma Import (CPP, detect, "_ZNK2cv13HOGDescriptor6detectERKNS_3MatERSt6vectorINS_6Point_IiEESaIS6_EERS4_IdSaIdEEdNS_5Size_IiEESE_RKS8_");

      procedure detect
        (this : access constant HOGDescriptor;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         foundLocations : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         hitThreshold : double;
         winStride : opencv2_core_core_hpp.Class_Size.Size;
         padding : opencv2_core_core_hpp.Class_Size.Size;
         searchLocations : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/objdetect/objdetect.hpp:496
      pragma Import (CPP, detect, "_ZNK2cv13HOGDescriptor6detectERKNS_3MatERSt6vectorINS_6Point_IiEESaIS6_EEdNS_5Size_IiEESB_RKS8_");

      procedure detectMultiScale
        (this : access constant HOGDescriptor;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         foundLocations : System.Address;
         foundWeights : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         hitThreshold : double;
         winStride : opencv2_core_core_hpp.Class_Size.Size;
         padding : opencv2_core_core_hpp.Class_Size.Size;
         scale : double;
         finalThreshold : double;
         useMeanshiftGrouping : Extensions.bool);  -- /usr/include/opencv2/objdetect/objdetect.hpp:501
      pragma Import (CPP, detectMultiScale, "_ZNK2cv13HOGDescriptor16detectMultiScaleERKNS_3MatERSt6vectorINS_5Rect_IiEESaIS6_EERS4_IdSaIdEEdNS_5Size_IiEESE_ddb");

      procedure detectMultiScale
        (this : access constant HOGDescriptor;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         foundLocations : System.Address;
         hitThreshold : double;
         winStride : opencv2_core_core_hpp.Class_Size.Size;
         padding : opencv2_core_core_hpp.Class_Size.Size;
         scale : double;
         finalThreshold : double;
         useMeanshiftGrouping : Extensions.bool);  -- /usr/include/opencv2/objdetect/objdetect.hpp:506
      pragma Import (CPP, detectMultiScale, "_ZNK2cv13HOGDescriptor16detectMultiScaleERKNS_3MatERSt6vectorINS_5Rect_IiEESaIS6_EEdNS_5Size_IiEESB_ddb");

      procedure computeGradient
        (this : access constant HOGDescriptor;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         grad : access opencv2_core_core_hpp.Class_Mat.Mat;
         angleOfs : access opencv2_core_core_hpp.Class_Mat.Mat;
         paddingTL : opencv2_core_core_hpp.Class_Size.Size;
         paddingBR : opencv2_core_core_hpp.Class_Size.Size);  -- /usr/include/opencv2/objdetect/objdetect.hpp:511
      pragma Import (CPP, computeGradient, "_ZNK2cv13HOGDescriptor15computeGradientERKNS_3MatERS1_S4_NS_5Size_IiEES6_");

      function getDefaultPeopleDetector return cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:514
      pragma Import (CPP, getDefaultPeopleDetector, "_ZN2cv13HOGDescriptor24getDefaultPeopleDetectorEv");

      function getDaimlerPeopleDetector return cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:515
      pragma Import (CPP, getDaimlerPeopleDetector, "_ZN2cv13HOGDescriptor24getDaimlerPeopleDetectorEv");
   end;
   use Class_HOGDescriptor;
   package Class_PlanarObjectDetector is
      type PlanarObjectDetector is tagged limited record
         verbose : aliased Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:576
         modelROI : aliased opencv2_core_core_hpp.Class_Rect.Rect;  -- /usr/include/opencv2/objdetect/objdetect.hpp:577
         modelPoints : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:578
         the_ldetector : aliased opencv2_features2d_features2d_hpp.Class_LDetector.LDetector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:579
         the_fernClassifier : aliased opencv2_features2d_features2d_hpp.Class_FernClassifier.FernClassifier;  -- /usr/include/opencv2/objdetect/objdetect.hpp:580
      end record;
      pragma Import (CPP, PlanarObjectDetector);

      function New_PlanarObjectDetector return PlanarObjectDetector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:538
      pragma CPP_Constructor (New_PlanarObjectDetector, "_ZN2cv20PlanarObjectDetectorC1Ev");

      function New_PlanarObjectDetector (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode) return PlanarObjectDetector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:539
      pragma CPP_Constructor (New_PlanarObjectDetector, "_ZN2cv20PlanarObjectDetectorC1ERKNS_8FileNodeE");

      function New_PlanarObjectDetector
        (pyr : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         u_npoints : int;
         u_patchSize : int;
         u_nstructs : int;
         u_structSize : int;
         u_nviews : int;
         detector : access constant opencv2_features2d_features2d_hpp.Class_LDetector.LDetector;
         patchGenerator : access constant opencv2_features2d_features2d_hpp.Class_PatchGenerator.PatchGenerator) return PlanarObjectDetector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:540
      pragma CPP_Constructor (New_PlanarObjectDetector, "_ZN2cv20PlanarObjectDetectorC1ERKSt6vectorINS_3MatESaIS2_EEiiiiiRKNS_9LDetectorERKNS_14PatchGeneratorE");

      procedure Delete_PlanarObjectDetector (this : access PlanarObjectDetector);  -- /usr/include/opencv2/objdetect/objdetect.hpp:547
      pragma Import (CPP, Delete_PlanarObjectDetector, "_ZN2cv20PlanarObjectDetectorD1Ev");

      procedure deleting_dtor (this : access PlanarObjectDetector);  -- /usr/include/opencv2/objdetect/objdetect.hpp:547
      pragma Import (CPP, deleting_dtor, "_ZN2cv20PlanarObjectDetectorD0Ev");

      procedure train
        (this : access PlanarObjectDetector;
         pyr : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         u_npoints : int;
         u_patchSize : int;
         u_nstructs : int;
         u_structSize : int;
         u_nviews : int;
         detector : access constant opencv2_features2d_features2d_hpp.Class_LDetector.LDetector;
         patchGenerator : access constant opencv2_features2d_features2d_hpp.Class_PatchGenerator.PatchGenerator);  -- /usr/include/opencv2/objdetect/objdetect.hpp:548
      pragma Import (CPP, train, "_ZN2cv20PlanarObjectDetector5trainERKSt6vectorINS_3MatESaIS2_EEiiiiiRKNS_9LDetectorERKNS_14PatchGeneratorE");

      procedure train
        (this : access PlanarObjectDetector;
         pyr : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         keypoints : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         u_patchSize : int;
         u_nstructs : int;
         u_structSize : int;
         u_nviews : int;
         detector : access constant opencv2_features2d_features2d_hpp.Class_LDetector.LDetector;
         patchGenerator : access constant opencv2_features2d_features2d_hpp.Class_PatchGenerator.PatchGenerator);  -- /usr/include/opencv2/objdetect/objdetect.hpp:555
      pragma Import (CPP, train, "_ZN2cv20PlanarObjectDetector5trainERKSt6vectorINS_3MatESaIS2_EERKS1_INS_8KeyPointESaIS7_EEiiiiRKNS_9LDetectorERKNS_14PatchGeneratorE");

      function getModelROI (this : access constant PlanarObjectDetector'Class) return opencv2_core_core_hpp.Class_Rect.Rect;  -- /usr/include/opencv2/objdetect/objdetect.hpp:562
      pragma Import (CPP, getModelROI, "_ZNK2cv20PlanarObjectDetector11getModelROIEv");

      function getModelPoints (this : access constant PlanarObjectDetector'Class) return cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:563
      pragma Import (CPP, getModelPoints, "_ZNK2cv20PlanarObjectDetector14getModelPointsEv");

      function getDetector (this : access constant PlanarObjectDetector'Class) return access constant opencv2_features2d_features2d_hpp.Class_LDetector.LDetector;  -- /usr/include/opencv2/objdetect/objdetect.hpp:564
      pragma Import (CPP, getDetector, "_ZNK2cv20PlanarObjectDetector11getDetectorEv");

      function getClassifier (this : access constant PlanarObjectDetector'Class) return access constant opencv2_features2d_features2d_hpp.Class_FernClassifier.FernClassifier;  -- /usr/include/opencv2/objdetect/objdetect.hpp:565
      pragma Import (CPP, getClassifier, "_ZNK2cv20PlanarObjectDetector13getClassifierEv");

      procedure setVerbose (this : access PlanarObjectDetector'Class; verbose : Extensions.bool);  -- /usr/include/opencv2/objdetect/objdetect.hpp:566
      pragma Import (CPP, setVerbose, "_ZN2cv20PlanarObjectDetector10setVerboseEb");

      procedure read (this : access PlanarObjectDetector'Class; node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/objdetect/objdetect.hpp:568
      pragma Import (CPP, read, "_ZN2cv20PlanarObjectDetector4readERKNS_8FileNodeE");

      procedure write
        (this : access constant PlanarObjectDetector'Class;
         fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
         name : access constant opencv2_core_core_hpp.Class_String.String);  -- /usr/include/opencv2/objdetect/objdetect.hpp:569
      pragma Import (CPP, write, "_ZNK2cv20PlanarObjectDetector5writeERNS_11FileStorageERKSs");

      function operator_op
        (this : access constant PlanarObjectDetector'Class;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         H : access opencv2_core_core_hpp.Class_Mat.Mat;
         corners : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:570
      pragma Import (CPP, operator_op, "_ZNK2cv20PlanarObjectDetectorclERKNS_3MatERS1_RSt6vectorINS_6Point_IfEESaIS7_EE");

      function operator_op
        (this : access constant PlanarObjectDetector'Class;
         pyr : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         keypoints : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         H : access opencv2_core_core_hpp.Class_Mat.Mat;
         corners : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         pairs : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return Extensions.bool;  -- /usr/include/opencv2/objdetect/objdetect.hpp:571
      pragma Import (CPP, operator_op, "_ZNK2cv20PlanarObjectDetectorclERKSt6vectorINS_3MatESaIS2_EERKS1_INS_8KeyPointESaIS7_EERS2_RS1_INS_6Point_IfEESaISE_EEPS1_IiSaIiEE");
   end;
   use Class_PlanarObjectDetector;
   subtype DataMatrixCode_msg_array is Interfaces.C.char_array (0 .. 3);
   type DataMatrixCode_corners_array is array (0 .. 3) of aliased opencv2_core_core_hpp.Class_Point.Point;
   type DataMatrixCode is record
      msg : aliased DataMatrixCode_msg_array;  -- /usr/include/opencv2/objdetect/objdetect.hpp:584
      original : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/objdetect/objdetect.hpp:585
      corners : aliased DataMatrixCode_corners_array;  -- /usr/include/opencv2/objdetect/objdetect.hpp:586
   end record;
   pragma Convention (C_Pass_By_Copy, DataMatrixCode);  -- /usr/include/opencv2/objdetect/objdetect.hpp:583

   procedure findDataMatrix (image : access constant opencv2_core_core_hpp.Class_Mat.Mat; codes : System.Address);  -- /usr/include/opencv2/objdetect/objdetect.hpp:589
   pragma Import (CPP, findDataMatrix, "_ZN2cv14findDataMatrixERKNS_3MatERSt6vectorINS_14DataMatrixCodeESaIS4_EE");

   procedure drawDataMatrixCodes (codes : System.Address; drawImage : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/objdetect/objdetect.hpp:590
   pragma Import (CPP, drawDataMatrixCodes, "_ZN2cv19drawDataMatrixCodesERKSt6vectorINS_14DataMatrixCodeESaIS1_EERNS_3MatE");

   subtype CvDataMatrixCode_msg_array is Interfaces.C.char_array (0 .. 3);
   type CvDataMatrixCode is record
      msg : aliased CvDataMatrixCode_msg_array;  -- /usr/include/opencv2/objdetect/objdetect.hpp:598
      original : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/objdetect/objdetect.hpp:599
      corners : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/objdetect/objdetect.hpp:600
   end record;
   pragma Convention (C_Pass_By_Copy, CvDataMatrixCode);  -- /usr/include/opencv2/objdetect/objdetect.hpp:597

   function cvFindDataMatrix (im : access opencv2_core_types_c_h.CvMat) return cpp_4_7_4_bits_stl_deque_h.deque;  -- /usr/include/opencv2/objdetect/objdetect.hpp:604
   pragma Import (CPP, cvFindDataMatrix, "_Z16cvFindDataMatrixP5CvMat");

end opencv2_objdetect_objdetect_hpp;
