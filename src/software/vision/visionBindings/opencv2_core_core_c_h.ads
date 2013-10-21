pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stddef_h;
with System;
with opencv2_core_types_c_h;
with Interfaces.C.Strings;

package opencv2_core_core_c_h is

   --  arg-macro: function cvFree (ptr)
   --    return cvFree_(*(ptr)), *(ptr):=0;

   CV_AUTOSTEP : constant := 16#7fffffff#;  --  /usr/include/opencv2/core/core_c.h:111
   --  unsupported macro: cvGetSubArr cvGetSubRect

   CV_MAX_ARR : constant := 10;  --  /usr/include/opencv2/core/core_c.h:267

   CV_NO_DEPTH_CHECK : constant := 1;  --  /usr/include/opencv2/core/core_c.h:281
   CV_NO_CN_CHECK : constant := 2;  --  /usr/include/opencv2/core/core_c.h:282
   CV_NO_SIZE_CHECK : constant := 4;  --  /usr/include/opencv2/core/core_c.h:283
   --  arg-macro: procedure cvReshapeND (arr, header, necvReshapeMatND( (arr), sizeof(*(header)), (header), (new_cn), (new_dims), (new_sizes))
   --    cvReshapeMatND( (arr), sizeof(*(header)), (header), (new_cn), (new_dims), (new_sizes))
   --  unsupported macro: cvZero cvSetZero
   --  unsupported macro: cvCvtScale cvConvertScale
   --  unsupported macro: cvScale cvConvertScale
   --  arg-macro: procedure cvConvert (src, dst)
   --    cvConvertScale( (src), (dst), 1, 0 )
   --  unsupported macro: cvCvtScaleAbs cvConvertScaleAbs
   --  arg-macro: procedure cvAXPY (A, real_scalar,cvScaleAdd(A, cvRealScalar(real_scalar), B, C)
   --    cvScaleAdd(A, cvRealScalar(real_scalar), B, C)

   CV_CMP_EQ : constant := 0;  --  /usr/include/opencv2/core/core_c.h:565
   CV_CMP_GT : constant := 1;  --  /usr/include/opencv2/core/core_c.h:566
   CV_CMP_GE : constant := 2;  --  /usr/include/opencv2/core/core_c.h:567
   CV_CMP_LT : constant := 3;  --  /usr/include/opencv2/core/core_c.h:568
   CV_CMP_LE : constant := 4;  --  /usr/include/opencv2/core/core_c.h:569
   CV_CMP_NE : constant := 5;  --  /usr/include/opencv2/core/core_c.h:570
   --  arg-macro: procedure cvAbs (src, dst)
   --    cvAbsDiffS( (src), (dst), cvScalarAll(0))

   CV_CHECK_RANGE : constant := 1;  --  /usr/include/opencv2/core/core_c.h:641
   CV_CHECK_QUIET : constant := 2;  --  /usr/include/opencv2/core/core_c.h:642
   --  unsupported macro: cvCheckArray cvCheckArr

   CV_RAND_UNI : constant := 0;  --  /usr/include/opencv2/core/core_c.h:647
   CV_RAND_NORMAL : constant := 1;  --  /usr/include/opencv2/core/core_c.h:648

   CV_SORT_EVERY_ROW : constant := 0;  --  /usr/include/opencv2/core/core_c.h:655
   CV_SORT_EVERY_COLUMN : constant := 1;  --  /usr/include/opencv2/core/core_c.h:656
   CV_SORT_ASCENDING : constant := 0;  --  /usr/include/opencv2/core/core_c.h:657
   CV_SORT_DESCENDING : constant := 16;  --  /usr/include/opencv2/core/core_c.h:658
   --  arg-macro: procedure cvMatMulAdd (src1, src2, srccvGEMM( (src1), (src2), 1., (src3), 1., (dst), 0 )
   --    cvGEMM( (src1), (src2), 1., (src3), 1., (dst), 0 )
   --  arg-macro: procedure cvMatMul (src1, src2, dstcvMatMulAdd( (src1), (src2), NULL, (dst))
   --    cvMatMulAdd( (src1), (src2), NULL, (dst))

   CV_GEMM_A_T : constant := 1;  --  /usr/include/opencv2/core/core_c.h:682
   CV_GEMM_B_T : constant := 2;  --  /usr/include/opencv2/core/core_c.h:683
   CV_GEMM_C_T : constant := 4;  --  /usr/include/opencv2/core/core_c.h:684
   --  unsupported macro: cvMatMulAddEx cvGEMM
   --  unsupported macro: cvMatMulAddS cvTransform
   --  unsupported macro: cvT cvTranspose
   --  unsupported macro: cvMirror cvFlip

   CV_SVD_MODIFY_A : constant := 1;  --  /usr/include/opencv2/core/core_c.h:723
   CV_SVD_U_T : constant := 2;  --  /usr/include/opencv2/core/core_c.h:724
   CV_SVD_V_T : constant := 4;  --  /usr/include/opencv2/core/core_c.h:725

   CV_LU : constant := 0;  --  /usr/include/opencv2/core/core_c.h:737
   CV_SVD : constant := 1;  --  /usr/include/opencv2/core/core_c.h:738
   CV_SVD_SYM : constant := 2;  --  /usr/include/opencv2/core/core_c.h:739
   CV_CHOLESKY : constant := 3;  --  /usr/include/opencv2/core/core_c.h:740
   CV_QR : constant := 4;  --  /usr/include/opencv2/core/core_c.h:741
   CV_NORMAL : constant := 16;  --  /usr/include/opencv2/core/core_c.h:742
   --  unsupported macro: cvInv cvInvert

   CV_COVAR_SCRAMBLED : constant := 0;  --  /usr/include/opencv2/core/core_c.h:778

   CV_COVAR_NORMAL : constant := 1;  --  /usr/include/opencv2/core/core_c.h:781

   CV_COVAR_USE_AVG : constant := 2;  --  /usr/include/opencv2/core/core_c.h:785

   CV_COVAR_SCALE : constant := 4;  --  /usr/include/opencv2/core/core_c.h:788

   CV_COVAR_ROWS : constant := 8;  --  /usr/include/opencv2/core/core_c.h:791

   CV_COVAR_COLS : constant := 16;  --  /usr/include/opencv2/core/core_c.h:794

   CV_PCA_DATA_AS_ROW : constant := 0;  --  /usr/include/opencv2/core/core_c.h:799
   CV_PCA_DATA_AS_COL : constant := 1;  --  /usr/include/opencv2/core/core_c.h:800
   CV_PCA_USE_AVG : constant := 2;  --  /usr/include/opencv2/core/core_c.h:801
   --  unsupported macro: cvMahalonobis cvMahalanobis

   CV_C : constant := 1;  --  /usr/include/opencv2/core/core_c.h:839
   CV_L1 : constant := 2;  --  /usr/include/opencv2/core/core_c.h:840
   CV_L2 : constant := 4;  --  /usr/include/opencv2/core/core_c.h:841
   CV_NORM_MASK : constant := 7;  --  /usr/include/opencv2/core/core_c.h:842
   CV_RELATIVE : constant := 8;  --  /usr/include/opencv2/core/core_c.h:843
   CV_DIFF : constant := 16;  --  /usr/include/opencv2/core/core_c.h:844
   CV_MINMAX : constant := 32;  --  /usr/include/opencv2/core/core_c.h:845
   --  unsupported macro: CV_DIFF_C (CV_DIFF | CV_C)
   --  unsupported macro: CV_DIFF_L1 (CV_DIFF | CV_L1)
   --  unsupported macro: CV_DIFF_L2 (CV_DIFF | CV_L2)
   --  unsupported macro: CV_RELATIVE_C (CV_RELATIVE | CV_C)
   --  unsupported macro: CV_RELATIVE_L1 (CV_RELATIVE | CV_L1)
   --  unsupported macro: CV_RELATIVE_L2 (CV_RELATIVE | CV_L2)

   CV_REDUCE_SUM : constant := 0;  --  /usr/include/opencv2/core/core_c.h:865
   CV_REDUCE_AVG : constant := 1;  --  /usr/include/opencv2/core/core_c.h:866
   CV_REDUCE_MAX : constant := 2;  --  /usr/include/opencv2/core/core_c.h:867
   CV_REDUCE_MIN : constant := 3;  --  /usr/include/opencv2/core/core_c.h:868

   CV_DXT_FORWARD : constant := 0;  --  /usr/include/opencv2/core/core_c.h:877
   CV_DXT_INVERSE : constant := 1;  --  /usr/include/opencv2/core/core_c.h:878
   CV_DXT_SCALE : constant := 2;  --  /usr/include/opencv2/core/core_c.h:879
   --  unsupported macro: CV_DXT_INV_SCALE (CV_DXT_INVERSE + CV_DXT_SCALE)
   --  unsupported macro: CV_DXT_INVERSE_SCALE CV_DXT_INV_SCALE

   CV_DXT_ROWS : constant := 4;  --  /usr/include/opencv2/core/core_c.h:882
   CV_DXT_MUL_CONJ : constant := 8;  --  /usr/include/opencv2/core/core_c.h:883
   --  unsupported macro: cvFFT cvDFT

   CV_FRONT : constant := 1;  --  /usr/include/opencv2/core/core_c.h:970
   CV_BACK : constant := 0;  --  /usr/include/opencv2/core/core_c.h:971
   --  unsupported macro: cvGraphFindEdge cvFindGraphEdge
   --  unsupported macro: cvGraphFindEdgeByPtr cvFindGraphEdgeByPtr
   --  arg-macro: function cvGetGraphVtx (graph, idx)
   --    return CvGraphVtx*)cvGetSetElem((CvSet*)(graph), (idx);
   --  arg-macro: function cvGraphVtxIdx (graph, vtx)
   --    return (vtx).flags and CV_SET_ELEM_IDX_MASK;
   --  arg-macro: function cvGraphEdgeIdx (graph, edge)
   --    return (edge).flags and CV_SET_ELEM_IDX_MASK;
   --  arg-macro: function cvGraphGetVtxCount (graph)
   --    return (graph).active_count;
   --  arg-macro: function cvGraphGetEdgeCount (graph)
   --    return (graph).edges.active_count;

   CV_GRAPH_VERTEX : constant := 1;  --  /usr/include/opencv2/core/core_c.h:1202
   CV_GRAPH_TREE_EDGE : constant := 2;  --  /usr/include/opencv2/core/core_c.h:1203
   CV_GRAPH_BACK_EDGE : constant := 4;  --  /usr/include/opencv2/core/core_c.h:1204
   CV_GRAPH_FORWARD_EDGE : constant := 8;  --  /usr/include/opencv2/core/core_c.h:1205
   CV_GRAPH_CROSS_EDGE : constant := 16;  --  /usr/include/opencv2/core/core_c.h:1206
   CV_GRAPH_ANY_EDGE : constant := 30;  --  /usr/include/opencv2/core/core_c.h:1207
   CV_GRAPH_NEW_TREE : constant := 32;  --  /usr/include/opencv2/core/core_c.h:1208
   CV_GRAPH_BACKTRACKING : constant := 64;  --  /usr/include/opencv2/core/core_c.h:1209
   CV_GRAPH_OVER : constant := -1;  --  /usr/include/opencv2/core/core_c.h:1210

   CV_GRAPH_ALL_ITEMS : constant := -1;  --  /usr/include/opencv2/core/core_c.h:1212

   CV_GRAPH_ITEM_VISITED_FLAG : constant := (2 ** 30);  --  /usr/include/opencv2/core/core_c.h:1215
   --  arg-macro: function CV_IS_GRAPH_VERTEX_VISITED (vtx)
   --    return ((CvGraphVtx*)(vtx)).flags and CV_GRAPH_ITEM_VISITED_FLAG;
   --  arg-macro: function CV_IS_GRAPH_EDGE_VISITED (edge)
   --    return ((CvGraphEdge*)(edge)).flags and CV_GRAPH_ITEM_VISITED_FLAG;

   CV_GRAPH_SEARCH_TREE_NODE_FLAG : constant := (2 ** 29);  --  /usr/include/opencv2/core/core_c.h:1220
   CV_GRAPH_FORWARD_EDGE_FLAG : constant := (2 ** 28);  --  /usr/include/opencv2/core/core_c.h:1221
   --  arg-macro: procedure CV_RGB (r, g, b)
   --    cvScalar( (b), (g), (r), 0 )

   CV_FILLED : constant := -1;  --  /usr/include/opencv2/core/core_c.h:1265

   CV_AA : constant := 16;  --  /usr/include/opencv2/core/core_c.h:1267
   --  unsupported macro: cvDrawRect cvRectangle
   --  unsupported macro: cvDrawLine cvLine
   --  unsupported macro: cvDrawCircle cvCircle
   --  unsupported macro: cvDrawEllipse cvEllipse
   --  unsupported macro: cvDrawPolyLine cvPolyLine
   --  arg-macro: procedure CV_NEXT_LINE_POINT (line_iterator)
   --    { int _line_iterator_mask := (line_iterator).err < 0 ? -1 : 0; (line_iterator).err += (line_iterator).minus_delta + ((line_iterator).plus_delta and _line_iterator_mask); (line_iterator).ptr += (line_iterator).minus_step + ((line_iterator).plus_step and _line_iterator_mask); }

   CV_FONT_HERSHEY_SIMPLEX : constant := 0;  --  /usr/include/opencv2/core/core_c.h:1359
   CV_FONT_HERSHEY_PLAIN : constant := 1;  --  /usr/include/opencv2/core/core_c.h:1360
   CV_FONT_HERSHEY_DUPLEX : constant := 2;  --  /usr/include/opencv2/core/core_c.h:1361
   CV_FONT_HERSHEY_COMPLEX : constant := 3;  --  /usr/include/opencv2/core/core_c.h:1362
   CV_FONT_HERSHEY_TRIPLEX : constant := 4;  --  /usr/include/opencv2/core/core_c.h:1363
   CV_FONT_HERSHEY_COMPLEX_SMALL : constant := 5;  --  /usr/include/opencv2/core/core_c.h:1364
   CV_FONT_HERSHEY_SCRIPT_SIMPLEX : constant := 6;  --  /usr/include/opencv2/core/core_c.h:1365
   CV_FONT_HERSHEY_SCRIPT_COMPLEX : constant := 7;  --  /usr/include/opencv2/core/core_c.h:1366

   CV_FONT_ITALIC : constant := 16;  --  /usr/include/opencv2/core/core_c.h:1369
   --  unsupported macro: CV_FONT_VECTOR0 CV_FONT_HERSHEY_SIMPLEX

   CV_KMEANS_USE_INITIAL_LABELS : constant := 1;  --  /usr/include/opencv2/core/core_c.h:1471
   --  arg-macro: procedure CV_TURN_ON_IPL_COMPATIBILITY ()
   --    cvSetIPLAllocators( iplCreateImageHeader, iplAllocateImage, iplDeallocate, iplCreateROI, iplCloneImage )

   CV_CPU_NONE : constant := 0;  --  /usr/include/opencv2/core/core_c.h:1699
   CV_CPU_MMX : constant := 1;  --  /usr/include/opencv2/core/core_c.h:1700
   CV_CPU_SSE : constant := 2;  --  /usr/include/opencv2/core/core_c.h:1701
   CV_CPU_SSE2 : constant := 3;  --  /usr/include/opencv2/core/core_c.h:1702
   CV_CPU_SSE3 : constant := 4;  --  /usr/include/opencv2/core/core_c.h:1703
   CV_CPU_SSSE3 : constant := 5;  --  /usr/include/opencv2/core/core_c.h:1704
   CV_CPU_SSE4_1 : constant := 6;  --  /usr/include/opencv2/core/core_c.h:1705
   CV_CPU_SSE4_2 : constant := 7;  --  /usr/include/opencv2/core/core_c.h:1706
   CV_CPU_POPCNT : constant := 8;  --  /usr/include/opencv2/core/core_c.h:1707
   CV_CPU_AVX : constant := 10;  --  /usr/include/opencv2/core/core_c.h:1708
   CV_HARDWARE_MAX_FEATURE : constant := 255;  --  /usr/include/opencv2/core/core_c.h:1709

   CV_ErrModeLeaf : constant := 0;  --  /usr/include/opencv2/core/core_c.h:1730
   CV_ErrModeParent : constant := 1;  --  /usr/include/opencv2/core/core_c.h:1731
   CV_ErrModeSilent : constant := 2;  --  /usr/include/opencv2/core/core_c.h:1732
   --  arg-macro: procedure OPENCV_ERROR (status, func, ccvError((status),(func),(context),__FILE__,__LINE__)
   --    cvError((status),(func),(context),__FILE__,__LINE__)
   --  arg-macro: procedure OPENCV_ERRCHK (func, context)
   --    {if (cvGetErrStatus() >= 0) {OPENCV_ERROR(CV_StsBackTrace,(func),(context));}}
   --  arg-macro: procedure OPENCV_ASSERT (expr, func, con{if (not (expr)) {OPENCV_ERROR(CV_StsInternal,(func),(context));}}
   --    {if (not (expr)) {OPENCV_ERROR(CV_StsInternal,(func),(context));}}
   --  arg-macro: function OPENCV_RSTERR ()
   --    return cvSetErrStatus(CV_StsOk);
   --  arg-macro: procedure OPENCV_CALL (Func)
   --    { Func; }
   --  arg-macro: procedure CV_FUNCNAME (Name)
   --    static char cvFuncName() := Name
   --  arg-macro: procedure CV_ERROR (Code, Msg)
   --    { cvError( (Code), cvFuncName, Msg, __FILE__, __LINE__ ); __CV_EXIT__; }
   --  arg-macro: procedure CV_ERROR_FROM_CODE (code)
   --    CV_ERROR( code, "" )
   --  arg-macro: procedure CV_CHECK ()
   --    { if( cvGetErrStatus() < 0 ) CV_ERROR( CV_StsBackTrace, "Inner function failed." ); }
   --  arg-macro: procedure CV_CALL (Func)
   --    { Func; CV_CHECK(); }
   --  unsupported macro: CV_ASSERT(Condition) { if( !(Condition) ) CV_ERROR( CV_StsInternal, "Assertion: " #Condition " failed" ); }

   function cvAlloc (size : stddef_h.size_t) return System.Address;  -- /usr/include/opencv2/core/core_c.h:61
   pragma Import (C, cvAlloc, "cvAlloc");

   procedure cvFree_u (ptr : System.Address);  -- /usr/include/opencv2/core/core_c.h:69
   pragma Import (C, cvFree_u, "cvFree_");

   function cvCreateImageHeader
     (size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      depth : int;
      channels : int) return access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/core/core_c.h:73
   pragma Import (C, cvCreateImageHeader, "cvCreateImageHeader");

   function cvInitImageHeader
     (image : access opencv2_core_types_c_h.IplImage;
      size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      depth : int;
      channels : int;
      origin : int;
      align : int) return access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/core/core_c.h:76
   pragma Import (C, cvInitImageHeader, "cvInitImageHeader");

   function cvCreateImage
     (size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      depth : int;
      channels : int) return access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/core/core_c.h:81
   pragma Import (C, cvCreateImage, "cvCreateImage");

   procedure cvReleaseImageHeader (image : System.Address);  -- /usr/include/opencv2/core/core_c.h:84
   pragma Import (C, cvReleaseImageHeader, "cvReleaseImageHeader");

   procedure cvReleaseImage (image : System.Address);  -- /usr/include/opencv2/core/core_c.h:87
   pragma Import (C, cvReleaseImage, "cvReleaseImage");

   function cvCloneImage (image : access constant opencv2_core_types_c_h.IplImage) return access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/core/core_c.h:90
   pragma Import (C, cvCloneImage, "cvCloneImage");

   procedure cvSetImageCOI (image : access opencv2_core_types_c_h.IplImage; coi : int);  -- /usr/include/opencv2/core/core_c.h:94
   pragma Import (C, cvSetImageCOI, "cvSetImageCOI");

   function cvGetImageCOI (image : access constant opencv2_core_types_c_h.IplImage) return int;  -- /usr/include/opencv2/core/core_c.h:97
   pragma Import (C, cvGetImageCOI, "cvGetImageCOI");

   procedure cvSetImageROI (image : access opencv2_core_types_c_h.IplImage; rect : opencv2_core_types_c_h.CvRect);  -- /usr/include/opencv2/core/core_c.h:100
   pragma Import (C, cvSetImageROI, "cvSetImageROI");

   procedure cvResetImageROI (image : access opencv2_core_types_c_h.IplImage);  -- /usr/include/opencv2/core/core_c.h:103
   pragma Import (C, cvResetImageROI, "cvResetImageROI");

   function cvGetImageROI (image : access constant opencv2_core_types_c_h.IplImage) return opencv2_core_types_c_h.CvRect;  -- /usr/include/opencv2/core/core_c.h:106
   pragma Import (C, cvGetImageROI, "cvGetImageROI");

   function cvCreateMatHeader
     (rows : int;
      cols : int;
      c_type : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:109
   pragma Import (C, cvCreateMatHeader, "cvCreateMatHeader");

   function cvInitMatHeader
     (mat : access opencv2_core_types_c_h.CvMat;
      rows : int;
      cols : int;
      c_type : int;
      data : System.Address;
      step : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:114
   pragma Import (C, cvInitMatHeader, "cvInitMatHeader");

   function cvCreateMat
     (rows : int;
      cols : int;
      c_type : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:119
   pragma Import (C, cvCreateMat, "cvCreateMat");

   procedure cvReleaseMat (mat : System.Address);  -- /usr/include/opencv2/core/core_c.h:123
   pragma Import (C, cvReleaseMat, "cvReleaseMat");

   procedure cvDecRefData (arr : System.Address);  -- /usr/include/opencv2/core/core_c.h:127
   pragma Import (C, cvDecRefData, "cvDecRefData");

   function cvIncRefData (arr : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:148
   pragma Import (C, cvIncRefData, "cvIncRefData");

   function cvCloneMat (mat : access constant opencv2_core_types_c_h.CvMat) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:168
   pragma Import (C, cvCloneMat, "cvCloneMat");

   function cvGetSubRect
     (arr : System.Address;
      submat : access opencv2_core_types_c_h.CvMat;
      rect : opencv2_core_types_c_h.CvRect) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:173
   pragma Import (C, cvGetSubRect, "cvGetSubRect");

   function cvGetRows
     (arr : System.Address;
      submat : access opencv2_core_types_c_h.CvMat;
      start_row : int;
      end_row : int;
      delta_row : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:178
   pragma Import (C, cvGetRows, "cvGetRows");

   function cvGetRow
     (arr : System.Address;
      submat : access opencv2_core_types_c_h.CvMat;
      row : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:182
   pragma Import (C, cvGetRow, "cvGetRow");

   function cvGetCols
     (arr : System.Address;
      submat : access opencv2_core_types_c_h.CvMat;
      start_col : int;
      end_col : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:190
   pragma Import (C, cvGetCols, "cvGetCols");

   function cvGetCol
     (arr : System.Address;
      submat : access opencv2_core_types_c_h.CvMat;
      col : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:193
   pragma Import (C, cvGetCol, "cvGetCol");

   function cvGetDiag
     (arr : System.Address;
      submat : access opencv2_core_types_c_h.CvMat;
      diag : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:202
   pragma Import (C, cvGetDiag, "cvGetDiag");

   procedure cvScalarToRawData
     (scalar : access constant opencv2_core_types_c_h.CvScalar;
      data : System.Address;
      c_type : int;
      extend_to_12 : int);  -- /usr/include/opencv2/core/core_c.h:206
   pragma Import (C, cvScalarToRawData, "cvScalarToRawData");

   procedure cvRawDataToScalar
     (data : System.Address;
      c_type : int;
      scalar : access opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/core/core_c.h:209
   pragma Import (C, cvRawDataToScalar, "cvRawDataToScalar");

   function cvCreateMatNDHeader
     (dims : int;
      sizes : access int;
      c_type : int) return access opencv2_core_types_c_h.CvMatND;  -- /usr/include/opencv2/core/core_c.h:212
   pragma Import (C, cvCreateMatNDHeader, "cvCreateMatNDHeader");

   function cvCreateMatND
     (dims : int;
      sizes : access int;
      c_type : int) return access opencv2_core_types_c_h.CvMatND;  -- /usr/include/opencv2/core/core_c.h:215
   pragma Import (C, cvCreateMatND, "cvCreateMatND");

   function cvInitMatNDHeader
     (mat : access opencv2_core_types_c_h.CvMatND;
      dims : int;
      sizes : access int;
      c_type : int;
      data : System.Address) return access opencv2_core_types_c_h.CvMatND;  -- /usr/include/opencv2/core/core_c.h:218
   pragma Import (C, cvInitMatNDHeader, "cvInitMatNDHeader");

   procedure cvReleaseMatND (mat : System.Address);  -- /usr/include/opencv2/core/core_c.h:222
   pragma Import (C, cvReleaseMatND, "cvReleaseMatND");

   function cvCloneMatND (mat : access constant opencv2_core_types_c_h.CvMatND) return access opencv2_core_types_c_h.CvMatND;  -- /usr/include/opencv2/core/core_c.h:228
   pragma Import (C, cvCloneMatND, "cvCloneMatND");

   function cvCreateSparseMat
     (dims : int;
      sizes : access int;
      c_type : int) return access opencv2_core_types_c_h.CvSparseMat;  -- /usr/include/opencv2/core/core_c.h:231
   pragma Import (C, cvCreateSparseMat, "cvCreateSparseMat");

   procedure cvReleaseSparseMat (mat : System.Address);  -- /usr/include/opencv2/core/core_c.h:234
   pragma Import (C, cvReleaseSparseMat, "cvReleaseSparseMat");

   function cvCloneSparseMat (mat : access constant opencv2_core_types_c_h.CvSparseMat) return access opencv2_core_types_c_h.CvSparseMat;  -- /usr/include/opencv2/core/core_c.h:237
   pragma Import (C, cvCloneSparseMat, "cvCloneSparseMat");

   function cvInitSparseMatIterator (mat : access constant opencv2_core_types_c_h.CvSparseMat; mat_iterator : access opencv2_core_types_c_h.CvSparseMatIterator) return access opencv2_core_types_c_h.CvSparseNode;  -- /usr/include/opencv2/core/core_c.h:241
   pragma Import (C, cvInitSparseMatIterator, "cvInitSparseMatIterator");

   function cvGetNextSparseNode (mat_iterator : access opencv2_core_types_c_h.CvSparseMatIterator) return access opencv2_core_types_c_h.CvSparseNode;  -- /usr/include/opencv2/core/core_c.h:245
   pragma Import (C, cvGetNextSparseNode, "cvGetNextSparseNode");

   type CvNArrayIterator_ptr_array is array (0 .. 9) of access opencv2_core_types_c_h.uchar;
   type CvNArrayIterator_stack_array is array (0 .. 31) of aliased int;
   type CvNArrayIterator_hdr_array is array (0 .. 9) of access opencv2_core_types_c_h.CvMatND;
   type CvNArrayIterator is record
      count : aliased int;  -- /usr/include/opencv2/core/core_c.h:271
      dims : aliased int;  -- /usr/include/opencv2/core/core_c.h:272
      size : aliased opencv2_core_types_c_h.Class_CvSize.CvSize;  -- /usr/include/opencv2/core/core_c.h:273
      ptr : aliased CvNArrayIterator_ptr_array;  -- /usr/include/opencv2/core/core_c.h:274
      stack : aliased CvNArrayIterator_stack_array;  -- /usr/include/opencv2/core/core_c.h:275
      hdr : aliased CvNArrayIterator_hdr_array;  -- /usr/include/opencv2/core/core_c.h:276
   end record;
   pragma Convention (C_Pass_By_Copy, CvNArrayIterator);  -- /usr/include/opencv2/core/core_c.h:269

   function cvInitNArrayIterator
     (count : int;
      arrs : System.Address;
      mask : System.Address;
      stubs : access opencv2_core_types_c_h.CvMatND;
      array_iterator : access CvNArrayIterator;
      flags : int) return int;  -- /usr/include/opencv2/core/core_c.h:288
   pragma Import (C, cvInitNArrayIterator, "cvInitNArrayIterator");

   function cvNextNArraySlice (array_iterator : access CvNArrayIterator) return int;  -- /usr/include/opencv2/core/core_c.h:294
   pragma Import (C, cvNextNArraySlice, "cvNextNArraySlice");

   function cvGetElemType (arr : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:299
   pragma Import (C, cvGetElemType, "cvGetElemType");

   function cvGetDims (arr : System.Address; sizes : access int) return int;  -- /usr/include/opencv2/core/core_c.h:303
   pragma Import (C, cvGetDims, "cvGetDims");

   function cvGetDimSize (arr : System.Address; index : int) return int;  -- /usr/include/opencv2/core/core_c.h:309
   pragma Import (C, cvGetDimSize, "cvGetDimSize");

   function cvPtr1D
     (arr : System.Address;
      idx0 : int;
      c_type : access int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core_c.h:314
   pragma Import (C, cvPtr1D, "cvPtr1D");

   function cvPtr2D
     (arr : System.Address;
      idx0 : int;
      idx1 : int;
      c_type : access int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core_c.h:315
   pragma Import (C, cvPtr2D, "cvPtr2D");

   function cvPtr3D
     (arr : System.Address;
      idx0 : int;
      idx1 : int;
      idx2 : int;
      c_type : access int) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core_c.h:316
   pragma Import (C, cvPtr3D, "cvPtr3D");

   function cvPtrND
     (arr : System.Address;
      idx : access int;
      c_type : access int;
      create_node : int;
      precalc_hashval : access unsigned) return access opencv2_core_types_c_h.uchar;  -- /usr/include/opencv2/core/core_c.h:323
   pragma Import (C, cvPtrND, "cvPtrND");

   function cvGet1D (arr : System.Address; idx0 : int) return opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/core/core_c.h:328
   pragma Import (C, cvGet1D, "cvGet1D");

   function cvGet2D
     (arr : System.Address;
      idx0 : int;
      idx1 : int) return opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/core/core_c.h:329
   pragma Import (C, cvGet2D, "cvGet2D");

   function cvGet3D
     (arr : System.Address;
      idx0 : int;
      idx1 : int;
      idx2 : int) return opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/core/core_c.h:330
   pragma Import (C, cvGet3D, "cvGet3D");

   function cvGetND (arr : System.Address; idx : access int) return opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/core/core_c.h:331
   pragma Import (C, cvGetND, "cvGetND");

   function cvGetReal1D (arr : System.Address; idx0 : int) return double;  -- /usr/include/opencv2/core/core_c.h:334
   pragma Import (C, cvGetReal1D, "cvGetReal1D");

   function cvGetReal2D
     (arr : System.Address;
      idx0 : int;
      idx1 : int) return double;  -- /usr/include/opencv2/core/core_c.h:335
   pragma Import (C, cvGetReal2D, "cvGetReal2D");

   function cvGetReal3D
     (arr : System.Address;
      idx0 : int;
      idx1 : int;
      idx2 : int) return double;  -- /usr/include/opencv2/core/core_c.h:336
   pragma Import (C, cvGetReal3D, "cvGetReal3D");

   function cvGetRealND (arr : System.Address; idx : access int) return double;  -- /usr/include/opencv2/core/core_c.h:337
   pragma Import (C, cvGetRealND, "cvGetRealND");

   procedure cvSet1D
     (arr : System.Address;
      idx0 : int;
      value : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/core/core_c.h:340
   pragma Import (C, cvSet1D, "cvSet1D");

   procedure cvSet2D
     (arr : System.Address;
      idx0 : int;
      idx1 : int;
      value : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/core/core_c.h:341
   pragma Import (C, cvSet2D, "cvSet2D");

   procedure cvSet3D
     (arr : System.Address;
      idx0 : int;
      idx1 : int;
      idx2 : int;
      value : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/core/core_c.h:342
   pragma Import (C, cvSet3D, "cvSet3D");

   procedure cvSetND
     (arr : System.Address;
      idx : access int;
      value : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/core/core_c.h:343
   pragma Import (C, cvSetND, "cvSetND");

   procedure cvSetReal1D
     (arr : System.Address;
      idx0 : int;
      value : double);  -- /usr/include/opencv2/core/core_c.h:346
   pragma Import (C, cvSetReal1D, "cvSetReal1D");

   procedure cvSetReal2D
     (arr : System.Address;
      idx0 : int;
      idx1 : int;
      value : double);  -- /usr/include/opencv2/core/core_c.h:347
   pragma Import (C, cvSetReal2D, "cvSetReal2D");

   procedure cvSetReal3D
     (arr : System.Address;
      idx0 : int;
      idx1 : int;
      idx2 : int;
      value : double);  -- /usr/include/opencv2/core/core_c.h:348
   pragma Import (C, cvSetReal3D, "cvSetReal3D");

   procedure cvSetRealND
     (arr : System.Address;
      idx : access int;
      value : double);  -- /usr/include/opencv2/core/core_c.h:350
   pragma Import (C, cvSetRealND, "cvSetRealND");

   procedure cvClearND (arr : System.Address; idx : access int);  -- /usr/include/opencv2/core/core_c.h:354
   pragma Import (C, cvClearND, "cvClearND");

   function cvGetMat
     (arr : System.Address;
      header : access opencv2_core_types_c_h.CvMat;
      coi : access int;
      allowND : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:361
   pragma Import (C, cvGetMat, "cvGetMat");

   function cvGetImage (arr : System.Address; image_header : access opencv2_core_types_c_h.IplImage) return access opencv2_core_types_c_h.IplImage;  -- /usr/include/opencv2/core/core_c.h:366
   pragma Import (C, cvGetImage, "cvGetImage");

   function cvReshapeMatND
     (arr : System.Address;
      sizeof_header : int;
      header : System.Address;
      new_cn : int;
      new_dims : int;
      new_sizes : access int) return System.Address;  -- /usr/include/opencv2/core/core_c.h:379
   pragma Import (C, cvReshapeMatND, "cvReshapeMatND");

   function cvReshape
     (arr : System.Address;
      header : access opencv2_core_types_c_h.CvMat;
      new_cn : int;
      new_rows : int) return access opencv2_core_types_c_h.CvMat;  -- /usr/include/opencv2/core/core_c.h:387
   pragma Import (C, cvReshape, "cvReshape");

   procedure cvRepeat (src : System.Address; dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:392
   pragma Import (C, cvRepeat, "cvRepeat");

   procedure cvCreateData (arr : System.Address);  -- /usr/include/opencv2/core/core_c.h:395
   pragma Import (C, cvCreateData, "cvCreateData");

   procedure cvReleaseData (arr : System.Address);  -- /usr/include/opencv2/core/core_c.h:398
   pragma Import (C, cvReleaseData, "cvReleaseData");

   procedure cvSetData
     (arr : System.Address;
      data : System.Address;
      step : int);  -- /usr/include/opencv2/core/core_c.h:403
   pragma Import (C, cvSetData, "cvSetData");

   procedure cvGetRawData
     (arr : System.Address;
      data : System.Address;
      step : access int;
      roi_size : access opencv2_core_types_c_h.Class_CvSize.CvSize);  -- /usr/include/opencv2/core/core_c.h:408
   pragma Import (C, cvGetRawData, "cvGetRawData");

   function cvGetSize (arr : System.Address) return opencv2_core_types_c_h.Class_CvSize.CvSize;  -- /usr/include/opencv2/core/core_c.h:413
   pragma Import (C, cvGetSize, "cvGetSize");

   procedure cvCopy
     (src : System.Address;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:416
   pragma Import (C, cvCopy, "cvCopy");

   procedure cvSet
     (arr : System.Address;
      value : opencv2_core_types_c_h.CvScalar;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:421
   pragma Import (C, cvSet, "cvSet");

   procedure cvSetZero (arr : System.Address);  -- /usr/include/opencv2/core/core_c.h:425
   pragma Import (C, cvSetZero, "cvSetZero");

   procedure cvSplit
     (src : System.Address;
      dst0 : System.Address;
      dst1 : System.Address;
      dst2 : System.Address;
      dst3 : System.Address);  -- /usr/include/opencv2/core/core_c.h:431
   pragma Import (C, cvSplit, "cvSplit");

   procedure cvMerge
     (src0 : System.Address;
      src1 : System.Address;
      src2 : System.Address;
      src3 : System.Address;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:436
   pragma Import (C, cvMerge, "cvMerge");

   procedure cvMixChannels
     (src : System.Address;
      src_count : int;
      dst : System.Address;
      dst_count : int;
      from_to : access int;
      pair_count : int);  -- /usr/include/opencv2/core/core_c.h:442
   pragma Import (C, cvMixChannels, "cvMixChannels");

   procedure cvConvertScale
     (src : System.Address;
      dst : System.Address;
      scale : double;
      shift : double);  -- /usr/include/opencv2/core/core_c.h:451
   pragma Import (C, cvConvertScale, "cvConvertScale");

   procedure cvConvertScaleAbs
     (src : System.Address;
      dst : System.Address;
      scale : double;
      shift : double);  -- /usr/include/opencv2/core/core_c.h:464
   pragma Import (C, cvConvertScaleAbs, "cvConvertScaleAbs");

   function cvCheckTermCriteria
     (criteria : opencv2_core_types_c_h.CvTermCriteria;
      default_eps : double;
      default_max_iters : int) return opencv2_core_types_c_h.CvTermCriteria;  -- /usr/include/opencv2/core/core_c.h:474
   pragma Import (C, cvCheckTermCriteria, "cvCheckTermCriteria");

   procedure cvAdd
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:483
   pragma Import (C, cvAdd, "cvAdd");

   procedure cvAddS
     (src : System.Address;
      value : opencv2_core_types_c_h.CvScalar;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:487
   pragma Import (C, cvAddS, "cvAddS");

   procedure cvSub
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:491
   pragma Import (C, cvSub, "cvSub");

   procedure cvSubS
     (src : System.Address;
      value : opencv2_core_types_c_h.CvScalar;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:495
   pragma Import (C, cvSubS, "cvSubS");

   procedure cvSubRS
     (src : System.Address;
      value : opencv2_core_types_c_h.CvScalar;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:503
   pragma Import (C, cvSubRS, "cvSubRS");

   procedure cvMul
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address;
      scale : double);  -- /usr/include/opencv2/core/core_c.h:508
   pragma Import (C, cvMul, "cvMul");

   procedure cvDiv
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address;
      scale : double);  -- /usr/include/opencv2/core/core_c.h:514
   pragma Import (C, cvDiv, "cvDiv");

   procedure cvScaleAdd
     (src1 : System.Address;
      scale : opencv2_core_types_c_h.CvScalar;
      src2 : System.Address;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:518
   pragma Import (C, cvScaleAdd, "cvScaleAdd");

   procedure cvAddWeighted
     (src1 : System.Address;
      alpha : double;
      src2 : System.Address;
      beta : double;
      gamma : double;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:523
   pragma Import (C, cvAddWeighted, "cvAddWeighted");

   function cvDotProduct (src1 : System.Address; src2 : System.Address) return double;  -- /usr/include/opencv2/core/core_c.h:528
   pragma Import (C, cvDotProduct, "cvDotProduct");

   procedure cvAnd
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:531
   pragma Import (C, cvAnd, "cvAnd");

   procedure cvAndS
     (src : System.Address;
      value : opencv2_core_types_c_h.CvScalar;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:535
   pragma Import (C, cvAndS, "cvAndS");

   procedure cvOr
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:539
   pragma Import (C, cvOr, "cvOr");

   procedure cvOrS
     (src : System.Address;
      value : opencv2_core_types_c_h.CvScalar;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:543
   pragma Import (C, cvOrS, "cvOrS");

   procedure cvXor
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:547
   pragma Import (C, cvXor, "cvXor");

   procedure cvXorS
     (src : System.Address;
      value : opencv2_core_types_c_h.CvScalar;
      dst : System.Address;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:551
   pragma Import (C, cvXorS, "cvXorS");

   procedure cvNot (src : System.Address; dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:555
   pragma Import (C, cvNot, "cvNot");

   procedure cvInRange
     (src : System.Address;
      lower : System.Address;
      upper : System.Address;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:558
   pragma Import (C, cvInRange, "cvInRange");

   procedure cvInRangeS
     (src : System.Address;
      lower : opencv2_core_types_c_h.CvScalar;
      upper : opencv2_core_types_c_h.CvScalar;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:562
   pragma Import (C, cvInRangeS, "cvInRangeS");

   procedure cvCmp
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address;
      cmp_op : int);  -- /usr/include/opencv2/core/core_c.h:576
   pragma Import (C, cvCmp, "cvCmp");

   procedure cvCmpS
     (src : System.Address;
      value : double;
      dst : System.Address;
      cmp_op : int);  -- /usr/include/opencv2/core/core_c.h:579
   pragma Import (C, cvCmpS, "cvCmpS");

   procedure cvMin
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:582
   pragma Import (C, cvMin, "cvMin");

   procedure cvMax
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:585
   pragma Import (C, cvMax, "cvMax");

   procedure cvMinS
     (src : System.Address;
      value : double;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:588
   pragma Import (C, cvMinS, "cvMinS");

   procedure cvMaxS
     (src : System.Address;
      value : double;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:591
   pragma Import (C, cvMaxS, "cvMaxS");

   procedure cvAbsDiff
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:594
   pragma Import (C, cvAbsDiff, "cvAbsDiff");

   procedure cvAbsDiffS
     (src : System.Address;
      dst : System.Address;
      value : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/core/core_c.h:597
   pragma Import (C, cvAbsDiffS, "cvAbsDiffS");

   procedure cvCartToPolar
     (x : System.Address;
      y : System.Address;
      magnitude : System.Address;
      angle : System.Address;
      angle_in_degrees : int);  -- /usr/include/opencv2/core/core_c.h:606
   pragma Import (C, cvCartToPolar, "cvCartToPolar");

   procedure cvPolarToCart
     (magnitude : System.Address;
      angle : System.Address;
      x : System.Address;
      y : System.Address;
      angle_in_degrees : int);  -- /usr/include/opencv2/core/core_c.h:613
   pragma Import (C, cvPolarToCart, "cvPolarToCart");

   procedure cvPow
     (src : System.Address;
      dst : System.Address;
      power : double);  -- /usr/include/opencv2/core/core_c.h:618
   pragma Import (C, cvPow, "cvPow");

   procedure cvExp (src : System.Address; dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:623
   pragma Import (C, cvExp, "cvExp");

   procedure cvLog (src : System.Address; dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:629
   pragma Import (C, cvLog, "cvLog");

   function cvFastArctan (y : float; x : float) return float;  -- /usr/include/opencv2/core/core_c.h:632
   pragma Import (C, cvFastArctan, "cvFastArctan");

   function cvCbrt (value : float) return float;  -- /usr/include/opencv2/core/core_c.h:635
   pragma Import (C, cvCbrt, "cvCbrt");

   function cvCheckArr
     (arr : System.Address;
      flags : int;
      min_val : double;
      max_val : double) return int;  -- /usr/include/opencv2/core/core_c.h:643
   pragma Import (C, cvCheckArr, "cvCheckArr");

   procedure cvRandArr
     (rng : access opencv2_core_types_c_h.CvRNG;
      arr : System.Address;
      dist_type : int;
      param1 : opencv2_core_types_c_h.CvScalar;
      param2 : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/core/core_c.h:649
   pragma Import (C, cvRandArr, "cvRandArr");

   procedure cvRandShuffle
     (mat : System.Address;
      rng : access opencv2_core_types_c_h.CvRNG;
      iter_factor : double);  -- /usr/include/opencv2/core/core_c.h:652
   pragma Import (C, cvRandShuffle, "cvRandShuffle");

   procedure cvSort
     (src : System.Address;
      dst : System.Address;
      idxmat : System.Address;
      flags : int);  -- /usr/include/opencv2/core/core_c.h:660
   pragma Import (C, cvSort, "cvSort");

   function cvSolveCubic (coeffs : access constant opencv2_core_types_c_h.CvMat; roots : access opencv2_core_types_c_h.CvMat) return int;  -- /usr/include/opencv2/core/core_c.h:665
   pragma Import (C, cvSolveCubic, "cvSolveCubic");

   procedure cvSolvePoly
     (coeffs : access constant opencv2_core_types_c_h.CvMat;
      roots2 : access opencv2_core_types_c_h.CvMat;
      maxiter : int;
      fig : int);  -- /usr/include/opencv2/core/core_c.h:668
   pragma Import (C, cvSolvePoly, "cvSolvePoly");

   procedure cvCrossProduct
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:676
   pragma Import (C, cvCrossProduct, "cvCrossProduct");

   procedure cvGEMM
     (src1 : System.Address;
      src2 : System.Address;
      alpha : double;
      src3 : System.Address;
      beta : double;
      dst : System.Address;
      tABC : int);  -- /usr/include/opencv2/core/core_c.h:687
   pragma Import (C, cvGEMM, "cvGEMM");

   procedure cvTransform
     (src : System.Address;
      dst : System.Address;
      transmat : access constant opencv2_core_types_c_h.CvMat;
      shiftvec : access constant opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/core/core_c.h:694
   pragma Import (C, cvTransform, "cvTransform");

   procedure cvPerspectiveTransform
     (src : System.Address;
      dst : System.Address;
      mat : access constant opencv2_core_types_c_h.CvMat);  -- /usr/include/opencv2/core/core_c.h:700
   pragma Import (C, cvPerspectiveTransform, "cvPerspectiveTransform");

   procedure cvMulTransposed
     (src : System.Address;
      dst : System.Address;
      order : int;
      c_delta : System.Address;
      scale : double);  -- /usr/include/opencv2/core/core_c.h:704
   pragma Import (C, cvMulTransposed, "cvMulTransposed");

   procedure cvTranspose (src : System.Address; dst : System.Address);  -- /usr/include/opencv2/core/core_c.h:709
   pragma Import (C, cvTranspose, "cvTranspose");

   procedure cvCompleteSymm (matrix : access opencv2_core_types_c_h.CvMat; LtoR : int);  -- /usr/include/opencv2/core/core_c.h:713
   pragma Import (C, cvCompleteSymm, "cvCompleteSymm");

   procedure cvFlip
     (src : System.Address;
      dst : System.Address;
      flip_mode : int);  -- /usr/include/opencv2/core/core_c.h:718
   pragma Import (C, cvFlip, "cvFlip");

   procedure cvSVD
     (A : System.Address;
      W : System.Address;
      U : System.Address;
      V : System.Address;
      flags : int);  -- /usr/include/opencv2/core/core_c.h:728
   pragma Import (C, cvSVD, "cvSVD");

   procedure cvSVBkSb
     (W : System.Address;
      U : System.Address;
      V : System.Address;
      B : System.Address;
      X : System.Address;
      flags : int);  -- /usr/include/opencv2/core/core_c.h:733
   pragma Import (C, cvSVBkSb, "cvSVBkSb");

   function cvInvert
     (src : System.Address;
      dst : System.Address;
      method : int) return double;  -- /usr/include/opencv2/core/core_c.h:745
   pragma Import (C, cvInvert, "cvInvert");

   function cvSolve
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address;
      method : int) return int;  -- /usr/include/opencv2/core/core_c.h:751
   pragma Import (C, cvSolve, "cvSolve");

   function cvDet (mat : System.Address) return double;  -- /usr/include/opencv2/core/core_c.h:755
   pragma Import (C, cvDet, "cvDet");

   function cvTrace (mat : System.Address) return opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/core/core_c.h:758
   pragma Import (C, cvTrace, "cvTrace");

   procedure cvEigenVV
     (mat : System.Address;
      evects : System.Address;
      evals : System.Address;
      eps : double;
      lowindex : int;
      highindex : int);  -- /usr/include/opencv2/core/core_c.h:761
   pragma Import (C, cvEigenVV, "cvEigenVV");

   procedure cvSetIdentity (mat : System.Address; value : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/core/core_c.h:771
   pragma Import (C, cvSetIdentity, "cvSetIdentity");

   function cvRange
     (mat : System.Address;
      start : double;
      c_end : double) return System.Address;  -- /usr/include/opencv2/core/core_c.h:774
   pragma Import (C, cvRange, "cvRange");

   procedure cvCalcCovarMatrix
     (vects : System.Address;
      count : int;
      cov_mat : System.Address;
      avg : System.Address;
      flags : int);  -- /usr/include/opencv2/core/core_c.h:796
   pragma Import (C, cvCalcCovarMatrix, "cvCalcCovarMatrix");

   procedure cvCalcPCA
     (data : System.Address;
      mean : System.Address;
      eigenvals : System.Address;
      eigenvects : System.Address;
      flags : int);  -- /usr/include/opencv2/core/core_c.h:802
   pragma Import (C, cvCalcPCA, "cvCalcPCA");

   procedure cvProjectPCA
     (data : System.Address;
      mean : System.Address;
      eigenvects : System.Address;
      result : System.Address);  -- /usr/include/opencv2/core/core_c.h:805
   pragma Import (C, cvProjectPCA, "cvProjectPCA");

   procedure cvBackProjectPCA
     (proj : System.Address;
      mean : System.Address;
      eigenvects : System.Address;
      result : System.Address);  -- /usr/include/opencv2/core/core_c.h:808
   pragma Import (C, cvBackProjectPCA, "cvBackProjectPCA");

   function cvMahalanobis
     (vec1 : System.Address;
      vec2 : System.Address;
      mat : System.Address) return double;  -- /usr/include/opencv2/core/core_c.h:812
   pragma Import (C, cvMahalanobis, "cvMahalanobis");

   function cvSum (arr : System.Address) return opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/core/core_c.h:820
   pragma Import (C, cvSum, "cvSum");

   function cvCountNonZero (arr : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:823
   pragma Import (C, cvCountNonZero, "cvCountNonZero");

   function cvAvg (arr : System.Address; mask : System.Address) return opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/core/core_c.h:826
   pragma Import (C, cvAvg, "cvAvg");

   procedure cvAvgSdv
     (arr : System.Address;
      mean : access opencv2_core_types_c_h.CvScalar;
      std_dev : access opencv2_core_types_c_h.CvScalar;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:829
   pragma Import (C, cvAvgSdv, "cvAvgSdv");

   procedure cvMinMaxLoc
     (arr : System.Address;
      min_val : access double;
      max_val : access double;
      min_loc : access opencv2_core_types_c_h.CvPoint;
      max_loc : access opencv2_core_types_c_h.CvPoint;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:833
   pragma Import (C, cvMinMaxLoc, "cvMinMaxLoc");

   function cvNorm
     (arr1 : System.Address;
      arr2 : System.Address;
      norm_type : int;
      mask : System.Address) return double;  -- /usr/include/opencv2/core/core_c.h:855
   pragma Import (C, cvNorm, "cvNorm");

   procedure cvNormalize
     (src : System.Address;
      dst : System.Address;
      a : double;
      b : double;
      norm_type : int;
      mask : System.Address);  -- /usr/include/opencv2/core/core_c.h:859
   pragma Import (C, cvNormalize, "cvNormalize");

   procedure cvReduce
     (src : System.Address;
      dst : System.Address;
      dim : int;
      op : int);  -- /usr/include/opencv2/core/core_c.h:870
   pragma Import (C, cvReduce, "cvReduce");

   procedure cvDFT
     (src : System.Address;
      dst : System.Address;
      flags : int;
      nonzero_rows : int);  -- /usr/include/opencv2/core/core_c.h:889
   pragma Import (C, cvDFT, "cvDFT");

   procedure cvMulSpectrums
     (src1 : System.Address;
      src2 : System.Address;
      dst : System.Address;
      flags : int);  -- /usr/include/opencv2/core/core_c.h:894
   pragma Import (C, cvMulSpectrums, "cvMulSpectrums");

   function cvGetOptimalDFTSize (size0 : int) return int;  -- /usr/include/opencv2/core/core_c.h:898
   pragma Import (C, cvGetOptimalDFTSize, "cvGetOptimalDFTSize");

   procedure cvDCT
     (src : System.Address;
      dst : System.Address;
      flags : int);  -- /usr/include/opencv2/core/core_c.h:901
   pragma Import (C, cvDCT, "cvDCT");

   function cvSliceLength (slice : opencv2_core_types_c_h.CvSlice; seq : access constant opencv2_core_types_c_h.CvSeq) return int;  -- /usr/include/opencv2/core/core_c.h:908
   pragma Import (C, cvSliceLength, "cvSliceLength");

   function cvCreateMemStorage (block_size : int) return access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/core/core_c.h:914
   pragma Import (C, cvCreateMemStorage, "cvCreateMemStorage");

   function cvCreateChildMemStorage (parent : access opencv2_core_types_c_h.CvMemStorage) return access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/core/core_c.h:918
   pragma Import (C, cvCreateChildMemStorage, "cvCreateChildMemStorage");

   procedure cvReleaseMemStorage (storage : System.Address);  -- /usr/include/opencv2/core/core_c.h:923
   pragma Import (C, cvReleaseMemStorage, "cvReleaseMemStorage");

   procedure cvClearMemStorage (storage : access opencv2_core_types_c_h.CvMemStorage);  -- /usr/include/opencv2/core/core_c.h:930
   pragma Import (C, cvClearMemStorage, "cvClearMemStorage");

   procedure cvSaveMemStoragePos (storage : access constant opencv2_core_types_c_h.CvMemStorage; pos : access opencv2_core_types_c_h.CvMemStoragePos);  -- /usr/include/opencv2/core/core_c.h:933
   pragma Import (C, cvSaveMemStoragePos, "cvSaveMemStoragePos");

   procedure cvRestoreMemStoragePos (storage : access opencv2_core_types_c_h.CvMemStorage; pos : access opencv2_core_types_c_h.CvMemStoragePos);  -- /usr/include/opencv2/core/core_c.h:936
   pragma Import (C, cvRestoreMemStoragePos, "cvRestoreMemStoragePos");

   function cvMemStorageAlloc (storage : access opencv2_core_types_c_h.CvMemStorage; size : stddef_h.size_t) return System.Address;  -- /usr/include/opencv2/core/core_c.h:939
   pragma Import (C, cvMemStorageAlloc, "cvMemStorageAlloc");

   function cvMemStorageAllocString
     (storage : access opencv2_core_types_c_h.CvMemStorage;
      ptr : Interfaces.C.Strings.chars_ptr;
      len : int) return opencv2_core_types_c_h.CvString;  -- /usr/include/opencv2/core/core_c.h:942
   pragma Import (C, cvMemStorageAllocString, "cvMemStorageAllocString");

   function cvCreateSeq
     (seq_flags : int;
      header_size : int;
      elem_size : int;
      storage : access opencv2_core_types_c_h.CvMemStorage) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/core/core_c.h:946
   pragma Import (C, cvCreateSeq, "cvCreateSeq");

   procedure cvSetSeqBlockSize (seq : access opencv2_core_types_c_h.CvSeq; delta_elems : int);  -- /usr/include/opencv2/core/core_c.h:951
   pragma Import (C, cvSetSeqBlockSize, "cvSetSeqBlockSize");

   function cvSeqPush (seq : access opencv2_core_types_c_h.CvSeq; element : System.Address) return access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/core/core_c.h:955
   pragma Import (C, cvSeqPush, "cvSeqPush");

   function cvSeqPushFront (seq : access opencv2_core_types_c_h.CvSeq; element : System.Address) return access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/core/core_c.h:959
   pragma Import (C, cvSeqPushFront, "cvSeqPushFront");

   procedure cvSeqPop (seq : access opencv2_core_types_c_h.CvSeq; element : System.Address);  -- /usr/include/opencv2/core/core_c.h:963
   pragma Import (C, cvSeqPop, "cvSeqPop");

   procedure cvSeqPopFront (seq : access opencv2_core_types_c_h.CvSeq; element : System.Address);  -- /usr/include/opencv2/core/core_c.h:967
   pragma Import (C, cvSeqPopFront, "cvSeqPopFront");

   procedure cvSeqPushMulti
     (seq : access opencv2_core_types_c_h.CvSeq;
      elements : System.Address;
      count : int;
      in_front : int);  -- /usr/include/opencv2/core/core_c.h:973
   pragma Import (C, cvSeqPushMulti, "cvSeqPushMulti");

   procedure cvSeqPopMulti
     (seq : access opencv2_core_types_c_h.CvSeq;
      elements : System.Address;
      count : int;
      in_front : int);  -- /usr/include/opencv2/core/core_c.h:977
   pragma Import (C, cvSeqPopMulti, "cvSeqPopMulti");

   function cvSeqInsert
     (seq : access opencv2_core_types_c_h.CvSeq;
      before_index : int;
      element : System.Address) return access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/core/core_c.h:982
   pragma Import (C, cvSeqInsert, "cvSeqInsert");

   procedure cvSeqRemove (seq : access opencv2_core_types_c_h.CvSeq; index : int);  -- /usr/include/opencv2/core/core_c.h:986
   pragma Import (C, cvSeqRemove, "cvSeqRemove");

   procedure cvClearSeq (seq : access opencv2_core_types_c_h.CvSeq);  -- /usr/include/opencv2/core/core_c.h:992
   pragma Import (C, cvClearSeq, "cvClearSeq");

   function cvGetSeqElem (seq : access constant opencv2_core_types_c_h.CvSeq; index : int) return access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/core/core_c.h:998
   pragma Import (C, cvGetSeqElem, "cvGetSeqElem");

   function cvSeqElemIdx
     (seq : access constant opencv2_core_types_c_h.CvSeq;
      element : System.Address;
      block : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:1002
   pragma Import (C, cvSeqElemIdx, "cvSeqElemIdx");

   procedure cvStartAppendToSeq (seq : access opencv2_core_types_c_h.CvSeq; writer : access opencv2_core_types_c_h.CvSeqWriter);  -- /usr/include/opencv2/core/core_c.h:1006
   pragma Import (C, cvStartAppendToSeq, "cvStartAppendToSeq");

   procedure cvStartWriteSeq
     (seq_flags : int;
      header_size : int;
      elem_size : int;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      writer : access opencv2_core_types_c_h.CvSeqWriter);  -- /usr/include/opencv2/core/core_c.h:1010
   pragma Import (C, cvStartWriteSeq, "cvStartWriteSeq");

   function cvEndWriteSeq (writer : access opencv2_core_types_c_h.CvSeqWriter) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/core/core_c.h:1018
   pragma Import (C, cvEndWriteSeq, "cvEndWriteSeq");

   procedure cvFlushSeqWriter (writer : access opencv2_core_types_c_h.CvSeqWriter);  -- /usr/include/opencv2/core/core_c.h:1023
   pragma Import (C, cvFlushSeqWriter, "cvFlushSeqWriter");

   procedure cvStartReadSeq
     (seq : access constant opencv2_core_types_c_h.CvSeq;
      reader : access opencv2_core_types_c_h.CvSeqReader;
      c_reverse : int);  -- /usr/include/opencv2/core/core_c.h:1028
   pragma Import (C, cvStartReadSeq, "cvStartReadSeq");

   function cvGetSeqReaderPos (reader : access opencv2_core_types_c_h.CvSeqReader) return int;  -- /usr/include/opencv2/core/core_c.h:1033
   pragma Import (C, cvGetSeqReaderPos, "cvGetSeqReaderPos");

   procedure cvSetSeqReaderPos
     (reader : access opencv2_core_types_c_h.CvSeqReader;
      index : int;
      is_relative : int);  -- /usr/include/opencv2/core/core_c.h:1038
   pragma Import (C, cvSetSeqReaderPos, "cvSetSeqReaderPos");

   function cvCvtSeqToArray
     (seq : access constant opencv2_core_types_c_h.CvSeq;
      elements : System.Address;
      slice : opencv2_core_types_c_h.CvSlice) return System.Address;  -- /usr/include/opencv2/core/core_c.h:1042
   pragma Import (C, cvCvtSeqToArray, "cvCvtSeqToArray");

   function cvMakeSeqHeaderForArray
     (seq_type : int;
      header_size : int;
      elem_size : int;
      elements : System.Address;
      total : int;
      seq : access opencv2_core_types_c_h.CvSeq;
      block : access opencv2_core_types_c_h.CvSeqBlock) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/core/core_c.h:1048
   pragma Import (C, cvMakeSeqHeaderForArray, "cvMakeSeqHeaderForArray");

   function cvSeqSlice
     (seq : access constant opencv2_core_types_c_h.CvSeq;
      slice : opencv2_core_types_c_h.CvSlice;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      copy_data : int) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/core/core_c.h:1053
   pragma Import (C, cvSeqSlice, "cvSeqSlice");

   function cvCloneSeq (seq : access constant opencv2_core_types_c_h.CvSeq; storage : access opencv2_core_types_c_h.CvMemStorage) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/core/core_c.h:1057
   pragma Import (C, cvCloneSeq, "cvCloneSeq");

   procedure cvSeqRemoveSlice (seq : access opencv2_core_types_c_h.CvSeq; slice : opencv2_core_types_c_h.CvSlice);  -- /usr/include/opencv2/core/core_c.h:1063
   pragma Import (C, cvSeqRemoveSlice, "cvSeqRemoveSlice");

   procedure cvSeqInsertSlice
     (seq : access opencv2_core_types_c_h.CvSeq;
      before_index : int;
      from_arr : System.Address);  -- /usr/include/opencv2/core/core_c.h:1066
   pragma Import (C, cvSeqInsertSlice, "cvSeqInsertSlice");

   type CvCmpFunc is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address) return int;
   pragma Convention (C, CvCmpFunc);  -- /usr/include/opencv2/core/core_c.h:1069

   procedure cvSeqSort
     (seq : access opencv2_core_types_c_h.CvSeq;
      func : CvCmpFunc;
      userdata : System.Address);  -- /usr/include/opencv2/core/core_c.h:1072
   pragma Import (C, cvSeqSort, "cvSeqSort");

   function cvSeqSearch
     (seq : access opencv2_core_types_c_h.CvSeq;
      elem : System.Address;
      func : CvCmpFunc;
      is_sorted : int;
      elem_idx : access int;
      userdata : System.Address) return access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/core/core_c.h:1075
   pragma Import (C, cvSeqSearch, "cvSeqSearch");

   procedure cvSeqInvert (seq : access opencv2_core_types_c_h.CvSeq);  -- /usr/include/opencv2/core/core_c.h:1080
   pragma Import (C, cvSeqInvert, "cvSeqInvert");

   function cvSeqPartition
     (seq : access constant opencv2_core_types_c_h.CvSeq;
      storage : access opencv2_core_types_c_h.CvMemStorage;
      labels : System.Address;
      is_equal : CvCmpFunc;
      userdata : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:1083
   pragma Import (C, cvSeqPartition, "cvSeqPartition");

   procedure cvChangeSeqBlock (reader : System.Address; direction : int);  -- /usr/include/opencv2/core/core_c.h:1087
   pragma Import (C, cvChangeSeqBlock, "cvChangeSeqBlock");

   procedure cvCreateSeqBlock (writer : access opencv2_core_types_c_h.CvSeqWriter);  -- /usr/include/opencv2/core/core_c.h:1088
   pragma Import (C, cvCreateSeqBlock, "cvCreateSeqBlock");

   function cvCreateSet
     (set_flags : int;
      header_size : int;
      elem_size : int;
      storage : access opencv2_core_types_c_h.CvMemStorage) return access opencv2_core_types_c_h.CvSet;  -- /usr/include/opencv2/core/core_c.h:1092
   pragma Import (C, cvCreateSet, "cvCreateSet");

   function cvSetAdd
     (set_header : access opencv2_core_types_c_h.CvSet;
      elem : access opencv2_core_types_c_h.CvSetElem;
      inserted_elem : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:1096
   pragma Import (C, cvSetAdd, "cvSetAdd");

   function cvSetNew (set_header : access opencv2_core_types_c_h.CvSet) return access opencv2_core_types_c_h.CvSetElem;  -- /usr/include/opencv2/core/core_c.h:1100
   pragma Import (C, cvSetNew, "cvSetNew");

   procedure cvSetRemoveByPtr (set_header : access opencv2_core_types_c_h.CvSet; elem : System.Address);  -- /usr/include/opencv2/core/core_c.h:1115
   pragma Import (C, cvSetRemoveByPtr, "cvSetRemoveByPtr");

   procedure cvSetRemove (set_header : access opencv2_core_types_c_h.CvSet; index : int);  -- /usr/include/opencv2/core/core_c.h:1126
   pragma Import (C, cvSetRemove, "cvSetRemove");

   function cvGetSetElem (set_header : access constant opencv2_core_types_c_h.CvSet; index : int) return access opencv2_core_types_c_h.CvSetElem;  -- /usr/include/opencv2/core/core_c.h:1130
   pragma Import (C, cvGetSetElem, "cvGetSetElem");

   procedure cvClearSet (set_header : access opencv2_core_types_c_h.CvSet);  -- /usr/include/opencv2/core/core_c.h:1137
   pragma Import (C, cvClearSet, "cvClearSet");

   function cvCreateGraph
     (graph_flags : int;
      header_size : int;
      vtx_size : int;
      edge_size : int;
      storage : access opencv2_core_types_c_h.CvMemStorage) return access opencv2_core_types_c_h.CvGraph;  -- /usr/include/opencv2/core/core_c.h:1140
   pragma Import (C, cvCreateGraph, "cvCreateGraph");

   function cvGraphAddVtx
     (graph : access opencv2_core_types_c_h.CvGraph;
      vtx : access constant opencv2_core_types_c_h.CvGraphVtx;
      inserted_vtx : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:1145
   pragma Import (C, cvGraphAddVtx, "cvGraphAddVtx");

   function cvGraphRemoveVtx (graph : access opencv2_core_types_c_h.CvGraph; index : int) return int;  -- /usr/include/opencv2/core/core_c.h:1150
   pragma Import (C, cvGraphRemoveVtx, "cvGraphRemoveVtx");

   function cvGraphRemoveVtxByPtr (graph : access opencv2_core_types_c_h.CvGraph; vtx : access opencv2_core_types_c_h.CvGraphVtx) return int;  -- /usr/include/opencv2/core/core_c.h:1151
   pragma Import (C, cvGraphRemoveVtxByPtr, "cvGraphRemoveVtxByPtr");

   function cvGraphAddEdge
     (graph : access opencv2_core_types_c_h.CvGraph;
      start_idx : int;
      end_idx : int;
      edge : access constant opencv2_core_types_c_h.CvGraphEdge;
      inserted_edge : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:1158
   pragma Import (C, cvGraphAddEdge, "cvGraphAddEdge");

   function cvGraphAddEdgeByPtr
     (graph : access opencv2_core_types_c_h.CvGraph;
      start_vtx : access opencv2_core_types_c_h.CvGraphVtx;
      end_vtx : access opencv2_core_types_c_h.CvGraphVtx;
      edge : access constant opencv2_core_types_c_h.CvGraphEdge;
      inserted_edge : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:1163
   pragma Import (C, cvGraphAddEdgeByPtr, "cvGraphAddEdgeByPtr");

   procedure cvGraphRemoveEdge
     (graph : access opencv2_core_types_c_h.CvGraph;
      start_idx : int;
      end_idx : int);  -- /usr/include/opencv2/core/core_c.h:1169
   pragma Import (C, cvGraphRemoveEdge, "cvGraphRemoveEdge");

   procedure cvGraphRemoveEdgeByPtr
     (graph : access opencv2_core_types_c_h.CvGraph;
      start_vtx : access opencv2_core_types_c_h.CvGraphVtx;
      end_vtx : access opencv2_core_types_c_h.CvGraphVtx);  -- /usr/include/opencv2/core/core_c.h:1170
   pragma Import (C, cvGraphRemoveEdgeByPtr, "cvGraphRemoveEdgeByPtr");

   function cvFindGraphEdge
     (graph : access constant opencv2_core_types_c_h.CvGraph;
      start_idx : int;
      end_idx : int) return access opencv2_core_types_c_h.CvGraphEdge;  -- /usr/include/opencv2/core/core_c.h:1174
   pragma Import (C, cvFindGraphEdge, "cvFindGraphEdge");

   function cvFindGraphEdgeByPtr
     (graph : access constant opencv2_core_types_c_h.CvGraph;
      start_vtx : access constant opencv2_core_types_c_h.CvGraphVtx;
      end_vtx : access constant opencv2_core_types_c_h.CvGraphVtx) return access opencv2_core_types_c_h.CvGraphEdge;  -- /usr/include/opencv2/core/core_c.h:1175
   pragma Import (C, cvFindGraphEdgeByPtr, "cvFindGraphEdgeByPtr");

   procedure cvClearGraph (graph : access opencv2_core_types_c_h.CvGraph);  -- /usr/include/opencv2/core/core_c.h:1182
   pragma Import (C, cvClearGraph, "cvClearGraph");

   function cvGraphVtxDegree (graph : access constant opencv2_core_types_c_h.CvGraph; vtx_idx : int) return int;  -- /usr/include/opencv2/core/core_c.h:1186
   pragma Import (C, cvGraphVtxDegree, "cvGraphVtxDegree");

   function cvGraphVtxDegreeByPtr (graph : access constant opencv2_core_types_c_h.CvGraph; vtx : access constant opencv2_core_types_c_h.CvGraphVtx) return int;  -- /usr/include/opencv2/core/core_c.h:1187
   pragma Import (C, cvGraphVtxDegreeByPtr, "cvGraphVtxDegreeByPtr");

   type CvGraphScanner is record
      vtx : access opencv2_core_types_c_h.CvGraphVtx;  -- /usr/include/opencv2/core/core_c.h:1225
      dst : access opencv2_core_types_c_h.CvGraphVtx;  -- /usr/include/opencv2/core/core_c.h:1226
      edge : access opencv2_core_types_c_h.CvGraphEdge;  -- /usr/include/opencv2/core/core_c.h:1227
      graph : access opencv2_core_types_c_h.CvGraph;  -- /usr/include/opencv2/core/core_c.h:1229
      stack : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/core/core_c.h:1230
      index : aliased int;  -- /usr/include/opencv2/core/core_c.h:1231
      mask : aliased int;  -- /usr/include/opencv2/core/core_c.h:1232
   end record;
   pragma Convention (C_Pass_By_Copy, CvGraphScanner);  -- /usr/include/opencv2/core/core_c.h:1223

   function cvCreateGraphScanner
     (graph : access opencv2_core_types_c_h.CvGraph;
      vtx : access opencv2_core_types_c_h.CvGraphVtx;
      mask : int) return access CvGraphScanner;  -- /usr/include/opencv2/core/core_c.h:1237
   pragma Import (C, cvCreateGraphScanner, "cvCreateGraphScanner");

   procedure cvReleaseGraphScanner (scanner : System.Address);  -- /usr/include/opencv2/core/core_c.h:1242
   pragma Import (C, cvReleaseGraphScanner, "cvReleaseGraphScanner");

   function cvNextGraphItem (scanner : access CvGraphScanner) return int;  -- /usr/include/opencv2/core/core_c.h:1245
   pragma Import (C, cvNextGraphItem, "cvNextGraphItem");

   function cvCloneGraph (graph : access constant opencv2_core_types_c_h.CvGraph; storage : access opencv2_core_types_c_h.CvMemStorage) return access opencv2_core_types_c_h.CvGraph;  -- /usr/include/opencv2/core/core_c.h:1248
   pragma Import (C, cvCloneGraph, "cvCloneGraph");

   procedure cvLine
     (img : System.Address;
      pt1 : opencv2_core_types_c_h.CvPoint;
      pt2 : opencv2_core_types_c_h.CvPoint;
      color : opencv2_core_types_c_h.CvScalar;
      thickness : int;
      line_type : int;
      shift : int);  -- /usr/include/opencv2/core/core_c.h:1270
   pragma Import (C, cvLine, "cvLine");

   procedure cvRectangle
     (img : System.Address;
      pt1 : opencv2_core_types_c_h.CvPoint;
      pt2 : opencv2_core_types_c_h.CvPoint;
      color : opencv2_core_types_c_h.CvScalar;
      thickness : int;
      line_type : int;
      shift : int);  -- /usr/include/opencv2/core/core_c.h:1276
   pragma Import (C, cvRectangle, "cvRectangle");

   procedure cvRectangleR
     (img : System.Address;
      r : opencv2_core_types_c_h.CvRect;
      color : opencv2_core_types_c_h.CvScalar;
      thickness : int;
      line_type : int;
      shift : int);  -- /usr/include/opencv2/core/core_c.h:1282
   pragma Import (C, cvRectangleR, "cvRectangleR");

   procedure cvCircle
     (img : System.Address;
      center : opencv2_core_types_c_h.CvPoint;
      radius : int;
      color : opencv2_core_types_c_h.CvScalar;
      thickness : int;
      line_type : int;
      shift : int);  -- /usr/include/opencv2/core/core_c.h:1290
   pragma Import (C, cvCircle, "cvCircle");

   procedure cvEllipse
     (img : System.Address;
      center : opencv2_core_types_c_h.CvPoint;
      axes : opencv2_core_types_c_h.Class_CvSize.CvSize;
      angle : double;
      start_angle : double;
      end_angle : double;
      color : opencv2_core_types_c_h.CvScalar;
      thickness : int;
      line_type : int;
      shift : int);  -- /usr/include/opencv2/core/core_c.h:1297
   pragma Import (C, cvEllipse, "cvEllipse");

   procedure cvEllipseBox
     (img : System.Address;
      box : opencv2_core_types_c_h.CvBox2D;
      color : opencv2_core_types_c_h.CvScalar;
      thickness : int;
      line_type : int;
      shift : int);  -- /usr/include/opencv2/core/core_c.h:1302
   pragma Import (C, cvEllipseBox, "cvEllipseBox");

   procedure cvFillConvexPoly
     (img : System.Address;
      pts : access constant opencv2_core_types_c_h.CvPoint;
      npts : int;
      color : opencv2_core_types_c_h.CvScalar;
      line_type : int;
      shift : int);  -- /usr/include/opencv2/core/core_c.h:1315
   pragma Import (C, cvFillConvexPoly, "cvFillConvexPoly");

   procedure cvFillPoly
     (img : System.Address;
      pts : System.Address;
      npts : access int;
      contours : int;
      color : opencv2_core_types_c_h.CvScalar;
      line_type : int;
      shift : int);  -- /usr/include/opencv2/core/core_c.h:1319
   pragma Import (C, cvFillPoly, "cvFillPoly");

   procedure cvPolyLine
     (img : System.Address;
      pts : System.Address;
      npts : access int;
      contours : int;
      is_closed : int;
      color : opencv2_core_types_c_h.CvScalar;
      thickness : int;
      line_type : int;
      shift : int);  -- /usr/include/opencv2/core/core_c.h:1324
   pragma Import (C, cvPolyLine, "cvPolyLine");

   function cvClipLine
     (img_size : opencv2_core_types_c_h.Class_CvSize.CvSize;
      pt1 : access opencv2_core_types_c_h.CvPoint;
      pt2 : access opencv2_core_types_c_h.CvPoint) return int;  -- /usr/include/opencv2/core/core_c.h:1337
   pragma Import (C, cvClipLine, "cvClipLine");

   function cvInitLineIterator
     (image : System.Address;
      pt1 : opencv2_core_types_c_h.CvPoint;
      pt2 : opencv2_core_types_c_h.CvPoint;
      line_iterator : access opencv2_core_types_c_h.CvLineIterator;
      connectivity : int;
      left_to_right : int) return int;  -- /usr/include/opencv2/core/core_c.h:1342
   pragma Import (C, cvInitLineIterator, "cvInitLineIterator");

   package Class_CvFont is
      type CvFont is limited record
         nameFont : Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/core_c.h:1377
         color : aliased opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/core/core_c.h:1378
         font_face : aliased int;  -- /usr/include/opencv2/core/core_c.h:1379
         ascii : access int;  -- /usr/include/opencv2/core/core_c.h:1380
         greek : access int;  -- /usr/include/opencv2/core/core_c.h:1381
         cyrillic : access int;  -- /usr/include/opencv2/core/core_c.h:1382
         hscale : aliased float;  -- /usr/include/opencv2/core/core_c.h:1383
         vscale : aliased float;  -- /usr/include/opencv2/core/core_c.h:1383
         shear : aliased float;  -- /usr/include/opencv2/core/core_c.h:1384
         thickness : aliased int;  -- /usr/include/opencv2/core/core_c.h:1385
         dx : aliased float;  -- /usr/include/opencv2/core/core_c.h:1386
         line_type : aliased int;  -- /usr/include/opencv2/core/core_c.h:1387
      end record;
      pragma Import (CPP, CvFont);

      function New_CvFont return CvFont;  -- /usr/include/opencv2/core/core_c.h:1375
      pragma CPP_Constructor (New_CvFont, "_ZN6CvFontC1Ev");


   end;
   use Class_CvFont;
   procedure cvInitFont
     (font : access CvFont;
      font_face : int;
      hscale : double;
      vscale : double;
      shear : double;
      thickness : int;
      line_type : int);  -- /usr/include/opencv2/core/core_c.h:1392
   pragma Import (C, cvInitFont, "cvInitFont");

   function cvFont (scale : double; thickness : int) return CvFont;  -- /usr/include/opencv2/core/core_c.h:1398
   pragma Import (C, cvFont, "cvFont");

   procedure cvPutText
     (img : System.Address;
      text : Interfaces.C.Strings.chars_ptr;
      org : opencv2_core_types_c_h.CvPoint;
      font : System.Address;
      color : opencv2_core_types_c_h.CvScalar);  -- /usr/include/opencv2/core/core_c.h:1407
   pragma Import (C, cvPutText, "cvPutText");

   procedure cvGetTextSize
     (text_string : Interfaces.C.Strings.chars_ptr;
      font : System.Address;
      text_size : access opencv2_core_types_c_h.Class_CvSize.CvSize;
      baseline : access int);  -- /usr/include/opencv2/core/core_c.h:1411
   pragma Import (C, cvGetTextSize, "cvGetTextSize");

   function cvColorToScalar (packed_color : double; arrtype : int) return opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/core/core_c.h:1419
   pragma Import (C, cvColorToScalar, "cvColorToScalar");

   function cvEllipse2Poly
     (center : opencv2_core_types_c_h.CvPoint;
      axes : opencv2_core_types_c_h.Class_CvSize.CvSize;
      angle : int;
      arc_start : int;
      arc_end : int;
      pts : access opencv2_core_types_c_h.CvPoint;
      c_delta : int) return int;  -- /usr/include/opencv2/core/core_c.h:1427
   pragma Import (C, cvEllipse2Poly, "cvEllipse2Poly");

   procedure cvDrawContours
     (img : System.Address;
      contour : access opencv2_core_types_c_h.CvSeq;
      external_color : opencv2_core_types_c_h.CvScalar;
      hole_color : opencv2_core_types_c_h.CvScalar;
      max_level : int;
      thickness : int;
      line_type : int;
      offset : opencv2_core_types_c_h.CvPoint);  -- /usr/include/opencv2/core/core_c.h:1431
   pragma Import (C, cvDrawContours, "cvDrawContours");

   procedure cvLUT
     (src : System.Address;
      dst : System.Address;
      lut : System.Address);  -- /usr/include/opencv2/core/core_c.h:1439
   pragma Import (C, cvLUT, "cvLUT");

   type CvTreeNodeIterator is record
      node : System.Address;  -- /usr/include/opencv2/core/core_c.h:1445
      level : aliased int;  -- /usr/include/opencv2/core/core_c.h:1446
      max_level : aliased int;  -- /usr/include/opencv2/core/core_c.h:1447
   end record;
   pragma Convention (C_Pass_By_Copy, CvTreeNodeIterator);  -- /usr/include/opencv2/core/core_c.h:1443

   procedure cvInitTreeNodeIterator
     (tree_iterator : access CvTreeNodeIterator;
      first : System.Address;
      max_level : int);  -- /usr/include/opencv2/core/core_c.h:1451
   pragma Import (C, cvInitTreeNodeIterator, "cvInitTreeNodeIterator");

   function cvNextTreeNode (tree_iterator : access CvTreeNodeIterator) return System.Address;  -- /usr/include/opencv2/core/core_c.h:1453
   pragma Import (C, cvNextTreeNode, "cvNextTreeNode");

   function cvPrevTreeNode (tree_iterator : access CvTreeNodeIterator) return System.Address;  -- /usr/include/opencv2/core/core_c.h:1454
   pragma Import (C, cvPrevTreeNode, "cvPrevTreeNode");

   procedure cvInsertNodeIntoTree
     (node : System.Address;
      parent : System.Address;
      frame : System.Address);  -- /usr/include/opencv2/core/core_c.h:1459
   pragma Import (C, cvInsertNodeIntoTree, "cvInsertNodeIntoTree");

   procedure cvRemoveNodeFromTree (node : System.Address; frame : System.Address);  -- /usr/include/opencv2/core/core_c.h:1462
   pragma Import (C, cvRemoveNodeFromTree, "cvRemoveNodeFromTree");

   function cvTreeToNodeSeq
     (first : System.Address;
      header_size : int;
      storage : access opencv2_core_types_c_h.CvMemStorage) return access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/core/core_c.h:1466
   pragma Import (C, cvTreeToNodeSeq, "cvTreeToNodeSeq");

   function cvKMeans2
     (samples : System.Address;
      cluster_count : int;
      labels : System.Address;
      termcrit : opencv2_core_types_c_h.CvTermCriteria;
      attempts : int;
      rng : access opencv2_core_types_c_h.CvRNG;
      flags : int;
      u_centers : System.Address;
      compactness : access double) return int;  -- /usr/include/opencv2/core/core_c.h:1472
   pragma Import (C, cvKMeans2, "cvKMeans2");

   function cvRegisterModule (module_info : access constant opencv2_core_types_c_h.CvModuleInfo) return int;  -- /usr/include/opencv2/core/core_c.h:1482
   pragma Import (C, cvRegisterModule, "cvRegisterModule");

   function cvUseOptimized (on_off : int) return int;  -- /usr/include/opencv2/core/core_c.h:1485
   pragma Import (C, cvUseOptimized, "cvUseOptimized");

   procedure cvGetModuleInfo
     (module_name : Interfaces.C.Strings.chars_ptr;
      version : System.Address;
      loaded_addon_plugins : System.Address);  -- /usr/include/opencv2/core/core_c.h:1488
   pragma Import (C, cvGetModuleInfo, "cvGetModuleInfo");

   type CvAllocFunc is access function (arg1 : stddef_h.size_t; arg2 : System.Address) return System.Address;
   pragma Convention (C, CvAllocFunc);  -- /usr/include/opencv2/core/core_c.h:1492

   type CvFreeFunc is access function (arg1 : System.Address; arg2 : System.Address) return int;
   pragma Convention (C, CvFreeFunc);  -- /usr/include/opencv2/core/core_c.h:1493

   procedure cvSetMemoryManager
     (alloc_func : CvAllocFunc;
      free_func : CvFreeFunc;
      userdata : System.Address);  -- /usr/include/opencv2/core/core_c.h:1497
   pragma Import (C, cvSetMemoryManager, "cvSetMemoryManager");

   type Cv_iplCreateImageHeader is access function
        (arg1 : int;
         arg2 : int;
         arg3 : int;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : Interfaces.C.Strings.chars_ptr;
         arg6 : int;
         arg7 : int;
         arg8 : int;
         arg9 : int;
         arg10 : int;
         arg11 : access opencv2_core_types_c_h.IplROI;
         arg12 : access opencv2_core_types_c_h.IplImage;
         arg13 : System.Address;
         arg14 : System.Address) return access opencv2_core_types_c_h.IplImage;
   pragma Convention (C, Cv_iplCreateImageHeader);  -- /usr/include/opencv2/core/core_c.h:1502

   type Cv_iplAllocateImageData is access procedure
        (arg1 : access opencv2_core_types_c_h.IplImage;
         arg2 : int;
         arg3 : int);
   pragma Convention (C, Cv_iplAllocateImageData);  -- /usr/include/opencv2/core/core_c.h:1505

   type Cv_iplDeallocate is access procedure (arg1 : access opencv2_core_types_c_h.IplImage; arg2 : int);
   pragma Convention (C, Cv_iplDeallocate);  -- /usr/include/opencv2/core/core_c.h:1506

   type Cv_iplCreateROI is access function
        (arg1 : int;
         arg2 : int;
         arg3 : int;
         arg4 : int;
         arg5 : int) return access opencv2_core_types_c_h.IplROI;
   pragma Convention (C, Cv_iplCreateROI);  -- /usr/include/opencv2/core/core_c.h:1507

   type Cv_iplCloneImage is access function (arg1 : access constant opencv2_core_types_c_h.IplImage) return access opencv2_core_types_c_h.IplImage;
   pragma Convention (C, Cv_iplCloneImage);  -- /usr/include/opencv2/core/core_c.h:1508

   procedure cvSetIPLAllocators
     (create_header : Cv_iplCreateImageHeader;
      allocate_data : Cv_iplAllocateImageData;
      deallocate : Cv_iplDeallocate;
      create_roi : Cv_iplCreateROI;
      clone_image : Cv_iplCloneImage);  -- /usr/include/opencv2/core/core_c.h:1511
   pragma Import (C, cvSetIPLAllocators, "cvSetIPLAllocators");

   function cvOpenFileStorage
     (filename : Interfaces.C.Strings.chars_ptr;
      memstorage : access opencv2_core_types_c_h.CvMemStorage;
      flags : int;
      encoding : Interfaces.C.Strings.chars_ptr) return System.Address;  -- /usr/include/opencv2/core/core_c.h:1528
   pragma Import (C, cvOpenFileStorage, "cvOpenFileStorage");

   procedure cvReleaseFileStorage (fs : System.Address);  -- /usr/include/opencv2/core/core_c.h:1532
   pragma Import (C, cvReleaseFileStorage, "cvReleaseFileStorage");

   function cvAttrValue (attr : access constant opencv2_core_types_c_h.CvAttrList; attr_name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/core_c.h:1535
   pragma Import (C, cvAttrValue, "cvAttrValue");

   procedure cvStartWriteStruct
     (fs : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      struct_flags : int;
      type_name : Interfaces.C.Strings.chars_ptr;
      attributes : opencv2_core_types_c_h.CvAttrList);  -- /usr/include/opencv2/core/core_c.h:1538
   pragma Import (C, cvStartWriteStruct, "cvStartWriteStruct");

   procedure cvEndWriteStruct (fs : System.Address);  -- /usr/include/opencv2/core/core_c.h:1543
   pragma Import (C, cvEndWriteStruct, "cvEndWriteStruct");

   procedure cvWriteInt
     (fs : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      value : int);  -- /usr/include/opencv2/core/core_c.h:1546
   pragma Import (C, cvWriteInt, "cvWriteInt");

   procedure cvWriteReal
     (fs : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      value : double);  -- /usr/include/opencv2/core/core_c.h:1549
   pragma Import (C, cvWriteReal, "cvWriteReal");

   procedure cvWriteString
     (fs : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      str : Interfaces.C.Strings.chars_ptr;
      quote : int);  -- /usr/include/opencv2/core/core_c.h:1552
   pragma Import (C, cvWriteString, "cvWriteString");

   procedure cvWriteComment
     (fs : System.Address;
      comment : Interfaces.C.Strings.chars_ptr;
      eol_comment : int);  -- /usr/include/opencv2/core/core_c.h:1556
   pragma Import (C, cvWriteComment, "cvWriteComment");

   procedure cvWrite
     (fs : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      ptr : System.Address;
      attributes : opencv2_core_types_c_h.CvAttrList);  -- /usr/include/opencv2/core/core_c.h:1561
   pragma Import (C, cvWrite, "cvWrite");

   procedure cvStartNextStream (fs : System.Address);  -- /usr/include/opencv2/core/core_c.h:1565
   pragma Import (C, cvStartNextStream, "cvStartNextStream");

   procedure cvWriteRawData
     (fs : System.Address;
      src : System.Address;
      len : int;
      dt : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/core/core_c.h:1568
   pragma Import (C, cvWriteRawData, "cvWriteRawData");

   function cvGetHashedKey
     (fs : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      len : int;
      create_missing : int) return access opencv2_core_types_c_h.CvStringHashNode;  -- /usr/include/opencv2/core/core_c.h:1573
   pragma Import (C, cvGetHashedKey, "cvGetHashedKey");

   function cvGetRootFileNode (fs : System.Address; stream_index : int) return access opencv2_core_types_c_h.CvFileNode;  -- /usr/include/opencv2/core/core_c.h:1579
   pragma Import (C, cvGetRootFileNode, "cvGetRootFileNode");

   function cvGetFileNode
     (fs : System.Address;
      map : access opencv2_core_types_c_h.CvFileNode;
      key : access constant opencv2_core_types_c_h.CvStringHashNode;
      create_missing : int) return access opencv2_core_types_c_h.CvFileNode;  -- /usr/include/opencv2/core/core_c.h:1584
   pragma Import (C, cvGetFileNode, "cvGetFileNode");

   function cvGetFileNodeByName
     (fs : System.Address;
      map : access constant opencv2_core_types_c_h.CvFileNode;
      name : Interfaces.C.Strings.chars_ptr) return access opencv2_core_types_c_h.CvFileNode;  -- /usr/include/opencv2/core/core_c.h:1589
   pragma Import (C, cvGetFileNodeByName, "cvGetFileNodeByName");

   function cvReadInt (node : access constant opencv2_core_types_c_h.CvFileNode; default_value : int) return int;  -- /usr/include/opencv2/core/core_c.h:1593
   pragma Import (C, cvReadInt, "cvReadInt");

   function cvReadIntByName
     (fs : System.Address;
      map : access constant opencv2_core_types_c_h.CvFileNode;
      name : Interfaces.C.Strings.chars_ptr;
      default_value : int) return int;  -- /usr/include/opencv2/core/core_c.h:1601
   pragma Import (C, cvReadIntByName, "cvReadIntByName");

   function cvReadReal (node : access constant opencv2_core_types_c_h.CvFileNode; default_value : double) return double;  -- /usr/include/opencv2/core/core_c.h:1608
   pragma Import (C, cvReadReal, "cvReadReal");

   function cvReadRealByName
     (fs : System.Address;
      map : access constant opencv2_core_types_c_h.CvFileNode;
      name : Interfaces.C.Strings.chars_ptr;
      default_value : double) return double;  -- /usr/include/opencv2/core/core_c.h:1616
   pragma Import (C, cvReadRealByName, "cvReadRealByName");

   function cvReadString (node : access constant opencv2_core_types_c_h.CvFileNode; default_value : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/core_c.h:1623
   pragma Import (C, cvReadString, "cvReadString");

   function cvReadStringByName
     (fs : System.Address;
      map : access constant opencv2_core_types_c_h.CvFileNode;
      name : Interfaces.C.Strings.chars_ptr;
      default_value : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/core_c.h:1630
   pragma Import (C, cvReadStringByName, "cvReadStringByName");

   function cvRead
     (fs : System.Address;
      node : access opencv2_core_types_c_h.CvFileNode;
      attributes : access opencv2_core_types_c_h.CvAttrList) return System.Address;  -- /usr/include/opencv2/core/core_c.h:1638
   pragma Import (C, cvRead, "cvRead");

   function cvReadByName
     (fs : System.Address;
      map : access constant opencv2_core_types_c_h.CvFileNode;
      name : Interfaces.C.Strings.chars_ptr;
      attributes : access opencv2_core_types_c_h.CvAttrList) return System.Address;  -- /usr/include/opencv2/core/core_c.h:1642
   pragma Import (C, cvReadByName, "cvReadByName");

   procedure cvStartReadRawData
     (fs : System.Address;
      src : access constant opencv2_core_types_c_h.CvFileNode;
      reader : access opencv2_core_types_c_h.CvSeqReader);  -- /usr/include/opencv2/core/core_c.h:1650
   pragma Import (C, cvStartReadRawData, "cvStartReadRawData");

   procedure cvReadRawDataSlice
     (fs : System.Address;
      reader : access opencv2_core_types_c_h.CvSeqReader;
      count : int;
      dst : System.Address;
      dt : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/core/core_c.h:1654
   pragma Import (C, cvReadRawDataSlice, "cvReadRawDataSlice");

   procedure cvReadRawData
     (fs : System.Address;
      src : access constant opencv2_core_types_c_h.CvFileNode;
      dst : System.Address;
      dt : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/core/core_c.h:1658
   pragma Import (C, cvReadRawData, "cvReadRawData");

   procedure cvWriteFileNode
     (fs : System.Address;
      new_node_name : Interfaces.C.Strings.chars_ptr;
      node : access constant opencv2_core_types_c_h.CvFileNode;
      embed : int);  -- /usr/include/opencv2/core/core_c.h:1662
   pragma Import (C, cvWriteFileNode, "cvWriteFileNode");

   function cvGetFileNodeName (node : access constant opencv2_core_types_c_h.CvFileNode) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/core_c.h:1666
   pragma Import (C, cvGetFileNodeName, "cvGetFileNodeName");

   procedure cvRegisterType (info : access constant opencv2_core_types_c_h.CvTypeInfo);  -- /usr/include/opencv2/core/core_c.h:1670
   pragma Import (C, cvRegisterType, "cvRegisterType");

   procedure cvUnregisterType (type_name : Interfaces.C.Strings.chars_ptr);  -- /usr/include/opencv2/core/core_c.h:1671
   pragma Import (C, cvUnregisterType, "cvUnregisterType");

   function cvFirstType return access opencv2_core_types_c_h.CvTypeInfo;  -- /usr/include/opencv2/core/core_c.h:1672
   pragma Import (C, cvFirstType, "cvFirstType");

   function cvFindType (type_name : Interfaces.C.Strings.chars_ptr) return access opencv2_core_types_c_h.CvTypeInfo;  -- /usr/include/opencv2/core/core_c.h:1673
   pragma Import (C, cvFindType, "cvFindType");

   function cvTypeOf (struct_ptr : System.Address) return access opencv2_core_types_c_h.CvTypeInfo;  -- /usr/include/opencv2/core/core_c.h:1674
   pragma Import (C, cvTypeOf, "cvTypeOf");

   procedure cvRelease (struct_ptr : System.Address);  -- /usr/include/opencv2/core/core_c.h:1677
   pragma Import (C, cvRelease, "cvRelease");

   function cvClone (struct_ptr : System.Address) return System.Address;  -- /usr/include/opencv2/core/core_c.h:1678
   pragma Import (C, cvClone, "cvClone");

   procedure cvSave
     (filename : Interfaces.C.Strings.chars_ptr;
      struct_ptr : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      comment : Interfaces.C.Strings.chars_ptr;
      attributes : opencv2_core_types_c_h.CvAttrList);  -- /usr/include/opencv2/core/core_c.h:1681
   pragma Import (C, cvSave, "cvSave");

   function cvLoad
     (filename : Interfaces.C.Strings.chars_ptr;
      memstorage : access opencv2_core_types_c_h.CvMemStorage;
      name : Interfaces.C.Strings.chars_ptr;
      real_name : System.Address) return System.Address;  -- /usr/include/opencv2/core/core_c.h:1685
   pragma Import (C, cvLoad, "cvLoad");

   function cvGetTickCount return opencv2_core_types_c_h.int64;  -- /usr/include/opencv2/core/core_c.h:1694
   pragma Import (C, cvGetTickCount, "cvGetTickCount");

   function cvGetTickFrequency return double;  -- /usr/include/opencv2/core/core_c.h:1695
   pragma Import (C, cvGetTickFrequency, "cvGetTickFrequency");

   function cvCheckHardwareSupport (feature : int) return int;  -- /usr/include/opencv2/core/core_c.h:1711
   pragma Import (C, cvCheckHardwareSupport, "cvCheckHardwareSupport");

   function cvGetNumThreads return int;  -- /usr/include/opencv2/core/core_c.h:1716
   pragma Import (C, cvGetNumThreads, "cvGetNumThreads");

   procedure cvSetNumThreads (threads : int);  -- /usr/include/opencv2/core/core_c.h:1717
   pragma Import (C, cvSetNumThreads, "cvSetNumThreads");

   function cvGetThreadNum return int;  -- /usr/include/opencv2/core/core_c.h:1719
   pragma Import (C, cvGetThreadNum, "cvGetThreadNum");

   function cvGetErrStatus return int;  -- /usr/include/opencv2/core/core_c.h:1725
   pragma Import (C, cvGetErrStatus, "cvGetErrStatus");

   procedure cvSetErrStatus (status : int);  -- /usr/include/opencv2/core/core_c.h:1728
   pragma Import (C, cvSetErrStatus, "cvSetErrStatus");

   function cvGetErrMode return int;  -- /usr/include/opencv2/core/core_c.h:1735
   pragma Import (C, cvGetErrMode, "cvGetErrMode");

   function cvSetErrMode (mode : int) return int;  -- /usr/include/opencv2/core/core_c.h:1738
   pragma Import (C, cvSetErrMode, "cvSetErrMode");

   procedure cvError
     (status : int;
      func_name : Interfaces.C.Strings.chars_ptr;
      err_msg : Interfaces.C.Strings.chars_ptr;
      file_name : Interfaces.C.Strings.chars_ptr;
      line : int);  -- /usr/include/opencv2/core/core_c.h:1743
   pragma Import (C, cvError, "cvError");

   function cvErrorStr (status : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/opencv2/core/core_c.h:1747
   pragma Import (C, cvErrorStr, "cvErrorStr");

   function cvGetErrInfo
     (errcode_desc : System.Address;
      description : System.Address;
      filename : System.Address;
      line : access int) return int;  -- /usr/include/opencv2/core/core_c.h:1750
   pragma Import (C, cvGetErrInfo, "cvGetErrInfo");

   function cvErrorFromIppStatus (ipp_status : int) return int;  -- /usr/include/opencv2/core/core_c.h:1754
   pragma Import (C, cvErrorFromIppStatus, "cvErrorFromIppStatus");

   type CvErrorCallback is access function
        (arg1 : int;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : int;
         arg6 : System.Address) return int;
   pragma Convention (C, CvErrorCallback);  -- /usr/include/opencv2/core/core_c.h:1756

   function cvRedirectError
     (error_handler : CvErrorCallback;
      userdata : System.Address;
      prev_userdata : System.Address) return CvErrorCallback;  -- /usr/include/opencv2/core/core_c.h:1760
   pragma Import (C, cvRedirectError, "cvRedirectError");

   function cvNulDevReport
     (status : int;
      func_name : Interfaces.C.Strings.chars_ptr;
      err_msg : Interfaces.C.Strings.chars_ptr;
      file_name : Interfaces.C.Strings.chars_ptr;
      line : int;
      userdata : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:1770
   pragma Import (C, cvNulDevReport, "cvNulDevReport");

   function cvStdErrReport
     (status : int;
      func_name : Interfaces.C.Strings.chars_ptr;
      err_msg : Interfaces.C.Strings.chars_ptr;
      file_name : Interfaces.C.Strings.chars_ptr;
      line : int;
      userdata : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:1773
   pragma Import (C, cvStdErrReport, "cvStdErrReport");

   function cvGuiBoxReport
     (status : int;
      func_name : Interfaces.C.Strings.chars_ptr;
      err_msg : Interfaces.C.Strings.chars_ptr;
      file_name : Interfaces.C.Strings.chars_ptr;
      line : int;
      userdata : System.Address) return int;  -- /usr/include/opencv2/core/core_c.h:1776
   pragma Import (C, cvGuiBoxReport, "cvGuiBoxReport");

   package Class_CvModule is
      type CvModule is limited record
         info : access opencv2_core_types_c_h.CvModuleInfo;  -- /usr/include/opencv2/core/core_c.h:1865
      end record;
      pragma Import (CPP, CvModule);

      function New_CvModule (u_info : access opencv2_core_types_c_h.CvModuleInfo) return CvModule;  -- /usr/include/opencv2/core/core_c.h:1863
      pragma CPP_Constructor (New_CvModule, "_ZN8CvModuleC1EP12CvModuleInfo");

      procedure Delete_CvModule (this : access CvModule);  -- /usr/include/opencv2/core/core_c.h:1864
      pragma Import (CPP, Delete_CvModule, "_ZN8CvModuleD1Ev");



      first : access opencv2_core_types_c_h.CvModuleInfo;  -- /usr/include/opencv2/core/core_c.h:1867
      pragma Import (CPP, first, "_ZN8CvModule5firstE");

      last : access opencv2_core_types_c_h.CvModuleInfo;  -- /usr/include/opencv2/core/core_c.h:1868
      pragma Import (CPP, last, "_ZN8CvModule4lastE");
   end;
   use Class_CvModule;
   package Class_CvType is
      type CvType is limited record
         info : access opencv2_core_types_c_h.CvTypeInfo;  -- /usr/include/opencv2/core/core_c.h:1877
      end record;
      pragma Import (CPP, CvType);

      function New_CvType
        (type_name : Interfaces.C.Strings.chars_ptr;
         is_instance : opencv2_core_types_c_h.CvIsInstanceFunc;
         release : opencv2_core_types_c_h.CvReleaseFunc;
         read : opencv2_core_types_c_h.CvReadFunc;
         write : opencv2_core_types_c_h.CvWriteFunc;
         clone : opencv2_core_types_c_h.CvCloneFunc) return CvType;  -- /usr/include/opencv2/core/core_c.h:1873
      pragma CPP_Constructor (New_CvType, "_ZN6CvTypeC1EPKcPFiPKvEPFvPPvEPFS6_P13CvFileStorageP10CvFileNodeEPFvSB_S1_S3_10CvAttrListEPFS6_S3_E");

      procedure Delete_CvType (this : access CvType);  -- /usr/include/opencv2/core/core_c.h:1876
      pragma Import (CPP, Delete_CvType, "_ZN6CvTypeD1Ev");



      first : access opencv2_core_types_c_h.CvTypeInfo;  -- /usr/include/opencv2/core/core_c.h:1879
      pragma Import (CPP, first, "_ZN6CvType5firstE");

      last : access opencv2_core_types_c_h.CvTypeInfo;  -- /usr/include/opencv2/core/core_c.h:1880
      pragma Import (CPP, last, "_ZN6CvType4lastE");
   end;
   use Class_CvType;
end opencv2_core_core_c_h;
