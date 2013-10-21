pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with opencv2_core_types_c_h;
with opencv2_imgproc_types_c_h;
limited with opencv2_imgproc_imgproc_hpp;

package opencv2_imgproc_imgproc_c_h is

   --  arg-macro: procedure cvCalcBackProject (image, dst, hiscvCalcArrBackProject((CvArr**)image, dst, hist)
   --    cvCalcArrBackProject((CvArr**)image, dst, hist)
   --  arg-macro: procedure cvCalcBackProjectPatch (image, dst, rancvCalcArrBackProjectPatch( (CvArr**)image, dst, range, hist, method, factor )
   --    cvCalcArrBackProjectPatch( (CvArr**)image, dst, range, hist, method, factor )
   procedure cvAcc
     (image : System.Address;
      sum : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:56
   pragma Import (C, cvAcc, "cvAcc");

   procedure cvSquareAcc
     (image : System.Address;
      sqsum : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:60
   pragma Import (C, cvSquareAcc, "cvSquareAcc");

   procedure cvMultiplyAcc
     (image1 : System.Address;
      image2 : System.Address;
      acc : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:64
   pragma Import (C, cvMultiplyAcc, "cvMultiplyAcc");

   procedure cvRunningAvg
     (image : System.Address;
      acc : System.Address;
      alpha : double;
      mask : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:68
   pragma Import (C, cvRunningAvg, "cvRunningAvg");

   procedure cvCopyMakeBorder
     (src : System.Address;
      dst : System.Address;
      offset : opencv2_core_types_c_h.CvPoint;
      bordertype : int;
      value : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/imgproc/imgproc_c.h:77
   pragma Import (C, cvCopyMakeBorder, "cvCopyMakeBorder");

   procedure cvSmooth
     (src : System.Address;
      dst : System.Address;
      smoothtype : int;
      size1 : int;
      size2 : int;
      sigma1 : double;
      sigma2 : double);  -- /usr/include/opencv2/imgproc/imgproc_c.h:81
   pragma Import (C, cvSmooth, "cvSmooth");

   procedure cvFilter2D
     (src : System.Address;
      dst : System.Address;
      kernel : access constant opencv2_core_types_c_h.CvMat;
      anchor : opencv2_core_types_c_h.CvPoint);  -- /usr/include/opencv2/imgproc/imgproc_c.h:89
   pragma Import (C, cvFilter2D, "cvFilter2D");

   procedure cvIntegral
     (image : System.Address;
      sum : System.Address;
      sqsum : System.Address;
      tilted_sum : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:93
   pragma Import (C, cvIntegral, "cvIntegral");

   procedure cvPyrDown
     (src : System.Address;
      dst : System.Address;
      filter : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:102
   pragma Import (C, cvPyrDown, "cvPyrDown");

   procedure cvPyrUp
     (src : System.Address;
      dst : System.Address;
      filter : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:110
   pragma Import (C, cvPyrUp, "cvPyrUp");

   function cvCreatePyramid
     (img : System.Address;
      extra_layers : int;
      rate : double;
      layer_sizes : access constant opencv2_core_types_c_h.Class_CvSize.CvSize;
      bufarr : System.Address;
      calc : int;
      filter : int) return System.Address;  -- /usr/include/opencv2/imgproc/imgproc_c.h:114
   pragma Import (C, cvCreatePyramid, "cvCreatePyramid");

   procedure cvReleasePyramid (pyramid : System.Address; extra_layers : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:121
   pragma Import (C, cvReleasePyramid, "cvReleasePyramid");

   procedure cvPyrSegmentation
     (src : access opencv2_core_types_c_h.IplImage;
      dst : access opencv2_core_types_c_h.IplImage;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      comp : System.Address;
      level : int;
      threshold1 : double;
      threshold2 : double);  -- /usr/include/opencv2/imgproc/imgproc_c.h:128
   pragma Import (C, cvPyrSegmentation, "cvPyrSegmentation");

   procedure cvPyrMeanShiftFiltering
     (src : System.Address;
      dst : System.Address;
      sp : double;
      sr : double;
      max_level : int;
      termcrit : opencv2_core_types_c_h.CvTermCriteria);  -- /usr/include/opencv2/imgproc/imgproc_c.h:134
   pragma Import (C, cvPyrMeanShiftFiltering, "cvPyrMeanShiftFiltering");

   procedure cvWatershed (image : System.Address; markers : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:139
   pragma Import (C, cvWatershed, "cvWatershed");

   procedure cvInpaint
     (src : System.Address;
      inpaint_mask : System.Address;
      dst : System.Address;
      inpaintRange : double;
      flags : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:142
   pragma Import (C, cvInpaint, "cvInpaint");

   procedure cvSobel
     (src : System.Address;
      dst : System.Address;
      xorder : int;
      yorder : int;
      aperture_size : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:148
   pragma Import (C, cvSobel, "cvSobel");

   procedure cvLaplace
     (src : System.Address;
      dst : System.Address;
      aperture_size : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:153
   pragma Import (C, cvLaplace, "cvLaplace");

   procedure cvCvtColor
     (src : System.Address;
      dst : System.Address;
      code : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:157
   pragma Import (C, cvCvtColor, "cvCvtColor");

   procedure cvResize
     (src : System.Address;
      dst : System.Address;
      interpolation : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:161
   pragma Import (C, cvResize, "cvResize");

   procedure cvWarpAffine
     (src : System.Address;
      dst : System.Address;
      map_matrix : access constant opencv2_core_types_c_h.CvMat;
      flags : int;
      fillval : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/imgproc/imgproc_c.h:165
   pragma Import (C, cvWarpAffine, "cvWarpAffine");

   function cvGetAffineTransform
     (src : access constant opencv2_core_types_c_h.CvPoint2D32f;
      dst : access constant opencv2_core_types_c_h.CvPoint2D32f;
      map_matrix : access opencv2_core_types_c_h.CvMat) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/imgproc/imgproc_c.h:170
   pragma Import (C, cvGetAffineTransform, "cvGetAffineTransform");

   function cv2DRotationMatrix
     (center : opencv2_core_types_c_h.CvPoint2D32f;
      angle : double;
      scale : double;
      map_matrix : access opencv2_core_types_c_h.CvMat) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/imgproc/imgproc_c.h:175
   pragma Import (C, cv2DRotationMatrix, "cv2DRotationMatrix");

   procedure cvWarpPerspective
     (src : System.Address;
      dst : System.Address;
      map_matrix : access constant opencv2_core_types_c_h.CvMat;
      flags : int;
      fillval : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/imgproc/imgproc_c.h:179
   pragma Import (C, cvWarpPerspective, "cvWarpPerspective");

   function cvGetPerspectiveTransform
     (src : access constant opencv2_core_types_c_h.CvPoint2D32f;
      dst : access constant opencv2_core_types_c_h.CvPoint2D32f;
      map_matrix : access opencv2_core_types_c_h.CvMat) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/imgproc/imgproc_c.h:184
   pragma Import (C, cvGetPerspectiveTransform, "cvGetPerspectiveTransform");

   procedure cvRemap
     (src : System.Address;
      dst : System.Address;
      mapx : System.Address;
      mapy : System.Address;
      flags : int;
      fillval : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/imgproc/imgproc_c.h:189
   pragma Import (C, cvRemap, "cvRemap");

   procedure cvConvertMaps
     (mapx : System.Address;
      mapy : System.Address;
      mapxy : System.Address;
      mapalpha : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:195
   pragma Import (C, cvConvertMaps, "cvConvertMaps");

   procedure cvLogPolar
     (src : System.Address;
      dst : System.Address;
      center : opencv2_core_types_c_h.CvPoint2D32f;
      M : double;
      flags : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:199
   pragma Import (C, cvLogPolar, "cvLogPolar");

   procedure cvLinearPolar
     (src : System.Address;
      dst : System.Address;
      center : opencv2_core_types_c_h.CvPoint2D32f;
      maxRadius : double;
      flags : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:204
   pragma Import (C, cvLinearPolar, "cvLinearPolar");

   procedure cvUndistort2
     (src : System.Address;
      dst : System.Address;
      camera_matrix : access constant opencv2_core_types_c_h.CvMat;
      distortion_coeffs : access constant opencv2_core_types_c_h.CvMat;
      new_camera_matrix : access constant opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/imgproc/imgproc_c.h:209
   pragma Import (C, cvUndistort2, "cvUndistort2");

   procedure cvInitUndistortMap
     (camera_matrix : access constant opencv2_core_types_c_h.CvMat;
      distortion_coeffs : access constant opencv2_core_types_c_h.CvMat;
      mapx : System.Address;
      mapy : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:216
   pragma Import (C, cvInitUndistortMap, "cvInitUndistortMap");

   procedure cvInitUndistortRectifyMap
     (camera_matrix : access constant opencv2_core_types_c_h.CvMat;
      dist_coeffs : access constant opencv2_core_types_c_h.CvMat;
      R : access constant opencv2_core_types_c_h.CvMat;
      new_camera_matrix : access constant opencv2_core_types_c_h.CvMat;
      mapx : System.Address;
      mapy : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:221
   pragma Import (C, cvInitUndistortRectifyMap, "cvInitUndistortRectifyMap");

   procedure cvUndistortPoints
     (src : access constant opencv2_core_types_c_h.CvMat;
      dst : access opencv2_core_types_c_h.CvMat;
      camera_matrix : access constant opencv2_core_types_c_h.CvMat;
      dist_coeffs : access constant opencv2_core_types_c_h.CvMat;
      R : access constant opencv2_core_types_c_h.CvMat;
      P : access constant opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/imgproc/imgproc_c.h:228
   pragma Import (C, cvUndistortPoints, "cvUndistortPoints");

   function cvCreateStructuringElementEx
     (cols : int;
      rows : int;
      anchor_x : int;
      anchor_y : int;
      shape : int;
      values : access int) return access opencv2_core_types_c_h.IplConvKernel;  -- /usr/include/opencv2/imgproc/imgproc_c.h:235
   pragma Import (C, cvCreateStructuringElementEx, "cvCreateStructuringElementEx");

   procedure cvReleaseStructuringElement (element : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:240
   pragma Import (C, cvReleaseStructuringElement, "cvReleaseStructuringElement");

   procedure cvErode
     (src : System.Address;
      dst : System.Address;
      element : access opencv2_core_types_c_h.IplConvKernel;
      iterations : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:244
   pragma Import (C, cvErode, "cvErode");

   procedure cvDilate
     (src : System.Address;
      dst : System.Address;
      element : access opencv2_core_types_c_h.IplConvKernel;
      iterations : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:250
   pragma Import (C, cvDilate, "cvDilate");

   procedure cvMorphologyEx
     (src : System.Address;
      dst : System.Address;
      temp : System.Address;
      element : access opencv2_core_types_c_h.IplConvKernel;
      operation : int;
      iterations : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:255
   pragma Import (C, cvMorphologyEx, "cvMorphologyEx");

   procedure cvMoments
     (arr : System.Address;
      moments : access opencv2_imgproc_types_c_h.CvMoments;
      binary : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:260
   pragma Import (C, cvMoments, "cvMoments");

   function cvGetSpatialMoment
     (moments : access opencv2_imgproc_types_c_h.CvMoments;
      x_order : int;
      y_order : int) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:263
   pragma Import (C, cvGetSpatialMoment, "cvGetSpatialMoment");

   function cvGetCentralMoment
     (moments : access opencv2_imgproc_types_c_h.CvMoments;
      x_order : int;
      y_order : int) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:264
   pragma Import (C, cvGetCentralMoment, "cvGetCentralMoment");

   function cvGetNormalizedCentralMoment
     (moments : access opencv2_imgproc_types_c_h.CvMoments;
      x_order : int;
      y_order : int) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:265
   pragma Import (C, cvGetNormalizedCentralMoment, "cvGetNormalizedCentralMoment");

   procedure cvGetHuMoments (moments : access opencv2_imgproc_types_c_h.CvMoments; hu_moments : access opencv2_imgproc_types_c_h.CvHuMoments);  -- /usr/include/opencv2/imgproc/imgproc_c.h:269
   pragma Import (C, cvGetHuMoments, "cvGetHuMoments");

   function cvSampleLine
     (image : System.Address;
      pt1 : opencv2_core_types_c_h.CvPoint;
      pt2 : opencv2_core_types_c_h.CvPoint;
      buffer : System.Address;
      connectivity : int) return int;  -- /usr/include/opencv2/imgproc/imgproc_c.h:275
   pragma Import (C, cvSampleLine, "cvSampleLine");

   procedure cvGetRectSubPix
     (src : System.Address;
      dst : System.Address;
      center : opencv2_core_types_c_h.CvPoint2D32f);  -- /usr/include/opencv2/imgproc/imgproc_c.h:281
   pragma Import (C, cvGetRectSubPix, "cvGetRectSubPix");

   procedure cvGetQuadrangleSubPix
     (src : System.Address;
      dst : System.Address;
      map_matrix : access constant opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/imgproc/imgproc_c.h:289
   pragma Import (C, cvGetQuadrangleSubPix, "cvGetQuadrangleSubPix");

   procedure cvMatchTemplate
     (image : System.Address;
      templ : System.Address;
      result : System.Address;
      method : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:294
   pragma Import (C, cvMatchTemplate, "cvMatchTemplate");

   function cvCalcEMD2
     (signature1 : System.Address;
      signature2 : System.Address;
      distance_type : int;
      distance_func : opencv2_imgproc_types_c_h.CvDistanceFunction;
      cost_matrix : System.Address;
      flow : System.Address;
      lower_bound : access float;
      userdata : System.Address) return float;  -- /usr/include/opencv2/imgproc/imgproc_c.h:299
   pragma Import (C, cvCalcEMD2, "cvCalcEMD2");

   function cvFindContours
     (image : System.Address;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      first_contour : System.Address;
      header_size : int;
      mode : int;
      method : int;
      offset : opencv2_core_types_c_h.CvPoint) return int;  -- /usr/include/opencv2/imgproc/imgproc_c.h:314
   pragma Import (C, cvFindContours, "cvFindContours");

   function cvStartFindContours
     (image : System.Address;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      header_size : int;
      mode : int;
      method : int;
      offset : opencv2_core_types_c_h.CvPoint) return opencv2_imgproc_types_c_h.CvContourScanner;  -- /usr/include/opencv2/imgproc/imgproc_c.h:325
   pragma Import (C, cvStartFindContours, "cvStartFindContours");

   function cvFindNextContour (scanner : opencv2_imgproc_types_c_h.CvContourScanner) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/imgproc_c.h:332
   pragma Import (C, cvFindNextContour, "cvFindNextContour");

   procedure cvSubstituteContour (scanner : opencv2_imgproc_types_c_h.CvContourScanner; new_contour : access opencv2_core_types_c_h.CvSeq);  -- /usr/include/opencv2/imgproc/imgproc_c.h:337
   pragma Import (C, cvSubstituteContour, "cvSubstituteContour");

   function cvEndFindContours (scanner : System.Address) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/imgproc_c.h:341
   pragma Import (C, cvEndFindContours, "cvEndFindContours");

   function cvApproxChains
     (src_seq : access opencv2_core_types_c_h.CvSeq;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      method : int;
      parameter : double;
      minimal_perimeter : int;
      recursive : int) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/imgproc_c.h:344
   pragma Import (C, cvApproxChains, "cvApproxChains");

   procedure cvStartReadChainPoints (chain : access opencv2_core_types_c_h.CvChain; reader : access opencv2_imgproc_types_c_h.CvChainPtReader);  -- /usr/include/opencv2/imgproc/imgproc_c.h:353
   pragma Import (C, cvStartReadChainPoints, "cvStartReadChainPoints");

   function cvReadChainPoint (reader : access opencv2_imgproc_types_c_h.CvChainPtReader) return opencv2_core_types_c_h.CvPoint;  -- /usr/include/opencv2/imgproc/imgproc_c.h:356
   pragma Import (C, cvReadChainPoint, "cvReadChainPoint");

   procedure cvInitSubdivDelaunay2D (subdiv : access opencv2_imgproc_types_c_h.CvSubdiv2D; rect : opencv2_core_types_c_h.CvRect);  -- /usr/include/opencv2/imgproc/imgproc_c.h:363
   pragma Import (C, cvInitSubdivDelaunay2D, "cvInitSubdivDelaunay2D");

   function cvCreateSubdiv2D
     (subdiv_type : int;
      header_size : int;
      vtx_size : int;
      quadedge_size : int;
      storage : access opencv2_core_types_c_h.CvMemStorage) return access opencv2_imgproc_types_c_h.CvSubdiv2D;  -- /usr/include/opencv2/imgproc/imgproc_c.h:366
   pragma Import (C, cvCreateSubdiv2D, "cvCreateSubdiv2D");

   function cvCreateSubdivDelaunay2D (rect : opencv2_core_types_c_h.CvRect; storage : access opencv2_core_types_c_h.CvMemStorage) return access opencv2_imgproc_types_c_h.CvSubdiv2D;  -- /usr/include/opencv2/imgproc/imgproc_c.h:373
   pragma Import (C, cvCreateSubdivDelaunay2D, "cvCreateSubdivDelaunay2D");

   function cvSubdivDelaunay2DInsert (subdiv : access opencv2_imgproc_types_c_h.CvSubdiv2D; pt : opencv2_core_types_c_h.CvPoint2D32f) return access opencv2_imgproc_types_c_h.CvSubdiv2DPoint;  -- /usr/include/opencv2/imgproc/imgproc_c.h:384
   pragma Import (C, cvSubdivDelaunay2DInsert, "cvSubdivDelaunay2DInsert");

   function cvSubdiv2DLocate
     (subdiv : access opencv2_imgproc_types_c_h.CvSubdiv2D;
      pt : opencv2_core_types_c_h.CvPoint2D32f;
      edge : access opencv2_imgproc_types_c_h.CvSubdiv2DEdge;
      vertex : System.Address) return opencv2_imgproc_types_c_h.CvSubdiv2DPointLocation;  -- /usr/include/opencv2/imgproc/imgproc_c.h:389
   pragma Import (C, cvSubdiv2DLocate, "cvSubdiv2DLocate");

   procedure cvCalcSubdivVoronoi2D (subdiv : access opencv2_imgproc_types_c_h.CvSubdiv2D);  -- /usr/include/opencv2/imgproc/imgproc_c.h:395
   pragma Import (C, cvCalcSubdivVoronoi2D, "cvCalcSubdivVoronoi2D");

   procedure cvClearSubdivVoronoi2D (subdiv : access opencv2_imgproc_types_c_h.CvSubdiv2D);  -- /usr/include/opencv2/imgproc/imgproc_c.h:399
   pragma Import (C, cvClearSubdivVoronoi2D, "cvClearSubdivVoronoi2D");

   function cvFindNearestPoint2D (subdiv : access opencv2_imgproc_types_c_h.CvSubdiv2D; pt : opencv2_core_types_c_h.CvPoint2D32f) return access opencv2_imgproc_types_c_h.CvSubdiv2DPoint;  -- /usr/include/opencv2/imgproc/imgproc_c.h:403
   pragma Import (C, cvFindNearestPoint2D, "cvFindNearestPoint2D");

   function cvSubdiv2DNextEdge (edge : opencv2_imgproc_types_c_h.CvSubdiv2DEdge) return opencv2_imgproc_types_c_h.CvSubdiv2DEdge;  -- /usr/include/opencv2/imgproc/imgproc_c.h:408
   pragma Import (C, cvSubdiv2DNextEdge, "cvSubdiv2DNextEdge");

   function cvSubdiv2DRotateEdge (edge : opencv2_imgproc_types_c_h.CvSubdiv2DEdge; rotate : int) return opencv2_imgproc_types_c_h.CvSubdiv2DEdge;  -- /usr/include/opencv2/imgproc/imgproc_c.h:414
   pragma Import (C, cvSubdiv2DRotateEdge, "cvSubdiv2DRotateEdge");

   function cvSubdiv2DSymEdge (edge : opencv2_imgproc_types_c_h.CvSubdiv2DEdge) return opencv2_imgproc_types_c_h.CvSubdiv2DEdge;  -- /usr/include/opencv2/imgproc/imgproc_c.h:419
   pragma Import (C, cvSubdiv2DSymEdge, "cvSubdiv2DSymEdge");

   function cvSubdiv2DGetEdge (edge : opencv2_imgproc_types_c_h.CvSubdiv2DEdge; c_type : opencv2_imgproc_types_c_h.CvNextEdgeType) return opencv2_imgproc_types_c_h.CvSubdiv2DEdge;  -- /usr/include/opencv2/imgproc/imgproc_c.h:424
   pragma Import (C, cvSubdiv2DGetEdge, "cvSubdiv2DGetEdge");

   function cvSubdiv2DEdgeOrg (edge : opencv2_imgproc_types_c_h.CvSubdiv2DEdge) return access opencv2_imgproc_types_c_h.CvSubdiv2DPoint;  -- /usr/include/opencv2/imgproc/imgproc_c.h:432
   pragma Import (C, cvSubdiv2DEdgeOrg, "cvSubdiv2DEdgeOrg");

   function cvSubdiv2DEdgeDst (edge : opencv2_imgproc_types_c_h.CvSubdiv2DEdge) return access opencv2_imgproc_types_c_h.CvSubdiv2DPoint;  -- /usr/include/opencv2/imgproc/imgproc_c.h:439
   pragma Import (C, cvSubdiv2DEdgeDst, "cvSubdiv2DEdgeDst");

   function cvTriangleArea
     (a : opencv2_core_types_c_h.CvPoint2D32f;
      b : opencv2_core_types_c_h.CvPoint2D32f;
      c : opencv2_core_types_c_h.CvPoint2D32f) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:446
   pragma Import (C, cvTriangleArea, "cvTriangleArea");

   function cvApproxPoly
     (src_seq : System.Address;
      header_size : int;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      method : int;
      parameter : double;
      parameter2 : int) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/imgproc_c.h:458
   pragma Import (C, cvApproxPoly, "cvApproxPoly");

   function cvArcLength
     (curve : System.Address;
      slice : opencv2_core_types_c_h.CvSlice;
      is_closed : int) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:464
   pragma Import (C, cvArcLength, "cvArcLength");

   function cvContourPerimeter (contour : System.Address) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:468
   pragma Import (C, cvContourPerimeter, "cvContourPerimeter");

   function cvBoundingRect (points : System.Address; update : int) return opencv2_core_types_c_h.CvRect;  -- /usr/include/opencv2/imgproc/imgproc_c.h:476
   pragma Import (C, cvBoundingRect, "cvBoundingRect");

   function cvContourArea
     (contour : System.Address;
      slice : opencv2_core_types_c_h.CvSlice;
      oriented : int) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:479
   pragma Import (C, cvContourArea, "cvContourArea");

   function cvMinAreaRect2 (points : System.Address; storage : access opencv2_core_types_c_h.CvMemStorage) return opencv2_core_types_c_h.CvBox2D;  -- /usr/include/opencv2/imgproc/imgproc_c.h:484
   pragma Import (C, cvMinAreaRect2, "cvMinAreaRect2");

   function cvMinEnclosingCircle
     (points : System.Address;
      center : access opencv2_core_types_c_h.CvPoint2D32f;
      radius : access float) return int;  -- /usr/include/opencv2/imgproc/imgproc_c.h:488
   pragma Import (C, cvMinEnclosingCircle, "cvMinEnclosingCircle");

   function cvMatchShapes
     (object1 : System.Address;
      object2 : System.Address;
      method : int;
      parameter : double) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:492
   pragma Import (C, cvMatchShapes, "cvMatchShapes");

   function cvConvexHull2
     (input : System.Address;
      hull_storage : System.Address;
      orientation : int;
      return_points : int) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/imgproc_c.h:496
   pragma Import (C, cvConvexHull2, "cvConvexHull2");

   function cvCheckContourConvexity (contour : System.Address) return int;  -- /usr/include/opencv2/imgproc/imgproc_c.h:502
   pragma Import (C, cvCheckContourConvexity, "cvCheckContourConvexity");

   function cvConvexityDefects
     (contour : System.Address;
      convexhull : System.Address;
      storage : access opencv2_core_types_c_h.CvMemStorage) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/imgproc_c.h:506
   pragma Import (C, cvConvexityDefects, "cvConvexityDefects");

   function cvFitEllipse2 (points : System.Address) return opencv2_core_types_c_h.CvBox2D;  -- /usr/include/opencv2/imgproc/imgproc_c.h:510
   pragma Import (C, cvFitEllipse2, "cvFitEllipse2");

   function cvMaxRect (rect1 : access constant opencv2_core_types_c_h.CvRect; rect2 : access constant opencv2_core_types_c_h.CvRect) return opencv2_core_types_c_h.CvRect;  -- /usr/include/opencv2/imgproc/imgproc_c.h:513
   pragma Import (C, cvMaxRect, "cvMaxRect");

   procedure cvBoxPoints (box : opencv2_core_types_c_h.CvBox2D; pt : access opencv2_core_types_c_h.CvPoint2D32f);  -- /usr/include/opencv2/imgproc/imgproc_c.h:516
   pragma Import (C, cvBoxPoints, "cvBoxPoints");

   function cvPointSeqFromMat
     (seq_kind : int;
      mat : System.Address;
      contour_header : access opencv2_core_types_c_h.CvContour;
      block : access opencv2_core_types_c_h.CvSeqBlock) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/imgproc_c.h:520
   pragma Import (C, cvPointSeqFromMat, "cvPointSeqFromMat");

   function cvPointPolygonTest
     (contour : System.Address;
      pt : opencv2_core_types_c_h.CvPoint2D32f;
      measure_dist : int) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:528
   pragma Import (C, cvPointPolygonTest, "cvPointPolygonTest");

   function cvCreateHist
     (dims : int;
      sizes : access int;
      c_type : int;
      ranges : System.Address;
      uniform : int) return access opencv2_core_types_c_h.CvHistogram;  -- /usr/include/opencv2/imgproc/imgproc_c.h:536
   pragma Import (C, cvCreateHist, "cvCreateHist");

   procedure cvSetHistBinRanges
     (hist : access opencv2_core_types_c_h.CvHistogram;
      ranges : System.Address;
      uniform : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:541
   pragma Import (C, cvSetHistBinRanges, "cvSetHistBinRanges");

   function cvMakeHistHeaderForArray
     (dims : int;
      sizes : access int;
      hist : access opencv2_core_types_c_h.CvHistogram;
      data : access float;
      ranges : System.Address;
      uniform : int) return access opencv2_core_types_c_h.CvHistogram;  -- /usr/include/opencv2/imgproc/imgproc_c.h:545
   pragma Import (C, cvMakeHistHeaderForArray, "cvMakeHistHeaderForArray");

   procedure cvReleaseHist (hist : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:551
   pragma Import (C, cvReleaseHist, "cvReleaseHist");

   procedure cvClearHist (hist : access opencv2_core_types_c_h.CvHistogram);  -- /usr/include/opencv2/imgproc/imgproc_c.h:554
   pragma Import (C, cvClearHist, "cvClearHist");

   procedure cvGetMinMaxHistValue
     (hist : access constant opencv2_core_types_c_h.CvHistogram;
      min_value : access float;
      max_value : access float;
      min_idx : access int;
      max_idx : access int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:557
   pragma Import (C, cvGetMinMaxHistValue, "cvGetMinMaxHistValue");

   procedure cvNormalizeHist (hist : access opencv2_core_types_c_h.CvHistogram; factor : double);  -- /usr/include/opencv2/imgproc/imgproc_c.h:565
   pragma Import (C, cvNormalizeHist, "cvNormalizeHist");

   procedure cvThreshHist (hist : access opencv2_core_types_c_h.CvHistogram; threshold : double);  -- /usr/include/opencv2/imgproc/imgproc_c.h:569
   pragma Import (C, cvThreshHist, "cvThreshHist");

   function cvCompareHist
     (hist1 : access constant opencv2_core_types_c_h.CvHistogram;
      hist2 : access constant opencv2_core_types_c_h.CvHistogram;
      method : int) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:573
   pragma Import (C, cvCompareHist, "cvCompareHist");

   procedure cvCopyHist (src : access constant opencv2_core_types_c_h.CvHistogram; dst : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:579
   pragma Import (C, cvCopyHist, "cvCopyHist");

   procedure cvCalcBayesianProb
     (src : System.Address;
      number : int;
      dst : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:584
   pragma Import (C, cvCalcBayesianProb, "cvCalcBayesianProb");

   procedure cvCalcArrHist
     (arr : System.Address;
      hist : access opencv2_core_types_c_h.CvHistogram;
      accumulate : int;
      mask : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:588
   pragma Import (C, cvCalcArrHist, "cvCalcArrHist");

   procedure cvCalcHist
     (image : System.Address;
      hist : access opencv2_core_types_c_h.CvHistogram;
      accumulate : int;
      mask : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:592
   pragma Import (C, cvCalcHist, "cvCalcHist");

   procedure cvCalcArrBackProject
     (image : System.Address;
      dst : System.Address;
      hist : access constant opencv2_core_types_c_h.CvHistogram);  -- /usr/include/opencv2/imgproc/imgproc_c.h:600
   pragma Import (C, cvCalcArrBackProject, "cvCalcArrBackProject");

   procedure cvCalcArrBackProjectPatch
     (image : System.Address;
      dst : System.Address;
      c_range : opencv2_core_types_c_h.Class_CvSize.CvSize;
      hist : access opencv2_core_types_c_h.CvHistogram;
      method : int;
      factor : double);  -- /usr/include/opencv2/imgproc/imgproc_c.h:607
   pragma Import (C, cvCalcArrBackProjectPatch, "cvCalcArrBackProjectPatch");

   procedure cvCalcProbDensity
     (hist1 : access constant opencv2_core_types_c_h.CvHistogram;
      hist2 : access constant opencv2_core_types_c_h.CvHistogram;
      dst_hist : access opencv2_core_types_c_h.CvHistogram;
      scale : double);  -- /usr/include/opencv2/imgproc/imgproc_c.h:615
   pragma Import (C, cvCalcProbDensity, "cvCalcProbDensity");

   procedure cvEqualizeHist (src : System.Address; dst : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:619
   pragma Import (C, cvEqualizeHist, "cvEqualizeHist");

   procedure cvDistTransform
     (src : System.Address;
      dst : System.Address;
      distance_type : int;
      mask_size : int;
      mask : access float;
      labels : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:623
   pragma Import (C, cvDistTransform, "cvDistTransform");

   function cvThreshold
     (src : System.Address;
      dst : System.Address;
      threshold : double;
      max_value : double;
      threshold_type : int) return double;  -- /usr/include/opencv2/imgproc/imgproc_c.h:632
   pragma Import (C, cvThreshold, "cvThreshold");

   procedure cvAdaptiveThreshold
     (src : System.Address;
      dst : System.Address;
      max_value : double;
      adaptive_method : int;
      threshold_type : int;
      block_size : int;
      param1 : double);  -- /usr/include/opencv2/imgproc/imgproc_c.h:641
   pragma Import (C, cvAdaptiveThreshold, "cvAdaptiveThreshold");

   procedure cvFloodFill
     (image : System.Address;
      seed_point : opencv2_core_types_c_h.CvPoint;
      new_val : opencv2_core_types_c_h.CvScalar;
      lo_diff : opencv2_core_types_c_h.CvScalar;
      up_diff : opencv2_core_types_c_h.CvScalar;
      comp : access opencv2_imgproc_types_c_h.CvConnectedComp;
      flags : int;
      mask : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:648
   pragma Import (C, cvFloodFill, "cvFloodFill");

   procedure cvCanny
     (image : System.Address;
      edges : System.Address;
      threshold1 : double;
      threshold2 : double;
      aperture_size : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:660
   pragma Import (C, cvCanny, "cvCanny");

   procedure cvPreCornerDetect
     (image : System.Address;
      corners : System.Address;
      aperture_size : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:666
   pragma Import (C, cvPreCornerDetect, "cvPreCornerDetect");

   procedure cvCornerEigenValsAndVecs
     (image : System.Address;
      eigenvv : System.Address;
      block_size : int;
      aperture_size : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:671
   pragma Import (C, cvCornerEigenValsAndVecs, "cvCornerEigenValsAndVecs");

   procedure cvCornerMinEigenVal
     (image : System.Address;
      eigenval : System.Address;
      block_size : int;
      aperture_size : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:676
   pragma Import (C, cvCornerMinEigenVal, "cvCornerMinEigenVal");

   procedure cvCornerHarris
     (image : System.Address;
      harris_responce : System.Address;
      block_size : int;
      aperture_size : int;
      k : double);  -- /usr/include/opencv2/imgproc/imgproc_c.h:681
   pragma Import (C, cvCornerHarris, "cvCornerHarris");

   procedure cvFindCornerSubPix
     (image : System.Address;
      corners : access opencv2_core_types_c_h.CvPoint2D32f;
      count : int;
      win : opencv2_core_types_c_h.Class_CvSize.CvSize;
      zero_zone : opencv2_core_types_c_h.Class_CvSize.CvSize;
      criteria : opencv2_core_types_c_h.CvTermCriteria);  -- /usr/include/opencv2/imgproc/imgproc_c.h:686
   pragma Import (C, cvFindCornerSubPix, "cvFindCornerSubPix");

   procedure cvGoodFeaturesToTrack
     (image : System.Address;
      eig_image : System.Address;
      temp_image : System.Address;
      corners : access opencv2_core_types_c_h.CvPoint2D32f;
      corner_count : access int;
      quality_level : double;
      min_distance : double;
      mask : System.Address;
      block_size : int;
      use_harris : int;
      k : double);  -- /usr/include/opencv2/imgproc/imgproc_c.h:692
   pragma Import (C, cvGoodFeaturesToTrack, "cvGoodFeaturesToTrack");

   function cvHoughLines2
     (image : System.Address;
      line_storage : System.Address;
      method : int;
      rho : double;
      theta : double;
      threshold : int;
      param1 : double;
      param2 : double) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/imgproc_c.h:708
   pragma Import (C, cvHoughLines2, "cvHoughLines2");

   function cvHoughCircles
     (image : System.Address;
      circle_storage : System.Address;
      method : int;
      dp : double;
      min_dist : double;
      param1 : double;
      param2 : double;
      min_radius : int;
      max_radius : int) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/imgproc_c.h:713
   pragma Import (C, cvHoughCircles, "cvHoughCircles");

   procedure cvFitLine
     (points : System.Address;
      dist_type : int;
      param : double;
      reps : double;
      aeps : double;
      line : access float);  -- /usr/include/opencv2/imgproc/imgproc_c.h:721
   pragma Import (C, cvFitLine, "cvFitLine");

   function cvCreateKDTree (desc : access opencv2_core_types_c_h.CvMat) return System.Address;  -- /usr/include/opencv2/imgproc/imgproc_c.h:726
   pragma Import (C, cvCreateKDTree, "cvCreateKDTree");

   function cvCreateSpillTree
     (raw_data : access constant opencv2_core_types_c_h.CvMat;
      naive : int;
      rho : double;
      tau : double) return System.Address;  -- /usr/include/opencv2/imgproc/imgproc_c.h:729
   pragma Import (C, cvCreateSpillTree, "cvCreateSpillTree");

   procedure cvReleaseFeatureTree (tr : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:735
   pragma Import (C, cvReleaseFeatureTree, "cvReleaseFeatureTree");

   procedure cvFindFeatures
     (tr : System.Address;
      query_points : access constant opencv2_core_types_c_h.CvMat;
      indices : access opencv2_core_types_c_h.CvMat;
      dist : access opencv2_core_types_c_h.CvMat;
      k : int;
      emax : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:739
   pragma Import (C, cvFindFeatures, "cvFindFeatures");

   function cvFindFeaturesBoxed
     (tr : System.Address;
      bounds_min : access opencv2_core_types_c_h.CvMat;
      bounds_max : access opencv2_core_types_c_h.CvMat;
      out_indices : access opencv2_core_types_c_h.CvMat) return int;  -- /usr/include/opencv2/imgproc/imgproc_c.h:744
   pragma Import (C, cvFindFeaturesBoxed, "cvFindFeaturesBoxed");

   function cvCreateLSH
     (ops : access opencv2_imgproc_imgproc_hpp.Class_CvLSHOperations.CvLSHOperations'Class;
      d : int;
      L : int;
      k : int;
      c_type : int;
      r : double;
      seed : opencv2_core_types_c_h.int64) return System.Address;  -- /usr/include/opencv2/imgproc/imgproc_c.h:751
   pragma Import (C, cvCreateLSH, "cvCreateLSH");

   function cvCreateMemoryLSH
     (d : int;
      n : int;
      L : int;
      k : int;
      c_type : int;
      r : double;
      seed : opencv2_core_types_c_h.int64) return System.Address;  -- /usr/include/opencv2/imgproc/imgproc_c.h:757
   pragma Import (C, cvCreateMemoryLSH, "cvCreateMemoryLSH");

   procedure cvReleaseLSH (lsh : System.Address);  -- /usr/include/opencv2/imgproc/imgproc_c.h:762
   pragma Import (C, cvReleaseLSH, "cvReleaseLSH");

   function LSHSize (lsh : System.Address) return unsigned;  -- /usr/include/opencv2/imgproc/imgproc_c.h:765
   pragma Import (C, LSHSize, "LSHSize");

   procedure cvLSHAdd
     (lsh : System.Address;
      data : access constant opencv2_core_types_c_h.CvMat;
      indices : access opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/imgproc/imgproc_c.h:768
   pragma Import (C, cvLSHAdd, "cvLSHAdd");

   procedure cvLSHRemove (lsh : System.Address; indices : access constant opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/imgproc/imgproc_c.h:771
   pragma Import (C, cvLSHRemove, "cvLSHRemove");

   procedure cvLSHQuery
     (lsh : System.Address;
      query_points : access constant opencv2_core_types_c_h.CvMat;
      indices : access opencv2_core_types_c_h.CvMat;
      dist : access opencv2_core_types_c_h.CvMat;
      k : int;
      emax : int);  -- /usr/include/opencv2/imgproc/imgproc_c.h:775
   pragma Import (C, cvLSHQuery, "cvLSHQuery");

end opencv2_imgproc_imgproc_c_h;
