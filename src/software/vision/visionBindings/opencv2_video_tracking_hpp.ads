pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with opencv2_core_types_c_h;
with Interfaces.C.Strings;
limited with opencv2_imgproc_types_c_h;
with opencv2_core_core_hpp;
with Interfaces.C.Extensions;

package opencv2_video_tracking_hpp is


   CV_LKFLOW_PYR_A_READY : constant := 1;  --  /usr/include/opencv2/video/tracking.hpp:78
   CV_LKFLOW_PYR_B_READY : constant := 2;  --  /usr/include/opencv2/video/tracking.hpp:79
   CV_LKFLOW_INITIAL_GUESSES : constant := 4;  --  /usr/include/opencv2/video/tracking.hpp:80
   CV_LKFLOW_GET_MIN_EIGENVALS : constant := 8;  --  /usr/include/opencv2/video/tracking.hpp:81
   --  unsupported macro: cvKalmanUpdateByTime cvKalmanPredict
   --  unsupported macro: cvKalmanUpdateByMeasurement cvKalmanCorrect

   procedure cvCalcOpticalFlowLK
     (prev : System.Address;
      curr : System.Address;
      win_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      velx : System.Address;
      vely : System.Address);  -- /usr/include/opencv2/video/tracking.hpp:64
   pragma Import (C, cvCalcOpticalFlowLK, "cvCalcOpticalFlowLK");

   procedure cvCalcOpticalFlowBM
     (prev : System.Address;
      curr : System.Address;
      block_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      shift_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      max_range : opencv2_core_types_c_h.Class_CvSize.CvSize;
      use_previous : int;
      velx : System.Address;
      vely : System.Address);  -- /usr/include/opencv2/video/tracking.hpp:68
   pragma Import (C, cvCalcOpticalFlowBM, "cvCalcOpticalFlowBM");

   procedure cvCalcOpticalFlowHS
     (prev : System.Address;
      curr : System.Address;
      use_previous : int;
      velx : System.Address;
      vely : System.Address;
      lambda : double;
      criteria : opencv2_core_types_c_h.CvTermCriteria);  -- /usr/include/opencv2/video/tracking.hpp:74
   pragma Import (C, cvCalcOpticalFlowHS, "cvCalcOpticalFlowHS");

   procedure cvCalcOpticalFlowPyrLK
     (prev : System.Address;
      curr : System.Address;
      prev_pyr : System.Address;
      curr_pyr : System.Address;
      prev_features : access constant opencv2_core_types_c_h.CvPoint2D32f;
      curr_features : access opencv2_core_types_c_h.CvPoint2D32f;
      count : int;
      win_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      level : int;
      status : Interfaces.C.Strings.chars_ptr;
      track_error : access float;
      criteria : opencv2_core_types_c_h.CvTermCriteria;
      flags : int);  -- /usr/include/opencv2/video/tracking.hpp:88
   pragma Import (C, cvCalcOpticalFlowPyrLK, "cvCalcOpticalFlowPyrLK");

   procedure cvCalcAffineFlowPyrLK
     (prev : System.Address;
      curr : System.Address;
      prev_pyr : System.Address;
      curr_pyr : System.Address;
      prev_features : access constant opencv2_core_types_c_h.CvPoint2D32f;
      curr_features : access opencv2_core_types_c_h.CvPoint2D32f;
      matrices : access float;
      count : int;
      win_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      level : int;
      status : Interfaces.C.Strings.chars_ptr;
      track_error : access float;
      criteria : opencv2_core_types_c_h.CvTermCriteria;
      flags : int);  -- /usr/include/opencv2/video/tracking.hpp:103
   pragma Import (C, cvCalcAffineFlowPyrLK, "cvCalcAffineFlowPyrLK");

   function cvEstimateRigidTransform
     (A : System.Address;
      B : System.Address;
      M : access opencv2_core_types_c_h.CvMat;
      full_affine : int) return int;  -- /usr/include/opencv2/video/tracking.hpp:113
   pragma Import (C, cvEstimateRigidTransform, "cvEstimateRigidTransform");

   procedure cvCalcOpticalFlowFarneback
     (prev : System.Address;
      next : System.Address;
      flow : System.Address;
      pyr_scale : double;
      levels : int;
      winsize : int;
      iterations : int;
      poly_n : int;
      poly_sigma : double;
      flags : int);  -- /usr/include/opencv2/video/tracking.hpp:117
   pragma Import (C, cvCalcOpticalFlowFarneback, "cvCalcOpticalFlowFarneback");

   procedure cvUpdateMotionHistory
     (silhouette : System.Address;
      mhi : System.Address;
      timestamp : double;
      duration : double);  -- /usr/include/opencv2/video/tracking.hpp:135
   pragma Import (C, cvUpdateMotionHistory, "cvUpdateMotionHistory");

   procedure cvCalcMotionGradient
     (mhi : System.Address;
      mask : System.Address;
      orientation : System.Address;
      delta1 : double;
      delta2 : double;
      aperture_size : int);  -- /usr/include/opencv2/video/tracking.hpp:140
   pragma Import (C, cvCalcMotionGradient, "cvCalcMotionGradient");

   function cvCalcGlobalOrientation
     (orientation : System.Address;
      mask : System.Address;
      mhi : System.Address;
      timestamp : double;
      duration : double) return double;  -- /usr/include/opencv2/video/tracking.hpp:147
   pragma Import (C, cvCalcGlobalOrientation, "cvCalcGlobalOrientation");

   function cvSegmentMotion
     (mhi : System.Address;
      seg_mask : System.Address;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      timestamp : double;
      seg_thresh : double) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/video/tracking.hpp:153
   pragma Import (C, cvSegmentMotion, "cvSegmentMotion");

   function cvCamShift
     (prob_image : System.Address;
      window : opencv2_core_types_c_h.CvRect;
      criteria : opencv2_core_types_c_h.CvTermCriteria;
      comp : access opencv2_imgproc_types_c_h.CvConnectedComp;
      box : access opencv2_core_types_c_h.CvBox2D) return int;  -- /usr/include/opencv2/video/tracking.hpp:163
   pragma Import (C, cvCamShift, "cvCamShift");

   function cvMeanShift
     (prob_image : System.Address;
      window : opencv2_core_types_c_h.CvRect;
      criteria : opencv2_core_types_c_h.CvTermCriteria;
      comp : access opencv2_imgproc_types_c_h.CvConnectedComp) return int;  -- /usr/include/opencv2/video/tracking.hpp:169
   pragma Import (C, cvMeanShift, "cvMeanShift");

   type CvKalman is record
      MP : aliased int;  -- /usr/include/opencv2/video/tracking.hpp:180
      DP : aliased int;  -- /usr/include/opencv2/video/tracking.hpp:181
      CP : aliased int;  -- /usr/include/opencv2/video/tracking.hpp:182
      PosterState : access float;  -- /usr/include/opencv2/video/tracking.hpp:186
      PriorState : access float;  -- /usr/include/opencv2/video/tracking.hpp:187
      DynamMatr : access float;  -- /usr/include/opencv2/video/tracking.hpp:188
      MeasurementMatr : access float;  -- /usr/include/opencv2/video/tracking.hpp:189
      MNCovariance : access float;  -- /usr/include/opencv2/video/tracking.hpp:190
      PNCovariance : access float;  -- /usr/include/opencv2/video/tracking.hpp:191
      KalmGainMatr : access float;  -- /usr/include/opencv2/video/tracking.hpp:192
      PriorErrorCovariance : access float;  -- /usr/include/opencv2/video/tracking.hpp:193
      PosterErrorCovariance : access float;  -- /usr/include/opencv2/video/tracking.hpp:194
      Temp1 : access float;  -- /usr/include/opencv2/video/tracking.hpp:195
      Temp2 : access float;  -- /usr/include/opencv2/video/tracking.hpp:196
      state_pre : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:199
      state_post : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:201
      transition_matrix : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:203
      control_matrix : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:204
      measurement_matrix : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:206
      process_noise_cov : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:207
      measurement_noise_cov : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:208
      error_cov_pre : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:209
      gain : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:211
      error_cov_post : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:213
      temp1 : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:215
      temp2 : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:216
      temp3 : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:217
      temp4 : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:218
      temp5 : access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:219
   end record;
   pragma Convention (C_Pass_By_Copy, CvKalman);  -- /usr/include/opencv2/video/tracking.hpp:178

   function cvCreateKalman
     (dynam_params : int;
      measure_params : int;
      control_params : int) return access CvKalman;  -- /usr/include/opencv2/video/tracking.hpp:223
   pragma Import (C, cvCreateKalman, "cvCreateKalman");

   procedure cvReleaseKalman (kalman : System.Address);  -- /usr/include/opencv2/video/tracking.hpp:227
   pragma Import (C, cvReleaseKalman, "cvReleaseKalman");

   function cvKalmanPredict (kalman : access CvKalman; control : access constant opencv2_core_types_c_h.CvMat) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:230
   pragma Import (C, cvKalmanPredict, "cvKalmanPredict");

   function cvKalmanCorrect (kalman : access CvKalman; measurement : access constant opencv2_core_types_c_h.CvMat) return access constant opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/video/tracking.hpp:235
   pragma Import (C, cvKalmanCorrect, "cvKalmanCorrect");

   procedure updateMotionHistory
     (silhouette : opencv2_core_core_hpp.InputArray'Class;
      mhi : opencv2_core_core_hpp.InputOutputArray'Class;
      timestamp : double;
      duration : double);  -- /usr/include/opencv2/video/tracking.hpp:247
   pragma Import (CPP, updateMotionHistory, "_ZN2cv19updateMotionHistoryERKNS_11_InputArrayERKNS_12_OutputArrayEdd");

   procedure calcMotionGradient
     (mhi : opencv2_core_core_hpp.InputArray'Class;
      mask : opencv2_core_core_hpp.OutputArray'Class;
      orientation : opencv2_core_core_hpp.OutputArray'Class;
      delta1 : double;
      delta2 : double;
      apertureSize : int);  -- /usr/include/opencv2/video/tracking.hpp:251
   pragma Import (CPP, calcMotionGradient, "_ZN2cv18calcMotionGradientERKNS_11_InputArrayERKNS_12_OutputArrayES5_ddi");

   function calcGlobalOrientation
     (orientation : opencv2_core_core_hpp.InputArray'Class;
      mask : opencv2_core_core_hpp.InputArray'Class;
      mhi : opencv2_core_core_hpp.InputArray'Class;
      timestamp : double;
      duration : double) return double;  -- /usr/include/opencv2/video/tracking.hpp:257
   pragma Import (CPP, calcGlobalOrientation, "_ZN2cv21calcGlobalOrientationERKNS_11_InputArrayES2_S2_dd");

   procedure segmentMotion
     (mhi : opencv2_core_core_hpp.InputArray'Class;
      segmask : opencv2_core_core_hpp.OutputArray'Class;
      boundingRects : System.Address;
      timestamp : double;
      segThresh : double);  -- /usr/include/opencv2/video/tracking.hpp:261
   pragma Import (CPP, segmentMotion, "_ZN2cv13segmentMotionERKNS_11_InputArrayERKNS_12_OutputArrayERSt6vectorINS_5Rect_IiEESaIS8_EEdd");

   function CamShift
     (probImage : opencv2_core_core_hpp.InputArray'Class;
      window : access opencv2_core_core_hpp.Class_Rect.Rect;
      criteria : opencv2_core_core_hpp.Class_TermCriteria.TermCriteria) return opencv2_core_core_hpp.Class_RotatedRect.RotatedRect;  -- /usr/include/opencv2/video/tracking.hpp:266
   pragma Import (CPP, CamShift, "_ZN2cv8CamShiftERKNS_11_InputArrayERNS_5Rect_IiEENS_12TermCriteriaE");

   function meanShift
     (probImage : opencv2_core_core_hpp.InputArray'Class;
      window : access opencv2_core_core_hpp.Class_Rect.Rect;
      criteria : opencv2_core_core_hpp.Class_TermCriteria.TermCriteria) return int;  -- /usr/include/opencv2/video/tracking.hpp:270
   pragma Import (CPP, meanShift, "_ZN2cv9meanShiftERKNS_11_InputArrayERNS_5Rect_IiEENS_12TermCriteriaE");

   package Class_KalmanFilter is
      type KalmanFilter is limited record
         statePre : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:295
         statePost : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:296
         transitionMatrix : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:297
         controlMatrix : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:298
         measurementMatrix : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:299
         processNoiseCov : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:300
         measurementNoiseCov : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:301
         errorCovPre : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:302
         gain : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:303
         errorCovPost : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:304
         temp1 : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:307
         temp2 : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:308
         temp3 : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:309
         temp4 : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:310
         temp5 : aliased opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:311
      end record;
      pragma Import (CPP, KalmanFilter);

      function New_KalmanFilter return KalmanFilter;  -- /usr/include/opencv2/video/tracking.hpp:284
      pragma CPP_Constructor (New_KalmanFilter, "_ZN2cv12KalmanFilterC1Ev");

      function New_KalmanFilter
        (dynamParams : int;
         measureParams : int;
         controlParams : int;
         c_type : int) return KalmanFilter;  -- /usr/include/opencv2/video/tracking.hpp:286
      pragma CPP_Constructor (New_KalmanFilter, "_ZN2cv12KalmanFilterC1Eiiii");

      procedure init
        (this : access KalmanFilter;
         dynamParams : int;
         measureParams : int;
         controlParams : int;
         c_type : int);  -- /usr/include/opencv2/video/tracking.hpp:288
      pragma Import (CPP, init, "_ZN2cv12KalmanFilter4initEiiii");

      function predict (this : access KalmanFilter; control : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access constant opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:291
      pragma Import (CPP, predict, "_ZN2cv12KalmanFilter7predictERKNS_3MatE");

      function correct (this : access KalmanFilter; measurement : access constant opencv2_core_core_hpp.Class_Mat.Mat) return access constant opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:293
      pragma Import (CPP, correct, "_ZN2cv12KalmanFilter7correctERKNS_3MatE");
   end;
   use Class_KalmanFilter;
   procedure calcOpticalFlowPyrLK
     (prevImg : opencv2_core_core_hpp.InputArray'Class;
      nextImg : opencv2_core_core_hpp.InputArray'Class;
      prevPts : opencv2_core_core_hpp.InputArray'Class;
      nextPts : opencv2_core_core_hpp.InputOutputArray'Class;
      status : opencv2_core_core_hpp.OutputArray'Class;
      err : opencv2_core_core_hpp.OutputArray'Class;
      winSize : opencv2_core_core_hpp.Class_Size.Size;
      maxLevel : int;
      criteria : opencv2_core_core_hpp.Class_TermCriteria.TermCriteria;
      derivLambda : double;
      flags : int;
      minEigThreshold : double);  -- /usr/include/opencv2/video/tracking.hpp:318
   pragma Import (CPP, calcOpticalFlowPyrLK, "_ZN2cv20calcOpticalFlowPyrLKERKNS_11_InputArrayES2_S2_RKNS_12_OutputArrayES5_S5_NS_5Size_IiEEiNS_12TermCriteriaEdid");

   procedure calcOpticalFlowFarneback
     (prev : opencv2_core_core_hpp.InputArray'Class;
      next : opencv2_core_core_hpp.InputArray'Class;
      flow : opencv2_core_core_hpp.InputOutputArray'Class;
      pyr_scale : double;
      levels : int;
      winsize : int;
      iterations : int;
      poly_n : int;
      poly_sigma : double;
      flags : int);  -- /usr/include/opencv2/video/tracking.hpp:330
   pragma Import (CPP, calcOpticalFlowFarneback, "_ZN2cv24calcOpticalFlowFarnebackERKNS_11_InputArrayES2_RKNS_12_OutputArrayEdiiiidi");

   function estimateRigidTransform
     (src : opencv2_core_core_hpp.InputArray'Class;
      dst : opencv2_core_core_hpp.InputArray'Class;
      fullAffine : Extensions.bool) return opencv2_core_core_hpp.Class_Mat.Mat;  -- /usr/include/opencv2/video/tracking.hpp:336
   pragma Import (CPP, estimateRigidTransform, "_ZN2cv22estimateRigidTransformERKNS_11_InputArrayES2_b");

end opencv2_video_tracking_hpp;
