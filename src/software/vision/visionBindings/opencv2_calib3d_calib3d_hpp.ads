pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_types_c_h;
with System;
with opencv2_core_core_hpp;
with Interfaces.C.Extensions;

package opencv2_calib3d_calib3d_hpp is


   CV_FM_7POINT : constant := 1;  --  /usr/include/opencv2/calib3d/calib3d.hpp:79
   CV_FM_8POINT : constant := 2;  --  /usr/include/opencv2/calib3d/calib3d.hpp:80

   CV_LMEDS : constant := 4;  --  /usr/include/opencv2/calib3d/calib3d.hpp:82
   CV_RANSAC : constant := 8;  --  /usr/include/opencv2/calib3d/calib3d.hpp:83
   --  unsupported macro: CV_FM_LMEDS_ONLY CV_LMEDS
   --  unsupported macro: CV_FM_RANSAC_ONLY CV_RANSAC
   --  unsupported macro: CV_FM_LMEDS CV_LMEDS
   --  unsupported macro: CV_FM_RANSAC CV_RANSAC

   CV_CALIB_CB_ADAPTIVE_THRESH : constant := 1;  --  /usr/include/opencv2/calib3d/calib3d.hpp:194
   CV_CALIB_CB_NORMALIZE_IMAGE : constant := 2;  --  /usr/include/opencv2/calib3d/calib3d.hpp:195
   CV_CALIB_CB_FILTER_QUADS : constant := 4;  --  /usr/include/opencv2/calib3d/calib3d.hpp:196
   CV_CALIB_CB_FAST_CHECK : constant := 8;  --  /usr/include/opencv2/calib3d/calib3d.hpp:197

   CV_CALIB_USE_INTRINSIC_GUESS : constant := 1;  --  /usr/include/opencv2/calib3d/calib3d.hpp:219
   CV_CALIB_FIX_ASPECT_RATIO : constant := 2;  --  /usr/include/opencv2/calib3d/calib3d.hpp:220
   CV_CALIB_FIX_PRINCIPAL_POINT : constant := 4;  --  /usr/include/opencv2/calib3d/calib3d.hpp:221
   CV_CALIB_ZERO_TANGENT_DIST : constant := 8;  --  /usr/include/opencv2/calib3d/calib3d.hpp:222
   CV_CALIB_FIX_FOCAL_LENGTH : constant := 16;  --  /usr/include/opencv2/calib3d/calib3d.hpp:223
   CV_CALIB_FIX_K1 : constant := 32;  --  /usr/include/opencv2/calib3d/calib3d.hpp:224
   CV_CALIB_FIX_K2 : constant := 64;  --  /usr/include/opencv2/calib3d/calib3d.hpp:225
   CV_CALIB_FIX_K3 : constant := 128;  --  /usr/include/opencv2/calib3d/calib3d.hpp:226
   CV_CALIB_FIX_K4 : constant := 2048;  --  /usr/include/opencv2/calib3d/calib3d.hpp:227
   CV_CALIB_FIX_K5 : constant := 4096;  --  /usr/include/opencv2/calib3d/calib3d.hpp:228
   CV_CALIB_FIX_K6 : constant := 8192;  --  /usr/include/opencv2/calib3d/calib3d.hpp:229
   CV_CALIB_RATIONAL_MODEL : constant := 16384;  --  /usr/include/opencv2/calib3d/calib3d.hpp:230

   CV_CALIB_FIX_INTRINSIC : constant := 256;  --  /usr/include/opencv2/calib3d/calib3d.hpp:256
   CV_CALIB_SAME_FOCAL_LENGTH : constant := 512;  --  /usr/include/opencv2/calib3d/calib3d.hpp:257

   CV_CALIB_ZERO_DISPARITY : constant := 1024;  --  /usr/include/opencv2/calib3d/calib3d.hpp:272

   CV_STEREO_BM_NORMALIZED_RESPONSE : constant := 0;  --  /usr/include/opencv2/calib3d/calib3d.hpp:298
   CV_STEREO_BM_XSOBEL : constant := 1;  --  /usr/include/opencv2/calib3d/calib3d.hpp:299

   CV_STEREO_BM_BASIC : constant := 0;  --  /usr/include/opencv2/calib3d/calib3d.hpp:336
   CV_STEREO_BM_FISH_EYE : constant := 1;  --  /usr/include/opencv2/calib3d/calib3d.hpp:337
   CV_STEREO_BM_NARROW : constant := 2;  --  /usr/include/opencv2/calib3d/calib3d.hpp:338
   --  unsupported macro: CV_STEREO_GC_OCCLUDED SHRT_MAX

   --  skipped empty struct CvPOSITObject

   function cvCreatePOSITObject (points : access opencv2_core_types_c_h.CvPoint3D32f; point_count : int) return System.Address;  -- /usr/include/opencv2/calib3d/calib3d.hpp:60
   pragma Import (C, cvCreatePOSITObject, "cvCreatePOSITObject");

   procedure cvPOSIT
     (posit_object : System.Address;
      image_points : access opencv2_core_types_c_h.CvPoint2D32f;
      focal_length : double;
      criteria : opencv2_core_types_c_h.CvTermCriteria;
      rotation_matrix : access float;
      translation_vector : access float);  -- /usr/include/opencv2/calib3d/calib3d.hpp:65
   pragma Import (C, cvPOSIT, "cvPOSIT");

   procedure cvReleasePOSITObject (posit_object : System.Address);  -- /usr/include/opencv2/calib3d/calib3d.hpp:70
   pragma Import (C, cvReleasePOSITObject, "cvReleasePOSITObject");

   function cvRANSACUpdateNumIters
     (p : double;
      err_prob : double;
      model_points : int;
      max_iters : int) return int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:73
   pragma Import (C, cvRANSACUpdateNumIters, "cvRANSACUpdateNumIters");

   procedure cvConvertPointsHomogeneous (src : access constant opencv2_core_types_c_h.CvMat; dst : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/calib3d/calib3d.hpp:76
   pragma Import (C, cvConvertPointsHomogeneous, "cvConvertPointsHomogeneous");

   function cvFindFundamentalMat
     (points1 : access constant opencv2_core_types_c_h.CvMat;
      points2 : access constant opencv2_core_types_c_h.CvMat;
      fundamental_matrix : access opencv2_core_types_c_h.CvMat;
      method : int;
      param1 : double;
      param2 : double;
      status : access opencv2_core_types_c_h.CvMat) return int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:90
   pragma Import (C, cvFindFundamentalMat, "cvFindFundamentalMat");

   procedure cvComputeCorrespondEpilines
     (points : access constant opencv2_core_types_c_h.CvMat;
      which_image : int;
      fundamental_matrix : access constant opencv2_core_types_c_h.CvMat;
      correspondent_lines : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/calib3d/calib3d.hpp:99
   pragma Import (C, cvComputeCorrespondEpilines, "cvComputeCorrespondEpilines");

   procedure cvTriangulatePoints
     (projMatr1 : access opencv2_core_types_c_h.CvMat;
      projMatr2 : access opencv2_core_types_c_h.CvMat;
      projPoints1 : access opencv2_core_types_c_h.CvMat;
      projPoints2 : access opencv2_core_types_c_h.CvMat;
      points4D : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/calib3d/calib3d.hpp:106
   pragma Import (C, cvTriangulatePoints, "cvTriangulatePoints");

   procedure cvCorrectMatches
     (F : access opencv2_core_types_c_h.CvMat;
      points1 : access opencv2_core_types_c_h.CvMat;
      points2 : access opencv2_core_types_c_h.CvMat;
      new_points1 : access opencv2_core_types_c_h.CvMat;
      new_points2 : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/calib3d/calib3d.hpp:110
   pragma Import (C, cvCorrectMatches, "cvCorrectMatches");

   procedure cvGetOptimalNewCameraMatrix
     (camera_matrix : access constant opencv2_core_types_c_h.CvMat;
      dist_coeffs : access constant opencv2_core_types_c_h.CvMat;
      image_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      alpha : double;
      new_camera_matrix : access opencv2_core_types_c_h.CvMat;
      new_imag_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      valid_pixel_ROI : access opencv2_core_types_c_h.CvRect;
      center_principal_point : int);  -- /usr/include/opencv2/calib3d/calib3d.hpp:118
   pragma Import (C, cvGetOptimalNewCameraMatrix, "cvGetOptimalNewCameraMatrix");

   function cvRodrigues2
     (src : access constant opencv2_core_types_c_h.CvMat;
      dst : access opencv2_core_types_c_h.CvMat;
      jacobian : access opencv2_core_types_c_h.CvMat) return int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:127
   pragma Import (C, cvRodrigues2, "cvRodrigues2");

   function cvFindHomography
     (src_points : access constant opencv2_core_types_c_h.CvMat;
      dst_points : access constant opencv2_core_types_c_h.CvMat;
      homography : access opencv2_core_types_c_h.CvMat;
      method : int;
      ransacReprojThreshold : double;
      mask : access opencv2_core_types_c_h.CvMat) return int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:131
   pragma Import (C, cvFindHomography, "cvFindHomography");

   procedure cvRQDecomp3x3
     (matrixM : access constant opencv2_core_types_c_h.CvMat;
      matrixR : access opencv2_core_types_c_h.CvMat;
      matrixQ : access opencv2_core_types_c_h.CvMat;
      matrixQx : access opencv2_core_types_c_h.CvMat;
      matrixQy : access opencv2_core_types_c_h.CvMat;
      matrixQz : access opencv2_core_types_c_h.CvMat;
      eulerAngles : access opencv2_core_types_c_h.CvPoint3D64f);  -- /usr/include/opencv2/calib3d/calib3d.hpp:139
   pragma Import (C, cvRQDecomp3x3, "cvRQDecomp3x3");

   procedure cvDecomposeProjectionMatrix
     (projMatr : access constant opencv2_core_types_c_h.CvMat;
      calibMatr : access opencv2_core_types_c_h.CvMat;
      rotMatr : access opencv2_core_types_c_h.CvMat;
      posVect : access opencv2_core_types_c_h.CvMat;
      rotMatrX : access opencv2_core_types_c_h.CvMat;
      rotMatrY : access opencv2_core_types_c_h.CvMat;
      rotMatrZ : access opencv2_core_types_c_h.CvMat;
      eulerAngles : access opencv2_core_types_c_h.CvPoint3D64f);  -- /usr/include/opencv2/calib3d/calib3d.hpp:146
   pragma Import (C, cvDecomposeProjectionMatrix, "cvDecomposeProjectionMatrix");

   procedure cvCalcMatMulDeriv
     (A : access constant opencv2_core_types_c_h.CvMat;
      B : access constant opencv2_core_types_c_h.CvMat;
      dABdA : access opencv2_core_types_c_h.CvMat;
      dABdB : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/calib3d/calib3d.hpp:154
   pragma Import (C, cvCalcMatMulDeriv, "cvCalcMatMulDeriv");

   procedure cvComposeRT
     (u_rvec1 : access constant opencv2_core_types_c_h.CvMat;
      u_tvec1 : access constant opencv2_core_types_c_h.CvMat;
      u_rvec2 : access constant opencv2_core_types_c_h.CvMat;
      u_tvec2 : access constant opencv2_core_types_c_h.CvMat;
      u_rvec3 : access opencv2_core_types_c_h.CvMat;
      u_tvec3 : access opencv2_core_types_c_h.CvMat;
      dr3dr1 : access opencv2_core_types_c_h.CvMat;
      dr3dt1 : access opencv2_core_types_c_h.CvMat;
      dr3dr2 : access opencv2_core_types_c_h.CvMat;
      dr3dt2 : access opencv2_core_types_c_h.CvMat;
      dt3dr1 : access opencv2_core_types_c_h.CvMat;
      dt3dt1 : access opencv2_core_types_c_h.CvMat;
      dt3dr2 : access opencv2_core_types_c_h.CvMat;
      dt3dt2 : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/calib3d/calib3d.hpp:158
   pragma Import (C, cvComposeRT, "cvComposeRT");

   procedure cvProjectPoints2
     (object_points : access constant opencv2_core_types_c_h.CvMat;
      rotation_vector : access constant opencv2_core_types_c_h.CvMat;
      translation_vector : access constant opencv2_core_types_c_h.CvMat;
      camera_matrix : access constant opencv2_core_types_c_h.CvMat;
      distortion_coeffs : access constant opencv2_core_types_c_h.CvMat;
      image_points : access opencv2_core_types_c_h.CvMat;
      dpdrot : access opencv2_core_types_c_h.CvMat;
      dpdt : access opencv2_core_types_c_h.CvMat;
      dpdf : access opencv2_core_types_c_h.CvMat;
      dpdc : access opencv2_core_types_c_h.CvMat;
      dpddist : access opencv2_core_types_c_h.CvMat;
      aspect_ratio : double);  -- /usr/include/opencv2/calib3d/calib3d.hpp:168
   pragma Import (C, cvProjectPoints2, "cvProjectPoints2");

   procedure cvFindExtrinsicCameraParams2
     (object_points : access constant opencv2_core_types_c_h.CvMat;
      image_points : access constant opencv2_core_types_c_h.CvMat;
      camera_matrix : access constant opencv2_core_types_c_h.CvMat;
      distortion_coeffs : access constant opencv2_core_types_c_h.CvMat;
      rotation_vector : access opencv2_core_types_c_h.CvMat;
      translation_vector : access opencv2_core_types_c_h.CvMat;
      use_extrinsic_guess : int);  -- /usr/include/opencv2/calib3d/calib3d.hpp:178
   pragma Import (C, cvFindExtrinsicCameraParams2, "cvFindExtrinsicCameraParams2");

   procedure cvInitIntrinsicParams2D
     (object_points : access constant opencv2_core_types_c_h.CvMat;
      image_points : access constant opencv2_core_types_c_h.CvMat;
      npoints : access constant opencv2_core_types_c_h.CvMat;
      image_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      camera_matrix : access opencv2_core_types_c_h.CvMat;
      aspect_ratio : double);  -- /usr/include/opencv2/calib3d/calib3d.hpp:188
   pragma Import (C, cvInitIntrinsicParams2D, "cvInitIntrinsicParams2D");

   function cvCheckChessboard (src : access opencv2_core_types_c_h.IplImage; size : opencv2_core_types_c_h.Class_CvSize.CvSize) return int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:205
   pragma Import (C, cvCheckChessboard, "cvCheckChessboard");

   function cvFindChessboardCorners
     (image : System.Address;
      pattern_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      corners : access opencv2_core_types_c_h.CvPoint2D32f;
      corner_count : access int;
      flags : int) return int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:208
   pragma Import (C, cvFindChessboardCorners, "cvFindChessboardCorners");

   procedure cvDrawChessboardCorners
     (image : System.Address;
      pattern_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      corners : access opencv2_core_types_c_h.CvPoint2D32f;
      count : int;
      pattern_was_found : int);  -- /usr/include/opencv2/calib3d/calib3d.hpp:215
   pragma Import (C, cvDrawChessboardCorners, "cvDrawChessboardCorners");

   function cvCalibrateCamera2
     (object_points : access constant opencv2_core_types_c_h.CvMat;
      image_points : access constant opencv2_core_types_c_h.CvMat;
      point_counts : access constant opencv2_core_types_c_h.CvMat;
      image_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      camera_matrix : access opencv2_core_types_c_h.CvMat;
      distortion_coeffs : access opencv2_core_types_c_h.CvMat;
      rotation_vectors : access opencv2_core_types_c_h.CvMat;
      translation_vectors : access opencv2_core_types_c_h.CvMat;
      flags : int) return double;  -- /usr/include/opencv2/calib3d/calib3d.hpp:234
   pragma Import (C, cvCalibrateCamera2, "cvCalibrateCamera2");

   procedure cvCalibrationMatrixValues
     (camera_matrix : access constant opencv2_core_types_c_h.CvMat;
      image_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      aperture_width : double;
      aperture_height : double;
      fovx : access double;
      fovy : access double;
      focal_length : access double;
      principal_point : access opencv2_core_types_c_h.CvPoint2D64f;
      pixel_aspect_ratio : access double);  -- /usr/include/opencv2/calib3d/calib3d.hpp:246
   pragma Import (C, cvCalibrationMatrixValues, "cvCalibrationMatrixValues");

   function cvStereoCalibrate
     (object_points : access constant opencv2_core_types_c_h.CvMat;
      image_points1 : access constant opencv2_core_types_c_h.CvMat;
      image_points2 : access constant opencv2_core_types_c_h.CvMat;
      npoints : access constant opencv2_core_types_c_h.CvMat;
      camera_matrix1 : access opencv2_core_types_c_h.CvMat;
      dist_coeffs1 : access opencv2_core_types_c_h.CvMat;
      camera_matrix2 : access opencv2_core_types_c_h.CvMat;
      dist_coeffs2 : access opencv2_core_types_c_h.CvMat;
      image_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      R : access opencv2_core_types_c_h.CvMat;
      T : access opencv2_core_types_c_h.CvMat;
      E : access opencv2_core_types_c_h.CvMat;
      F : access opencv2_core_types_c_h.CvMat;
      term_crit : opencv2_core_types_c_h.CvTermCriteria;
      flags : int) return double;  -- /usr/include/opencv2/calib3d/calib3d.hpp:262
   pragma Import (C, cvStereoCalibrate, "cvStereoCalibrate");

   procedure cvStereoRectify
     (camera_matrix1 : access constant opencv2_core_types_c_h.CvMat;
      camera_matrix2 : access constant opencv2_core_types_c_h.CvMat;
      dist_coeffs1 : access constant opencv2_core_types_c_h.CvMat;
      dist_coeffs2 : access constant opencv2_core_types_c_h.CvMat;
      image_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      R : access constant opencv2_core_types_c_h.CvMat;
      T : access constant opencv2_core_types_c_h.CvMat;
      R1 : access opencv2_core_types_c_h.CvMat;
      R2 : access opencv2_core_types_c_h.CvMat;
      P1 : access opencv2_core_types_c_h.CvMat;
      P2 : access opencv2_core_types_c_h.CvMat;
      Q : access opencv2_core_types_c_h.CvMat;
      flags : int;
      alpha : double;
      new_image_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      valid_pix_ROI1 : access opencv2_core_types_c_h.CvRect;
      valid_pix_ROI2 : access opencv2_core_types_c_h.CvRect);  -- /usr/include/opencv2/calib3d/calib3d.hpp:276
   pragma Import (C, cvStereoRectify, "cvStereoRectify");

   function cvStereoRectifyUncalibrated
     (points1 : access constant opencv2_core_types_c_h.CvMat;
      points2 : access constant opencv2_core_types_c_h.CvMat;
      F : access constant opencv2_core_types_c_h.CvMat;
      img_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      H1 : access opencv2_core_types_c_h.CvMat;
      H2 : access opencv2_core_types_c_h.CvMat;
      threshold : double) return int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:289
   pragma Import (C, cvStereoRectifyUncalibrated, "cvStereoRectifyUncalibrated");

   type CvStereoBMState is record
      preFilterType : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:305
      preFilterSize : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:306
      preFilterCap : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:307
      SADWindowSize : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:310
      minDisparity : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:311
      numberOfDisparities : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:312
      textureThreshold : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:315
      uniquenessRatio : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:317
      speckleWindowSize : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:320
      speckleRange : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:321
      trySmallerWindows : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:323
      roi1 : aliased opencv2_core_types_c_h.CvRect;  -- /usr/include/opencv2/calib3d/calib3d.hpp:325
      roi2 : aliased opencv2_core_types_c_h.CvRect;  -- /usr/include/opencv2/calib3d/calib3d.hpp:325
      disp12MaxDiff : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:326
      preFilteredImg0 : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:329
      preFilteredImg1 : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:330
      slidingSumBuf : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:331
      cost : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:332
      disp : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:333
   end record;
   pragma Convention (C_Pass_By_Copy, CvStereoBMState);  -- /usr/include/opencv2/calib3d/calib3d.hpp:302

   function cvCreateStereoBMState (preset : int; numberOfDisparities : int) return access CvStereoBMState;  -- /usr/include/opencv2/calib3d/calib3d.hpp:340
   pragma Import (C, cvCreateStereoBMState, "cvCreateStereoBMState");

   procedure cvReleaseStereoBMState (state : System.Address);  -- /usr/include/opencv2/calib3d/calib3d.hpp:343
   pragma Import (C, cvReleaseStereoBMState, "cvReleaseStereoBMState");

   procedure cvFindStereoCorrespondenceBM
     (left : System.Address;
      right : System.Address;
      disparity : System.Address;
      state : access CvStereoBMState);  -- /usr/include/opencv2/calib3d/calib3d.hpp:345
   pragma Import (C, cvFindStereoCorrespondenceBM, "cvFindStereoCorrespondenceBM");

   function cvGetValidDisparityROI
     (roi1 : opencv2_core_types_c_h.CvRect;
      roi2 : opencv2_core_types_c_h.CvRect;
      minDisparity : int;
      numberOfDisparities : int;
      SADWindowSize : int) return opencv2_core_types_c_h.CvRect;  -- /usr/include/opencv2/calib3d/calib3d.hpp:348
   pragma Import (C, cvGetValidDisparityROI, "cvGetValidDisparityROI");

   procedure cvValidateDisparity
     (disparity : System.Address;
      cost : System.Address;
      minDisparity : int;
      numberOfDisparities : int;
      disp12MaxDiff : int);  -- /usr/include/opencv2/calib3d/calib3d.hpp:351
   pragma Import (C, cvValidateDisparity, "cvValidateDisparity");

   type CvStereoGCState is record
      Ithreshold : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:360
      interactionRadius : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:361
      K : aliased float;  -- /usr/include/opencv2/calib3d/calib3d.hpp:362
      lambda : aliased float;  -- /usr/include/opencv2/calib3d/calib3d.hpp:362
      lambda1 : aliased float;  -- /usr/include/opencv2/calib3d/calib3d.hpp:362
      lambda2 : aliased float;  -- /usr/include/opencv2/calib3d/calib3d.hpp:362
      occlusionCost : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:363
      minDisparity : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:364
      numberOfDisparities : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:365
      maxIters : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:366
      left : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:368
      right : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:369
      dispLeft : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:370
      dispRight : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:371
      ptrLeft : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:372
      ptrRight : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:373
      vtxBuf : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:374
      edgeBuf : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:375
   end record;
   pragma Convention (C_Pass_By_Copy, CvStereoGCState);  -- /usr/include/opencv2/calib3d/calib3d.hpp:358

   function cvCreateStereoGCState (numberOfDisparities : int; maxIters : int) return access CvStereoGCState;  -- /usr/include/opencv2/calib3d/calib3d.hpp:378
   pragma Import (C, cvCreateStereoGCState, "cvCreateStereoGCState");

   procedure cvReleaseStereoGCState (state : System.Address);  -- /usr/include/opencv2/calib3d/calib3d.hpp:379
   pragma Import (C, cvReleaseStereoGCState, "cvReleaseStereoGCState");

   procedure cvFindStereoCorrespondenceGC
     (left : System.Address;
      right : System.Address;
      disparityLeft : System.Address;
      disparityRight : System.Address;
      state : access CvStereoGCState;
      useDisparityGuess : int);  -- /usr/include/opencv2/calib3d/calib3d.hpp:381
   pragma Import (C, cvFindStereoCorrespondenceGC, "cvFindStereoCorrespondenceGC");

   procedure cvReprojectImageTo3D
     (disparityImage : System.Address;
      u_3dImage : System.Address;
      Q : access constant opencv2_core_types_c_h.CvMat;
      handleMissingValues : int);  -- /usr/include/opencv2/calib3d/calib3d.hpp:387
   pragma Import (C, cvReprojectImageTo3D, "cvReprojectImageTo3D");

   package Class_CvLevMarq is
      type CvLevMarq is limited record
         mask : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:415
         prevParam : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:416
         param : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:417
         J : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:418
         err : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:419
         JtJ : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:420
         JtJN : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:421
         JtErr : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:422
         JtJV : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:423
         JtJW : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:424
         prevErrNorm : aliased double;  -- /usr/include/opencv2/calib3d/calib3d.hpp:425
         errNorm : aliased double;  -- /usr/include/opencv2/calib3d/calib3d.hpp:425
         lambdaLg10 : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:426
         criteria : aliased opencv2_core_types_c_h.CvTermCriteria;  -- /usr/include/opencv2/calib3d/calib3d.hpp:427
         state : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:428
         iters : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:429
         completeSymmFlag : aliased Extensions.bool;  -- /usr/include/opencv2/calib3d/calib3d.hpp:430
      end record;
      pragma Import (CPP, CvLevMarq);

      function New_CvLevMarq return CvLevMarq;  -- /usr/include/opencv2/calib3d/calib3d.hpp:400
      pragma CPP_Constructor (New_CvLevMarq, "_ZN9CvLevMarqC1Ev");

      function New_CvLevMarq
        (nparams : int;
         nerrs : int;
         criteria : opencv2_core_types_c_h.CvTermCriteria;
         completeSymmFlag : Extensions.bool) return CvLevMarq;  -- /usr/include/opencv2/calib3d/calib3d.hpp:401
      pragma CPP_Constructor (New_CvLevMarq, "_ZN9CvLevMarqC1Eii14CvTermCriteriab");

      procedure Delete_CvLevMarq (this : access CvLevMarq);  -- /usr/include/opencv2/calib3d/calib3d.hpp:404
      pragma Import (CPP, Delete_CvLevMarq, "_ZN9CvLevMarqD1Ev");

      procedure init
        (this : access CvLevMarq;
         nparams : int;
         nerrs : int;
         criteria : opencv2_core_types_c_h.CvTermCriteria;
         completeSymmFlag : Extensions.bool);  -- /usr/include/opencv2/calib3d/calib3d.hpp:405
      pragma Import (CPP, init, "_ZN9CvLevMarq4initEii14CvTermCriteriab");

      function update
        (this : access CvLevMarq;
         param : System.Address;
         J : System.Address;
         err : System.Address) return Extensions.bool;  -- /usr/include/opencv2/calib3d/calib3d.hpp:408
      pragma Import (CPP, update, "_ZN9CvLevMarq6updateERPK5CvMatRPS0_S5_");

      function updateAlt
        (this : access CvLevMarq;
         param : System.Address;
         JtJ : System.Address;
         JtErr : System.Address;
         errNorm : System.Address) return Extensions.bool;  -- /usr/include/opencv2/calib3d/calib3d.hpp:409
      pragma Import (CPP, updateAlt, "_ZN9CvLevMarq9updateAltERPK5CvMatRPS0_S5_RPd");

      procedure clear (this : access CvLevMarq);  -- /usr/include/opencv2/calib3d/calib3d.hpp:411
      pragma Import (CPP, clear, "_ZN9CvLevMarq5clearEv");

      procedure step (this : access CvLevMarq);  -- /usr/include/opencv2/calib3d/calib3d.hpp:412
      pragma Import (CPP, step, "_ZN9CvLevMarq4stepEv");
   end;
   use Class_CvLevMarq;
   procedure Rodrigues
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.OutputArray'Class;
      jacobian : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:437
   pragma Import (CPP, Rodrigues, "_ZN2cv9RodriguesERKNS_11_InputArrayERKNS_12_OutputArrayES5_");

   function findHomography
     (srcPoints : opencv2_core_core_hpp.InputArray'Class;
      dstPoints : opencv2_core_core_hpp.InputArray'Class;
      method : int;
      ransacReprojThreshold : double;
      mask : opencv2_core_core_hpp.OutputArray'Class) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:447
   pragma Import (CPP, findHomography, "_ZN2cv14findHomographyERKNS_11_InputArrayES2_idRKNS_12_OutputArrayE");

   function findHomography
     (srcPoints : opencv2_core_core_hpp.InputArray'Class;
      dstPoints : opencv2_core_core_hpp.InputArray'Class;
      mask : opencv2_core_core_hpp.OutputArray'Class;
      method : int;
      ransacReprojThreshold : double) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:452
   pragma Import (CPP, findHomography, "_ZN2cv14findHomographyERKNS_11_InputArrayES2_RKNS_12_OutputArrayEid");

   function RQDecomp3x3
     (src : opencv2_core_core_hpp.InputArray'Class;
      mtxR : opencv2_core_core_hpp.OutputArray'Class;
      mtxQ : opencv2_core_core_hpp.OutputArray'Class;
      Qx : opencv2_core_core_hpp.OutputArray'Class;
      Qy : opencv2_core_core_hpp.OutputArray'Class;
      Qz : opencv2_core_core_hpp.OutputArray'Class) return opencv2_core_core_hpp.Class_Vec3d.Vec3d;  -- /usr/include/opencv2/calib3d/calib3d.hpp:456
   pragma Import (CPP, RQDecomp3x3, "_ZN2cv11RQDecomp3x3ERKNS_11_InputArrayERKNS_12_OutputArrayES5_S5_S5_S5_");

   procedure decomposeProjectionMatrix
     (projMatrix : opencv2_core_core_hpp.InputArray'Class;
      cameraMatrix : opencv2_core_core_hpp.OutputArray'Class;
      rotMatrix : opencv2_core_core_hpp.OutputArray'Class;
      transVect : opencv2_core_core_hpp.OutputArray'Class;
      rotMatrixX : opencv2_core_core_hpp.OutputArray'Class;
      rotMatrixY : opencv2_core_core_hpp.OutputArray'Class;
      rotMatrixZ : opencv2_core_core_hpp.OutputArray'Class;
      eulerAngles : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:462
   pragma Import (CPP, decomposeProjectionMatrix, "_ZN2cv25decomposeProjectionMatrixERKNS_11_InputArrayERKNS_12_OutputArrayES5_S5_S5_S5_S5_S5_");

   procedure matMulDeriv
     (A : opencv2_core_core_hpp.InputArray'Class;
      B : opencv2_core_core_hpp.InputArray'Class;
      dABdA : opencv2_core_core_hpp.OutputArray'Class;
      dABdB : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:470
   pragma Import (CPP, matMulDeriv, "_ZN2cv11matMulDerivERKNS_11_InputArrayES2_RKNS_12_OutputArrayES5_");

   procedure composeRT
     (rvec1 : opencv2_core_core_hpp.InputArray'Class;
      tvec1 : opencv2_core_core_hpp.InputArray'Class;
      rvec2 : opencv2_core_core_hpp.InputArray'Class;
      tvec2 : opencv2_core_core_hpp.InputArray'Class;
      rvec3 : opencv2_core_core_hpp.OutputArray'Class;
      tvec3 : opencv2_core_core_hpp.OutputArray'Class;
      dr3dr1 : opencv2_core_core_hpp.OutputArray'Class;
      dr3dt1 : opencv2_core_core_hpp.OutputArray'Class;
      dr3dr2 : opencv2_core_core_hpp.OutputArray'Class;
      dr3dt2 : opencv2_core_core_hpp.OutputArray'Class;
      dt3dr1 : opencv2_core_core_hpp.OutputArray'Class;
      dt3dt1 : opencv2_core_core_hpp.OutputArray'Class;
      dt3dr2 : opencv2_core_core_hpp.OutputArray'Class;
      dt3dt2 : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:475
   pragma Import (CPP, composeRT, "_ZN2cv9composeRTERKNS_11_InputArrayES2_S2_S2_RKNS_12_OutputArrayES5_S5_S5_S5_S5_S5_S5_S5_S5_");

   procedure projectPoints
     (objectPoints : opencv2_core_core_hpp.InputArray'Class;
      rvec : opencv2_core_core_hpp.InputArray'Class;
      tvec : opencv2_core_core_hpp.InputArray'Class;
      cameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs : opencv2_core_core_hpp.InputArray'Class;
      imagePoints : opencv2_core_core_hpp.OutputArray'Class;
      jacobian : opencv2_core_core_hpp.OutputArray'Class;
      aspectRatio : double);  -- /usr/include/opencv2/calib3d/calib3d.hpp:484
   pragma Import (CPP, projectPoints, "_ZN2cv13projectPointsERKNS_11_InputArrayES2_S2_S2_S2_RKNS_12_OutputArrayES5_d");

   procedure solvePnP
     (objectPoints : opencv2_core_core_hpp.InputArray'Class;
      imagePoints : opencv2_core_core_hpp.InputArray'Class;
      cameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs : opencv2_core_core_hpp.InputArray'Class;
      rvec : opencv2_core_core_hpp.OutputArray'Class;
      tvec : opencv2_core_core_hpp.OutputArray'Class;
      useExtrinsicGuess : Extensions.bool);  -- /usr/include/opencv2/calib3d/calib3d.hpp:492
   pragma Import (CPP, solvePnP, "_ZN2cv8solvePnPERKNS_11_InputArrayES2_S2_S2_RKNS_12_OutputArrayES5_b");

   procedure solvePnPRansac
     (objectPoints : opencv2_core_core_hpp.InputArray'Class;
      imagePoints : opencv2_core_core_hpp.InputArray'Class;
      cameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs : opencv2_core_core_hpp.InputArray'Class;
      rvec : opencv2_core_core_hpp.OutputArray'Class;
      tvec : opencv2_core_core_hpp.OutputArray'Class;
      useExtrinsicGuess : Extensions.bool;
      iterationsCount : int;
      reprojectionError : float;
      minInliersCount : int;
      inliers : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:498
   pragma Import (CPP, solvePnPRansac, "_ZN2cv14solvePnPRansacERKNS_11_InputArrayES2_S2_S2_RKNS_12_OutputArrayES5_bifiS5_");

   function initCameraMatrix2D
     (objectPoints : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      imagePoints : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      imageSize : opencv2_core_core_hpp.Class_Size.Size;
      aspectRatio : double) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:511
   pragma Import (CPP, initCameraMatrix2D, "_ZN2cv18initCameraMatrix2DERKNS_11_InputArrayES2_NS_5Size_IiEEd");

   function findChessboardCorners
     (image : opencv2_core_core_hpp.InputArray'Class;
      patternSize : opencv2_core_core_hpp.Class_Size.Size;
      corners : opencv2_core_core_hpp.OutputArray'Class;
      flags : int) return Extensions.bool;  -- /usr/include/opencv2/calib3d/calib3d.hpp:519
   pragma Import (CPP, findChessboardCorners, "_ZN2cv21findChessboardCornersERKNS_11_InputArrayENS_5Size_IiEERKNS_12_OutputArrayEi");

   function find4QuadCornerSubpix
     (img : opencv2_core_core_hpp.InputArray'Class;
      corners : opencv2_core_core_hpp.InputOutputArray'Class;
      region_size : opencv2_core_core_hpp.Class_Size.Size) return Extensions.bool;  -- /usr/include/opencv2/calib3d/calib3d.hpp:525
   pragma Import (CPP, find4QuadCornerSubpix, "_ZN2cv21find4QuadCornerSubpixERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Size_IiEE");

   procedure drawChessboardCorners
     (image : opencv2_core_core_hpp.InputOutputArray'Class;
      patternSize : opencv2_core_core_hpp.Class_Size.Size;
      corners : opencv2_core_core_hpp.InputArray'Class;
      patternWasFound : Extensions.bool);  -- /usr/include/opencv2/calib3d/calib3d.hpp:528
   pragma Import (CPP, drawChessboardCorners, "_ZN2cv21drawChessboardCornersERKNS_12_OutputArrayENS_5Size_IiEERKNS_11_InputArrayEb");

   function findCirclesGrid
     (image : opencv2_core_core_hpp.InputArray'Class;
      patternSize : opencv2_core_core_hpp.Class_Size.Size;
      centers : opencv2_core_core_hpp.OutputArray'Class;
      flags : int;
      blobDetector : access constant opencv2_core_core_hpp.Class_Ptr.Ptr) return Extensions.bool;  -- /usr/include/opencv2/calib3d/calib3d.hpp:535
   pragma Import (CPP, findCirclesGrid, "_ZN2cv15findCirclesGridERKNS_11_InputArrayENS_5Size_IiEERKNS_12_OutputArrayEiRKNS_3PtrINS_15FeatureDetectorEEE");

   function findCirclesGridDefault
     (image : opencv2_core_core_hpp.InputArray'Class;
      patternSize : opencv2_core_core_hpp.Class_Size.Size;
      centers : opencv2_core_core_hpp.OutputArray'Class;
      flags : int) return Extensions.bool;  -- /usr/include/opencv2/calib3d/calib3d.hpp:539
   pragma Import (CPP, findCirclesGridDefault, "_ZN2cv22findCirclesGridDefaultERKNS_11_InputArrayENS_5Size_IiEERKNS_12_OutputArrayEi");

   function calibrateCamera
     (objectPoints : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      imagePoints : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      imageSize : opencv2_core_core_hpp.Class_Size.Size;
      cameraMatrix : opencv2_core_core_hpp.InputOutputArray'Class;
      distCoeffs : opencv2_core_core_hpp.InputOutputArray'Class;
      rvecs : opencv2_core_core_hpp.OutputArrayOfArrays'Class;
      tvecs : opencv2_core_core_hpp.OutputArrayOfArrays'Class;
      flags : int) return double;  -- /usr/include/opencv2/calib3d/calib3d.hpp:564
   pragma Import (CPP, calibrateCamera, "_ZN2cv15calibrateCameraERKNS_11_InputArrayES2_NS_5Size_IiEERKNS_12_OutputArrayES7_S7_S7_i");

   procedure calibrationMatrixValues
     (cameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      imageSize : opencv2_core_core_hpp.Class_Size.Size;
      apertureWidth : double;
      apertureHeight : double;
      fovx : access double;
      fovy : access double;
      focalLength : access double;
      principalPoint : access opencv2_core_core_hpp.Class_Point2d.Point2d;
      aspectRatio : access double);  -- /usr/include/opencv2/calib3d/calib3d.hpp:573
   pragma Import (CPP, calibrationMatrixValues, "_ZN2cv23calibrationMatrixValuesERKNS_11_InputArrayENS_5Size_IiEEddRdS5_S5_RNS_6Point_IdEES5_");

   function stereoCalibrate
     (objectPoints : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      imagePoints1 : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      imagePoints2 : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      cameraMatrix1 : opencv2_core_core_hpp.InputOutputArray'Class;
      distCoeffs1 : opencv2_core_core_hpp.InputOutputArray'Class;
      cameraMatrix2 : opencv2_core_core_hpp.InputOutputArray'Class;
      distCoeffs2 : opencv2_core_core_hpp.InputOutputArray'Class;
      imageSize : opencv2_core_core_hpp.Class_Size.Size;
      R : opencv2_core_core_hpp.OutputArray'Class;
      T : opencv2_core_core_hpp.OutputArray'Class;
      E : opencv2_core_core_hpp.OutputArray'Class;
      F : opencv2_core_core_hpp.OutputArray'Class;
      criteria : opencv2_core_core_hpp.Class_TermCriteria.TermCriteria;
      flags : int) return double;  -- /usr/include/opencv2/calib3d/calib3d.hpp:584
   pragma Import (CPP, stereoCalibrate, "_ZN2cv15stereoCalibrateERKNS_11_InputArrayES2_S2_RKNS_12_OutputArrayES5_S5_S5_NS_5Size_IiEES5_S5_S5_S5_NS_12TermCriteriaEi");

   procedure stereoRectify
     (cameraMatrix1 : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs1 : opencv2_core_core_hpp.InputArray'Class;
      cameraMatrix2 : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs2 : opencv2_core_core_hpp.InputArray'Class;
      imageSize : opencv2_core_core_hpp.Class_Size.Size;
      R : opencv2_core_core_hpp.InputArray'Class;
      T : opencv2_core_core_hpp.InputArray'Class;
      R1 : opencv2_core_core_hpp.OutputArray'Class;
      R2 : opencv2_core_core_hpp.OutputArray'Class;
      P1 : opencv2_core_core_hpp.OutputArray'Class;
      P2 : opencv2_core_core_hpp.OutputArray'Class;
      Q : opencv2_core_core_hpp.OutputArray'Class;
      flags : int;
      alpha : double;
      newImageSize : opencv2_core_core_hpp.Class_Size.Size;
      validPixROI1 : access opencv2_core_core_hpp.Class_Rect.Rect;
      validPixROI2 : access opencv2_core_core_hpp.Class_Rect.Rect);  -- /usr/include/opencv2/calib3d/calib3d.hpp:599
   pragma Import (CPP, stereoRectify, "_ZN2cv13stereoRectifyERKNS_11_InputArrayES2_S2_S2_NS_5Size_IiEES2_S2_RKNS_12_OutputArrayES7_S7_S7_S7_idS4_PNS_5Rect_IiEESA_");

   function stereoRectifyUncalibrated
     (points1 : opencv2_core_core_hpp.InputArray'Class;
      points2 : opencv2_core_core_hpp.InputArray'Class;
      F : opencv2_core_core_hpp.InputArray'Class;
      imgSize : opencv2_core_core_hpp.Class_Size.Size;
      H1 : opencv2_core_core_hpp.OutputArray'Class;
      H2 : opencv2_core_core_hpp.OutputArray'Class;
      threshold : double) return Extensions.bool;  -- /usr/include/opencv2/calib3d/calib3d.hpp:609
   pragma Import (CPP, stereoRectifyUncalibrated, "_ZN2cv25stereoRectifyUncalibratedERKNS_11_InputArrayES2_S2_NS_5Size_IiEERKNS_12_OutputArrayES7_d");

   function rectify3Collinear
     (cameraMatrix1 : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs1 : opencv2_core_core_hpp.InputArray'Class;
      cameraMatrix2 : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs2 : opencv2_core_core_hpp.InputArray'Class;
      cameraMatrix3 : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs3 : opencv2_core_core_hpp.InputArray'Class;
      imgpt1 : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      imgpt3 : opencv2_core_core_hpp.InputArrayOfArrays'Class;
      imageSize : opencv2_core_core_hpp.Class_Size.Size;
      R12 : opencv2_core_core_hpp.InputArray'Class;
      T12 : opencv2_core_core_hpp.InputArray'Class;
      R13 : opencv2_core_core_hpp.InputArray'Class;
      T13 : opencv2_core_core_hpp.InputArray'Class;
      R1 : opencv2_core_core_hpp.OutputArray'Class;
      R2 : opencv2_core_core_hpp.OutputArray'Class;
      R3 : opencv2_core_core_hpp.OutputArray'Class;
      P1 : opencv2_core_core_hpp.OutputArray'Class;
      P2 : opencv2_core_core_hpp.OutputArray'Class;
      P3 : opencv2_core_core_hpp.OutputArray'Class;
      Q : opencv2_core_core_hpp.OutputArray'Class;
      alpha : double;
      newImgSize : opencv2_core_core_hpp.Class_Size.Size;
      roi1 : access opencv2_core_core_hpp.Class_Rect.Rect;
      roi2 : access opencv2_core_core_hpp.Class_Rect.Rect;
      flags : int) return float;  -- /usr/include/opencv2/calib3d/calib3d.hpp:615
   pragma Import (CPP, rectify3Collinear, "_ZN2cv17rectify3CollinearERKNS_11_InputArrayES2_S2_S2_S2_S2_S2_S2_NS_5Size_IiEES2_S2_S2_S2_RKNS_12_OutputArrayES7_S7_S7_S7_S7_S7_dS4_PNS_5Rect_IiEESA_i");

   function getOptimalNewCameraMatrix
     (cameraMatrix : opencv2_core_core_hpp.InputArray'Class;
      distCoeffs : opencv2_core_core_hpp.InputArray'Class;
      imageSize : opencv2_core_core_hpp.Class_Size.Size;
      alpha : double;
      newImgSize : opencv2_core_core_hpp.Class_Size.Size;
      validPixROI : access opencv2_core_core_hpp.Class_Rect.Rect;
      centerPrincipalPoint : Extensions.bool) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:627
   pragma Import (CPP, getOptimalNewCameraMatrix, "_ZN2cv25getOptimalNewCameraMatrixERKNS_11_InputArrayES2_NS_5Size_IiEEdS4_PNS_5Rect_IiEEb");

   procedure convertPointsToHomogeneous (src : opencv2_core_core_hpp.InputArray'Class; dst : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:632
   pragma Import (CPP, convertPointsToHomogeneous, "_ZN2cv26convertPointsToHomogeneousERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure convertPointsFromHomogeneous (src : opencv2_core_core_hpp.InputArray'Class; dst : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:635
   pragma Import (CPP, convertPointsFromHomogeneous, "_ZN2cv28convertPointsFromHomogeneousERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure convertPointsHomogeneous (src : opencv2_core_core_hpp.InputArray'Class; dst : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:638
   pragma Import (CPP, convertPointsHomogeneous, "_ZN2cv24convertPointsHomogeneousERKNS_11_InputArrayERKNS_12_OutputArrayE");

   function findFundamentalMat
     (points1 : opencv2_core_core_hpp.InputArray'Class;
      points2 : opencv2_core_core_hpp.InputArray'Class;
      method : int;
      param1 : double;
      param2 : double;
      mask : opencv2_core_core_hpp.OutputArray'Class) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:650
   pragma Import (CPP, findFundamentalMat, "_ZN2cv18findFundamentalMatERKNS_11_InputArrayES2_iddRKNS_12_OutputArrayE");

   function findFundamentalMat
     (points1 : opencv2_core_core_hpp.InputArray'Class;
      points2 : opencv2_core_core_hpp.InputArray'Class;
      mask : opencv2_core_core_hpp.OutputArray'Class;
      method : int;
      param1 : double;
      param2 : double) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:656
   pragma Import (CPP, findFundamentalMat, "_ZN2cv18findFundamentalMatERKNS_11_InputArrayES2_RKNS_12_OutputArrayEidd");

   procedure computeCorrespondEpilines
     (points1 : opencv2_core_core_hpp.InputArray'Class;
      whichImage : int;
      F : opencv2_core_core_hpp.InputArray'Class;
      lines : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:661
   pragma Import (CPP, computeCorrespondEpilines, "_ZN2cv25computeCorrespondEpilinesERKNS_11_InputArrayEiS2_RKNS_12_OutputArrayE");

   package Class_StereoBM is
      type StereoBM is limited record
         state : aliased opencv2_core_core_hpp.Class_Ptr.Ptr;  -- /usr/include/opencv2/calib3d/calib3d.hpp:689
      end record;
      pragma Import (CPP, StereoBM);

      function New_StereoBM return StereoBM;  -- /usr/include/opencv2/calib3d/calib3d.hpp:679
      pragma CPP_Constructor (New_StereoBM, "_ZN2cv8StereoBMC1Ev");

      function New_StereoBM
        (preset : int;
         ndisparities : int;
         SADWindowSize : int) return StereoBM;  -- /usr/include/opencv2/calib3d/calib3d.hpp:681
      pragma CPP_Constructor (New_StereoBM, "_ZN2cv8StereoBMC1Eiii");

      procedure init
        (this : access StereoBM;
         preset : int;
         ndisparities : int;
         SADWindowSize : int);  -- /usr/include/opencv2/calib3d/calib3d.hpp:683
      pragma Import (CPP, init, "_ZN2cv8StereoBM4initEiii");

      procedure operator_op
        (this : access StereoBM;
         left : opencv2_core_core_hpp.InputArray'Class;
         right : opencv2_core_core_hpp.InputArray'Class;
         disparity : opencv2_core_core_hpp.OutputArray'Class;
         disptype : int);  -- /usr/include/opencv2/calib3d/calib3d.hpp:685
      pragma Import (CPP, operator_op, "_ZN2cv8StereoBMclERKNS_11_InputArrayES3_RKNS_12_OutputArrayEi");
   end;
   use Class_StereoBM;
   package Class_StereoSGBM is
      type StereoSGBM is tagged limited record
         minDisparity : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:719
         numberOfDisparities : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:720
         SADWindowSize : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:721
         preFilterCap : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:722
         uniquenessRatio : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:723
         P1 : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:724
         P2 : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:725
         speckleWindowSize : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:726
         speckleRange : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:727
         disp12MaxDiff : aliased int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:728
         fullDP : aliased Extensions.bool;  -- /usr/include/opencv2/calib3d/calib3d.hpp:729
         buffer : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/calib3d/calib3d.hpp:732
      end record;
      pragma Import (CPP, StereoSGBM);

      function New_StereoSGBM return StereoSGBM;  -- /usr/include/opencv2/calib3d/calib3d.hpp:704
      pragma CPP_Constructor (New_StereoSGBM, "_ZN2cv10StereoSGBMC1Ev");

      function New_StereoSGBM
        (minDisparity : int;
         numDisparities : int;
         SADWindowSize : int;
         P1 : int;
         P2 : int;
         disp12MaxDiff : int;
         preFilterCap : int;
         uniquenessRatio : int;
         speckleWindowSize : int;
         speckleRange : int;
         fullDP : Extensions.bool) return StereoSGBM;  -- /usr/include/opencv2/calib3d/calib3d.hpp:707
      pragma CPP_Constructor (New_StereoSGBM, "_ZN2cv10StereoSGBMC1Eiiiiiiiiiib");

      procedure Delete_StereoSGBM (this : access StereoSGBM);  -- /usr/include/opencv2/calib3d/calib3d.hpp:713
      pragma Import (CPP, Delete_StereoSGBM, "_ZN2cv10StereoSGBMD1Ev");

      procedure deleting_dtor (this : access StereoSGBM);  -- /usr/include/opencv2/calib3d/calib3d.hpp:713
      pragma Import (CPP, deleting_dtor, "_ZN2cv10StereoSGBMD0Ev");

      procedure operator_op
        (this : access StereoSGBM;
         left : opencv2_core_core_hpp.InputArray'Class;
         right : opencv2_core_core_hpp.InputArray'Class;
         disp : opencv2_core_core_hpp.OutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:716
      pragma Import (CPP, operator_op, "_ZN2cv10StereoSGBMclERKNS_11_InputArrayES3_RKNS_12_OutputArrayE");
   end;
   use Class_StereoSGBM;
   procedure filterSpeckles
     (img : opencv2_core_core_hpp.InputOutputArray'Class;
      newVal : double;
      maxSpeckleSize : int;
      maxDiff : double;
      buf : opencv2_core_core_hpp.InputOutputArray'Class);  -- /usr/include/opencv2/calib3d/calib3d.hpp:736
   pragma Import (CPP, filterSpeckles, "_ZN2cv14filterSpecklesERKNS_12_OutputArrayEdidS2_");

   function getValidDisparityROI
     (roi1 : opencv2_core_core_hpp.Class_Rect.Rect;
      roi2 : opencv2_core_core_hpp.Class_Rect.Rect;
      minDisparity : int;
      numberOfDisparities : int;
      SADWindowSize : int) return opencv2_core_core_hpp.Class_Rect.Rect;  -- /usr/include/opencv2/calib3d/calib3d.hpp:740
   pragma Import (CPP, getValidDisparityROI, "_ZN2cv20getValidDisparityROIENS_5Rect_IiEES1_iii");

   procedure validateDisparity
     (disparity : opencv2_core_core_hpp.InputOutputArray'Class;
      cost : opencv2_core_core_hpp.InputArray'Class;
      minDisparity : int;
      numberOfDisparities : int;
      disp12MaxDisp : int);  -- /usr/include/opencv2/calib3d/calib3d.hpp:745
   pragma Import (CPP, validateDisparity, "_ZN2cv17validateDisparityERKNS_12_OutputArrayERKNS_11_InputArrayEiii");

   procedure reprojectImageTo3D
     (disparity : opencv2_core_core_hpp.InputArray'Class;
      u_3dImage : opencv2_core_core_hpp.OutputArray'Class;
      Q : opencv2_core_core_hpp.InputArray'Class;
      handleMissingValues : Extensions.bool;
      ddepth : int);  -- /usr/include/opencv2/calib3d/calib3d.hpp:750
   pragma Import (CPP, reprojectImageTo3D, "_ZN2cv18reprojectImageTo3DERKNS_11_InputArrayERKNS_12_OutputArrayES2_bi");

   function estimateAffine3D
     (u_from : opencv2_core_core_hpp.InputArray'Class;
      u_to : opencv2_core_core_hpp.InputArray'Class;
      u_out : opencv2_core_core_hpp.OutputArray'Class;
      u_inliers : opencv2_core_core_hpp.OutputArray'Class;
      param1 : double;
      param2 : double) return int;  -- /usr/include/opencv2/calib3d/calib3d.hpp:755
   pragma Import (CPP, estimateAffine3D, "_ZN2cv16estimateAffine3DERKNS_11_InputArrayES2_RKNS_12_OutputArrayES5_dd");

end opencv2_calib3d_calib3d_hpp;
