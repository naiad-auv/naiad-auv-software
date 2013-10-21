pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_types_c_h;
with System;
with stddef_h;

package opencv2_imgproc_types_c_h is

   --  arg-macro: function CV_INIT_3X3_DELTAS (deltas, step, n((deltas)(0) := (nch), (deltas)(1) := -(step) + (nch), (deltas)(2) := -(step), (deltas)(3) := -(step) - (nch), (deltas)(4) := -(nch), (deltas)(5) := (step) - (nch), (deltas)(6) := (step), (deltas)(7) := (step) + (nch)
   --    return (deltas)(0) := (nch), (deltas)(1) := -(step) + (nch), (deltas)(2) := -(step), (deltas)(3) := -(step) - (nch), (deltas)(4) := -(nch), (deltas)(5) := (step) - (nch), (deltas)(6) := (step), (deltas)(7) := (step) + (nch);
   --  arg-macro: procedure CV_QUADEDGE2D_FIELDS ()
   --    int flags; struct CvSubdiv2DPoint* pt(4); CvSubdiv2DEdge next(4);
   --  arg-macro: procedure CV_SUBDIV2D_POINT_FIELDS ()
   --    int flags; CvSubdiv2DEdge first; CvPoint2D32f pt; int id;

   CV_SUBDIV2D_VIRTUAL_POINT_FLAG : constant := (2 ** 30);  --  /usr/include/opencv2/imgproc/types_c.h:366
   --  arg-macro: procedure CV_SUBDIV2D_FIELDS ()
   --    CV_GRAPH_FIELDS() int quad_edges; int is_geometry_valid; CvSubdiv2DEdge recent_edge; CvPoint2D32f topleft; CvPoint2D32f bottomright;
   --  arg-macro: function CV_SUBDIV2D_NEXT_EDGE (edge)
   --    return ((CvQuadEdge2D*)((edge) and ~3)).next((edge)and3);

   type CvConnectedComp is record
      area : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:56
      value : aliased opencv2_core_types_c_h.CvScalar;  -- /usr/include/opencv2/imgproc/types_c.h:57
      rect : aliased opencv2_core_types_c_h.CvRect;  -- /usr/include/opencv2/imgproc/types_c.h:58
      contour : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/types_c.h:59
   end record;
   pragma Convention (C_Pass_By_Copy, CvConnectedComp);  -- /usr/include/opencv2/imgproc/types_c.h:54

   type CvMoments is record
      m00 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:279
      m10 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:279
      m01 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:279
      m20 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:279
      m11 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:279
      m02 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:279
      m30 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:279
      m21 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:279
      m12 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:279
      m03 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:279
      mu20 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:280
      mu11 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:280
      mu02 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:280
      mu30 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:280
      mu21 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:280
      mu12 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:280
      mu03 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:280
      inv_sqrt_m00 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:281
   end record;
   pragma Convention (C_Pass_By_Copy, CvMoments);  -- /usr/include/opencv2/imgproc/types_c.h:277

   type CvHuMoments is record
      hu1 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:288
      hu2 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:288
      hu3 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:288
      hu4 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:288
      hu5 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:288
      hu6 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:288
      hu7 : aliased double;  -- /usr/include/opencv2/imgproc/types_c.h:288
   end record;
   pragma Convention (C_Pass_By_Copy, CvHuMoments);  -- /usr/include/opencv2/imgproc/types_c.h:286

   type CvDistanceFunction is access function
        (arg1 : access float;
         arg2 : access float;
         arg3 : System.Address) return float;
   pragma Convention (C, CvDistanceFunction);  -- /usr/include/opencv2/imgproc/types_c.h:303

   --  skipped empty struct u_CvContourScanner

   type CvContourScanner is new System.Address;  -- /usr/include/opencv2/imgproc/types_c.h:329

   type CvChainPtReader_deltas_array is array (0 .. 7, 0 .. 1) of aliased opencv2_core_types_c_h.schar;
   type CvChainPtReader is record
      header_size : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:334
      seq : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/types_c.h:334
      block : access opencv2_core_types_c_h.CvSeqBlock;  -- /usr/include/opencv2/imgproc/types_c.h:334
      ptr : access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/imgproc/types_c.h:334
      block_min : access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/imgproc/types_c.h:334
      block_max : access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/imgproc/types_c.h:334
      delta_index : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:334
      prev_elem : access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/imgproc/types_c.h:334
      code : aliased char;  -- /usr/include/opencv2/imgproc/types_c.h:335
      pt : aliased opencv2_core_types_c_h.CvPoint;  -- /usr/include/opencv2/imgproc/types_c.h:336
      deltas : aliased CvChainPtReader_deltas_array;  -- /usr/include/opencv2/imgproc/types_c.h:337
   end record;
   pragma Convention (C_Pass_By_Copy, CvChainPtReader);  -- /usr/include/opencv2/imgproc/types_c.h:332

   subtype CvSubdiv2DEdge is stddef_h.size_t;  -- /usr/include/opencv2/imgproc/types_c.h:353

   type CvQuadEdge2D_pt_array is array (0 .. 3) of System.Address;
   type CvQuadEdge2D_next_array is array (0 .. 3) of aliased CvSubdiv2DEdge;
   type CvQuadEdge2D is record
      flags : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:370
      pt : aliased CvQuadEdge2D_pt_array;  -- /usr/include/opencv2/imgproc/types_c.h:370
      next : aliased CvQuadEdge2D_next_array;  -- /usr/include/opencv2/imgproc/types_c.h:370
   end record;
   pragma Convention (C_Pass_By_Copy, CvQuadEdge2D);  -- /usr/include/opencv2/imgproc/types_c.h:368

   type CvSubdiv2DPoint is record
      flags : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:376
      first : aliased CvSubdiv2DEdge;  -- /usr/include/opencv2/imgproc/types_c.h:376
      pt : aliased opencv2_core_types_c_h.CvPoint2D32f;  -- /usr/include/opencv2/imgproc/types_c.h:376
      id : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:376
   end record;
   pragma Convention (C_Pass_By_Copy, CvSubdiv2DPoint);  -- /usr/include/opencv2/imgproc/types_c.h:374

   type CvSubdiv2D is record
      flags : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:390
      header_size : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:390
      h_prev : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/types_c.h:390
      h_next : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/types_c.h:390
      v_prev : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/types_c.h:390
      v_next : access opencv2_core_types_c_h.CvSeq;  -- /usr/include/opencv2/imgproc/types_c.h:390
      total : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:390
      elem_size : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:390
      block_max : access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/imgproc/types_c.h:390
      ptr : access opencv2_core_types_c_h.schar;  -- /usr/include/opencv2/imgproc/types_c.h:390
      delta_elems : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:390
      storage : access opencv2_core_types_c_h.CvMemStorage;  -- /usr/include/opencv2/imgproc/types_c.h:390
      free_blocks : access opencv2_core_types_c_h.CvSeqBlock;  -- /usr/include/opencv2/imgproc/types_c.h:390
      first : access opencv2_core_types_c_h.CvSeqBlock;  -- /usr/include/opencv2/imgproc/types_c.h:390
      free_elems : access opencv2_core_types_c_h.CvSetElem;  -- /usr/include/opencv2/imgproc/types_c.h:390
      active_count : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:390
      edges : access opencv2_core_types_c_h.CvSet;  -- /usr/include/opencv2/imgproc/types_c.h:390
      quad_edges : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:390
      is_geometry_valid : aliased int;  -- /usr/include/opencv2/imgproc/types_c.h:390
      recent_edge : aliased CvSubdiv2DEdge;  -- /usr/include/opencv2/imgproc/types_c.h:390
      topleft : aliased opencv2_core_types_c_h.CvPoint2D32f;  -- /usr/include/opencv2/imgproc/types_c.h:390
      bottomright : aliased opencv2_core_types_c_h.CvPoint2D32f;  -- /usr/include/opencv2/imgproc/types_c.h:390
   end record;
   pragma Convention (C_Pass_By_Copy, CvSubdiv2D);  -- /usr/include/opencv2/imgproc/types_c.h:388

   subtype CvSubdiv2DPointLocation is unsigned;
   CV_PTLOC_ERROR : constant CvSubdiv2DPointLocation := -2;
   CV_PTLOC_OUTSIDE_RECT : constant CvSubdiv2DPointLocation := -1;
   CV_PTLOC_INSIDE : constant CvSubdiv2DPointLocation := 0;
   CV_PTLOC_VERTEX : constant CvSubdiv2DPointLocation := 1;
   CV_PTLOC_ON_EDGE : constant CvSubdiv2DPointLocation := 2;  -- /usr/include/opencv2/imgproc/types_c.h:395

   subtype CvNextEdgeType is unsigned;
   CV_NEXT_AROUND_ORG : constant CvNextEdgeType := 0;
   CV_NEXT_AROUND_DST : constant CvNextEdgeType := 34;
   CV_PREV_AROUND_ORG : constant CvNextEdgeType := 17;
   CV_PREV_AROUND_DST : constant CvNextEdgeType := 51;
   CV_NEXT_AROUND_LEFT : constant CvNextEdgeType := 19;
   CV_NEXT_AROUND_RIGHT : constant CvNextEdgeType := 49;
   CV_PREV_AROUND_LEFT : constant CvNextEdgeType := 32;
   CV_PREV_AROUND_RIGHT : constant CvNextEdgeType := 2;  -- /usr/include/opencv2/imgproc/types_c.h:405

   type CvConvexityDefect is record
      start : access opencv2_core_types_c_h.CvPoint;  -- /usr/include/opencv2/imgproc/types_c.h:447
      c_end : access opencv2_core_types_c_h.CvPoint;  -- /usr/include/opencv2/imgproc/types_c.h:448
      depth_point : access opencv2_core_types_c_h.CvPoint;  -- /usr/include/opencv2/imgproc/types_c.h:449
      depth : aliased float;  -- /usr/include/opencv2/imgproc/types_c.h:450
   end record;
   pragma Convention (C_Pass_By_Copy, CvConvexityDefect);  -- /usr/include/opencv2/imgproc/types_c.h:445

   --  skipped empty struct CvFeatureTree

   --  skipped empty struct CvLSH

end opencv2_imgproc_types_c_h;
