pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_types_c_h;
with System;
with opencv2_core_core_hpp;
with stddef_h;
with cpp_4_7_4_bits_stl_vector_h;
with cpp_4_7_4_bits_stringfwd_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
limited with cpp_4_7_4_iosfwd;
limited with opencv2_flann_miniflann_hpp;

package opencv2_features2d_features2d_hpp is

   package Class_CvSURFPoint is
      type CvSURFPoint is limited record
         pt : aliased opencv2_core_types_c_h.CvPoint2D32f;  -- /usr/include/opencv2/features2d/features2d.hpp:57
         laplacian : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:59
         size : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:60
         dir : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:61
         hessian : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:62
      end record;
      pragma Import (CPP, CvSURFPoint);

      function New_CvSURFPoint return CvSURFPoint;  -- /usr/include/opencv2/features2d/features2d.hpp:55
      pragma CPP_Constructor (New_CvSURFPoint, "_ZN11CvSURFPointC1Ev");


   end;
   use Class_CvSURFPoint;
   function cvSURFPoint
     (pt : opencv2_core_types_c_h.CvPoint2D32f;
      laplacian : int;
      size : int;
      dir : float;
      hessian : float) return CvSURFPoint;  -- /usr/include/opencv2/features2d/features2d.hpp:66
   pragma Import (C, cvSURFPoint, "cvSURFPoint");

   type CvSURFParams is record
      extended : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:83
      upright : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:84
      hessianThreshold : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:85
      nOctaves : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:87
      nOctaveLayers : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:88
   end record;
   pragma Convention (C_Pass_By_Copy, CvSURFParams);  -- /usr/include/opencv2/features2d/features2d.hpp:81

   function cvSURFParams (hessianThreshold : double; extended : int) return CvSURFParams;  -- /usr/include/opencv2/features2d/features2d.hpp:92
   pragma Import (C, cvSURFParams, "cvSURFParams");

   procedure cvExtractSURF
     (img : System.Address;
      mask : System.Address;
      keypoints : System.Address;
      descriptors : System.Address;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      params : CvSURFParams;
      useProvidedKeyPts : int);  -- /usr/include/opencv2/features2d/features2d.hpp:96
   pragma Import (C, cvExtractSURF, "cvExtractSURF");

   type CvMSERParams is record
      c_delta : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:106
      maxArea : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:108
      minArea : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:110
      maxVariation : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:112
      minDiversity : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:114
      maxEvolution : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:119
      areaThreshold : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:121
      minMargin : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:123
      edgeBlurSize : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:125
   end record;
   pragma Convention (C_Pass_By_Copy, CvMSERParams);  -- /usr/include/opencv2/features2d/features2d.hpp:103

   function cvMSERParams
     (c_delta : int;
      min_area : int;
      max_area : int;
      max_variation : float;
      min_diversity : float;
      max_evolution : int;
      area_threshold : double;
      min_margin : double;
      edge_blur_size : int) return CvMSERParams;  -- /usr/include/opencv2/features2d/features2d.hpp:128
   pragma Import (C, cvMSERParams, "cvMSERParams");

   procedure cvExtractMSER
     (u_img : System.Address;
      u_mask : System.Address;
      contours : System.Address;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      params : CvMSERParams);  -- /usr/include/opencv2/features2d/features2d.hpp:136
   pragma Import (C, cvExtractMSER, "cvExtractMSER");

   package Class_CvStarKeypoint is
      type CvStarKeypoint is limited record
         pt : aliased opencv2_core_types_c_h.CvPoint;  -- /usr/include/opencv2/features2d/features2d.hpp:141
         size : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:142
         response : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:143
      end record;
      pragma Import (CPP, CvStarKeypoint);

      function New_CvStarKeypoint return CvStarKeypoint;  -- /usr/include/opencv2/features2d/features2d.hpp:139
      pragma CPP_Constructor (New_CvStarKeypoint, "_ZN14CvStarKeypointC1Ev");


   end;
   use Class_CvStarKeypoint;
   function cvStarKeypoint
     (pt : opencv2_core_types_c_h.CvPoint;
      size : int;
      response : float) return CvStarKeypoint;  -- /usr/include/opencv2/features2d/features2d.hpp:146
   pragma Import (C, cvStarKeypoint, "cvStarKeypoint");

   package Class_CvStarDetectorParams is
      type CvStarDetectorParams is limited record
         maxSize : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:157
         responseThreshold : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:158
         lineThresholdProjected : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:159
         lineThresholdBinarized : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:160
         suppressNonmaxSize : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:161
      end record;
      pragma Import (CPP, CvStarDetectorParams);

      procedure Delete_CvStarDetectorParams (this : access CvStarDetectorParams);  -- /usr/include/opencv2/features2d/features2d.hpp:155
      pragma Import (CPP, Delete_CvStarDetectorParams, "_ZN20CvStarDetectorParamsD1Ev");

      function New_CvStarDetectorParams return CvStarDetectorParams;  -- /usr/include/opencv2/features2d/features2d.hpp:155
      pragma CPP_Constructor (New_CvStarDetectorParams, "_ZN20CvStarDetectorParamsC1Ev");


   end;
   use Class_CvStarDetectorParams;
   function cvStarDetectorParams
     (maxSize : int;
      responseThreshold : int;
      lineThresholdProjected : int;
      lineThresholdBinarized : int;
      suppressNonmaxSize : int) return CvStarDetectorParams;  -- /usr/include/opencv2/features2d/features2d.hpp:164
   pragma Import (C, cvStarDetectorParams, "cvStarDetectorParams");

   function cvGetStarKeypoints
     (img : System.Address;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      params : CvStarDetectorParams) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/features2d/features2d.hpp:181
   pragma Import (C, cvGetStarKeypoints, "cvGetStarKeypoints");

   package Class_DefaultRngAuto is
      type DefaultRngAuto is limited record
         old_state : aliased opencv2_core_types_c_h.uint64;  -- /usr/include/opencv2/features2d/features2d.hpp:191
      end record;
      pragma Import (CPP, DefaultRngAuto);

      function New_DefaultRngAuto return DefaultRngAuto;  -- /usr/include/opencv2/features2d/features2d.hpp:193
      pragma CPP_Constructor (New_DefaultRngAuto, "_ZN2cv14DefaultRngAutoC1Ev");

      procedure Delete_DefaultRngAuto (this : access DefaultRngAuto);  -- /usr/include/opencv2/features2d/features2d.hpp:194
      pragma Import (CPP, Delete_DefaultRngAuto, "_ZN2cv14DefaultRngAutoD1Ev");

      function operator_as (this : access DefaultRngAuto; arg2 : System.Address) return access DefaultRngAuto;  -- /usr/include/opencv2/features2d/features2d.hpp:196
      pragma Import (CPP, operator_as, "_ZN2cv14DefaultRngAutoaSERKS0_");
   end;
   use Class_DefaultRngAuto;
   type CvAffinePose is record
      phi : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:207
      theta : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:208
      lambda1 : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:209
      lambda2 : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:210
   end record;
   pragma Convention (C_Pass_By_Copy, CvAffinePose);  -- /usr/include/opencv2/features2d/features2d.hpp:204

   package Class_KeyPoint is
      type KeyPoint is limited record
         pt : aliased opencv2_core_core_hpp.Class_Point2f.Point2f;  -- /usr/include/opencv2/features2d/features2d.hpp:257
         size : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:258
         angle : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:259
         response : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:260
         octave : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:261
         class_id : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:262
      end record;
      pragma Import (CPP, KeyPoint);

      function New_KeyPoint return KeyPoint;  -- /usr/include/opencv2/features2d/features2d.hpp:229
      pragma CPP_Constructor (New_KeyPoint, "_ZN2cv8KeyPointC1Ev");

      function New_KeyPoint
        (u_pt : access opencv2_core_core_hpp.Class_Point2f.Point2f;
         u_size : float;
         u_angle : float;
         u_response : float;
         u_octave : int;
         u_class_id : int) return KeyPoint;  -- /usr/include/opencv2/features2d/features2d.hpp:231
      pragma CPP_Constructor (New_KeyPoint, "_ZN2cv8KeyPointC1ENS_6Point_IfEEfffii");

      function New_KeyPoint
        (x : float;
         y : float;
         u_size : float;
         u_angle : float;
         u_response : float;
         u_octave : int;
         u_class_id : int) return KeyPoint;  -- /usr/include/opencv2/features2d/features2d.hpp:236
      pragma CPP_Constructor (New_KeyPoint, "_ZN2cv8KeyPointC1Efffffii");

      function hash (this : access constant KeyPoint) return stddef_h.size_t;  -- /usr/include/opencv2/features2d/features2d.hpp:241
      pragma Import (CPP, hash, "_ZNK2cv8KeyPoint4hashEv");

      procedure convert
        (keypoints : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         points2f : System.Address;
         keypointIndexes : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:244
      pragma Import (CPP, convert, "_ZN2cv8KeyPoint7convertERKSt6vectorIS0_SaIS0_EERS1_INS_6Point_IfEESaIS7_EERKS1_IiSaIiEE");

      procedure convert
        (points2f : System.Address;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         size : float;
         response : float;
         octave : int;
         class_id : int);  -- /usr/include/opencv2/features2d/features2d.hpp:248
      pragma Import (CPP, convert, "_ZN2cv8KeyPoint7convertERKSt6vectorINS_6Point_IfEESaIS3_EERS1_IS0_SaIS0_EEffii");

      function overlap (kp1 : System.Address; kp2 : System.Address) return float;  -- /usr/include/opencv2/features2d/features2d.hpp:255
      pragma Import (CPP, overlap, "_ZN2cv8KeyPoint7overlapERKS0_S2_");
   end;
   use Class_KeyPoint;
   procedure write
     (fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
      name : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
      keypoints : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:266
   pragma Import (CPP, write, "_ZN2cv5writeERNS_11FileStorageERKSsRKSt6vectorINS_8KeyPointESaIS5_EE");

   procedure read (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode; keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:268
   pragma Import (CPP, read, "_ZN2cv4readERKNS_8FileNodeERSt6vectorINS_8KeyPointESaIS4_EE");

   package Class_KeyPointsFilter is
      type KeyPointsFilter is limited record
         null;
      end record;
      pragma Import (CPP, KeyPointsFilter);

      function New_KeyPointsFilter return KeyPointsFilter;  -- /usr/include/opencv2/features2d/features2d.hpp:278
      pragma CPP_Constructor (New_KeyPointsFilter, "_ZN2cv15KeyPointsFilterC1Ev");

      procedure runByImageBorder
        (keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         imageSize : opencv2_core_core_hpp.Class_Size.Size;
         borderSize : int);  -- /usr/include/opencv2/features2d/features2d.hpp:283
      pragma Import (CPP, runByImageBorder, "_ZN2cv15KeyPointsFilter16runByImageBorderERSt6vectorINS_8KeyPointESaIS2_EENS_5Size_IiEEi");

      procedure runByKeypointSize
        (keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         minSize : float;
         maxSize : float);  -- /usr/include/opencv2/features2d/features2d.hpp:287
      pragma Import (CPP, runByKeypointSize, "_ZN2cv15KeyPointsFilter17runByKeypointSizeERSt6vectorINS_8KeyPointESaIS2_EEff");

      procedure runByPixelsMask (keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector; mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:291
      pragma Import (CPP, runByPixelsMask, "_ZN2cv15KeyPointsFilter15runByPixelsMaskERSt6vectorINS_8KeyPointESaIS2_EERKNS_3MatE");

      procedure removeDuplicated (keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:295
      pragma Import (CPP, removeDuplicated, "_ZN2cv15KeyPointsFilter16removeDuplicatedERSt6vectorINS_8KeyPointESaIS2_EE");
   end;
   use Class_KeyPointsFilter;
   type SIFT;
   type CommonParams is record
      nOctaves : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:317
      nOctaveLayers : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:317
      firstOctave : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:318
      angleMode : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:319
   end record;
   pragma Convention (C_Pass_By_Copy, CommonParams);
   type DetectorParams is record
      threshold : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:329
      edgeThreshold : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:329
   end record;
   pragma Convention (C_Pass_By_Copy, DetectorParams);
   type DescriptorParams is record
      magnification : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:341
      isNormalize : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:342
      recalculateAngles : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:343
   end record;
   pragma Convention (C_Pass_By_Copy, DescriptorParams);
   package Class_SIFT is
      type SIFT is limited record
         commParams : aliased CommonParams;  -- /usr/include/opencv2/features2d/features2d.hpp:381
         the_detectorParams : aliased DetectorParams;  -- /usr/include/opencv2/features2d/features2d.hpp:382
         the_descriptorParams : aliased DescriptorParams;  -- /usr/include/opencv2/features2d/features2d.hpp:383
      end record;
      pragma Import (CPP, SIFT);

      procedure Delete_SIFT (this : access SIFT);  -- /usr/include/opencv2/features2d/features2d.hpp:304
      pragma Import (CPP, Delete_SIFT, "_ZN2cv4SIFTD1Ev");

      function New_SIFT return SIFT;  -- /usr/include/opencv2/features2d/features2d.hpp:346
      pragma CPP_Constructor (New_SIFT, "_ZN2cv4SIFTC1Ev");

      function New_SIFT
        (u_threshold : double;
         u_edgeThreshold : double;
         u_nOctaves : int;
         u_nOctaveLayers : int;
         u_firstOctave : int;
         u_angleMode : int) return SIFT;  -- /usr/include/opencv2/features2d/features2d.hpp:348
      pragma CPP_Constructor (New_SIFT, "_ZN2cv4SIFTC1Eddiiii");

      function New_SIFT
        (u_magnification : double;
         u_isNormalize : Extensions.bool;
         u_recalculateAngles : Extensions.bool;
         u_nOctaves : int;
         u_nOctaveLayers : int;
         u_firstOctave : int;
         u_angleMode : int) return SIFT;  -- /usr/include/opencv2/features2d/features2d.hpp:354
      pragma CPP_Constructor (New_SIFT, "_ZN2cv4SIFTC1Edbbiiii");

      function New_SIFT
        (u_commParams : access constant CommonParams;
         u_detectorParams : access constant DetectorParams;
         u_descriptorParams : access constant DescriptorParams) return SIFT;  -- /usr/include/opencv2/features2d/features2d.hpp:360
      pragma CPP_Constructor (New_SIFT, "_ZN2cv4SIFTC1ERKNS0_12CommonParamsERKNS0_14DetectorParamsERKNS0_16DescriptorParamsE");

      function descriptorSize (this : access constant SIFT) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:365
      pragma Import (CPP, descriptorSize, "_ZNK2cv4SIFT14descriptorSizeEv");

      procedure operator_op
        (this : access constant SIFT;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:367
      pragma Import (CPP, operator_op, "_ZNK2cv4SIFTclERKNS_3MatES3_RSt6vectorINS_8KeyPointESaIS5_EE");

      procedure operator_op
        (this : access constant SIFT;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat;
         useProvidedKeypoints : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:371
      pragma Import (CPP, operator_op, "_ZNK2cv4SIFTclERKNS_3MatES3_RSt6vectorINS_8KeyPointESaIS5_EERS1_b");

      function getCommonParams (this : access constant SIFT) return CommonParams;  -- /usr/include/opencv2/features2d/features2d.hpp:376
      pragma Import (CPP, getCommonParams, "_ZNK2cv4SIFT15getCommonParamsEv");

      function getDetectorParams (this : access constant SIFT) return DetectorParams;  -- /usr/include/opencv2/features2d/features2d.hpp:377
      pragma Import (CPP, getDetectorParams, "_ZNK2cv4SIFT17getDetectorParamsEv");

      function getDescriptorParams (this : access constant SIFT) return DescriptorParams;  -- /usr/include/opencv2/features2d/features2d.hpp:378
      pragma Import (CPP, getDescriptorParams, "_ZNK2cv4SIFT19getDescriptorParamsEv");
   end;
   use Class_SIFT;
   package Class_SURF is
      type SURF is limited record
         parent : aliased CvSURFParams;
      end record;
      pragma Import (CPP, SURF);

      procedure Delete_SURF (this : access SURF);  -- /usr/include/opencv2/features2d/features2d.hpp:392
      pragma Import (CPP, Delete_SURF, "_ZN2cv4SURFD1Ev");

      function New_SURF return SURF;  -- /usr/include/opencv2/features2d/features2d.hpp:396
      pragma CPP_Constructor (New_SURF, "_ZN2cv4SURFC1Ev");

      function New_SURF
        (u_hessianThreshold : double;
         u_nOctaves : int;
         u_nOctaveLayers : int;
         u_extended : Extensions.bool;
         u_upright : Extensions.bool) return SURF;  -- /usr/include/opencv2/features2d/features2d.hpp:398
      pragma CPP_Constructor (New_SURF, "_ZN2cv4SURFC1Ediibb");

      function descriptorSize (this : access constant SURF) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:402
      pragma Import (CPP, descriptorSize, "_ZNK2cv4SURF14descriptorSizeEv");

      procedure operator_op
        (this : access constant SURF;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:404
      pragma Import (CPP, operator_op, "_ZNK2cv4SURFclERKNS_3MatES3_RSt6vectorINS_8KeyPointESaIS5_EE");

      procedure operator_op
        (this : access constant SURF;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         useProvidedKeypoints : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:407
      pragma Import (CPP, operator_op, "_ZNK2cv4SURFclERKNS_3MatES3_RSt6vectorINS_8KeyPointESaIS5_EERS4_IfSaIfEEb");
   end;
   use Class_SURF;
   type ORB;
   type CommonParams is record
      scale_factor_u : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:440
      n_levels_u : aliased unsigned;  -- /usr/include/opencv2/features2d/features2d.hpp:442
      first_level_u : aliased unsigned;  -- /usr/include/opencv2/features2d/features2d.hpp:446
      edge_threshold_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:448
      patch_size_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:453
   end record;
   pragma Convention (C_Pass_By_Copy, CommonParams);
   type OrbPatterns is null record;
   pragma Convention (C_Pass_By_Copy, OrbPatterns);
   package Class_ORB is
      type ORB is limited record
         params_u : aliased CommonParams;  -- /usr/include/opencv2/features2d/features2d.hpp:540
         half_patch_size_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:543
         orientation_horizontal_offsets_u : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:546
         orientation_vertical_offsets_u : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:547
         integral_image_steps_u : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:550
         n_features_per_level_u : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:553
         n_features_u : aliased stddef_h.size_t;  -- /usr/include/opencv2/features2d/features2d.hpp:556
         u_max_u : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:559
         patterns_u : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:563
      end record;
      pragma Import (CPP, ORB);

      function New_ORB (n_features : stddef_h.size_t; detector_params : access constant CommonParams) return ORB;  -- /usr/include/opencv2/features2d/features2d.hpp:460
      pragma CPP_Constructor (New_ORB, "_ZN2cv3ORBC1EmRKNS0_12CommonParamsE");

      procedure Delete_ORB (this : access ORB);  -- /usr/include/opencv2/features2d/features2d.hpp:463
      pragma Import (CPP, Delete_ORB, "_ZN2cv3ORBD1Ev");

      function descriptorSize (this : access constant ORB) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:466
      pragma Import (CPP, descriptorSize, "_ZNK2cv3ORB14descriptorSizeEv");

      procedure operator_op
        (this : access ORB;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:474
      pragma Import (CPP, operator_op, "_ZN2cv3ORBclERKNS_3MatES3_RSt6vectorINS_8KeyPointESaIS5_EE");

      procedure operator_op
        (this : access ORB;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat;
         useProvidedKeypoints : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:484
      pragma Import (CPP, operator_op, "_ZN2cv3ORBclERKNS_3MatES3_RSt6vectorINS_8KeyPointESaIS5_EERS1_b");

      procedure operator_op
        (this : access ORB;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat;
         do_keypoints : Extensions.bool;
         do_descriptors : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:500
      pragma Import (CPP, operator_op, "_ZN2cv3ORBclERKNS_3MatES3_RSt6vectorINS_8KeyPointESaIS5_EERS1_bb");

      procedure computeKeyPoints
        (this : access constant ORB;
         image_pyramid : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask_pyramid : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:508
      pragma Import (CPP, computeKeyPoints, "_ZNK2cv3ORB16computeKeyPointsERKSt6vectorINS_3MatESaIS2_EES6_RS1_IS1_INS_8KeyPointESaIS7_EESaIS9_EE");

      procedure computeOrientation
        (this : access constant ORB;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         integral_image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         level : unsigned;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:518
      pragma Import (CPP, computeOrientation, "_ZNK2cv3ORB18computeOrientationERKNS_3MatES3_jRSt6vectorINS_8KeyPointESaIS5_EE");

      procedure computeDescriptors
        (this : access constant ORB;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         integral_image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         level : unsigned;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:529
      pragma Import (CPP, computeDescriptors, "_ZNK2cv3ORB18computeDescriptorsERKNS_3MatES3_jRSt6vectorINS_8KeyPointESaIS5_EERS1_");

      procedure computeIntegralImage
        (this : access ORB;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         level : unsigned;
         integral_image : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:537
      pragma Import (CPP, computeIntegralImage, "_ZN2cv3ORB20computeIntegralImageERKNS_3MatEjRS1_");

      kKernelWidth : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:489
      pragma Import (CPP, kKernelWidth, "_ZN2cv3ORB12kKernelWidthE");
   end;
   use Class_ORB;
   package Class_MSER is
      type MSER is limited record
         parent : aliased CvMSERParams;
      end record;
      pragma Import (CPP, MSER);

      procedure Delete_MSER (this : access MSER);  -- /usr/include/opencv2/features2d/features2d.hpp:575
      pragma Import (CPP, Delete_MSER, "_ZN2cv4MSERD1Ev");

      function New_MSER return MSER;  -- /usr/include/opencv2/features2d/features2d.hpp:579
      pragma CPP_Constructor (New_MSER, "_ZN2cv4MSERC1Ev");

      function New_MSER
        (u_delta : int;
         u_min_area : int;
         u_max_area : int;
         u_max_variation : double;
         u_min_diversity : double;
         u_max_evolution : int;
         u_area_threshold : double;
         u_min_margin : double;
         u_edge_blur_size : int) return MSER;  -- /usr/include/opencv2/features2d/features2d.hpp:581
      pragma CPP_Constructor (New_MSER, "_ZN2cv4MSERC1Eiiiddiddi");

      procedure operator_op
        (this : access constant MSER;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         msers : System.Address;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:586
      pragma Import (CPP, operator_op, "_ZNK2cv4MSERclERKNS_3MatERSt6vectorIS4_INS_6Point_IiEESaIS6_EESaIS8_EES3_");
   end;
   use Class_MSER;
   package Class_StarDetector is
      type StarDetector is limited record
         parent : aliased CvStarDetectorParams;
      end record;
      pragma Import (CPP, StarDetector);

      procedure Delete_StarDetector (this : access StarDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:595
      pragma Import (CPP, Delete_StarDetector, "_ZN2cv12StarDetectorD1Ev");

      function New_StarDetector return StarDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:599
      pragma CPP_Constructor (New_StarDetector, "_ZN2cv12StarDetectorC1Ev");

      function New_StarDetector
        (u_maxSize : int;
         u_responseThreshold : int;
         u_lineThresholdProjected : int;
         u_lineThresholdBinarized : int;
         u_suppressNonmaxSize : int) return StarDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:601
      pragma CPP_Constructor (New_StarDetector, "_ZN2cv12StarDetectorC1Eiiiii");

      procedure operator_op
        (this : access constant StarDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:606
      pragma Import (CPP, operator_op, "_ZNK2cv12StarDetectorclERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EE");
   end;
   use Class_StarDetector;
   procedure FAST
     (image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      threshold : int;
      nonmaxSupression : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:611
   pragma Import (CPP, FAST, "_ZN2cv4FASTERKNS_3MatERSt6vectorINS_8KeyPointESaIS4_EEib");

   package Class_PatchGenerator is
      type PatchGenerator is limited record
         backgroundMin : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:636
         backgroundMax : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:636
         noiseRange : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:637
         randomBlur : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:638
         lambdaMin : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:639
         lambdaMax : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:639
         thetaMin : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:640
         thetaMax : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:640
         phiMin : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:641
         phiMax : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:641
      end record;
      pragma Import (CPP, PatchGenerator);

      procedure Delete_PatchGenerator (this : access PatchGenerator);  -- /usr/include/opencv2/features2d/features2d.hpp:617
      pragma Import (CPP, Delete_PatchGenerator, "_ZN2cv14PatchGeneratorD1Ev");

      function New_PatchGenerator return PatchGenerator;  -- /usr/include/opencv2/features2d/features2d.hpp:620
      pragma CPP_Constructor (New_PatchGenerator, "_ZN2cv14PatchGeneratorC1Ev");

      function New_PatchGenerator
        (u_backgroundMin : double;
         u_backgroundMax : double;
         u_noiseRange : double;
         u_randomBlur : Extensions.bool;
         u_lambdaMin : double;
         u_lambdaMax : double;
         u_thetaMin : double;
         u_thetaMax : double;
         u_phiMin : double;
         u_phiMax : double) return PatchGenerator;  -- /usr/include/opencv2/features2d/features2d.hpp:621
      pragma CPP_Constructor (New_PatchGenerator, "_ZN2cv14PatchGeneratorC1Edddbdddddd");

      procedure operator_op
        (this : access constant PatchGenerator;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         pt : opencv2_core_core_hpp.Class_Point2f.Point2f;
         patch : access opencv2_core_core_hpp.Class_Mat.Mat;
         patchSize : opencv2_core_core_hpp.Class_Size.Size;
         rng : access opencv2_core_core_hpp.Class_RNG.RNG);  -- /usr/include/opencv2/features2d/features2d.hpp:626
      pragma Import (CPP, operator_op, "_ZNK2cv14PatchGeneratorclERKNS_3MatENS_6Point_IfEERS1_NS_5Size_IiEERNS_3RNGE");

      procedure operator_op
        (this : access constant PatchGenerator;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         transform : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         patch : access opencv2_core_core_hpp.Class_Mat.Mat;
         patchSize : opencv2_core_core_hpp.Class_Size.Size;
         rng : access opencv2_core_core_hpp.Class_RNG.RNG);  -- /usr/include/opencv2/features2d/features2d.hpp:627
      pragma Import (CPP, operator_op, "_ZNK2cv14PatchGeneratorclERKNS_3MatES3_RS1_NS_5Size_IiEERNS_3RNGE");

      procedure warpWholeImage
        (this : access constant PatchGenerator;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matT : access opencv2_core_core_hpp.Class_Mat.Mat;
         buf : access opencv2_core_core_hpp.Class_Mat.Mat;
         warped : access opencv2_core_core_hpp.Class_Mat.Mat;
         border : int;
         rng : access opencv2_core_core_hpp.Class_RNG.RNG);  -- /usr/include/opencv2/features2d/features2d.hpp:629
      pragma Import (CPP, warpWholeImage, "_ZNK2cv14PatchGenerator14warpWholeImageERKNS_3MatERS1_S4_S4_iRNS_3RNGE");

      procedure generateRandomTransform
        (this : access constant PatchGenerator;
         srcCenter : opencv2_core_core_hpp.Class_Point2f.Point2f;
         dstCenter : opencv2_core_core_hpp.Class_Point2f.Point2f;
         transform : access opencv2_core_core_hpp.Class_Mat.Mat;
         rng : access opencv2_core_core_hpp.Class_RNG.RNG;
         inverse : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:631
      pragma Import (CPP, generateRandomTransform, "_ZNK2cv14PatchGenerator23generateRandomTransformENS_6Point_IfEES2_RNS_3MatERNS_3RNGEb");

      procedure setAffineParam
        (this : access PatchGenerator;
         lambda : double;
         theta : double;
         phi : double);  -- /usr/include/opencv2/features2d/features2d.hpp:634
      pragma Import (CPP, setAffineParam, "_ZN2cv14PatchGenerator14setAffineParamEddd");
   end;
   use Class_PatchGenerator;
   package Class_LDetector is
      type LDetector is limited record
         radius : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:664
         threshold : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:665
         nOctaves : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:666
         nViews : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:667
         verbose : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:668
         baseFeatureSize : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:670
         clusteringDistance : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:671
      end record;
      pragma Import (CPP, LDetector);

      function New_LDetector return LDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:648
      pragma CPP_Constructor (New_LDetector, "_ZN2cv9LDetectorC1Ev");

      function New_LDetector
        (u_radius : int;
         u_threshold : int;
         u_nOctaves : int;
         u_nViews : int;
         u_baseFeatureSize : double;
         u_clusteringDistance : double) return LDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:649
      pragma CPP_Constructor (New_LDetector, "_ZN2cv9LDetectorC1Eiiiidd");

      procedure operator_op
        (this : access constant LDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxCount : int;
         scaleCoords : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:651
      pragma Import (CPP, operator_op, "_ZNK2cv9LDetectorclERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EEib");

      procedure operator_op
        (this : access constant LDetector;
         pyr : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxCount : int;
         scaleCoords : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:654
      pragma Import (CPP, operator_op, "_ZNK2cv9LDetectorclERKSt6vectorINS_3MatESaIS2_EERS1_INS_8KeyPointESaIS7_EEib");

      procedure getMostStable2D
        (this : access constant LDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxCount : int;
         patchGenerator : access constant PatchGenerator);  -- /usr/include/opencv2/features2d/features2d.hpp:657
      pragma Import (CPP, getMostStable2D, "_ZNK2cv9LDetector15getMostStable2DERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EEiRKNS_14PatchGeneratorE");

      procedure setVerbose (this : access LDetector; verbose : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:659
      pragma Import (CPP, setVerbose, "_ZN2cv9LDetector10setVerboseEb");

      procedure read (this : access LDetector; node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:661
      pragma Import (CPP, read, "_ZN2cv9LDetector4readERKNS_8FileNodeE");

      procedure write
        (this : access constant LDetector;
         fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
         name : access constant opencv2_core_core_hpp.Class_String.String);  -- /usr/include/opencv2/features2d/features2d.hpp:662
      pragma Import (CPP, write, "_ZNK2cv9LDetector5writeERNS_11FileStorageERKSs");
   end;
   use Class_LDetector;
   subtype YAPE is LDetector;

   type FernClassifier;
   type Feature is record
      x1 : aliased opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:728
      y1 : aliased opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:728
      x2 : aliased opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:728
      y2 : aliased opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:728
   end record;
   pragma Convention (C_Pass_By_Copy, Feature);
   package Class_FernClassifier is
      type FernClassifier is tagged limited record
         verbose : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:757
         nstructs : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:758
         structSize : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:759
         nclasses : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:760
         signatureSize : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:761
         compressionMethod : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:762
         leavesPerStruct : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:763
         patchSize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/features2d/features2d.hpp:764
         features : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:765
         classCounters : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:766
         posteriors : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:767
      end record;
      pragma Import (CPP, FernClassifier);

      function New_FernClassifier return FernClassifier;  -- /usr/include/opencv2/features2d/features2d.hpp:679
      pragma CPP_Constructor (New_FernClassifier, "_ZN2cv14FernClassifierC1Ev");

      function New_FernClassifier (node : access constant opencv2_core_core_hpp.Class_FileNode.FileNode) return FernClassifier;  -- /usr/include/opencv2/features2d/features2d.hpp:680
      pragma CPP_Constructor (New_FernClassifier, "_ZN2cv14FernClassifierC1ERKNS_8FileNodeE");

      function New_FernClassifier
        (points : System.Address;
         refimgs : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         labels : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         u_nclasses : int;
         u_patchSize : int;
         u_signatureSize : int;
         u_nstructs : int;
         u_structSize : int;
         u_nviews : int;
         u_compressionMethod : int;
         patchGenerator : access constant PatchGenerator) return FernClassifier;  -- /usr/include/opencv2/features2d/features2d.hpp:681
      pragma CPP_Constructor (New_FernClassifier, "_ZN2cv14FernClassifierC1ERKSt6vectorIS1_INS_6Point_IfEESaIS3_EESaIS5_EERKS1_INS_3MatESaISA_EERKS1_IS1_IiSaIiEESaISG_EEiiiiiiiRKNS_14PatchGeneratorE");

      procedure Delete_FernClassifier (this : access FernClassifier);  -- /usr/include/opencv2/features2d/features2d.hpp:691
      pragma Import (CPP, Delete_FernClassifier, "_ZN2cv14FernClassifierD1Ev");

      procedure deleting_dtor (this : access FernClassifier);  -- /usr/include/opencv2/features2d/features2d.hpp:691
      pragma Import (CPP, deleting_dtor, "_ZN2cv14FernClassifierD0Ev");

      procedure read (this : access FernClassifier; n : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:692
      pragma Import (CPP, read, "_ZN2cv14FernClassifier4readERKNS_8FileNodeE");

      procedure write
        (this : access constant FernClassifier;
         fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class;
         name : access constant opencv2_core_core_hpp.Class_String.String);  -- /usr/include/opencv2/features2d/features2d.hpp:693
      pragma Import (CPP, write, "_ZNK2cv14FernClassifier5writeERNS_11FileStorageERKSs");

      procedure trainFromSingleView
        (this : access FernClassifier;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         u_patchSize : int;
         u_signatureSize : int;
         u_nstructs : int;
         u_structSize : int;
         u_nviews : int;
         u_compressionMethod : int;
         patchGenerator : access constant PatchGenerator);  -- /usr/include/opencv2/features2d/features2d.hpp:694
      pragma Import (CPP, trainFromSingleView, "_ZN2cv14FernClassifier19trainFromSingleViewERKNS_3MatERKSt6vectorINS_8KeyPointESaIS5_EEiiiiiiRKNS_14PatchGeneratorE");

      procedure train
        (this : access FernClassifier;
         points : System.Address;
         refimgs : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         labels : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         u_nclasses : int;
         u_patchSize : int;
         u_signatureSize : int;
         u_nstructs : int;
         u_structSize : int;
         u_nviews : int;
         u_compressionMethod : int;
         patchGenerator : access constant PatchGenerator);  -- /usr/include/opencv2/features2d/features2d.hpp:703
      pragma Import (CPP, train, "_ZN2cv14FernClassifier5trainERKSt6vectorIS1_INS_6Point_IfEESaIS3_EESaIS5_EERKS1_INS_3MatESaISA_EERKS1_IS1_IiSaIiEESaISG_EEiiiiiiiRKNS_14PatchGeneratorE");

      function operator_op
        (this : access constant FernClassifier;
         img : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         kpt : opencv2_core_core_hpp.Class_Point2f.Point2f;
         signature : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:713
      pragma Import (CPP, operator_op, "_ZNK2cv14FernClassifierclERKNS_3MatENS_6Point_IfEERSt6vectorIfSaIfEE");

      function operator_op
        (this : access constant FernClassifier;
         patch : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         signature : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:714
      pragma Import (CPP, operator_op, "_ZNK2cv14FernClassifierclERKNS_3MatERSt6vectorIfSaIfEE");

      procedure clear (this : access FernClassifier);  -- /usr/include/opencv2/features2d/features2d.hpp:715
      pragma Import (CPP, clear, "_ZN2cv14FernClassifier5clearEv");

      function empty (this : access constant FernClassifier) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:716
      pragma Import (CPP, empty, "_ZNK2cv14FernClassifier5emptyEv");

      procedure setVerbose (this : access FernClassifier'Class; verbose : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:717
      pragma Import (CPP, setVerbose, "_ZN2cv14FernClassifier10setVerboseEb");

      function getClassCount (this : access constant FernClassifier'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:719
      pragma Import (CPP, getClassCount, "_ZNK2cv14FernClassifier13getClassCountEv");

      function getStructCount (this : access constant FernClassifier'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:720
      pragma Import (CPP, getStructCount, "_ZNK2cv14FernClassifier14getStructCountEv");

      function getStructSize (this : access constant FernClassifier'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:721
      pragma Import (CPP, getStructSize, "_ZNK2cv14FernClassifier13getStructSizeEv");

      function getSignatureSize (this : access constant FernClassifier'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:722
      pragma Import (CPP, getSignatureSize, "_ZNK2cv14FernClassifier16getSignatureSizeEv");

      function getCompressionMethod (this : access constant FernClassifier'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:723
      pragma Import (CPP, getCompressionMethod, "_ZNK2cv14FernClassifier20getCompressionMethodEv");

      function getPatchSize (this : access constant FernClassifier'Class) return opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/features2d/features2d.hpp:724
      pragma Import (CPP, getPatchSize, "_ZNK2cv14FernClassifier12getPatchSizeEv");

      procedure prepare
        (this : access FernClassifier;
         u_nclasses : int;
         u_patchSize : int;
         u_signatureSize : int;
         u_nstructs : int;
         u_structSize : int;
         u_nviews : int;
         u_compressionMethod : int);  -- /usr/include/opencv2/features2d/features2d.hpp:751
      pragma Import (CPP, prepare, "_ZN2cv14FernClassifier7prepareEiiiiiii");

      procedure finalize (this : access FernClassifier; rng : access opencv2_core_core_hpp.Class_RNG.RNG);  -- /usr/include/opencv2/features2d/features2d.hpp:754
      pragma Import (CPP, finalize, "_ZN2cv14FernClassifier8finalizeERNS_3RNGE");

      function getLeaf
        (this : access constant FernClassifier;
         fidx : int;
         patch : access constant opencv2_core_core_hpp.Class_Mat.Mat) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:755
      pragma Import (CPP, getLeaf, "_ZNK2cv14FernClassifier7getLeafEiRKNS_3MatE");
   end;
   use Class_FernClassifier;
   package Class_BaseKeypoint is
      type BaseKeypoint is limited record
         x : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:779
         y : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:780
         image : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/features2d/features2d.hpp:781
      end record;
      pragma Import (CPP, BaseKeypoint);

      function New_BaseKeypoint return BaseKeypoint;  -- /usr/include/opencv2/features2d/features2d.hpp:783
      pragma CPP_Constructor (New_BaseKeypoint, "_ZN2cv12BaseKeypointC1Ev");

      function New_BaseKeypoint
        (x : int;
         y : int;
         image : access opencv2_core_types_c_h.IplImage) return BaseKeypoint;  -- /usr/include/opencv2/features2d/features2d.hpp:787
      pragma CPP_Constructor (New_BaseKeypoint, "_ZN2cv12BaseKeypointC1EiiP9_IplImage");


   end;
   use Class_BaseKeypoint;
   package Class_RandomizedTree is
      type RandomizedTree is limited record
         classes_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:841
         depth_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:842
         num_leaves_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:843
         nodes_u : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:844
         posteriors_u : System.Address;  -- /usr/include/opencv2/features2d/features2d.hpp:845
         posteriors2_u : System.Address;  -- /usr/include/opencv2/features2d/features2d.hpp:846
         leaf_counts_u : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:847
      end record;
      pragma Import (CPP, RandomizedTree);

      function GET_LOWER_QUANT_PERC return float;  -- /usr/include/opencv2/features2d/features2d.hpp:801
      pragma Import (CPP, GET_LOWER_QUANT_PERC, "_ZN2cv14RandomizedTree20GET_LOWER_QUANT_PERCEv");

      function GET_UPPER_QUANT_PERC return float;  -- /usr/include/opencv2/features2d/features2d.hpp:802
      pragma Import (CPP, GET_UPPER_QUANT_PERC, "_ZN2cv14RandomizedTree20GET_UPPER_QUANT_PERCEv");

      function New_RandomizedTree return RandomizedTree;  -- /usr/include/opencv2/features2d/features2d.hpp:804
      pragma CPP_Constructor (New_RandomizedTree, "_ZN2cv14RandomizedTreeC1Ev");

      procedure Delete_RandomizedTree (this : access RandomizedTree);  -- /usr/include/opencv2/features2d/features2d.hpp:805
      pragma Import (CPP, Delete_RandomizedTree, "_ZN2cv14RandomizedTreeD1Ev");

      procedure train
        (this : access RandomizedTree;
         base_set : System.Address;
         rng : access opencv2_core_core_hpp.Class_RNG.RNG;
         depth : int;
         views : int;
         reduced_num_dim : stddef_h.size_t;
         num_quant_bits : int);  -- /usr/include/opencv2/features2d/features2d.hpp:807
      pragma Import (CPP, train, "_ZN2cv14RandomizedTree5trainERKSt6vectorINS_12BaseKeypointESaIS2_EERNS_3RNGEiimi");

      procedure train
        (this : access RandomizedTree;
         base_set : System.Address;
         rng : access opencv2_core_core_hpp.Class_RNG.RNG;
         make_patch : access PatchGenerator;
         depth : int;
         views : int;
         reduced_num_dim : stddef_h.size_t;
         num_quant_bits : int);  -- /usr/include/opencv2/features2d/features2d.hpp:809
      pragma Import (CPP, train, "_ZN2cv14RandomizedTree5trainERKSt6vectorINS_12BaseKeypointESaIS2_EERNS_3RNGERNS_14PatchGeneratorEiimi");

      procedure quantizeVector
        (vec : access float;
         dim : int;
         N : int;
         bnds : access float;
         clamp_mode : int);  -- /usr/include/opencv2/features2d/features2d.hpp:814
      pragma Import (CPP, quantizeVector, "_ZN2cv14RandomizedTree14quantizeVectorEPfiiS1_i");

      procedure quantizeVector
        (src : access float;
         dim : int;
         N : int;
         bnds : access float;
         dst : access opencv2_core_types_c_h.uchar);  -- /usr/include/opencv2/features2d/features2d.hpp:815
      pragma Import (CPP, quantizeVector, "_ZN2cv14RandomizedTree14quantizeVectorEPfiiS1_Ph");

      function getPosterior (this : access RandomizedTree; patch_data : access opencv2_core_types_c_h.uchar) return access float;  -- /usr/include/opencv2/features2d/features2d.hpp:818
      pragma Import (CPP, getPosterior, "_ZN2cv14RandomizedTree12getPosteriorEPh");

      function getPosterior (this : access constant RandomizedTree; patch_data : access opencv2_core_types_c_h.uchar) return access float;  -- /usr/include/opencv2/features2d/features2d.hpp:819
      pragma Import (CPP, getPosterior, "_ZNK2cv14RandomizedTree12getPosteriorEPh");

      function getPosterior2 (this : access RandomizedTree; patch_data : access opencv2_core_types_c_h.uchar) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:820
      pragma Import (CPP, getPosterior2, "_ZN2cv14RandomizedTree13getPosterior2EPh");

      function getPosterior2 (this : access constant RandomizedTree; patch_data : access opencv2_core_types_c_h.uchar) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:821
      pragma Import (CPP, getPosterior2, "_ZNK2cv14RandomizedTree13getPosterior2EPh");

      procedure read
        (this : access RandomizedTree;
         file_name : Interfaces.C.Strings.chars_ptr;
         num_quant_bits : int);  -- /usr/include/opencv2/features2d/features2d.hpp:823
      pragma Import (CPP, read, "_ZN2cv14RandomizedTree4readEPKci");

      procedure read
        (this : access RandomizedTree;
         c_is : access cpp_4_7_4_iosfwd.Class_istream.istream'Class;
         num_quant_bits : int);  -- /usr/include/opencv2/features2d/features2d.hpp:824
      pragma Import (CPP, read, "_ZN2cv14RandomizedTree4readERSii");

      procedure write (this : access constant RandomizedTree; file_name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:825
      pragma Import (CPP, write, "_ZNK2cv14RandomizedTree5writeEPKc");

      procedure write (this : access constant RandomizedTree; os : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:826
      pragma Import (CPP, write, "_ZNK2cv14RandomizedTree5writeERSo");

      function classes (this : access RandomizedTree) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:828
      pragma Import (CPP, classes, "_ZN2cv14RandomizedTree7classesEv");

      function depth (this : access RandomizedTree) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:829
      pragma Import (CPP, depth, "_ZN2cv14RandomizedTree5depthEv");

      procedure discardFloatPosteriors (this : access RandomizedTree);  -- /usr/include/opencv2/features2d/features2d.hpp:832
      pragma Import (CPP, discardFloatPosteriors, "_ZN2cv14RandomizedTree22discardFloatPosteriorsEv");

      procedure applyQuantization (this : access RandomizedTree; num_quant_bits : int);  -- /usr/include/opencv2/features2d/features2d.hpp:834
      pragma Import (CPP, applyQuantization, "_ZN2cv14RandomizedTree17applyQuantizationEi");

      procedure savePosteriors
        (this : access RandomizedTree;
         url : cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         append : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:837
      pragma Import (CPP, savePosteriors, "_ZN2cv14RandomizedTree14savePosteriorsESsb");

      procedure savePosteriors2
        (this : access RandomizedTree;
         url : cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         append : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:838
      pragma Import (CPP, savePosteriors2, "_ZN2cv14RandomizedTree15savePosteriors2ESsb");

      procedure createNodes
        (this : access RandomizedTree;
         num_nodes : int;
         rng : access opencv2_core_core_hpp.Class_RNG.RNG);  -- /usr/include/opencv2/features2d/features2d.hpp:849
      pragma Import (CPP, createNodes, "_ZN2cv14RandomizedTree11createNodesEiRNS_3RNGE");

      procedure allocPosteriorsAligned
        (this : access RandomizedTree;
         num_leaves : int;
         num_classes : int);  -- /usr/include/opencv2/features2d/features2d.hpp:850
      pragma Import (CPP, allocPosteriorsAligned, "_ZN2cv14RandomizedTree22allocPosteriorsAlignedEii");

      procedure freePosteriors (this : access RandomizedTree; which : int);  -- /usr/include/opencv2/features2d/features2d.hpp:851
      pragma Import (CPP, freePosteriors, "_ZN2cv14RandomizedTree14freePosteriorsEi");

      procedure init
        (this : access RandomizedTree;
         classes : int;
         depth : int;
         rng : access opencv2_core_core_hpp.Class_RNG.RNG);  -- /usr/include/opencv2/features2d/features2d.hpp:852
      pragma Import (CPP, init, "_ZN2cv14RandomizedTree4initEiiRNS_3RNGE");

      procedure addExample
        (this : access RandomizedTree;
         class_id : int;
         patch_data : access opencv2_core_types_c_h.uchar);  -- /usr/include/opencv2/features2d/features2d.hpp:853
      pragma Import (CPP, addExample, "_ZN2cv14RandomizedTree10addExampleEiPh");

      procedure finalize
        (this : access RandomizedTree;
         reduced_num_dim : stddef_h.size_t;
         num_quant_bits : int);  -- /usr/include/opencv2/features2d/features2d.hpp:854
      pragma Import (CPP, finalize, "_ZN2cv14RandomizedTree8finalizeEmi");

      function getIndex (this : access constant RandomizedTree; patch_data : access opencv2_core_types_c_h.uchar) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:855
      pragma Import (CPP, getIndex, "_ZNK2cv14RandomizedTree8getIndexEPh");

      function getPosteriorByIndex (this : access RandomizedTree; index : int) return access float;  -- /usr/include/opencv2/features2d/features2d.hpp:873
      pragma Import (CPP, getPosteriorByIndex, "_ZN2cv14RandomizedTree19getPosteriorByIndexEi");

      function getPosteriorByIndex (this : access constant RandomizedTree; index : int) return access float;  -- /usr/include/opencv2/features2d/features2d.hpp:878
      pragma Import (CPP, getPosteriorByIndex, "_ZNK2cv14RandomizedTree19getPosteriorByIndexEi");

      function getPosteriorByIndex2 (this : access RandomizedTree; index : int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:883
      pragma Import (CPP, getPosteriorByIndex2, "_ZN2cv14RandomizedTree20getPosteriorByIndex2Ei");

      function getPosteriorByIndex2 (this : access constant RandomizedTree; index : int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:888
      pragma Import (CPP, getPosteriorByIndex2, "_ZNK2cv14RandomizedTree20getPosteriorByIndex2Ei");

      procedure convertPosteriorsToChar (this : access RandomizedTree);  -- /usr/include/opencv2/features2d/features2d.hpp:861
      pragma Import (CPP, convertPosteriorsToChar, "_ZN2cv14RandomizedTree23convertPosteriorsToCharEv");

      procedure makePosteriors2 (this : access RandomizedTree; num_quant_bits : int);  -- /usr/include/opencv2/features2d/features2d.hpp:862
      pragma Import (CPP, makePosteriors2, "_ZN2cv14RandomizedTree15makePosteriors2Ei");

      procedure compressLeaves (this : access RandomizedTree; reduced_num_dim : stddef_h.size_t);  -- /usr/include/opencv2/features2d/features2d.hpp:863
      pragma Import (CPP, compressLeaves, "_ZN2cv14RandomizedTree14compressLeavesEm");

      procedure estimateQuantPercForPosteriors (this : access RandomizedTree; perc : access float);  -- /usr/include/opencv2/features2d/features2d.hpp:864
      pragma Import (CPP, estimateQuantPercForPosteriors, "_ZN2cv14RandomizedTree30estimateQuantPercForPosteriorsEPf");

      PATCH_SIZE : aliased opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:797
      pragma Import (CPP, PATCH_SIZE, "_ZN2cv14RandomizedTree10PATCH_SIZEE");

      DEFAULT_DEPTH : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:798
      pragma Import (CPP, DEFAULT_DEPTH, "_ZN2cv14RandomizedTree13DEFAULT_DEPTHE");

      DEFAULT_VIEWS : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:799
      pragma Import (CPP, DEFAULT_VIEWS, "_ZN2cv14RandomizedTree13DEFAULT_VIEWSE");

      DEFAULT_REDUCED_NUM_DIM : aliased stddef_h.size_t;  -- /usr/include/opencv2/features2d/features2d.hpp:800
      pragma Import (CPP, DEFAULT_REDUCED_NUM_DIM, "_ZN2cv14RandomizedTree23DEFAULT_REDUCED_NUM_DIME");
   end;
   use Class_RandomizedTree;
   function getData (image : access opencv2_core_types_c_h.IplImage) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:868
   pragma Import (CPP, getData, "_ZN2cv7getDataEP9_IplImage");

   package Class_RTreeNode is
      type RTreeNode is limited record
         offset1 : aliased short;  -- /usr/include/opencv2/features2d/features2d.hpp:895
         offset2 : aliased short;  -- /usr/include/opencv2/features2d/features2d.hpp:895
      end record;
      pragma Import (CPP, RTreeNode);

      function New_RTreeNode return RTreeNode;  -- /usr/include/opencv2/features2d/features2d.hpp:897
      pragma CPP_Constructor (New_RTreeNode, "_ZN2cv9RTreeNodeC1Ev");

      function New_RTreeNode
        (x1 : opencv2_core_types_c_h.uchar;
         y1 : opencv2_core_types_c_h.uchar;
         x2 : opencv2_core_types_c_h.uchar;
         y2 : opencv2_core_types_c_h.uchar) return RTreeNode;  -- /usr/include/opencv2/features2d/features2d.hpp:898
      pragma CPP_Constructor (New_RTreeNode, "_ZN2cv9RTreeNodeC1Ehhhh");

      function operator_op (this : access constant RTreeNode; patch_data : access opencv2_core_types_c_h.uchar) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:904
      pragma Import (CPP, operator_op, "_ZNK2cv9RTreeNodeclEPh");
   end;
   use Class_RTreeNode;
   package Class_RTreeClassifier is
      type RTreeClassifier is limited record
         trees_u : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:961
         classes_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:964
         num_quant_bits_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:965
         posteriors_u : System.Address;  -- /usr/include/opencv2/features2d/features2d.hpp:966
         ptemp_u : access unsigned_short;  -- /usr/include/opencv2/features2d/features2d.hpp:967
         original_num_classes_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:968
         keep_floats_u : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:969
      end record;
      pragma Import (CPP, RTreeClassifier);

      function New_RTreeClassifier return RTreeClassifier;  -- /usr/include/opencv2/features2d/features2d.hpp:916
      pragma CPP_Constructor (New_RTreeClassifier, "_ZN2cv15RTreeClassifierC1Ev");

      procedure train
        (this : access RTreeClassifier;
         base_set : System.Address;
         rng : access opencv2_core_core_hpp.Class_RNG.RNG;
         num_trees : int;
         depth : int;
         views : int;
         reduced_num_dim : stddef_h.size_t;
         num_quant_bits : int);  -- /usr/include/opencv2/features2d/features2d.hpp:917
      pragma Import (CPP, train, "_ZN2cv15RTreeClassifier5trainERKSt6vectorINS_12BaseKeypointESaIS2_EERNS_3RNGEiiimi");

      procedure train
        (this : access RTreeClassifier;
         base_set : System.Address;
         rng : access opencv2_core_core_hpp.Class_RNG.RNG;
         make_patch : access PatchGenerator;
         num_trees : int;
         depth : int;
         views : int;
         reduced_num_dim : stddef_h.size_t;
         num_quant_bits : int);  -- /usr/include/opencv2/features2d/features2d.hpp:924
      pragma Import (CPP, train, "_ZN2cv15RTreeClassifier5trainERKSt6vectorINS_12BaseKeypointESaIS2_EERNS_3RNGERNS_14PatchGeneratorEiiimi");

      procedure getSignature
        (this : access constant RTreeClassifier;
         patch : access opencv2_core_types_c_h.IplImage;
         sig : access opencv2_core_types_c_h.uchar);  -- /usr/include/opencv2/features2d/features2d.hpp:934
      pragma Import (CPP, getSignature, "_ZNK2cv15RTreeClassifier12getSignatureEP9_IplImagePh");

      procedure getSignature
        (this : access constant RTreeClassifier;
         patch : access opencv2_core_types_c_h.IplImage;
         sig : access float);  -- /usr/include/opencv2/features2d/features2d.hpp:935
      pragma Import (CPP, getSignature, "_ZNK2cv15RTreeClassifier12getSignatureEP9_IplImagePf");

      procedure getSparseSignature
        (this : access constant RTreeClassifier;
         patch : access opencv2_core_types_c_h.IplImage;
         sig : access float;
         thresh : float);  -- /usr/include/opencv2/features2d/features2d.hpp:936
      pragma Import (CPP, getSparseSignature, "_ZNK2cv15RTreeClassifier18getSparseSignatureEP9_IplImagePff");

      procedure getFloatSignature
        (this : access constant RTreeClassifier;
         patch : access opencv2_core_types_c_h.IplImage;
         sig : access float);  -- /usr/include/opencv2/features2d/features2d.hpp:938
      pragma Import (CPP, getFloatSignature, "_ZNK2cv15RTreeClassifier17getFloatSignatureEP9_IplImagePf");

      function countNonZeroElements
        (vec : access float;
         n : int;
         tol : double) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:940
      pragma Import (CPP, countNonZeroElements, "_ZN2cv15RTreeClassifier20countNonZeroElementsEPfid");

      procedure safeSignatureAlloc
        (sig : System.Address;
         num_sig : int;
         sig_len : int);  -- /usr/include/opencv2/features2d/features2d.hpp:941
      pragma Import (CPP, safeSignatureAlloc, "_ZN2cv15RTreeClassifier18safeSignatureAllocEPPhii");

      function safeSignatureAlloc (num_sig : int; sig_len : int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:942
      pragma Import (CPP, safeSignatureAlloc, "_ZN2cv15RTreeClassifier18safeSignatureAllocEii");

      function classes (this : access constant RTreeClassifier) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:944
      pragma Import (CPP, classes, "_ZNK2cv15RTreeClassifier7classesEv");

      function original_num_classes (this : access constant RTreeClassifier) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:945
      pragma Import (CPP, original_num_classes, "_ZNK2cv15RTreeClassifier20original_num_classesEv");

      procedure setQuantization (this : access RTreeClassifier; num_quant_bits : int);  -- /usr/include/opencv2/features2d/features2d.hpp:947
      pragma Import (CPP, setQuantization, "_ZN2cv15RTreeClassifier15setQuantizationEi");

      procedure discardFloatPosteriors (this : access RTreeClassifier);  -- /usr/include/opencv2/features2d/features2d.hpp:948
      pragma Import (CPP, discardFloatPosteriors, "_ZN2cv15RTreeClassifier22discardFloatPosteriorsEv");

      procedure read (this : access RTreeClassifier; file_name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:950
      pragma Import (CPP, read, "_ZN2cv15RTreeClassifier4readEPKc");

      procedure read (this : access RTreeClassifier; c_is : access cpp_4_7_4_iosfwd.Class_istream.istream'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:951
      pragma Import (CPP, read, "_ZN2cv15RTreeClassifier4readERSi");

      procedure write (this : access constant RTreeClassifier; file_name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:952
      pragma Import (CPP, write, "_ZNK2cv15RTreeClassifier5writeEPKc");

      procedure write (this : access constant RTreeClassifier; os : access cpp_4_7_4_iosfwd.Class_ostream.ostream'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:953
      pragma Import (CPP, write, "_ZNK2cv15RTreeClassifier5writeERSo");

      procedure saveAllFloatPosteriors (this : access RTreeClassifier; file_url : cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/features2d/features2d.hpp:956
      pragma Import (CPP, saveAllFloatPosteriors, "_ZN2cv15RTreeClassifier22saveAllFloatPosteriorsESs");

      procedure saveAllBytePosteriors (this : access RTreeClassifier; file_url : cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/features2d/features2d.hpp:957
      pragma Import (CPP, saveAllBytePosteriors, "_ZN2cv15RTreeClassifier21saveAllBytePosteriorsESs");

      procedure setFloatPosteriorsFromTextfile_176 (this : access RTreeClassifier; url : cpp_4_7_4_bits_stringfwd_h.Class_string.string);  -- /usr/include/opencv2/features2d/features2d.hpp:958
      pragma Import (CPP, setFloatPosteriorsFromTextfile_176, "_ZN2cv15RTreeClassifier34setFloatPosteriorsFromTextfile_176ESs");

      function countZeroElements (this : access RTreeClassifier) return float;  -- /usr/include/opencv2/features2d/features2d.hpp:959
      pragma Import (CPP, countZeroElements, "_ZN2cv15RTreeClassifier17countZeroElementsEv");

      DEFAULT_TREES : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:913
      pragma Import (CPP, DEFAULT_TREES, "_ZN2cv15RTreeClassifier13DEFAULT_TREESE");

      DEFAULT_NUM_QUANT_BITS : aliased stddef_h.size_t;  -- /usr/include/opencv2/features2d/features2d.hpp:914
      pragma Import (CPP, DEFAULT_NUM_QUANT_BITS, "_ZN2cv15RTreeClassifier22DEFAULT_NUM_QUANT_BITSE");
   end;
   use Class_RTreeClassifier;
   package Class_OneWayDescriptor is
      type OneWayDescriptor is limited record
         m_pose_count : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1109
         m_patch_size : aliased opencv2_core_types_c_h.Class_CvSize.CvSize;  -- /usr/include/opencv2/features2d/features2d.hpp:1110
         m_samples : System.Address;  -- /usr/include/opencv2/features2d/features2d.hpp:1111
         m_input_patch : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/features2d/features2d.hpp:1112
         m_train_patch : access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/features2d/features2d.hpp:1113
         m_pca_coeffs : System.Address;  -- /usr/include/opencv2/features2d/features2d.hpp:1114
         m_affine_poses : access CvAffinePose;  -- /usr/include/opencv2/features2d/features2d.hpp:1115
         m_transforms : System.Address;  -- /usr/include/opencv2/features2d/features2d.hpp:1116
         m_feature_name : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/features2d/features2d.hpp:1118
         m_center : aliased opencv2_core_types_c_h.CvPoint;  -- /usr/include/opencv2/features2d/features2d.hpp:1119
         m_pca_dim_high : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1121
         m_pca_dim_low : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1122
      end record;
      pragma Import (CPP, OneWayDescriptor);

      function New_OneWayDescriptor return OneWayDescriptor;  -- /usr/include/opencv2/features2d/features2d.hpp:979
      pragma CPP_Constructor (New_OneWayDescriptor, "_ZN2cv16OneWayDescriptorC1Ev");

      procedure Delete_OneWayDescriptor (this : access OneWayDescriptor);  -- /usr/include/opencv2/features2d/features2d.hpp:980
      pragma Import (CPP, Delete_OneWayDescriptor, "_ZN2cv16OneWayDescriptorD1Ev");

      procedure Allocate
        (this : access OneWayDescriptor;
         pose_count : int;
         size : opencv2_core_types_c_h.Class_CvSize.CvSize;
         nChannels : int);  -- /usr/include/opencv2/features2d/features2d.hpp:983
      pragma Import (CPP, Allocate, "_ZN2cv16OneWayDescriptor8AllocateEi6CvSizei");

      procedure GenerateSamples
        (this : access OneWayDescriptor;
         pose_count : int;
         frontal : access opencv2_core_types_c_h.IplImage;
         norm : int);  -- /usr/include/opencv2/features2d/features2d.hpp:990
      pragma Import (CPP, GenerateSamples, "_ZN2cv16OneWayDescriptor15GenerateSamplesEiP9_IplImagei");

      procedure GenerateSamplesFast
        (this : access OneWayDescriptor;
         frontal : access opencv2_core_types_c_h.IplImage;
         pca_hr_avg : access opencv2_core_types_c_h.CvMat;
         pca_hr_eigenvectors : access opencv2_core_types_c_h.CvMat;
         pca_descriptors : access OneWayDescriptor);  -- /usr/include/opencv2/features2d/features2d.hpp:999
      pragma Import (CPP, GenerateSamplesFast, "_ZN2cv16OneWayDescriptor19GenerateSamplesFastEP9_IplImageP5CvMatS4_PS0_");

      procedure SetTransforms
        (this : access OneWayDescriptor;
         poses : access CvAffinePose;
         transforms : System.Address);  -- /usr/include/opencv2/features2d/features2d.hpp:1003
      pragma Import (CPP, SetTransforms, "_ZN2cv16OneWayDescriptor13SetTransformsEPNS_12CvAffinePoseEPP5CvMat");

      procedure Initialize
        (this : access OneWayDescriptor;
         pose_count : int;
         frontal : access opencv2_core_types_c_h.IplImage;
         feature_name : Interfaces.C.Strings.chars_ptr;
         norm : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1010
      pragma Import (CPP, Initialize, "_ZN2cv16OneWayDescriptor10InitializeEiP9_IplImagePKci");

      procedure InitializeFast
        (this : access OneWayDescriptor;
         pose_count : int;
         frontal : access opencv2_core_types_c_h.IplImage;
         feature_name : Interfaces.C.Strings.chars_ptr;
         pca_hr_avg : access opencv2_core_types_c_h.CvMat;
         pca_hr_eigenvectors : access opencv2_core_types_c_h.CvMat;
         pca_descriptors : access OneWayDescriptor);  -- /usr/include/opencv2/features2d/features2d.hpp:1020
      pragma Import (CPP, InitializeFast, "_ZN2cv16OneWayDescriptor14InitializeFastEiP9_IplImagePKcP5CvMatS6_PS0_");

      procedure ProjectPCASample
        (this : access constant OneWayDescriptor;
         patch : access opencv2_core_types_c_h.IplImage;
         avg : access opencv2_core_types_c_h.CvMat;
         eigenvectors : access opencv2_core_types_c_h.CvMat;
         pca_coeffs : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/features2d/features2d.hpp:1028
      pragma Import (CPP, ProjectPCASample, "_ZNK2cv16OneWayDescriptor16ProjectPCASampleEP9_IplImageP5CvMatS4_S4_");

      procedure InitializePCACoeffs
        (this : access OneWayDescriptor;
         avg : access opencv2_core_types_c_h.CvMat;
         eigenvectors : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/features2d/features2d.hpp:1033
      pragma Import (CPP, InitializePCACoeffs, "_ZN2cv16OneWayDescriptor19InitializePCACoeffsEP5CvMatS2_");

      procedure EstimatePose
        (this : access constant OneWayDescriptor;
         patch : access opencv2_core_types_c_h.IplImage;
         pose_idx : access int;
         distance : access float);  -- /usr/include/opencv2/features2d/features2d.hpp:1039
      pragma Import (CPP, EstimatePose, "_ZNK2cv16OneWayDescriptor12EstimatePoseEP9_IplImageRiRf");

      procedure EstimatePosePCA
        (this : access constant OneWayDescriptor;
         patch : System.Address;
         pose_idx : access int;
         distance : access float;
         avg : access opencv2_core_types_c_h.CvMat;
         eigenvalues : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/features2d/features2d.hpp:1048
      pragma Import (CPP, EstimatePosePCA, "_ZNK2cv16OneWayDescriptor15EstimatePosePCAEPvRiRfP5CvMatS5_");

      function GetPatchSize (this : access constant OneWayDescriptor) return opencv2_core_types_c_h.Class_CvSize.CvSize;  -- /usr/include/opencv2/features2d/features2d.hpp:1051
      pragma Import (CPP, GetPatchSize, "_ZNK2cv16OneWayDescriptor12GetPatchSizeEv");

      function GetInputPatchSize (this : access constant OneWayDescriptor) return opencv2_core_types_c_h.Class_CvSize.CvSize;  -- /usr/include/opencv2/features2d/features2d.hpp:1058
      pragma Import (CPP, GetInputPatchSize, "_ZNK2cv16OneWayDescriptor17GetInputPatchSizeEv");

      function GetPatch (this : access OneWayDescriptor; index : int) return access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/features2d/features2d.hpp:1066
      pragma Import (CPP, GetPatch, "_ZN2cv16OneWayDescriptor8GetPatchEi");

      function GetPose (this : access constant OneWayDescriptor; index : int) return CvAffinePose;  -- /usr/include/opencv2/features2d/features2d.hpp:1071
      pragma Import (CPP, GetPose, "_ZNK2cv16OneWayDescriptor7GetPoseEi");

      procedure Save (this : access OneWayDescriptor; path : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:1074
      pragma Import (CPP, Save, "_ZN2cv16OneWayDescriptor4SaveEPKc");

      function ReadByName
        (this : access OneWayDescriptor;
         fs : System.Address;
         parent : access opencv2_core_types_c_h.CvFileNode;
         name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1081
      pragma Import (CPP, ReadByName, "_ZN2cv16OneWayDescriptor10ReadByNameEP13CvFileStorageP10CvFileNodePKc");

      function ReadByName
        (this : access OneWayDescriptor;
         parent : access constant opencv2_core_core_hpp.Class_FileNode.FileNode;
         name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1087
      pragma Import (CPP, ReadByName, "_ZN2cv16OneWayDescriptor10ReadByNameERKNS_8FileNodeEPKc");

      procedure Write
        (this : access OneWayDescriptor;
         fs : System.Address;
         name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:1092
      pragma Import (CPP, Write, "_ZN2cv16OneWayDescriptor5WriteEP13CvFileStoragePKc");

      function GetFeatureName (this : access constant OneWayDescriptor) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:1095
      pragma Import (CPP, GetFeatureName, "_ZNK2cv16OneWayDescriptor14GetFeatureNameEv");

      function GetCenter (this : access constant OneWayDescriptor) return opencv2_core_types_c_h.CvPoint;  -- /usr/include/opencv2/features2d/features2d.hpp:1098
      pragma Import (CPP, GetCenter, "_ZNK2cv16OneWayDescriptor9GetCenterEv");

      procedure SetPCADimHigh (this : access OneWayDescriptor; pca_dim_high : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1100
      pragma Import (CPP, SetPCADimHigh, "_ZN2cv16OneWayDescriptor13SetPCADimHighEi");

      procedure SetPCADimLow (this : access OneWayDescriptor; pca_dim_low : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1101
      pragma Import (CPP, SetPCADimLow, "_ZN2cv16OneWayDescriptor12SetPCADimLowEi");

      function GetPCADimLow (this : access constant OneWayDescriptor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1103
      pragma Import (CPP, GetPCADimLow, "_ZNK2cv16OneWayDescriptor12GetPCADimLowEv");

      function GetPCADimHigh (this : access constant OneWayDescriptor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1104
      pragma Import (CPP, GetPCADimHigh, "_ZNK2cv16OneWayDescriptor13GetPCADimHighEv");

      function GetPCACoeffs (this : access constant OneWayDescriptor) return System.Address;  -- /usr/include/opencv2/features2d/features2d.hpp:1106
      pragma Import (CPP, GetPCACoeffs, "_ZNK2cv16OneWayDescriptor12GetPCACoeffsEv");
   end;
   use Class_OneWayDescriptor;
   package Class_OneWayDescriptorBase is
      type OneWayDescriptorBase is tagged limited record
         m_patch_size : aliased opencv2_core_types_c_h.Class_CvSize.CvSize;  -- /usr/include/opencv2/features2d/features2d.hpp:1283
         m_pose_count : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1284
         m_train_feature_count : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1285
         m_descriptors : access OneWayDescriptor;  -- /usr/include/opencv2/features2d/features2d.hpp:1286
         m_pca_avg : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/features2d/features2d.hpp:1287
         m_pca_eigenvectors : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/features2d/features2d.hpp:1288
         m_pca_hr_avg : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/features2d/features2d.hpp:1289
         m_pca_hr_eigenvectors : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/features2d/features2d.hpp:1290
         m_pca_descriptors : access OneWayDescriptor;  -- /usr/include/opencv2/features2d/features2d.hpp:1291
         m_pca_descriptors_tree : access opencv2_flann_miniflann_hpp.Class_Index.Index;  -- /usr/include/opencv2/features2d/features2d.hpp:1293
         m_pca_descriptors_matrix : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/features2d/features2d.hpp:1294
         m_poses : access CvAffinePose;  -- /usr/include/opencv2/features2d/features2d.hpp:1296
         m_transforms : System.Address;  -- /usr/include/opencv2/features2d/features2d.hpp:1297
         m_pca_dim_high : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1299
         m_pca_dim_low : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1300
         m_pyr_levels : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1302
         scale_min : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1303
         scale_max : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1304
         scale_step : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1305
      end record;
      pragma Import (CPP, OneWayDescriptorBase);

      function New_OneWayDescriptorBase
        (patch_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
         pose_count : int;
         train_path : Interfaces.C.Strings.chars_ptr;
         pca_config : Interfaces.C.Strings.chars_ptr;
         pca_hr_config : Interfaces.C.Strings.chars_ptr;
         pca_desc_config : Interfaces.C.Strings.chars_ptr;
         pyr_levels : int;
         pca_dim_high : int;
         pca_dim_low : int) return OneWayDescriptorBase;  -- /usr/include/opencv2/features2d/features2d.hpp:1140
      pragma CPP_Constructor (New_OneWayDescriptorBase, "_ZN2cv20OneWayDescriptorBaseC1E6CvSizeiPKcS3_S3_S3_iii");

      function New_OneWayDescriptorBase
        (patch_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
         pose_count : int;
         pca_filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         train_path : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         images_list : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         u_scale_min : float;
         u_scale_max : float;
         u_scale_step : float;
         pyr_levels : int;
         pca_dim_high : int;
         pca_dim_low : int) return OneWayDescriptorBase;  -- /usr/include/opencv2/features2d/features2d.hpp:1144
      pragma CPP_Constructor (New_OneWayDescriptorBase, "_ZN2cv20OneWayDescriptorBaseC1E6CvSizeiRKSsS3_S3_fffiii");

      procedure Delete_OneWayDescriptorBase (this : access OneWayDescriptorBase);  -- /usr/include/opencv2/features2d/features2d.hpp:1149
      pragma Import (CPP, Delete_OneWayDescriptorBase, "_ZN2cv20OneWayDescriptorBaseD1Ev");

      procedure deleting_dtor (this : access OneWayDescriptorBase);  -- /usr/include/opencv2/features2d/features2d.hpp:1149
      pragma Import (CPP, deleting_dtor, "_ZN2cv20OneWayDescriptorBaseD0Ev");

      procedure clear (this : access OneWayDescriptorBase'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1150
      pragma Import (CPP, clear, "_ZN2cv20OneWayDescriptorBase5clearEv");

      procedure Allocate (this : access OneWayDescriptorBase'Class; train_feature_count : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1154
      pragma Import (CPP, Allocate, "_ZN2cv20OneWayDescriptorBase8AllocateEi");

      procedure AllocatePCADescriptors (this : access OneWayDescriptorBase'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1157
      pragma Import (CPP, AllocatePCADescriptors, "_ZN2cv20OneWayDescriptorBase22AllocatePCADescriptorsEv");

      function GetPatchSize (this : access constant OneWayDescriptorBase'Class) return opencv2_core_types_c_h.Class_CvSize.CvSize;  -- /usr/include/opencv2/features2d/features2d.hpp:1160
      pragma Import (CPP, GetPatchSize, "_ZNK2cv20OneWayDescriptorBase12GetPatchSizeEv");

      function GetPoseCount (this : access constant OneWayDescriptorBase'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1162
      pragma Import (CPP, GetPoseCount, "_ZNK2cv20OneWayDescriptorBase12GetPoseCountEv");

      function GetPyrLevels (this : access constant OneWayDescriptorBase'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1165
      pragma Import (CPP, GetPyrLevels, "_ZNK2cv20OneWayDescriptorBase12GetPyrLevelsEv");

      function GetDescriptorCount (this : access constant OneWayDescriptorBase'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1168
      pragma Import (CPP, GetDescriptorCount, "_ZNK2cv20OneWayDescriptorBase18GetDescriptorCountEv");

      procedure CreateDescriptorsFromImage
        (this : access OneWayDescriptorBase'Class;
         src : access opencv2_core_types_c_h.IplImage;
         features : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:1174
      pragma Import (CPP, CreateDescriptorsFromImage, "_ZN2cv20OneWayDescriptorBase26CreateDescriptorsFromImageEP9_IplImageRKSt6vectorINS_8KeyPointESaIS4_EE");

      procedure CreatePCADescriptors (this : access OneWayDescriptorBase'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1177
      pragma Import (CPP, CreatePCADescriptors, "_ZN2cv20OneWayDescriptorBase20CreatePCADescriptorsEv");

      function GetDescriptor (this : access constant OneWayDescriptorBase'Class; desc_idx : int) return access constant OneWayDescriptor;  -- /usr/include/opencv2/features2d/features2d.hpp:1180
      pragma Import (CPP, GetDescriptor, "_ZNK2cv20OneWayDescriptorBase13GetDescriptorEi");

      procedure FindDescriptor
        (this : access constant OneWayDescriptorBase'Class;
         patch : access opencv2_core_types_c_h.IplImage;
         desc_idx : access int;
         pose_idx : access int;
         distance : access float;
         u_scale : access float;
         scale_ranges : access float);  -- /usr/include/opencv2/features2d/features2d.hpp:1189
      pragma Import (CPP, FindDescriptor, "_ZNK2cv20OneWayDescriptorBase14FindDescriptorEP9_IplImageRiS3_RfPfS5_");

      procedure FindDescriptor
        (this : access constant OneWayDescriptorBase'Class;
         patch : access opencv2_core_types_c_h.IplImage;
         n : int;
         desc_idxs : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         pose_idxs : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         distances : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         u_scales : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         scale_ranges : access float);  -- /usr/include/opencv2/features2d/features2d.hpp:1198
      pragma Import (CPP, FindDescriptor, "_ZNK2cv20OneWayDescriptorBase14FindDescriptorEP9_IplImageiRSt6vectorIiSaIiEES6_RS3_IfSaIfEES9_Pf");

      procedure FindDescriptor
        (this : access constant OneWayDescriptorBase'Class;
         src : access opencv2_core_types_c_h.IplImage;
         pt : opencv2_core_core_hpp.Class_Point2f.Point2f;
         desc_idx : access int;
         pose_idx : access int;
         distance : access float);  -- /usr/include/opencv2/features2d/features2d.hpp:1207
      pragma Import (CPP, FindDescriptor, "_ZNK2cv20OneWayDescriptorBase14FindDescriptorEP9_IplImageNS_6Point_IfEERiS5_Rf");

      procedure InitializePoses (this : access OneWayDescriptorBase'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1210
      pragma Import (CPP, InitializePoses, "_ZN2cv20OneWayDescriptorBase15InitializePosesEv");

      procedure InitializeTransformsFromPoses (this : access OneWayDescriptorBase'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1213
      pragma Import (CPP, InitializeTransformsFromPoses, "_ZN2cv20OneWayDescriptorBase29InitializeTransformsFromPosesEv");

      procedure InitializePoseTransforms (this : access OneWayDescriptorBase'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1216
      pragma Import (CPP, InitializePoseTransforms, "_ZN2cv20OneWayDescriptorBase24InitializePoseTransformsEv");

      procedure InitializeDescriptor
        (this : access OneWayDescriptorBase'Class;
         desc_idx : int;
         train_image : access opencv2_core_types_c_h.IplImage;
         feature_label : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:1222
      pragma Import (CPP, InitializeDescriptor, "_ZN2cv20OneWayDescriptorBase20InitializeDescriptorEiP9_IplImagePKc");

      procedure InitializeDescriptor
        (this : access OneWayDescriptorBase'Class;
         desc_idx : int;
         train_image : access opencv2_core_types_c_h.IplImage;
         keypoint : access constant KeyPoint;
         feature_label : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:1224
      pragma Import (CPP, InitializeDescriptor, "_ZN2cv20OneWayDescriptorBase20InitializeDescriptorEiP9_IplImageRKNS_8KeyPointEPKc");

      procedure InitializeDescriptors
        (this : access OneWayDescriptorBase'Class;
         train_image : access opencv2_core_types_c_h.IplImage;
         features : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         feature_label : Interfaces.C.Strings.chars_ptr;
         desc_start_idx : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1227
      pragma Import (CPP, InitializeDescriptors, "_ZN2cv20OneWayDescriptorBase21InitializeDescriptorsEP9_IplImageRKSt6vectorINS_8KeyPointESaIS4_EEPKci");

      procedure Write (this : access constant OneWayDescriptorBase'Class; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1232
      pragma Import (CPP, Write, "_ZNK2cv20OneWayDescriptorBase5WriteERNS_11FileStorageE");

      procedure Read (this : access OneWayDescriptorBase'Class; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1236
      pragma Import (CPP, Read, "_ZN2cv20OneWayDescriptorBase4ReadERKNS_8FileNodeE");

      function LoadPCADescriptors (this : access OneWayDescriptorBase'Class; filename : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1240
      pragma Import (CPP, LoadPCADescriptors, "_ZN2cv20OneWayDescriptorBase18LoadPCADescriptorsEPKc");

      function LoadPCADescriptors (this : access OneWayDescriptorBase'Class; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1244
      pragma Import (CPP, LoadPCADescriptors, "_ZN2cv20OneWayDescriptorBase18LoadPCADescriptorsERKNS_8FileNodeE");

      procedure SavePCADescriptors (this : access OneWayDescriptorBase'Class; filename : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:1248
      pragma Import (CPP, SavePCADescriptors, "_ZN2cv20OneWayDescriptorBase18SavePCADescriptorsEPKc");

      procedure SavePCADescriptors (this : access constant OneWayDescriptorBase'Class; fs : System.Address);  -- /usr/include/opencv2/features2d/features2d.hpp:1252
      pragma Import (CPP, SavePCADescriptors, "_ZNK2cv20OneWayDescriptorBase18SavePCADescriptorsEP13CvFileStorage");

      procedure GeneratePCA
        (this : access OneWayDescriptorBase'Class;
         img_path : Interfaces.C.Strings.chars_ptr;
         images_list : Interfaces.C.Strings.chars_ptr;
         pose_count : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1257
      pragma Import (CPP, GeneratePCA, "_ZN2cv20OneWayDescriptorBase11GeneratePCAEPKcS2_i");

      procedure SetPCAHigh
        (this : access OneWayDescriptorBase'Class;
         avg : access opencv2_core_types_c_h.CvMat;
         eigenvectors : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/features2d/features2d.hpp:1260
      pragma Import (CPP, SetPCAHigh, "_ZN2cv20OneWayDescriptorBase10SetPCAHighEP5CvMatS2_");

      procedure SetPCALow
        (this : access OneWayDescriptorBase'Class;
         avg : access opencv2_core_types_c_h.CvMat;
         eigenvectors : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/features2d/features2d.hpp:1263
      pragma Import (CPP, SetPCALow, "_ZN2cv20OneWayDescriptorBase9SetPCALowEP5CvMatS2_");

      function GetLowPCA
        (this : access OneWayDescriptorBase'Class;
         avg : System.Address;
         eigenvectors : System.Address) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1265
      pragma Import (CPP, GetLowPCA, "_ZN2cv20OneWayDescriptorBase9GetLowPCAEPP5CvMatS3_");

      function GetPCADimLow (this : access constant OneWayDescriptorBase'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1272
      pragma Import (CPP, GetPCADimLow, "_ZNK2cv20OneWayDescriptorBase12GetPCADimLowEv");

      function GetPCADimHigh (this : access constant OneWayDescriptorBase'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1273
      pragma Import (CPP, GetPCADimHigh, "_ZNK2cv20OneWayDescriptorBase13GetPCADimHighEv");

      procedure ConvertDescriptorsArrayToTree (this : access OneWayDescriptorBase'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1275
      pragma Import (CPP, ConvertDescriptorsArrayToTree, "_ZN2cv20OneWayDescriptorBase29ConvertDescriptorsArrayToTreeEv");

      function GetPCAFilename return cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/features2d/features2d.hpp:1278
      pragma Import (CPP, GetPCAFilename, "_ZN2cv20OneWayDescriptorBase14GetPCAFilenameEv");

      function empty (this : access constant OneWayDescriptorBase) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1280
      pragma Import (CPP, empty, "_ZNK2cv20OneWayDescriptorBase5emptyEv");

      procedure SavePCAall (this : access constant OneWayDescriptorBase'Class; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1309
      pragma Import (CPP, SavePCAall, "_ZNK2cv20OneWayDescriptorBase10SavePCAallERNS_11FileStorageE");

      procedure LoadPCAall (this : access OneWayDescriptorBase'Class; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1313
      pragma Import (CPP, LoadPCAall, "_ZN2cv20OneWayDescriptorBase10LoadPCAallERKNS_8FileNodeE");
   end;
   use Class_OneWayDescriptorBase;
   package Class_OneWayDescriptorObject is
      type OneWayDescriptorObject is limited new OneWayDescriptorBase with record
         m_part_id : access int;  -- /usr/include/opencv2/features2d/features2d.hpp:1367
         m_train_features : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:1368
         m_object_feature_count : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1369
      end record;
      pragma Import (CPP, OneWayDescriptorObject);

      function New_OneWayDescriptorObject
        (patch_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
         pose_count : int;
         train_path : Interfaces.C.Strings.chars_ptr;
         pca_config : Interfaces.C.Strings.chars_ptr;
         pca_hr_config : Interfaces.C.Strings.chars_ptr;
         pca_desc_config : Interfaces.C.Strings.chars_ptr;
         pyr_levels : int) return OneWayDescriptorObject;  -- /usr/include/opencv2/features2d/features2d.hpp:1327
      pragma CPP_Constructor (New_OneWayDescriptorObject, "_ZN2cv22OneWayDescriptorObjectC1E6CvSizeiPKcS3_S3_S3_i");

      function New_OneWayDescriptorObject
        (patch_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
         pose_count : int;
         pca_filename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         train_path : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         images_list : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string;
         u_scale_min : float;
         u_scale_max : float;
         u_scale_step : float;
         pyr_levels : int) return OneWayDescriptorObject;  -- /usr/include/opencv2/features2d/features2d.hpp:1330
      pragma CPP_Constructor (New_OneWayDescriptorObject, "_ZN2cv22OneWayDescriptorObjectC1E6CvSizeiRKSsS3_S3_fffi");

      procedure Delete_OneWayDescriptorObject (this : access OneWayDescriptorObject);  -- /usr/include/opencv2/features2d/features2d.hpp:1335
      pragma Import (CPP, Delete_OneWayDescriptorObject, "_ZN2cv22OneWayDescriptorObjectD1Ev");

      procedure deleting_dtor (this : access OneWayDescriptorObject);  -- /usr/include/opencv2/features2d/features2d.hpp:1335
      pragma Import (CPP, deleting_dtor, "_ZN2cv22OneWayDescriptorObjectD0Ev");

      procedure Allocate
        (this : access OneWayDescriptorObject'Class;
         train_feature_count : int;
         object_feature_count : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1340
      pragma Import (CPP, Allocate, "_ZN2cv22OneWayDescriptorObject8AllocateEii");

      procedure SetLabeledFeatures (this : access OneWayDescriptorObject'Class; features : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:1343
      pragma Import (CPP, SetLabeledFeatures, "_ZN2cv22OneWayDescriptorObject18SetLabeledFeaturesERKSt6vectorINS_8KeyPointESaIS2_EE");

      function GetLabeledFeatures (this : access OneWayDescriptorObject'Class) return access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:1344
      pragma Import (CPP, GetLabeledFeatures, "_ZN2cv22OneWayDescriptorObject18GetLabeledFeaturesEv");

      function GetLabeledFeatures (this : access constant OneWayDescriptorObject'Class) return access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:1345
      pragma Import (CPP, GetLabeledFeatures, "_ZNK2cv22OneWayDescriptorObject18GetLabeledFeaturesEv");

      --  skipped func _GetLabeledFeatures

      function IsDescriptorObject (this : access constant OneWayDescriptorObject'Class; desc_idx : int) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1349
      pragma Import (CPP, IsDescriptorObject, "_ZNK2cv22OneWayDescriptorObject18IsDescriptorObjectEi");

      function MatchPointToPart (this : access constant OneWayDescriptorObject'Class; pt : opencv2_core_types_c_h.CvPoint) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1352
      pragma Import (CPP, MatchPointToPart, "_ZNK2cv22OneWayDescriptorObject16MatchPointToPartE7CvPoint");

      function GetDescriptorPart (this : access constant OneWayDescriptorObject'Class; desc_idx : int) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1356
      pragma Import (CPP, GetDescriptorPart, "_ZNK2cv22OneWayDescriptorObject17GetDescriptorPartEi");

      procedure InitializeObjectDescriptors
        (this : access OneWayDescriptorObject'Class;
         train_image : access opencv2_core_types_c_h.IplImage;
         features : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         feature_label : Interfaces.C.Strings.chars_ptr;
         desc_start_idx : int;
         scale : float;
         is_background : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1359
      pragma Import (CPP, InitializeObjectDescriptors, "_ZN2cv22OneWayDescriptorObject27InitializeObjectDescriptorsEP9_IplImageRKSt6vectorINS_8KeyPointESaIS4_EEPKcifi");

      function GetObjectFeatureCount (this : access constant OneWayDescriptorObject'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1364
      pragma Import (CPP, GetObjectFeatureCount, "_ZNK2cv22OneWayDescriptorObject21GetObjectFeatureCountEv");
   end;
   use Class_OneWayDescriptorObject;
   package Class_FeatureDetector is
      type FeatureDetector is abstract tagged limited record
         null;
      end record;
      pragma Import (CPP, FeatureDetector);

      function New_FeatureDetector return FeatureDetector is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:1381
      pragma CPP_Constructor (New_FeatureDetector, "_ZN2cv15FeatureDetectorC1Ev");

      function operator_as (this : access FeatureDetector'Class; arg2 : access constant FeatureDetector'Class) return access FeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1381
      pragma Import (CPP, operator_as, "_ZN2cv15FeatureDetectoraSERKS0_");

      procedure Delete_FeatureDetector (this : access FeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1384
      pragma Import (CPP, Delete_FeatureDetector, "_ZN2cv15FeatureDetectorD1Ev");

      procedure deleting_dtor (this : access FeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1384
      pragma Import (CPP, deleting_dtor, "_ZN2cv15FeatureDetectorD0Ev");

      procedure detect
        (this : access constant FeatureDetector'Class;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1393
      pragma Import (CPP, detect, "_ZNK2cv15FeatureDetector6detectERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure detect
        (this : access constant FeatureDetector'Class;
         images : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:1401
      pragma Import (CPP, detect, "_ZNK2cv15FeatureDetector6detectERKSt6vectorINS_3MatESaIS2_EERS1_IS1_INS_8KeyPointESaIS7_EESaIS9_EES6_");

      procedure read (this : access FeatureDetector; arg2 : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1404
      pragma Import (CPP, read, "_ZN2cv15FeatureDetector4readERKNS_8FileNodeE");

      procedure write (this : access constant FeatureDetector; arg2 : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1406
      pragma Import (CPP, write, "_ZNK2cv15FeatureDetector5writeERNS_11FileStorageE");

      function empty (this : access constant FeatureDetector) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1409
      pragma Import (CPP, empty, "_ZNK2cv15FeatureDetector5emptyEv");

      function create (detectorType : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:1412
      pragma Import (CPP, create, "_ZN2cv15FeatureDetector6createERKSs");

      procedure detectImpl
        (this : access constant FeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat) is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:1415

      procedure removeInvalidPoints (mask : access constant opencv2_core_core_hpp.Class_Mat.Mat; keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:1422
      pragma Import (CPP, removeInvalidPoints, "_ZN2cv15FeatureDetector19removeInvalidPointsERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EE");
   end;
   use Class_FeatureDetector;
   package Class_FastFeatureDetector is
      type FastFeatureDetector is limited new FeatureDetector with record
         threshold : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1435
         nonmaxSuppression : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1436
      end record;
      pragma Import (CPP, FastFeatureDetector);

      function New_FastFeatureDetector (threshold : int; nonmaxSuppression : Extensions.bool) return FastFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1428
      pragma CPP_Constructor (New_FastFeatureDetector, "_ZN2cv19FastFeatureDetectorC1Eib");

      procedure read (this : access FastFeatureDetector; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1429
      pragma Import (CPP, read, "_ZN2cv19FastFeatureDetector4readERKNS_8FileNodeE");

      procedure write (this : access constant FastFeatureDetector; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1430
      pragma Import (CPP, write, "_ZNK2cv19FastFeatureDetector5writeERNS_11FileStorageE");

      procedure detectImpl
        (this : access constant FastFeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1433
      pragma Import (CPP, detectImpl, "_ZNK2cv19FastFeatureDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_FastFeatureDetector (this : access FastFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1425
      pragma Import (CPP, Delete_FastFeatureDetector, "_ZN2cv19FastFeatureDetectorD1Ev");

      procedure deleting_dtor (this : access FastFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1425
      pragma Import (CPP, deleting_dtor, "_ZN2cv19FastFeatureDetectorD0Ev");
   end;
   use Class_FastFeatureDetector;
   type GoodFeaturesToTrackDetector;
   type Params is record
      maxCorners : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1451
      qualityLevel : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1452
      minDistance : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1453
      blockSize : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1454
      useHarrisDetector : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1455
      k : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1456
   end record;
   pragma Convention (C_Pass_By_Copy, Params);
   package Class_GoodFeaturesToTrackDetector is
      type GoodFeaturesToTrackDetector is limited new FeatureDetector with record
         the_params : aliased Params;  -- /usr/include/opencv2/features2d/features2d.hpp:1468
      end record;
      pragma Import (CPP, GoodFeaturesToTrackDetector);

      function New_GoodFeaturesToTrackDetector (params : access constant Params) return GoodFeaturesToTrackDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1459
      pragma CPP_Constructor (New_GoodFeaturesToTrackDetector, "_ZN2cv27GoodFeaturesToTrackDetectorC1ERKNS0_6ParamsE");

      function New_GoodFeaturesToTrackDetector
        (maxCorners : int;
         qualityLevel : double;
         minDistance : double;
         blockSize : int;
         useHarrisDetector : Extensions.bool;
         k : double) return GoodFeaturesToTrackDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1460
      pragma CPP_Constructor (New_GoodFeaturesToTrackDetector, "_ZN2cv27GoodFeaturesToTrackDetectorC1Eiddibd");

      procedure read (this : access GoodFeaturesToTrackDetector; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1462
      pragma Import (CPP, read, "_ZN2cv27GoodFeaturesToTrackDetector4readERKNS_8FileNodeE");

      procedure write (this : access constant GoodFeaturesToTrackDetector; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1463
      pragma Import (CPP, write, "_ZNK2cv27GoodFeaturesToTrackDetector5writeERNS_11FileStorageE");

      procedure detectImpl
        (this : access constant GoodFeaturesToTrackDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1466
      pragma Import (CPP, detectImpl, "_ZNK2cv27GoodFeaturesToTrackDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_GoodFeaturesToTrackDetector (this : access GoodFeaturesToTrackDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1440
      pragma Import (CPP, Delete_GoodFeaturesToTrackDetector, "_ZN2cv27GoodFeaturesToTrackDetectorD1Ev");

      procedure deleting_dtor (this : access GoodFeaturesToTrackDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1440
      pragma Import (CPP, deleting_dtor, "_ZN2cv27GoodFeaturesToTrackDetectorD0Ev");
   end;
   use Class_GoodFeaturesToTrackDetector;
   package Class_MserFeatureDetector is
      type MserFeatureDetector is limited new FeatureDetector with record
         the_mser : aliased MSER;  -- /usr/include/opencv2/features2d/features2d.hpp:1483
      end record;
      pragma Import (CPP, MserFeatureDetector);

      function New_MserFeatureDetector (params : CvMSERParams) return MserFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1474
      pragma CPP_Constructor (New_MserFeatureDetector, "_ZN2cv19MserFeatureDetectorC1E12CvMSERParams");

      function New_MserFeatureDetector
        (c_delta : int;
         minArea : int;
         maxArea : int;
         maxVariation : double;
         minDiversity : double;
         maxEvolution : int;
         areaThreshold : double;
         minMargin : double;
         edgeBlurSize : int) return MserFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1475
      pragma CPP_Constructor (New_MserFeatureDetector, "_ZN2cv19MserFeatureDetectorC1Eiiiddiddi");

      procedure read (this : access MserFeatureDetector; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1477
      pragma Import (CPP, read, "_ZN2cv19MserFeatureDetector4readERKNS_8FileNodeE");

      procedure write (this : access constant MserFeatureDetector; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1478
      pragma Import (CPP, write, "_ZNK2cv19MserFeatureDetector5writeERNS_11FileStorageE");

      procedure detectImpl
        (this : access constant MserFeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1481
      pragma Import (CPP, detectImpl, "_ZNK2cv19MserFeatureDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_MserFeatureDetector (this : access MserFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1471
      pragma Import (CPP, Delete_MserFeatureDetector, "_ZN2cv19MserFeatureDetectorD1Ev");

      procedure deleting_dtor (this : access MserFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1471
      pragma Import (CPP, deleting_dtor, "_ZN2cv19MserFeatureDetectorD0Ev");
   end;
   use Class_MserFeatureDetector;
   package Class_StarFeatureDetector is
      type StarFeatureDetector is limited new FeatureDetector with record
         star : aliased StarDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1498
      end record;
      pragma Import (CPP, StarFeatureDetector);

      function New_StarFeatureDetector (params : System.Address) return StarFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1489
      pragma CPP_Constructor (New_StarFeatureDetector, "_ZN2cv19StarFeatureDetectorC1ERK20CvStarDetectorParams");

      function New_StarFeatureDetector
        (maxSize : int;
         responseThreshold : int;
         lineThresholdProjected : int;
         lineThresholdBinarized : int;
         suppressNonmaxSize : int) return StarFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1490
      pragma CPP_Constructor (New_StarFeatureDetector, "_ZN2cv19StarFeatureDetectorC1Eiiiii");

      procedure read (this : access StarFeatureDetector; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1492
      pragma Import (CPP, read, "_ZN2cv19StarFeatureDetector4readERKNS_8FileNodeE");

      procedure write (this : access constant StarFeatureDetector; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1493
      pragma Import (CPP, write, "_ZNK2cv19StarFeatureDetector5writeERNS_11FileStorageE");

      procedure detectImpl
        (this : access constant StarFeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1496
      pragma Import (CPP, detectImpl, "_ZNK2cv19StarFeatureDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_StarFeatureDetector (this : access StarFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1486
      pragma Import (CPP, Delete_StarFeatureDetector, "_ZN2cv19StarFeatureDetectorD1Ev");

      procedure deleting_dtor (this : access StarFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1486
      pragma Import (CPP, deleting_dtor, "_ZN2cv19StarFeatureDetectorD0Ev");
   end;
   use Class_StarFeatureDetector;
   package Class_SiftFeatureDetector is
      type SiftFeatureDetector is limited new FeatureDetector with record
         the_sift : aliased SIFT;  -- /usr/include/opencv2/features2d/features2d.hpp:1517
      end record;
      pragma Import (CPP, SiftFeatureDetector);

      function New_SiftFeatureDetector (detectorParams : access constant DetectorParams; commonParams : access constant CommonParams) return SiftFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1504
      pragma CPP_Constructor (New_SiftFeatureDetector, "_ZN2cv19SiftFeatureDetectorC1ERKNS_4SIFT14DetectorParamsERKNS1_12CommonParamsE");

      function New_SiftFeatureDetector
        (threshold : double;
         edgeThreshold : double;
         nOctaves : int;
         nOctaveLayers : int;
         firstOctave : int;
         angleMode : int) return SiftFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1506
      pragma CPP_Constructor (New_SiftFeatureDetector, "_ZN2cv19SiftFeatureDetectorC1Eddiiii");

      procedure read (this : access SiftFeatureDetector; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1511
      pragma Import (CPP, read, "_ZN2cv19SiftFeatureDetector4readERKNS_8FileNodeE");

      procedure write (this : access constant SiftFeatureDetector; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1512
      pragma Import (CPP, write, "_ZNK2cv19SiftFeatureDetector5writeERNS_11FileStorageE");

      procedure detectImpl
        (this : access constant SiftFeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1515
      pragma Import (CPP, detectImpl, "_ZNK2cv19SiftFeatureDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_SiftFeatureDetector (this : access SiftFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1501
      pragma Import (CPP, Delete_SiftFeatureDetector, "_ZN2cv19SiftFeatureDetectorD1Ev");

      procedure deleting_dtor (this : access SiftFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1501
      pragma Import (CPP, deleting_dtor, "_ZN2cv19SiftFeatureDetectorD0Ev");
   end;
   use Class_SiftFeatureDetector;
   package Class_SurfFeatureDetector is
      type SurfFeatureDetector is limited new FeatureDetector with record
         the_surf : aliased SURF;  -- /usr/include/opencv2/features2d/features2d.hpp:1530
      end record;
      pragma Import (CPP, SurfFeatureDetector);

      function New_SurfFeatureDetector
        (hessianThreshold : double;
         octaves : int;
         octaveLayers : int;
         upright : Extensions.bool) return SurfFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1523
      pragma CPP_Constructor (New_SurfFeatureDetector, "_ZN2cv19SurfFeatureDetectorC1Ediib");

      procedure read (this : access SurfFeatureDetector; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1524
      pragma Import (CPP, read, "_ZN2cv19SurfFeatureDetector4readERKNS_8FileNodeE");

      procedure write (this : access constant SurfFeatureDetector; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1525
      pragma Import (CPP, write, "_ZNK2cv19SurfFeatureDetector5writeERNS_11FileStorageE");

      procedure detectImpl
        (this : access constant SurfFeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1528
      pragma Import (CPP, detectImpl, "_ZNK2cv19SurfFeatureDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_SurfFeatureDetector (this : access SurfFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1520
      pragma Import (CPP, Delete_SurfFeatureDetector, "_ZN2cv19SurfFeatureDetectorD1Ev");

      procedure deleting_dtor (this : access SurfFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1520
      pragma Import (CPP, deleting_dtor, "_ZN2cv19SurfFeatureDetectorD0Ev");
   end;
   use Class_SurfFeatureDetector;
   package Class_OrbFeatureDetector is
      type OrbFeatureDetector is limited new FeatureDetector with record
         orb_u : aliased ORB;  -- /usr/include/opencv2/features2d/features2d.hpp:1553
         params_u : aliased CommonParams;  -- /usr/include/opencv2/features2d/features2d.hpp:1555
         n_features_u : aliased unsigned;  -- /usr/include/opencv2/features2d/features2d.hpp:1557
      end record;
      pragma Import (CPP, OrbFeatureDetector);

      function New_OrbFeatureDetector (n_features : stddef_h.size_t; params : CommonParams) return OrbFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1543
      pragma CPP_Constructor (New_OrbFeatureDetector, "_ZN2cv18OrbFeatureDetectorC1EmNS_3ORB12CommonParamsE");

      procedure read (this : access OrbFeatureDetector; arg2 : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1545
      pragma Import (CPP, read, "_ZN2cv18OrbFeatureDetector4readERKNS_8FileNodeE");

      procedure write (this : access constant OrbFeatureDetector; arg2 : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1546
      pragma Import (CPP, write, "_ZNK2cv18OrbFeatureDetector5writeERNS_11FileStorageE");

      procedure detectImpl
        (this : access constant OrbFeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1550
      pragma Import (CPP, detectImpl, "_ZNK2cv18OrbFeatureDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_OrbFeatureDetector (this : access OrbFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1536
      pragma Import (CPP, Delete_OrbFeatureDetector, "_ZN2cv18OrbFeatureDetectorD1Ev");

      procedure deleting_dtor (this : access OrbFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1536
      pragma Import (CPP, deleting_dtor, "_ZN2cv18OrbFeatureDetectorD0Ev");
   end;
   use Class_OrbFeatureDetector;
   type SimpleBlobDetector;
   type Params is record
      thresholdStep : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1566
      minThreshold : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1567
      maxThreshold : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1568
      minRepeatability : aliased stddef_h.size_t;  -- /usr/include/opencv2/features2d/features2d.hpp:1569
      minDistBetweenBlobs : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1570
      filterByColor : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1572
      blobColor : aliased opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/features2d/features2d.hpp:1573
      filterByArea : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1575
      minArea : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1576
      maxArea : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1576
      filterByCircularity : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1578
      minCircularity : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1579
      maxCircularity : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1579
      filterByInertia : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1581
      minInertiaRatio : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1582
      maxInertiaRatio : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1582
      filterByConvexity : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1584
      minConvexity : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1585
      maxConvexity : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1585
   end record;
   pragma Convention (C_Pass_By_Copy, Params);
   type Center is record
      location : aliased opencv2_core_core_hpp.Class_Point2d.Point2d;  -- /usr/include/opencv2/features2d/features2d.hpp:1599
      radius : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1600
      confidence : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1601
   end record;
   pragma Convention (C_Pass_By_Copy, Center);
   package Class_SimpleBlobDetector is
      type SimpleBlobDetector is limited new FeatureDetector with record
         the_params : aliased Params;  -- /usr/include/opencv2/features2d/features2d.hpp:1607
      end record;
      pragma Import (CPP, SimpleBlobDetector);

      function New_SimpleBlobDetector (parameters : access constant Params) return SimpleBlobDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1591
      pragma CPP_Constructor (New_SimpleBlobDetector, "_ZN2cv18SimpleBlobDetectorC1ERKNS0_6ParamsE");

      procedure read (this : access SimpleBlobDetector; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1593
      pragma Import (CPP, read, "_ZN2cv18SimpleBlobDetector4readERKNS_8FileNodeE");

      procedure write (this : access constant SimpleBlobDetector; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1594
      pragma Import (CPP, write, "_ZNK2cv18SimpleBlobDetector5writeERNS_11FileStorageE");

      procedure detectImpl
        (this : access constant SimpleBlobDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1604
      pragma Import (CPP, detectImpl, "_ZNK2cv18SimpleBlobDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure findBlobs
        (this : access constant SimpleBlobDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         binaryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         centers : System.Address);  -- /usr/include/opencv2/features2d/features2d.hpp:1605
      pragma Import (CPP, findBlobs, "_ZNK2cv18SimpleBlobDetector9findBlobsERKNS_3MatES3_RSt6vectorINS0_6CenterESaIS5_EE");

      procedure Delete_SimpleBlobDetector (this : access SimpleBlobDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1560
      pragma Import (CPP, Delete_SimpleBlobDetector, "_ZN2cv18SimpleBlobDetectorD1Ev");

      procedure deleting_dtor (this : access SimpleBlobDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1560
      pragma Import (CPP, deleting_dtor, "_ZN2cv18SimpleBlobDetectorD0Ev");
   end;
   use Class_SimpleBlobDetector;
   type DenseFeatureDetector;
   type Params is record
      initFeatureScale : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1618
      featureScaleLevels : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1619
      featureScaleMul : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:1620
      initXyStep : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1622
      initImgBound : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1623
      varyXyStepWithScale : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1625
      varyImgBoundWithScale : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1626
   end record;
   pragma Convention (C_Pass_By_Copy, Params);
   package Class_DenseFeatureDetector is
      type DenseFeatureDetector is limited new FeatureDetector with record
         the_params : aliased Params;  -- /usr/include/opencv2/features2d/features2d.hpp:1640
      end record;
      pragma Import (CPP, DenseFeatureDetector);

      function New_DenseFeatureDetector (params : access constant Params) return DenseFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1632
      pragma CPP_Constructor (New_DenseFeatureDetector, "_ZN2cv20DenseFeatureDetectorC1ERKNS0_6ParamsE");

      procedure read (this : access DenseFeatureDetector; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1634
      pragma Import (CPP, read, "_ZN2cv20DenseFeatureDetector4readERKNS_8FileNodeE");

      procedure write (this : access constant DenseFeatureDetector; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1635
      pragma Import (CPP, write, "_ZNK2cv20DenseFeatureDetector5writeERNS_11FileStorageE");

      procedure detectImpl
        (this : access constant DenseFeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1638
      pragma Import (CPP, detectImpl, "_ZNK2cv20DenseFeatureDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_DenseFeatureDetector (this : access DenseFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1610
      pragma Import (CPP, Delete_DenseFeatureDetector, "_ZN2cv20DenseFeatureDetectorD1Ev");

      procedure deleting_dtor (this : access DenseFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1610
      pragma Import (CPP, deleting_dtor, "_ZN2cv20DenseFeatureDetectorD0Ev");
   end;
   use Class_DenseFeatureDetector;
   package Class_GridAdaptedFeatureDetector is
      type GridAdaptedFeatureDetector is limited new FeatureDetector with record
         detector : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:1666
         maxTotalKeypoints : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1667
         gridRows : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1668
         gridCols : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1669
      end record;
      pragma Import (CPP, GridAdaptedFeatureDetector);

      function New_GridAdaptedFeatureDetector
        (detector : access constant opencv2_core_core_hpp.Class_Ptr.Ptr;
         maxTotalKeypoints : int;
         gridRows : int;
         gridCols : int) return GridAdaptedFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1657
      pragma CPP_Constructor (New_GridAdaptedFeatureDetector, "_ZN2cv26GridAdaptedFeatureDetectorC1ERKNS_3PtrINS_15FeatureDetectorEEEiii");

      function empty (this : access constant GridAdaptedFeatureDetector) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1661
      pragma Import (CPP, empty, "_ZNK2cv26GridAdaptedFeatureDetector5emptyEv");

      procedure detectImpl
        (this : access constant GridAdaptedFeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1664
      pragma Import (CPP, detectImpl, "_ZNK2cv26GridAdaptedFeatureDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_GridAdaptedFeatureDetector (this : access GridAdaptedFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1647
      pragma Import (CPP, Delete_GridAdaptedFeatureDetector, "_ZN2cv26GridAdaptedFeatureDetectorD1Ev");

      procedure deleting_dtor (this : access GridAdaptedFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1647
      pragma Import (CPP, deleting_dtor, "_ZN2cv26GridAdaptedFeatureDetectorD0Ev");
   end;
   use Class_GridAdaptedFeatureDetector;
   package Class_PyramidAdaptedFeatureDetector is
      type PyramidAdaptedFeatureDetector is limited new FeatureDetector with record
         detector : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:1688
         maxLevel : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1689
      end record;
      pragma Import (CPP, PyramidAdaptedFeatureDetector);

      function New_PyramidAdaptedFeatureDetector (detector : access constant opencv2_core_core_hpp.Class_Ptr.Ptr; maxLevel : int) return PyramidAdaptedFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1680
      pragma CPP_Constructor (New_PyramidAdaptedFeatureDetector, "_ZN2cv29PyramidAdaptedFeatureDetectorC1ERKNS_3PtrINS_15FeatureDetectorEEEi");

      function empty (this : access constant PyramidAdaptedFeatureDetector) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1683
      pragma Import (CPP, empty, "_ZNK2cv29PyramidAdaptedFeatureDetector5emptyEv");

      procedure detectImpl
        (this : access constant PyramidAdaptedFeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1686
      pragma Import (CPP, detectImpl, "_ZNK2cv29PyramidAdaptedFeatureDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_PyramidAdaptedFeatureDetector (this : access PyramidAdaptedFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1676
      pragma Import (CPP, Delete_PyramidAdaptedFeatureDetector, "_ZN2cv29PyramidAdaptedFeatureDetectorD1Ev");

      procedure deleting_dtor (this : access PyramidAdaptedFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1676
      pragma Import (CPP, deleting_dtor, "_ZN2cv29PyramidAdaptedFeatureDetectorD0Ev");
   end;
   use Class_PyramidAdaptedFeatureDetector;
   package Class_AdjusterAdapter is
      type AdjusterAdapter is abstract limited new FeatureDetector with record
         null;
      end record;
      pragma Import (CPP, AdjusterAdapter);

      procedure Delete_AdjusterAdapter (this : access AdjusterAdapter);  -- /usr/include/opencv2/features2d/features2d.hpp:1700
      pragma Import (CPP, Delete_AdjusterAdapter, "_ZN2cv15AdjusterAdapterD1Ev");

      procedure deleting_dtor (this : access AdjusterAdapter);  -- /usr/include/opencv2/features2d/features2d.hpp:1700
      pragma Import (CPP, deleting_dtor, "_ZN2cv15AdjusterAdapterD0Ev");

      procedure tooFew
        (this : access AdjusterAdapter;
         min : int;
         n_detected : int) is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:1705

      procedure tooMany
        (this : access AdjusterAdapter;
         max : int;
         n_detected : int) is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:1710

      function good (this : access constant AdjusterAdapter) return Extensions.bool is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:1714

      function clone (this : access constant AdjusterAdapter) return opencv2_core_core_hpp.Class_Ptr.Ptr is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:1716

      function create (detectorType : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:1718
      pragma Import (CPP, create, "_ZN2cv15AdjusterAdapter6createERKSs");
   end;
   use Class_AdjusterAdapter;
   package Class_DynamicAdaptedFeatureDetector is
      type DynamicAdaptedFeatureDetector is limited new FeatureDetector with record
         escape_iters_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1753
         min_features_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1754
         max_features_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1754
         adjuster_u : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:1755
      end record;
      pragma Import (CPP, DynamicAdaptedFeatureDetector);

      function New_DynamicAdaptedFeatureDetector
        (adjaster : access constant opencv2_core_core_hpp.Class_Ptr.Ptr;
         min_features : int;
         max_features : int;
         max_iters : int) return DynamicAdaptedFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1742
      pragma CPP_Constructor (New_DynamicAdaptedFeatureDetector, "_ZN2cv29DynamicAdaptedFeatureDetectorC1ERKNS_3PtrINS_15AdjusterAdapterEEEiii");

      function empty (this : access constant DynamicAdaptedFeatureDetector) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1744
      pragma Import (CPP, empty, "_ZNK2cv29DynamicAdaptedFeatureDetector5emptyEv");

      procedure detectImpl
        (this : access constant DynamicAdaptedFeatureDetector;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1747
      pragma Import (CPP, detectImpl, "_ZNK2cv29DynamicAdaptedFeatureDetector10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      function operator_as (this : access DynamicAdaptedFeatureDetector'Class; arg2 : access constant DynamicAdaptedFeatureDetector'Class) return access DynamicAdaptedFeatureDetector;  -- /usr/include/opencv2/features2d/features2d.hpp:1750
      pragma Import (CPP, operator_as, "_ZN2cv29DynamicAdaptedFeatureDetectoraSERKS0_");

      procedure Delete_DynamicAdaptedFeatureDetector (this : access DynamicAdaptedFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1732
      pragma Import (CPP, Delete_DynamicAdaptedFeatureDetector, "_ZN2cv29DynamicAdaptedFeatureDetectorD1Ev");

      procedure deleting_dtor (this : access DynamicAdaptedFeatureDetector);  -- /usr/include/opencv2/features2d/features2d.hpp:1732
      pragma Import (CPP, deleting_dtor, "_ZN2cv29DynamicAdaptedFeatureDetectorD0Ev");
   end;
   use Class_DynamicAdaptedFeatureDetector;
   package Class_FastAdjuster is
      type FastAdjuster is limited new AdjusterAdapter with record
         thresh_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1778
         nonmax_u : aliased Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1779
         init_thresh_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1780
         min_thresh_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1780
         max_thresh_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:1780
      end record;
      pragma Import (CPP, FastAdjuster);

      function New_FastAdjuster
        (init_thresh : int;
         nonmax : Extensions.bool;
         min_thresh : int;
         max_thresh : int) return FastAdjuster;  -- /usr/include/opencv2/features2d/features2d.hpp:1767
      pragma CPP_Constructor (New_FastAdjuster, "_ZN2cv12FastAdjusterC1Eibii");

      procedure tooFew
        (this : access FastAdjuster;
         min : int;
         n_detected : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1769
      pragma Import (CPP, tooFew, "_ZN2cv12FastAdjuster6tooFewEii");

      procedure tooMany
        (this : access FastAdjuster;
         max : int;
         n_detected : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1770
      pragma Import (CPP, tooMany, "_ZN2cv12FastAdjuster7tooManyEii");

      function good (this : access constant FastAdjuster) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1771
      pragma Import (CPP, good, "_ZNK2cv12FastAdjuster4goodEv");

      function clone (this : access constant FastAdjuster) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:1773
      pragma Import (CPP, clone, "_ZNK2cv12FastAdjuster5cloneEv");

      procedure detectImpl
        (this : access constant FastAdjuster;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1776
      pragma Import (CPP, detectImpl, "_ZNK2cv12FastAdjuster10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_FastAdjuster (this : access FastAdjuster);  -- /usr/include/opencv2/features2d/features2d.hpp:1761
      pragma Import (CPP, Delete_FastAdjuster, "_ZN2cv12FastAdjusterD1Ev");

      procedure deleting_dtor (this : access FastAdjuster);  -- /usr/include/opencv2/features2d/features2d.hpp:1761
      pragma Import (CPP, deleting_dtor, "_ZN2cv12FastAdjusterD0Ev");
   end;
   use Class_FastAdjuster;
   package Class_StarAdjuster is
      type StarAdjuster is limited new AdjusterAdapter with record
         thresh_u : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1801
         init_thresh_u : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1801
         min_thresh_u : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1801
         max_thresh_u : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1801
         params_u : aliased CvStarDetectorParams;  -- /usr/include/opencv2/features2d/features2d.hpp:1802
      end record;
      pragma Import (CPP, StarAdjuster);

      function New_StarAdjuster
        (initial_thresh : double;
         min_thresh : double;
         max_thresh : double) return StarAdjuster;  -- /usr/include/opencv2/features2d/features2d.hpp:1790
      pragma CPP_Constructor (New_StarAdjuster, "_ZN2cv12StarAdjusterC1Eddd");

      procedure tooFew
        (this : access StarAdjuster;
         min : int;
         n_detected : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1792
      pragma Import (CPP, tooFew, "_ZN2cv12StarAdjuster6tooFewEii");

      procedure tooMany
        (this : access StarAdjuster;
         max : int;
         n_detected : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1793
      pragma Import (CPP, tooMany, "_ZN2cv12StarAdjuster7tooManyEii");

      function good (this : access constant StarAdjuster) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1794
      pragma Import (CPP, good, "_ZNK2cv12StarAdjuster4goodEv");

      function clone (this : access constant StarAdjuster) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:1796
      pragma Import (CPP, clone, "_ZNK2cv12StarAdjuster5cloneEv");

      procedure detectImpl
        (this : access constant StarAdjuster;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1799
      pragma Import (CPP, detectImpl, "_ZNK2cv12StarAdjuster10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_StarAdjuster (this : access StarAdjuster);  -- /usr/include/opencv2/features2d/features2d.hpp:1787
      pragma Import (CPP, Delete_StarAdjuster, "_ZN2cv12StarAdjusterD1Ev");

      procedure deleting_dtor (this : access StarAdjuster);  -- /usr/include/opencv2/features2d/features2d.hpp:1787
      pragma Import (CPP, deleting_dtor, "_ZN2cv12StarAdjusterD0Ev");
   end;
   use Class_StarAdjuster;
   package Class_SurfAdjuster is
      type SurfAdjuster is limited new AdjusterAdapter with record
         thresh_u : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1819
         init_thresh_u : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1819
         min_thresh_u : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1819
         max_thresh_u : aliased double;  -- /usr/include/opencv2/features2d/features2d.hpp:1819
      end record;
      pragma Import (CPP, SurfAdjuster);

      function New_SurfAdjuster
        (initial_thresh : double;
         min_thresh : double;
         max_thresh : double) return SurfAdjuster;  -- /usr/include/opencv2/features2d/features2d.hpp:1808
      pragma CPP_Constructor (New_SurfAdjuster, "_ZN2cv12SurfAdjusterC1Eddd");

      procedure tooFew
        (this : access SurfAdjuster;
         min : int;
         n_detected : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1810
      pragma Import (CPP, tooFew, "_ZN2cv12SurfAdjuster6tooFewEii");

      procedure tooMany
        (this : access SurfAdjuster;
         max : int;
         n_detected : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1811
      pragma Import (CPP, tooMany, "_ZN2cv12SurfAdjuster7tooManyEii");

      function good (this : access constant SurfAdjuster) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1812
      pragma Import (CPP, good, "_ZNK2cv12SurfAdjuster4goodEv");

      function clone (this : access constant SurfAdjuster) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:1814
      pragma Import (CPP, clone, "_ZNK2cv12SurfAdjuster5cloneEv");

      procedure detectImpl
        (this : access constant SurfAdjuster;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1817
      pragma Import (CPP, detectImpl, "_ZNK2cv12SurfAdjuster10detectImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_");

      procedure Delete_SurfAdjuster (this : access SurfAdjuster);  -- /usr/include/opencv2/features2d/features2d.hpp:1805
      pragma Import (CPP, Delete_SurfAdjuster, "_ZN2cv12SurfAdjusterD1Ev");

      procedure deleting_dtor (this : access SurfAdjuster);  -- /usr/include/opencv2/features2d/features2d.hpp:1805
      pragma Import (CPP, deleting_dtor, "_ZN2cv12SurfAdjusterD0Ev");
   end;
   use Class_SurfAdjuster;
   function windowedMatchingMask
     (keypoints1 : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      keypoints2 : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      maxDeltaX : float;
      maxDeltaY : float) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/features2d/features2d.hpp:1822
   pragma Import (CPP, windowedMatchingMask, "_ZN2cv20windowedMatchingMaskERKSt6vectorINS_8KeyPointESaIS1_EES5_ff");

   package Class_DescriptorExtractor is
      type DescriptorExtractor is abstract tagged limited record
         null;
      end record;
      pragma Import (CPP, DescriptorExtractor);

      procedure Delete_DescriptorExtractor (this : access DescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:1841
      pragma Import (CPP, Delete_DescriptorExtractor, "_ZN2cv19DescriptorExtractorD1Ev");

      procedure deleting_dtor (this : access DescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:1841
      pragma Import (CPP, deleting_dtor, "_ZN2cv19DescriptorExtractorD0Ev");

      procedure compute
        (this : access constant DescriptorExtractor'Class;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1849
      pragma Import (CPP, compute, "_ZNK2cv19DescriptorExtractor7computeERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS1_");

      procedure compute
        (this : access constant DescriptorExtractor'Class;
         images : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:1858
      pragma Import (CPP, compute, "_ZNK2cv19DescriptorExtractor7computeERKSt6vectorINS_3MatESaIS2_EERS1_IS1_INS_8KeyPointESaIS7_EESaIS9_EERS4_");

      procedure read (this : access DescriptorExtractor; arg2 : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1860
      pragma Import (CPP, read, "_ZN2cv19DescriptorExtractor4readERKNS_8FileNodeE");

      procedure write (this : access constant DescriptorExtractor; arg2 : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1861
      pragma Import (CPP, write, "_ZNK2cv19DescriptorExtractor5writeERNS_11FileStorageE");

      function descriptorSize (this : access constant DescriptorExtractor) return int is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:1863

      function descriptorType (this : access constant DescriptorExtractor) return int is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:1864

      function empty (this : access constant DescriptorExtractor) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:1866
      pragma Import (CPP, empty, "_ZNK2cv19DescriptorExtractor5emptyEv");

      function create (descriptorExtractorType : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:1868
      pragma Import (CPP, create, "_ZN2cv19DescriptorExtractor6createERKSs");

      procedure computeImpl
        (this : access constant DescriptorExtractor;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat) is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:1871

      procedure removeBorderKeypoints
        (keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         imageSize : opencv2_core_core_hpp.Class_Size.Size;
         borderSize : int);  -- /usr/include/opencv2/features2d/features2d.hpp:1876
      pragma Import (CPP, removeBorderKeypoints, "_ZN2cv19DescriptorExtractor21removeBorderKeypointsERSt6vectorINS_8KeyPointESaIS2_EENS_5Size_IiEEi");
   end;
   use Class_DescriptorExtractor;
   package Class_SiftDescriptorExtractor is
      type SiftDescriptorExtractor is limited new DescriptorExtractor with record
         the_sift : aliased SIFT;  -- /usr/include/opencv2/features2d/features2d.hpp:1903
      end record;
      pragma Import (CPP, SiftDescriptorExtractor);

      function New_SiftDescriptorExtractor (descriptorParams : access constant DescriptorParams; commonParams : access constant CommonParams) return SiftDescriptorExtractor;  -- /usr/include/opencv2/features2d/features2d.hpp:1886
      pragma CPP_Constructor (New_SiftDescriptorExtractor, "_ZN2cv23SiftDescriptorExtractorC1ERKNS_4SIFT16DescriptorParamsERKNS1_12CommonParamsE");

      function New_SiftDescriptorExtractor
        (magnification : double;
         isNormalize : Extensions.bool;
         recalculateAngles : Extensions.bool;
         nOctaves : int;
         nOctaveLayers : int;
         firstOctave : int;
         angleMode : int) return SiftDescriptorExtractor;  -- /usr/include/opencv2/features2d/features2d.hpp:1888
      pragma CPP_Constructor (New_SiftDescriptorExtractor, "_ZN2cv23SiftDescriptorExtractorC1Edbbiiii");

      procedure read (this : access SiftDescriptorExtractor; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1894
      pragma Import (CPP, read, "_ZN2cv23SiftDescriptorExtractor4readERKNS_8FileNodeE");

      procedure write (this : access constant SiftDescriptorExtractor; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1895
      pragma Import (CPP, write, "_ZNK2cv23SiftDescriptorExtractor5writeERNS_11FileStorageE");

      function descriptorSize (this : access constant SiftDescriptorExtractor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1897
      pragma Import (CPP, descriptorSize, "_ZNK2cv23SiftDescriptorExtractor14descriptorSizeEv");

      function descriptorType (this : access constant SiftDescriptorExtractor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1898
      pragma Import (CPP, descriptorType, "_ZNK2cv23SiftDescriptorExtractor14descriptorTypeEv");

      procedure computeImpl
        (this : access constant SiftDescriptorExtractor;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1901
      pragma Import (CPP, computeImpl, "_ZNK2cv23SiftDescriptorExtractor11computeImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS1_");

      procedure Delete_SiftDescriptorExtractor (this : access SiftDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:1883
      pragma Import (CPP, Delete_SiftDescriptorExtractor, "_ZN2cv23SiftDescriptorExtractorD1Ev");

      procedure deleting_dtor (this : access SiftDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:1883
      pragma Import (CPP, deleting_dtor, "_ZN2cv23SiftDescriptorExtractorD0Ev");
   end;
   use Class_SiftDescriptorExtractor;
   package Class_SurfDescriptorExtractor is
      type SurfDescriptorExtractor is limited new DescriptorExtractor with record
         the_surf : aliased SURF;  -- /usr/include/opencv2/features2d/features2d.hpp:1923
      end record;
      pragma Import (CPP, SurfDescriptorExtractor);

      function New_SurfDescriptorExtractor
        (nOctaves : int;
         nOctaveLayers : int;
         extended : Extensions.bool;
         upright : Extensions.bool) return SurfDescriptorExtractor;  -- /usr/include/opencv2/features2d/features2d.hpp:1912
      pragma CPP_Constructor (New_SurfDescriptorExtractor, "_ZN2cv23SurfDescriptorExtractorC1Eiibb");

      procedure read (this : access SurfDescriptorExtractor; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1914
      pragma Import (CPP, read, "_ZN2cv23SurfDescriptorExtractor4readERKNS_8FileNodeE");

      procedure write (this : access constant SurfDescriptorExtractor; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1915
      pragma Import (CPP, write, "_ZNK2cv23SurfDescriptorExtractor5writeERNS_11FileStorageE");

      function descriptorSize (this : access constant SurfDescriptorExtractor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1917
      pragma Import (CPP, descriptorSize, "_ZNK2cv23SurfDescriptorExtractor14descriptorSizeEv");

      function descriptorType (this : access constant SurfDescriptorExtractor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1918
      pragma Import (CPP, descriptorType, "_ZNK2cv23SurfDescriptorExtractor14descriptorTypeEv");

      procedure computeImpl
        (this : access constant SurfDescriptorExtractor;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1921
      pragma Import (CPP, computeImpl, "_ZNK2cv23SurfDescriptorExtractor11computeImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS1_");

      procedure Delete_SurfDescriptorExtractor (this : access SurfDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:1909
      pragma Import (CPP, Delete_SurfDescriptorExtractor, "_ZN2cv23SurfDescriptorExtractorD1Ev");

      procedure deleting_dtor (this : access SurfDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:1909
      pragma Import (CPP, deleting_dtor, "_ZN2cv23SurfDescriptorExtractorD0Ev");
   end;
   use Class_SurfDescriptorExtractor;
   package Class_OrbDescriptorExtractor is
      type OrbDescriptorExtractor is limited new DescriptorExtractor with record
         orb_u : aliased ORB;  -- /usr/include/opencv2/features2d/features2d.hpp:1955
         params_u : aliased CommonParams;  -- /usr/include/opencv2/features2d/features2d.hpp:1957
      end record;
      pragma Import (CPP, OrbDescriptorExtractor);

      function New_OrbDescriptorExtractor (params : CommonParams) return OrbDescriptorExtractor;  -- /usr/include/opencv2/features2d/features2d.hpp:1938
      pragma CPP_Constructor (New_OrbDescriptorExtractor, "_ZN2cv22OrbDescriptorExtractorC1ENS_3ORB12CommonParamsE");

      procedure Delete_OrbDescriptorExtractor (this : access OrbDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:1941
      pragma Import (CPP, Delete_OrbDescriptorExtractor, "_ZN2cv22OrbDescriptorExtractorD1Ev");

      procedure deleting_dtor (this : access OrbDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:1941
      pragma Import (CPP, deleting_dtor, "_ZN2cv22OrbDescriptorExtractorD0Ev");

      function descriptorSize (this : access constant OrbDescriptorExtractor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1945
      pragma Import (CPP, descriptorSize, "_ZNK2cv22OrbDescriptorExtractor14descriptorSizeEv");

      function descriptorType (this : access constant OrbDescriptorExtractor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:1946
      pragma Import (CPP, descriptorType, "_ZNK2cv22OrbDescriptorExtractor14descriptorTypeEv");

      procedure read (this : access OrbDescriptorExtractor; arg2 : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:1948
      pragma Import (CPP, read, "_ZN2cv22OrbDescriptorExtractor4readERKNS_8FileNodeE");

      procedure write (this : access constant OrbDescriptorExtractor; arg2 : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:1949
      pragma Import (CPP, write, "_ZNK2cv22OrbDescriptorExtractor5writeERNS_11FileStorageE");

      procedure computeImpl
        (this : access constant OrbDescriptorExtractor;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:1952
      pragma Import (CPP, computeImpl, "_ZNK2cv22OrbDescriptorExtractor11computeImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS1_");
   end;
   use Class_OrbDescriptorExtractor;
   package Class_OpponentColorDescriptorExtractor is
      type OpponentColorDescriptorExtractor is limited new DescriptorExtractor with record
         descriptorExtractor : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2050
      end record;
      pragma Import (CPP, OpponentColorDescriptorExtractor);

      function New_OpponentColorDescriptorExtractor (descriptorExtractor : access constant opencv2_core_core_hpp.Class_Ptr.Ptr) return OpponentColorDescriptorExtractor;  -- /usr/include/opencv2/features2d/features2d.hpp:2037
      pragma CPP_Constructor (New_OpponentColorDescriptorExtractor, "_ZN2cv32OpponentColorDescriptorExtractorC1ERKNS_3PtrINS_19DescriptorExtractorEEE");

      procedure read (this : access OpponentColorDescriptorExtractor; arg2 : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:2039
      pragma Import (CPP, read, "_ZN2cv32OpponentColorDescriptorExtractor4readERKNS_8FileNodeE");

      procedure write (this : access constant OpponentColorDescriptorExtractor; arg2 : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:2040
      pragma Import (CPP, write, "_ZNK2cv32OpponentColorDescriptorExtractor5writeERNS_11FileStorageE");

      function descriptorSize (this : access constant OpponentColorDescriptorExtractor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:2042
      pragma Import (CPP, descriptorSize, "_ZNK2cv32OpponentColorDescriptorExtractor14descriptorSizeEv");

      function descriptorType (this : access constant OpponentColorDescriptorExtractor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:2043
      pragma Import (CPP, descriptorType, "_ZNK2cv32OpponentColorDescriptorExtractor14descriptorTypeEv");

      function empty (this : access constant OpponentColorDescriptorExtractor) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2045
      pragma Import (CPP, empty, "_ZNK2cv32OpponentColorDescriptorExtractor5emptyEv");

      procedure computeImpl
        (this : access constant OpponentColorDescriptorExtractor;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:2048
      pragma Import (CPP, computeImpl, "_ZNK2cv32OpponentColorDescriptorExtractor11computeImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS1_");

      procedure Delete_OpponentColorDescriptorExtractor (this : access OpponentColorDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:2034
      pragma Import (CPP, Delete_OpponentColorDescriptorExtractor, "_ZN2cv32OpponentColorDescriptorExtractorD1Ev");

      procedure deleting_dtor (this : access OpponentColorDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:2034
      pragma Import (CPP, deleting_dtor, "_ZN2cv32OpponentColorDescriptorExtractorD0Ev");
   end;
   use Class_OpponentColorDescriptorExtractor;
   package Class_BriefDescriptorExtractor is
      type BriefDescriptorExtractor is limited new DescriptorExtractor with record
         bytes_u : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2078
         test_fn_u : PixelTestFn;  -- /usr/include/opencv2/features2d/features2d.hpp:2079
      end record;
      pragma Import (CPP, BriefDescriptorExtractor);

      function New_BriefDescriptorExtractor (bytes : int) return BriefDescriptorExtractor;  -- /usr/include/opencv2/features2d/features2d.hpp:2063
      pragma CPP_Constructor (New_BriefDescriptorExtractor, "_ZN2cv24BriefDescriptorExtractorC1Ei");

      procedure read (this : access BriefDescriptorExtractor; arg2 : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:2065
      pragma Import (CPP, read, "_ZN2cv24BriefDescriptorExtractor4readERKNS_8FileNodeE");

      procedure write (this : access constant BriefDescriptorExtractor; arg2 : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:2066
      pragma Import (CPP, write, "_ZNK2cv24BriefDescriptorExtractor5writeERNS_11FileStorageE");

      function descriptorSize (this : access constant BriefDescriptorExtractor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:2068
      pragma Import (CPP, descriptorSize, "_ZNK2cv24BriefDescriptorExtractor14descriptorSizeEv");

      function descriptorType (this : access constant BriefDescriptorExtractor) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:2069
      pragma Import (CPP, descriptorType, "_ZNK2cv24BriefDescriptorExtractor14descriptorTypeEv");

      procedure computeImpl
        (this : access constant BriefDescriptorExtractor;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:2074
      pragma Import (CPP, computeImpl, "_ZNK2cv24BriefDescriptorExtractor11computeImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS1_");

      procedure Delete_BriefDescriptorExtractor (this : access BriefDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:2056
      pragma Import (CPP, Delete_BriefDescriptorExtractor, "_ZN2cv24BriefDescriptorExtractorD1Ev");

      procedure deleting_dtor (this : access BriefDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:2056
      pragma Import (CPP, deleting_dtor, "_ZN2cv24BriefDescriptorExtractorD0Ev");

      PATCH_SIZE : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2059
      pragma Import (CPP, PATCH_SIZE, "_ZN2cv24BriefDescriptorExtractor10PATCH_SIZEE");

      KERNEL_SIZE : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2060
      pragma Import (CPP, KERNEL_SIZE, "_ZN2cv24BriefDescriptorExtractor11KERNEL_SIZEE");
   end;
   use Class_BriefDescriptorExtractor;
   package L2_float is
      type L2 is limited record
         null;
      end record;
      pragma Import (CPP, L2);

      function operator_op
        (this : access constant L2;
         a : access float;
         b : access float;
         size : int) return ResultType;  -- /usr/include/opencv2/features2d/features2d.hpp:2126
      pragma Import (CPP, operator_op, "_ZNK2cv2L2IfEclEPKfS3_i");

   end;
   use L2_float;



   package Class_HammingLUT is
      type HammingLUT is limited record
         null;
      end record;
      pragma Import (CPP, HammingLUT);

      function operator_op
        (this : access constant HammingLUT;
         a : access unsigned_char;
         b : access unsigned_char;
         size : int) return ResultType;  -- /usr/include/opencv2/features2d/features2d.hpp:2170
      pragma Import (CPP, operator_op, "_ZNK2cv10HammingLUTclEPKhS2_i");

      function byteBitsLookUp (b : unsigned_char) return unsigned_char;  -- /usr/include/opencv2/features2d/features2d.hpp:2177
      pragma Import (CPP, byteBitsLookUp, "_ZN2cv10HammingLUT14byteBitsLookUpEh");
   end;
   use Class_HammingLUT;
   package Class_Hamming is
      type Hamming is limited record
         null;
      end record;
      pragma Import (CPP, Hamming);

      function operator_op
        (this : access constant Hamming;
         a : access unsigned_char;
         b : access unsigned_char;
         size : int) return ResultType;  -- /usr/include/opencv2/features2d/features2d.hpp:2194
      pragma Import (CPP, operator_op, "_ZNK2cv7HammingclEPKhS2_i");
   end;
   use Class_Hamming;
   package Class_DMatch is
      type DMatch is limited record
         queryIdx : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2212
         trainIdx : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2213
         imgIdx : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2214
         distance : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:2216
      end record;
      pragma Import (CPP, DMatch);

      function New_DMatch return DMatch;  -- /usr/include/opencv2/features2d/features2d.hpp:2206
      pragma CPP_Constructor (New_DMatch, "_ZN2cv6DMatchC1Ev");

      function New_DMatch
        (u_queryIdx : int;
         u_trainIdx : int;
         u_distance : float) return DMatch;  -- /usr/include/opencv2/features2d/features2d.hpp:2207
      pragma CPP_Constructor (New_DMatch, "_ZN2cv6DMatchC1Eiif");

      function New_DMatch
        (u_queryIdx : int;
         u_trainIdx : int;
         u_imgIdx : int;
         u_distance : float) return DMatch;  -- /usr/include/opencv2/features2d/features2d.hpp:2209
      pragma CPP_Constructor (New_DMatch, "_ZN2cv6DMatchC1Eiiif");

      function operator_lt (this : access constant DMatch; m : System.Address) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2219
      pragma Import (CPP, operator_lt, "_ZNK2cv6DMatchltERKS0_");
   end;
   use Class_DMatch;
   type DescriptorMatcher;
   type DescriptorCollection is record
      mergedDescriptors : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/features2d/features2d.hpp:2336
      startIdxs : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:2337
   end record;
   pragma Convention (C_Pass_By_Copy, DescriptorCollection);
   package Class_DescriptorMatcher is
      type DescriptorMatcher is abstract tagged limited record
         trainDescCollection : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:2355
      end record;
      pragma Import (CPP, DescriptorMatcher);

      procedure Delete_DescriptorMatcher (this : access DescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2234
      pragma Import (CPP, Delete_DescriptorMatcher, "_ZN2cv17DescriptorMatcherD1Ev");

      procedure deleting_dtor (this : access DescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2234
      pragma Import (CPP, deleting_dtor, "_ZN2cv17DescriptorMatcherD0Ev");

      procedure add (this : access DescriptorMatcher; descriptors : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:2240
      pragma Import (CPP, add, "_ZN2cv17DescriptorMatcher3addERKSt6vectorINS_3MatESaIS2_EE");

      function getTrainDescriptors (this : access constant DescriptorMatcher'Class) return access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:2244
      pragma Import (CPP, getTrainDescriptors, "_ZNK2cv17DescriptorMatcher19getTrainDescriptorsEv");

      procedure clear (this : access DescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2248
      pragma Import (CPP, clear, "_ZN2cv17DescriptorMatcher5clearEv");

      function empty (this : access constant DescriptorMatcher) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2253
      pragma Import (CPP, empty, "_ZNK2cv17DescriptorMatcher5emptyEv");

      function isMaskSupported (this : access constant DescriptorMatcher) return Extensions.bool is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:2257

      procedure train (this : access DescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2270
      pragma Import (CPP, train, "_ZN2cv17DescriptorMatcher5trainEv");

      procedure match
        (this : access constant DescriptorMatcher'Class;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         trainDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:2276
      pragma Import (CPP, match, "_ZNK2cv17DescriptorMatcher5matchERKNS_3MatES3_RSt6vectorINS_6DMatchESaIS5_EES3_");

      procedure knnMatch
        (this : access constant DescriptorMatcher'Class;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         trainDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2282
      pragma Import (CPP, knnMatch, "_ZNK2cv17DescriptorMatcher8knnMatchERKNS_3MatES3_RSt6vectorIS4_INS_6DMatchESaIS5_EESaIS7_EEiS3_b");

      procedure radiusMatch
        (this : access constant DescriptorMatcher'Class;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         trainDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2287
      pragma Import (CPP, radiusMatch, "_ZNK2cv17DescriptorMatcher11radiusMatchERKNS_3MatES3_RSt6vectorIS4_INS_6DMatchESaIS5_EESaIS7_EEfS3_b");

      procedure match
        (this : access DescriptorMatcher'Class;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:2294
      pragma Import (CPP, match, "_ZN2cv17DescriptorMatcher5matchERKNS_3MatERSt6vectorINS_6DMatchESaIS5_EERKS4_IS1_SaIS1_EE");

      procedure knnMatch
        (this : access DescriptorMatcher'Class;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2296
      pragma Import (CPP, knnMatch, "_ZN2cv17DescriptorMatcher8knnMatchERKNS_3MatERSt6vectorIS4_INS_6DMatchESaIS5_EESaIS7_EEiRKS4_IS1_SaIS1_EEb");

      procedure radiusMatch
        (this : access DescriptorMatcher'Class;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2298
      pragma Import (CPP, radiusMatch, "_ZN2cv17DescriptorMatcher11radiusMatchERKNS_3MatERSt6vectorIS4_INS_6DMatchESaIS5_EESaIS7_EEfRKS4_IS1_SaIS1_EEb");

      procedure read (this : access DescriptorMatcher; arg2 : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:2302
      pragma Import (CPP, read, "_ZN2cv17DescriptorMatcher4readERKNS_8FileNodeE");

      procedure write (this : access constant DescriptorMatcher; arg2 : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:2304
      pragma Import (CPP, write, "_ZNK2cv17DescriptorMatcher5writeERNS_11FileStorageE");

      function clone (this : access constant DescriptorMatcher; emptyTrainData : Extensions.bool) return opencv2_core_core_hpp.Class_Ptr.Ptr is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:2309

      function create (descriptorMatcherType : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2311
      pragma Import (CPP, create, "_ZN2cv17DescriptorMatcher6createERKSs");

      procedure knnMatchImpl
        (this : access DescriptorMatcher;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool) is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:2343

      procedure radiusMatchImpl
        (this : access DescriptorMatcher;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool) is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:2345

      function isPossibleMatch
        (mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryIdx : int;
         trainIdx : int) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2348
      pragma Import (CPP, isPossibleMatch, "_ZN2cv17DescriptorMatcher15isPossibleMatchERKNS_3MatEii");

      function isMaskedOut (masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector; queryIdx : int) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2349
      pragma Import (CPP, isMaskedOut, "_ZN2cv17DescriptorMatcher11isMaskedOutERKSt6vectorINS_3MatESaIS2_EEi");

      function clone_op (m : access opencv2_core_core_hpp.Class_Mat.Mat) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/features2d/features2d.hpp:2351
      pragma Import (CPP, clone_op, "_ZN2cv17DescriptorMatcher8clone_opENS_3MatE");

      procedure checkMasks
        (this : access constant DescriptorMatcher'Class;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         queryDescriptorsCount : int);  -- /usr/include/opencv2/features2d/features2d.hpp:2352
      pragma Import (CPP, checkMasks, "_ZNK2cv17DescriptorMatcher10checkMasksERKSt6vectorINS_3MatESaIS2_EEi");
   end;
   use Class_DescriptorMatcher;
   package BruteForceMatcher_L2 is
      type BruteForceMatcher is tagged limited record
         distance : aliased L2;  -- /usr/include/opencv2/features2d/features2d.hpp:2384
      end record;
      pragma Import (CPP, BruteForceMatcher);

      function New_BruteForceMatcher (d : L2) return BruteForceMatcher;  -- /usr/include/opencv2/features2d/features2d.hpp:2371
      pragma CPP_Constructor (New_BruteForceMatcher, "_ZN2cv17BruteForceMatcherINS_2L2IfEEEC1ES2_");

      procedure Delete_BruteForceMatcher (this : access BruteForceMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2372
      pragma Import (CPP, Delete_BruteForceMatcher, "_ZN2cv17BruteForceMatcherINS_2L2IfEEED1Ev");

      procedure deleting_dtor (this : access BruteForceMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2372
      pragma Import (CPP, deleting_dtor, "_ZN2cv17BruteForceMatcherINS_2L2IfEEED0Ev");

      function isMaskSupported (this : access constant BruteForceMatcher) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2374
      pragma Import (CPP, isMaskSupported, "_ZNK2cv17BruteForceMatcherINS_2L2IfEEE15isMaskSupportedEv");

      function clone (this : access constant BruteForceMatcher; emptyTrainData : Extensions.bool) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2399
      pragma Import (CPP, clone, "_ZNK2cv17BruteForceMatcherINS_2L2IfEEE5cloneEb");

      procedure knnMatchImpl
        (this : access BruteForceMatcher;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2556
      pragma Import (CPP, knnMatchImpl, "_ZN2cv17BruteForceMatcherINS_2L2IfEEE12knnMatchImplERKNS_3MatERSt6vectorIS7_INS_6DMatchESaIS8_EESaISA_EEiRKS7_IS4_SaIS4_EEb");

      procedure radiusMatchImpl
        (this : access BruteForceMatcher;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2559
      pragma Import (CPP, radiusMatchImpl, "_ZN2cv17BruteForceMatcherINS_2L2IfEEE15radiusMatchImplERKNS_3MatERSt6vectorIS7_INS_6DMatchESaIS8_EESaISA_EEfRKS7_IS4_SaIS4_EEb");

      procedure commonKnnMatchImpl
        (matcher : access BruteForceMatcher'Class;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         knn : int;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2426
      pragma Import (CPP, commonKnnMatchImpl, "_ZN2cv17BruteForceMatcherINS_2L2IfEEE18commonKnnMatchImplERS3_RKNS_3MatERSt6vectorIS8_INS_6DMatchESaIS9_EESaISB_EEiRKS8_IS5_SaIS5_EEb");

      procedure commonRadiusMatchImpl
        (matcher : access BruteForceMatcher'Class;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2503
      pragma Import (CPP, commonRadiusMatchImpl, "_ZN2cv17BruteForceMatcherINS_2L2IfEEE21commonRadiusMatchImplERS3_RKNS_3MatERSt6vectorIS8_INS_6DMatchESaIS9_EESaISB_EEfRKS8_IS5_SaIS5_EEb");

   end;
   use BruteForceMatcher_L2;



   package Class_FlannBasedMatcher is
      type FlannBasedMatcher is limited new DescriptorMatcher with record
         indexParams : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2594
         searchParams : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2595
         flannIndex : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2596
         mergedDescriptors : aliased DescriptorCollection;  -- /usr/include/opencv2/features2d/features2d.hpp:2598
         addedDescCount : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2599
      end record;
      pragma Import (CPP, FlannBasedMatcher);

      function New_FlannBasedMatcher (indexParams : access constant opencv2_core_core_hpp.Class_Ptr.Ptr; searchParams : access constant opencv2_core_core_hpp.Class_Ptr.Ptr) return FlannBasedMatcher;  -- /usr/include/opencv2/features2d/features2d.hpp:2568
      pragma CPP_Constructor (New_FlannBasedMatcher, "_ZN2cv17FlannBasedMatcherC1ERKNS_3PtrINS_5flann11IndexParamsEEERKNS1_INS2_12SearchParamsEEE");

      procedure add (this : access FlannBasedMatcher; descriptors : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:2571
      pragma Import (CPP, add, "_ZN2cv17FlannBasedMatcher3addERKSt6vectorINS_3MatESaIS2_EE");

      procedure clear (this : access FlannBasedMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2572
      pragma Import (CPP, clear, "_ZN2cv17FlannBasedMatcher5clearEv");

      procedure read (this : access FlannBasedMatcher; arg2 : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:2575
      pragma Import (CPP, read, "_ZN2cv17FlannBasedMatcher4readERKNS_8FileNodeE");

      procedure write (this : access constant FlannBasedMatcher; arg2 : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:2577
      pragma Import (CPP, write, "_ZNK2cv17FlannBasedMatcher5writeERNS_11FileStorageE");

      procedure train (this : access FlannBasedMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2579
      pragma Import (CPP, train, "_ZN2cv17FlannBasedMatcher5trainEv");

      function isMaskSupported (this : access constant FlannBasedMatcher) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2580
      pragma Import (CPP, isMaskSupported, "_ZNK2cv17FlannBasedMatcher15isMaskSupportedEv");

      function clone (this : access constant FlannBasedMatcher; emptyTrainData : Extensions.bool) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2582
      pragma Import (CPP, clone, "_ZNK2cv17FlannBasedMatcher5cloneEb");

      procedure convertToDMatches
        (descriptors : access constant DescriptorCollection'Class;
         indices : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         distances : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:2585
      pragma Import (CPP, convertToDMatches, "_ZN2cv17FlannBasedMatcher17convertToDMatchesERKNS_17DescriptorMatcher20DescriptorCollectionERKNS_3MatES7_RSt6vectorIS8_INS_6DMatchESaIS9_EESaISB_EE");

      procedure knnMatchImpl
        (this : access FlannBasedMatcher;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2589
      pragma Import (CPP, knnMatchImpl, "_ZN2cv17FlannBasedMatcher12knnMatchImplERKNS_3MatERSt6vectorIS4_INS_6DMatchESaIS5_EESaIS7_EEiRKS4_IS1_SaIS1_EEb");

      procedure radiusMatchImpl
        (this : access FlannBasedMatcher;
         queryDescriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2591
      pragma Import (CPP, radiusMatchImpl, "_ZN2cv17FlannBasedMatcher15radiusMatchImplERKNS_3MatERSt6vectorIS4_INS_6DMatchESaIS5_EESaIS7_EEfRKS4_IS1_SaIS1_EEb");

      procedure Delete_FlannBasedMatcher (this : access FlannBasedMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2565
      pragma Import (CPP, Delete_FlannBasedMatcher, "_ZN2cv17FlannBasedMatcherD1Ev");

      procedure deleting_dtor (this : access FlannBasedMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2565
      pragma Import (CPP, deleting_dtor, "_ZN2cv17FlannBasedMatcherD0Ev");
   end;
   use Class_FlannBasedMatcher;
   type GenericDescriptorMatcher;
   type KeyPointCollection is record
      pointCount : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2747
      images : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:2749
      keypoints : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:2750
      startIndices : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:2752
   end record;
   pragma Convention (C_Pass_By_Copy, KeyPointCollection);
   subtype GenericDescriptorMatch is GenericDescriptorMatcher;

   package Class_GenericDescriptorMatcher is
      type GenericDescriptorMatcher is abstract tagged limited record
         trainPointCollection : aliased KeyPointCollection;  -- /usr/include/opencv2/features2d/features2d.hpp:2758
      end record;
      pragma Import (CPP, GenericDescriptorMatcher);

      function New_GenericDescriptorMatcher return GenericDescriptorMatcher is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:2614
      pragma CPP_Constructor (New_GenericDescriptorMatcher, "_ZN2cv24GenericDescriptorMatcherC1Ev");

      procedure Delete_GenericDescriptorMatcher (this : access GenericDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2615
      pragma Import (CPP, Delete_GenericDescriptorMatcher, "_ZN2cv24GenericDescriptorMatcherD1Ev");

      procedure deleting_dtor (this : access GenericDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2615
      pragma Import (CPP, deleting_dtor, "_ZN2cv24GenericDescriptorMatcherD0Ev");

      procedure add
        (this : access GenericDescriptorMatcher;
         images : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:2627
      pragma Import (CPP, add, "_ZN2cv24GenericDescriptorMatcher3addERKSt6vectorINS_3MatESaIS2_EERS1_IS1_INS_8KeyPointESaIS7_EESaIS9_EE");

      function getTrainImages (this : access constant GenericDescriptorMatcher'Class) return access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:2630
      pragma Import (CPP, getTrainImages, "_ZNK2cv24GenericDescriptorMatcher14getTrainImagesEv");

      function getTrainKeypoints (this : access constant GenericDescriptorMatcher'Class) return access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:2631
      pragma Import (CPP, getTrainKeypoints, "_ZNK2cv24GenericDescriptorMatcher17getTrainKeypointsEv");

      procedure clear (this : access GenericDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2636
      pragma Import (CPP, clear, "_ZN2cv24GenericDescriptorMatcher5clearEv");

      function isMaskSupported (this : access GenericDescriptorMatcher) return Extensions.bool is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:2640

      procedure train (this : access GenericDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2646
      pragma Import (CPP, train, "_ZN2cv24GenericDescriptorMatcher5trainEv");

      procedure classify
        (this : access constant GenericDescriptorMatcher'Class;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         trainImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         trainKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:2656
      pragma Import (CPP, classify, "_ZNK2cv24GenericDescriptorMatcher8classifyERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_S8_");

      procedure classify
        (this : access GenericDescriptorMatcher'Class;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:2659
      pragma Import (CPP, classify, "_ZN2cv24GenericDescriptorMatcher8classifyERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EE");

      procedure match
        (this : access constant GenericDescriptorMatcher'Class;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         trainImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         trainKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:2667
      pragma Import (CPP, match, "_ZNK2cv24GenericDescriptorMatcher5matchERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_S8_RS4_INS_6DMatchESaIS9_EES3_");

      procedure knnMatch
        (this : access constant GenericDescriptorMatcher'Class;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         trainImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         trainKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2674
      pragma Import (CPP, knnMatch, "_ZNK2cv24GenericDescriptorMatcher8knnMatchERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_S8_RS4_IS4_INS_6DMatchESaIS9_EESaISB_EEiS3_b");

      procedure radiusMatch
        (this : access constant GenericDescriptorMatcher'Class;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         trainImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         trainKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         mask : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2679
      pragma Import (CPP, radiusMatch, "_ZNK2cv24GenericDescriptorMatcher11radiusMatchERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EES3_S8_RS4_IS4_INS_6DMatchESaIS9_EESaISB_EEfS3_b");

      procedure match
        (this : access GenericDescriptorMatcher'Class;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:2687
      pragma Import (CPP, match, "_ZN2cv24GenericDescriptorMatcher5matchERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS4_INS_6DMatchESaIS9_EERKS4_IS1_SaIS1_EE");

      procedure knnMatch
        (this : access GenericDescriptorMatcher'Class;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2689
      pragma Import (CPP, knnMatch, "_ZN2cv24GenericDescriptorMatcher8knnMatchERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS4_IS4_INS_6DMatchESaIS9_EESaISB_EEiRKS4_IS1_SaIS1_EEb");

      procedure radiusMatch
        (this : access GenericDescriptorMatcher'Class;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2692
      pragma Import (CPP, radiusMatch, "_ZN2cv24GenericDescriptorMatcher11radiusMatchERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS4_IS4_INS_6DMatchESaIS9_EESaISB_EEfRKS4_IS1_SaIS1_EEb");

      procedure read (this : access GenericDescriptorMatcher; arg2 : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:2697
      pragma Import (CPP, read, "_ZN2cv24GenericDescriptorMatcher4readERKNS_8FileNodeE");

      procedure write (this : access constant GenericDescriptorMatcher; arg2 : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:2699
      pragma Import (CPP, write, "_ZNK2cv24GenericDescriptorMatcher5writeERNS_11FileStorageE");

      function empty (this : access constant GenericDescriptorMatcher) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2702
      pragma Import (CPP, empty, "_ZNK2cv24GenericDescriptorMatcher5emptyEv");

      function clone (this : access constant GenericDescriptorMatcher; emptyTrainData : Extensions.bool) return opencv2_core_core_hpp.Class_Ptr.Ptr is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:2707

      function create (genericDescritptorMatcherType : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string; paramsFilename : access constant cpp_4_7_4_bits_stringfwd_h.Class_string.string) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2709
      pragma Import (CPP, create, "_ZN2cv24GenericDescriptorMatcher6createERKSsS2_");

      procedure knnMatchImpl
        (this : access GenericDescriptorMatcher;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool) is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:2716

      procedure radiusMatchImpl
        (this : access GenericDescriptorMatcher;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool) is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:2719
   end;
   use Class_GenericDescriptorMatcher;
   type OneWayDescriptorMatcher;
   type Params is record
      poseCount : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2787
      patchSize : aliased opencv2_core_core_hpp.Class_Size.Size;  -- /usr/include/opencv2/features2d/features2d.hpp:2788
      pcaFilename : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/features2d/features2d.hpp:2789
      trainPath : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/features2d/features2d.hpp:2790
      trainImagesList : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/features2d/features2d.hpp:2791
      minScale : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:2793
      maxScale : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:2793
      stepScale : aliased float;  -- /usr/include/opencv2/features2d/features2d.hpp:2793
   end record;
   pragma Convention (C_Pass_By_Copy, Params);
   subtype OneWayDescriptorMatch is OneWayDescriptorMatcher;

   package Class_OneWayDescriptorMatcher is
      type OneWayDescriptorMatcher is limited new GenericDescriptorMatcher with record
         base : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2829
         the_params : aliased Params;  -- /usr/include/opencv2/features2d/features2d.hpp:2830
         prevTrainCount : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2831
      end record;
      pragma Import (CPP, OneWayDescriptorMatcher);

      function New_OneWayDescriptorMatcher (params : access constant Params) return OneWayDescriptorMatcher;  -- /usr/include/opencv2/features2d/features2d.hpp:2796
      pragma CPP_Constructor (New_OneWayDescriptorMatcher, "_ZN2cv23OneWayDescriptorMatcherC1ERKNS0_6ParamsE");

      procedure Delete_OneWayDescriptorMatcher (this : access OneWayDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2797
      pragma Import (CPP, Delete_OneWayDescriptorMatcher, "_ZN2cv23OneWayDescriptorMatcherD1Ev");

      procedure deleting_dtor (this : access OneWayDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2797
      pragma Import (CPP, deleting_dtor, "_ZN2cv23OneWayDescriptorMatcherD0Ev");

      procedure initialize
        (this : access OneWayDescriptorMatcher'Class;
         params : access constant Params;
         base : access constant opencv2_core_core_hpp.Class_Ptr.Ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:2799
      pragma Import (CPP, initialize, "_ZN2cv23OneWayDescriptorMatcher10initializeERKNS0_6ParamsERKNS_3PtrINS_20OneWayDescriptorBaseEEE");

      procedure clear (this : access OneWayDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2802
      pragma Import (CPP, clear, "_ZN2cv23OneWayDescriptorMatcher5clearEv");

      procedure train (this : access OneWayDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2804
      pragma Import (CPP, train, "_ZN2cv23OneWayDescriptorMatcher5trainEv");

      function isMaskSupported (this : access OneWayDescriptorMatcher) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2806
      pragma Import (CPP, isMaskSupported, "_ZN2cv23OneWayDescriptorMatcher15isMaskSupportedEv");

      procedure read (this : access OneWayDescriptorMatcher; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:2808
      pragma Import (CPP, read, "_ZN2cv23OneWayDescriptorMatcher4readERKNS_8FileNodeE");

      procedure write (this : access constant OneWayDescriptorMatcher; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:2809
      pragma Import (CPP, write, "_ZNK2cv23OneWayDescriptorMatcher5writeERNS_11FileStorageE");

      function empty (this : access constant OneWayDescriptorMatcher) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2811
      pragma Import (CPP, empty, "_ZNK2cv23OneWayDescriptorMatcher5emptyEv");

      function clone (this : access constant OneWayDescriptorMatcher; emptyTrainData : Extensions.bool) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2813
      pragma Import (CPP, clone, "_ZNK2cv23OneWayDescriptorMatcher5cloneEb");

      procedure knnMatchImpl
        (this : access OneWayDescriptorMatcher;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2822
      pragma Import (CPP, knnMatchImpl, "_ZN2cv23OneWayDescriptorMatcher12knnMatchImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS4_IS4_INS_6DMatchESaIS9_EESaISB_EEiRKS4_IS1_SaIS1_EEb");

      procedure radiusMatchImpl
        (this : access OneWayDescriptorMatcher;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2825
      pragma Import (CPP, radiusMatchImpl, "_ZN2cv23OneWayDescriptorMatcher15radiusMatchImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS4_IS4_INS_6DMatchESaIS9_EESaISB_EEfRKS4_IS1_SaIS1_EEb");
   end;
   use Class_OneWayDescriptorMatcher;
   type FernDescriptorMatcher;
   type Params is record
      nclasses : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2857
      patchSize : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2858
      signatureSize : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2859
      nstructs : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2860
      structSize : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2861
      nviews : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2862
      compressionMethod : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2863
      the_patchGenerator : aliased PatchGenerator;  -- /usr/include/opencv2/features2d/features2d.hpp:2864
      filename : aliased cpp_4_7_4_bits_stringfwd_h.Class_string.string;  -- /usr/include/opencv2/features2d/features2d.hpp:2866
   end record;
   pragma Convention (C_Pass_By_Copy, Params);
   subtype FernDescriptorMatch is FernDescriptorMatcher;

   package Class_FernDescriptorMatcher is
      type FernDescriptorMatcher is limited new GenericDescriptorMatcher with record
         classifier : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2895
         the_params : aliased Params;  -- /usr/include/opencv2/features2d/features2d.hpp:2896
         prevTrainCount : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:2897
      end record;
      pragma Import (CPP, FernDescriptorMatcher);

      function New_FernDescriptorMatcher (params : access constant Params) return FernDescriptorMatcher;  -- /usr/include/opencv2/features2d/features2d.hpp:2869
      pragma CPP_Constructor (New_FernDescriptorMatcher, "_ZN2cv21FernDescriptorMatcherC1ERKNS0_6ParamsE");

      procedure Delete_FernDescriptorMatcher (this : access FernDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2870
      pragma Import (CPP, Delete_FernDescriptorMatcher, "_ZN2cv21FernDescriptorMatcherD1Ev");

      procedure deleting_dtor (this : access FernDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2870
      pragma Import (CPP, deleting_dtor, "_ZN2cv21FernDescriptorMatcherD0Ev");

      procedure clear (this : access FernDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2872
      pragma Import (CPP, clear, "_ZN2cv21FernDescriptorMatcher5clearEv");

      procedure train (this : access FernDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2874
      pragma Import (CPP, train, "_ZN2cv21FernDescriptorMatcher5trainEv");

      function isMaskSupported (this : access FernDescriptorMatcher) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2876
      pragma Import (CPP, isMaskSupported, "_ZN2cv21FernDescriptorMatcher15isMaskSupportedEv");

      procedure read (this : access FernDescriptorMatcher; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:2878
      pragma Import (CPP, read, "_ZN2cv21FernDescriptorMatcher4readERKNS_8FileNodeE");

      procedure write (this : access constant FernDescriptorMatcher; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:2879
      pragma Import (CPP, write, "_ZNK2cv21FernDescriptorMatcher5writeERNS_11FileStorageE");

      function empty (this : access constant FernDescriptorMatcher) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2880
      pragma Import (CPP, empty, "_ZNK2cv21FernDescriptorMatcher5emptyEv");

      function clone (this : access constant FernDescriptorMatcher; emptyTrainData : Extensions.bool) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2882
      pragma Import (CPP, clone, "_ZNK2cv21FernDescriptorMatcher5cloneEb");

      procedure knnMatchImpl
        (this : access FernDescriptorMatcher;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2885
      pragma Import (CPP, knnMatchImpl, "_ZN2cv21FernDescriptorMatcher12knnMatchImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS4_IS4_INS_6DMatchESaIS9_EESaISB_EEiRKS4_IS1_SaIS1_EEb");

      procedure radiusMatchImpl
        (this : access FernDescriptorMatcher;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2888
      pragma Import (CPP, radiusMatchImpl, "_ZN2cv21FernDescriptorMatcher15radiusMatchImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS4_IS4_INS_6DMatchESaIS9_EESaISB_EEfRKS4_IS1_SaIS1_EEb");

      procedure trainFernClassifier (this : access FernDescriptorMatcher'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:2892
      pragma Import (CPP, trainFernClassifier, "_ZN2cv21FernDescriptorMatcher19trainFernClassifierEv");

      procedure calcBestProbAndMatchIdx
        (this : access FernDescriptorMatcher'Class;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         pt : access constant opencv2_core_core_hpp.Class_Point2f.Point2f;
         bestProb : access float;
         bestMatchIdx : access int;
         signature : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:2893
      pragma Import (CPP, calcBestProbAndMatchIdx, "_ZN2cv21FernDescriptorMatcher23calcBestProbAndMatchIdxERKNS_3MatERKNS_6Point_IfEERfRiRSt6vectorIfSaIfEE");
   end;
   use Class_FernDescriptorMatcher;
   type VectorDescriptorMatcher;
   subtype VectorDescriptorMatch is VectorDescriptorMatcher;

   package Class_VectorDescriptorMatcher is
      type VectorDescriptorMatcher is limited new GenericDescriptorMatcher with record
         extractor : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2939
         matcher : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2940
      end record;
      pragma Import (CPP, VectorDescriptorMatcher);

      function New_VectorDescriptorMatcher (extractor : access constant opencv2_core_core_hpp.Class_Ptr.Ptr; matcher : access constant opencv2_core_core_hpp.Class_Ptr.Ptr) return VectorDescriptorMatcher;  -- /usr/include/opencv2/features2d/features2d.hpp:2913
      pragma CPP_Constructor (New_VectorDescriptorMatcher, "_ZN2cv23VectorDescriptorMatcherC1ERKNS_3PtrINS_19DescriptorExtractorEEERKNS1_INS_17DescriptorMatcherEEE");

      procedure Delete_VectorDescriptorMatcher (this : access VectorDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2914
      pragma Import (CPP, Delete_VectorDescriptorMatcher, "_ZN2cv23VectorDescriptorMatcherD1Ev");

      procedure deleting_dtor (this : access VectorDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2914
      pragma Import (CPP, deleting_dtor, "_ZN2cv23VectorDescriptorMatcherD0Ev");

      procedure add
        (this : access VectorDescriptorMatcher;
         imgCollection : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         pointCollection : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/include/opencv2/features2d/features2d.hpp:2916
      pragma Import (CPP, add, "_ZN2cv23VectorDescriptorMatcher3addERKSt6vectorINS_3MatESaIS2_EERS1_IS1_INS_8KeyPointESaIS7_EESaIS9_EE");

      procedure clear (this : access VectorDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2919
      pragma Import (CPP, clear, "_ZN2cv23VectorDescriptorMatcher5clearEv");

      procedure train (this : access VectorDescriptorMatcher);  -- /usr/include/opencv2/features2d/features2d.hpp:2921
      pragma Import (CPP, train, "_ZN2cv23VectorDescriptorMatcher5trainEv");

      function isMaskSupported (this : access VectorDescriptorMatcher) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2923
      pragma Import (CPP, isMaskSupported, "_ZN2cv23VectorDescriptorMatcher15isMaskSupportedEv");

      procedure read (this : access VectorDescriptorMatcher; fn : access constant opencv2_core_core_hpp.Class_FileNode.FileNode);  -- /usr/include/opencv2/features2d/features2d.hpp:2925
      pragma Import (CPP, read, "_ZN2cv23VectorDescriptorMatcher4readERKNS_8FileNodeE");

      procedure write (this : access constant VectorDescriptorMatcher; fs : access opencv2_core_core_hpp.Class_FileStorage.FileStorage'Class);  -- /usr/include/opencv2/features2d/features2d.hpp:2926
      pragma Import (CPP, write, "_ZNK2cv23VectorDescriptorMatcher5writeERNS_11FileStorageE");

      function empty (this : access constant VectorDescriptorMatcher) return Extensions.bool;  -- /usr/include/opencv2/features2d/features2d.hpp:2927
      pragma Import (CPP, empty, "_ZNK2cv23VectorDescriptorMatcher5emptyEv");

      function clone (this : access constant VectorDescriptorMatcher; emptyTrainData : Extensions.bool) return opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:2929
      pragma Import (CPP, clone, "_ZNK2cv23VectorDescriptorMatcher5cloneEb");

      procedure knnMatchImpl
        (this : access VectorDescriptorMatcher;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         k : int;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2932
      pragma Import (CPP, knnMatchImpl, "_ZN2cv23VectorDescriptorMatcher12knnMatchImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS4_IS4_INS_6DMatchESaIS9_EESaISB_EEiRKS4_IS1_SaIS1_EEb");

      procedure radiusMatchImpl
        (this : access VectorDescriptorMatcher;
         queryImage : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         queryKeypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         matches : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         maxDistance : float;
         masks : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         compactResult : Extensions.bool);  -- /usr/include/opencv2/features2d/features2d.hpp:2935
      pragma Import (CPP, radiusMatchImpl, "_ZN2cv23VectorDescriptorMatcher15radiusMatchImplERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS4_IS4_INS_6DMatchESaIS9_EESaISB_EEfRKS4_IS1_SaIS1_EEb");
   end;
   use Class_VectorDescriptorMatcher;
   type DrawMatchesFlags is record
      null;
   end record;
   pragma Convention (C_Pass_By_Copy, DrawMatchesFlags);  -- /usr/include/opencv2/features2d/features2d.hpp:2946

   procedure drawKeypoints
     (image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      keypoints : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      outImage : access opencv2_core_core_hpp.Class_Mat.Mat;
      color : access constant opencv2_core_core_hpp.Class_Scalar.Scalar;
      flags : int);  -- /usr/include/opencv2/features2d/features2d.hpp:2962
   pragma Import (CPP, drawKeypoints, "_ZN2cv13drawKeypointsERKNS_3MatERKSt6vectorINS_8KeyPointESaIS4_EERS0_RKNS_7Scalar_IdEEi");

   procedure drawMatches
     (img1 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      keypoints1 : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      img2 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      keypoints2 : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      matches1to2 : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      outImg : access opencv2_core_core_hpp.Class_Mat.Mat;
      matchColor : access constant opencv2_core_core_hpp.Class_Scalar.Scalar;
      singlePointColor : access constant opencv2_core_core_hpp.Class_Scalar.Scalar;
      matchesMask : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      flags : int);  -- /usr/include/opencv2/features2d/features2d.hpp:2966
   pragma Import (CPP, drawMatches, "_ZN2cv11drawMatchesERKNS_3MatERKSt6vectorINS_8KeyPointESaIS4_EES2_S8_RKS3_INS_6DMatchESaIS9_EERS0_RKNS_7Scalar_IdEESI_RKS3_IcSaIcEEi");

   procedure drawMatches
     (img1 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      keypoints1 : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      img2 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      keypoints2 : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      matches1to2 : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      outImg : access opencv2_core_core_hpp.Class_Mat.Mat;
      matchColor : access constant opencv2_core_core_hpp.Class_Scalar.Scalar;
      singlePointColor : access constant opencv2_core_core_hpp.Class_Scalar.Scalar;
      matchesMask : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      flags : int);  -- /usr/include/opencv2/features2d/features2d.hpp:2972
   pragma Import (CPP, drawMatches, "_ZN2cv11drawMatchesERKNS_3MatERKSt6vectorINS_8KeyPointESaIS4_EES2_S8_RKS3_IS3_INS_6DMatchESaIS9_EESaISB_EERS0_RKNS_7Scalar_IdEESK_RKS3_IS3_IcSaIcEESaISM_EEi");

   procedure evaluateFeatureDetector
     (img1 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      img2 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      H1to2 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      keypoints1 : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      keypoints2 : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      repeatability : access float;
      correspCount : access int;
      fdetector : access constant opencv2_core_core_hpp.Class_Ptr.Ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:2982
   pragma Import (CPP, evaluateFeatureDetector, "_ZN2cv23evaluateFeatureDetectorERKNS_3MatES2_S2_PSt6vectorINS_8KeyPointESaIS4_EES7_RfRiRKNS_3PtrINS_15FeatureDetectorEEE");

   procedure computeRecallPrecisionCurve
     (matches1to2 : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      correctMatches1to2Mask : System.Address;
      recallPrecisionCurve : System.Address);  -- /usr/include/opencv2/features2d/features2d.hpp:2987
   pragma Import (CPP, computeRecallPrecisionCurve, "_ZN2cv27computeRecallPrecisionCurveERKSt6vectorIS0_INS_6DMatchESaIS1_EESaIS3_EERKS0_IS0_IhSaIhEESaIS9_EERS0_INS_6Point_IfEESaISF_EE");

   function getRecall (recallPrecisionCurve : System.Address; l_precision : float) return float;  -- /usr/include/opencv2/features2d/features2d.hpp:2991
   pragma Import (CPP, getRecall, "_ZN2cv9getRecallERKSt6vectorINS_6Point_IfEESaIS2_EEf");

   function getNearestPoint (recallPrecisionCurve : System.Address; l_precision : float) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:2992
   pragma Import (CPP, getNearestPoint, "_ZN2cv15getNearestPointERKSt6vectorINS_6Point_IfEESaIS2_EEf");

   procedure evaluateGenericDescriptorMatcher
     (img1 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      img2 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      H1to2 : access constant opencv2_core_core_hpp.Class_Mat.Mat;
      keypoints1 : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      keypoints2 : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      matches1to2 : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      correctMatches1to2Mask : System.Address;
      recallPrecisionCurve : System.Address;
      dmatch : access constant opencv2_core_core_hpp.Class_Ptr.Ptr);  -- /usr/include/opencv2/features2d/features2d.hpp:2994
   pragma Import (CPP, evaluateGenericDescriptorMatcher, "_ZN2cv32evaluateGenericDescriptorMatcherERKNS_3MatES2_S2_RSt6vectorINS_8KeyPointESaIS4_EES7_PS3_IS3_INS_6DMatchESaIS8_EESaISA_EEPS3_IS3_IhSaIhEESaISF_EERS3_INS_6Point_IfEESaISK_EERKNS_3PtrINS_24GenericDescriptorMatcherEEE");

   package Class_BOWTrainer is
      type BOWTrainer is abstract tagged limited record
         descriptors : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:3030
         size : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:3031
      end record;
      pragma Import (CPP, BOWTrainer);

      function New_BOWTrainer return BOWTrainer is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:3010
      pragma CPP_Constructor (New_BOWTrainer, "_ZN2cv10BOWTrainerC1Ev");

      procedure Delete_BOWTrainer (this : access BOWTrainer);  -- /usr/include/opencv2/features2d/features2d.hpp:3011
      pragma Import (CPP, Delete_BOWTrainer, "_ZN2cv10BOWTrainerD1Ev");

      procedure deleting_dtor (this : access BOWTrainer);  -- /usr/include/opencv2/features2d/features2d.hpp:3011
      pragma Import (CPP, deleting_dtor, "_ZN2cv10BOWTrainerD0Ev");

      procedure add (this : access BOWTrainer'Class; descriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:3013
      pragma Import (CPP, add, "_ZN2cv10BOWTrainer3addERKNS_3MatE");

      function getDescriptors (this : access constant BOWTrainer'Class) return access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/include/opencv2/features2d/features2d.hpp:3014
      pragma Import (CPP, getDescriptors, "_ZNK2cv10BOWTrainer14getDescriptorsEv");

      function descripotorsCount (this : access constant BOWTrainer'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:3015
      pragma Import (CPP, descripotorsCount, "_ZNK2cv10BOWTrainer17descripotorsCountEv");

      procedure clear (this : access BOWTrainer);  -- /usr/include/opencv2/features2d/features2d.hpp:3017
      pragma Import (CPP, clear, "_ZN2cv10BOWTrainer5clearEv");

      function cluster (this : access constant BOWTrainer) return opencv2_core_core_hpp.Class_Mat.Mat is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:3026

      function cluster (this : access constant BOWTrainer; descriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat) return opencv2_core_core_hpp.Class_Mat.Mat is abstract;  -- /usr/include/opencv2/features2d/features2d.hpp:3027
   end;
   use Class_BOWTrainer;
   package Class_BOWKMeansTrainer is
      type BOWKMeansTrainer is limited new BOWTrainer with record
         clusterCount : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:3050
         termcrit : aliased opencv2_core_core_hpp.Class_TermCriteria.TermCriteria;  -- /usr/include/opencv2/features2d/features2d.hpp:3051
         attempts : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:3052
         flags : aliased int;  -- /usr/include/opencv2/features2d/features2d.hpp:3053
      end record;
      pragma Import (CPP, BOWKMeansTrainer);

      function New_BOWKMeansTrainer
        (clusterCount : int;
         termcrit : access constant opencv2_core_core_hpp.Class_TermCriteria.TermCriteria;
         attempts : int;
         flags : int) return BOWKMeansTrainer;  -- /usr/include/opencv2/features2d/features2d.hpp:3040
      pragma CPP_Constructor (New_BOWKMeansTrainer, "_ZN2cv16BOWKMeansTrainerC1EiRKNS_12TermCriteriaEii");

      procedure Delete_BOWKMeansTrainer (this : access BOWKMeansTrainer);  -- /usr/include/opencv2/features2d/features2d.hpp:3042
      pragma Import (CPP, Delete_BOWKMeansTrainer, "_ZN2cv16BOWKMeansTrainerD1Ev");

      procedure deleting_dtor (this : access BOWKMeansTrainer);  -- /usr/include/opencv2/features2d/features2d.hpp:3042
      pragma Import (CPP, deleting_dtor, "_ZN2cv16BOWKMeansTrainerD0Ev");

      function cluster (this : access constant BOWKMeansTrainer) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/features2d/features2d.hpp:3045
      pragma Import (CPP, cluster, "_ZNK2cv16BOWKMeansTrainer7clusterEv");

      function cluster (this : access constant BOWKMeansTrainer; descriptors : access constant opencv2_core_core_hpp.Class_Mat.Mat) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/features2d/features2d.hpp:3046
      pragma Import (CPP, cluster, "_ZNK2cv16BOWKMeansTrainer7clusterERKNS_3MatE");
   end;
   use Class_BOWKMeansTrainer;
   package Class_BOWImgDescriptorExtractor is
      type BOWImgDescriptorExtractor is tagged limited record
         vocabulary : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/features2d/features2d.hpp:3076
         dextractor : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:3077
         dmatcher : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/features2d/features2d.hpp:3078
      end record;
      pragma Import (CPP, BOWImgDescriptorExtractor);

      function New_BOWImgDescriptorExtractor (dextractor : access constant opencv2_core_core_hpp.Class_Ptr.Ptr; dmatcher : access constant opencv2_core_core_hpp.Class_Ptr.Ptr) return BOWImgDescriptorExtractor;  -- /usr/include/opencv2/features2d/features2d.hpp:3062
      pragma CPP_Constructor (New_BOWImgDescriptorExtractor, "_ZN2cv25BOWImgDescriptorExtractorC1ERKNS_3PtrINS_19DescriptorExtractorEEERKNS1_INS_17DescriptorMatcherEEE");

      procedure Delete_BOWImgDescriptorExtractor (this : access BOWImgDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:3064
      pragma Import (CPP, Delete_BOWImgDescriptorExtractor, "_ZN2cv25BOWImgDescriptorExtractorD1Ev");

      procedure deleting_dtor (this : access BOWImgDescriptorExtractor);  -- /usr/include/opencv2/features2d/features2d.hpp:3064
      pragma Import (CPP, deleting_dtor, "_ZN2cv25BOWImgDescriptorExtractorD0Ev");

      procedure setVocabulary (this : access BOWImgDescriptorExtractor'Class; vocabulary : access constant opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:3066
      pragma Import (CPP, setVocabulary, "_ZN2cv25BOWImgDescriptorExtractor13setVocabularyERKNS_3MatE");

      function getVocabulary (this : access constant BOWImgDescriptorExtractor'Class) return access constant opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/features2d/features2d.hpp:3067
      pragma Import (CPP, getVocabulary, "_ZNK2cv25BOWImgDescriptorExtractor13getVocabularyEv");

      procedure compute
        (this : access BOWImgDescriptorExtractor'Class;
         image : access constant opencv2_core_core_hpp.Class_Mat.Mat;
         keypoints : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         imgDescriptor : access opencv2_core_core_hpp.Class_Mat.Mat;
         pointIdxsOfClusters : access cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         descriptors : access opencv2_core_core_hpp.Class_Mat.Mat);  -- /usr/include/opencv2/features2d/features2d.hpp:3068
      pragma Import (CPP, compute, "_ZN2cv25BOWImgDescriptorExtractor7computeERKNS_3MatERSt6vectorINS_8KeyPointESaIS5_EERS1_PS4_IS4_IiSaIiEESaISB_EEPS1_");

      function descriptorSize (this : access constant BOWImgDescriptorExtractor'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:3072
      pragma Import (CPP, descriptorSize, "_ZNK2cv25BOWImgDescriptorExtractor14descriptorSizeEv");

      function descriptorType (this : access constant BOWImgDescriptorExtractor'Class) return int;  -- /usr/include/opencv2/features2d/features2d.hpp:3073
      pragma Import (CPP, descriptorType, "_ZNK2cv25BOWImgDescriptorExtractor14descriptorTypeEv");
   end;
   use Class_BOWImgDescriptorExtractor;
end opencv2_features2d_features2d_hpp;
