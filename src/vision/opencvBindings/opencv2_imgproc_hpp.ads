pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with opencv2_core_cvdef_h;
with System;
with opencv2_core_types_hpp;
with cpp_4_7_4_bits_stl_vector_h;
with opencv2_core_cvstd_hpp;
with opencv2_core_mat_hpp;
with Interfaces.C.Extensions;
with opencv2_core_hpp;

package opencv2_imgproc_hpp is

   package Class_BaseRowFilter is
      type BaseRowFilter is abstract tagged limited record
         ksize : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:486
         anchor : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:487
      end record;
      pragma Import (CPP, BaseRowFilter);

      function New_BaseRowFilter return BaseRowFilter is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:480
      pragma CPP_Constructor (New_BaseRowFilter, "_ZN2cv13BaseRowFilterC1Ev");

      procedure Delete_BaseRowFilter (this : access BaseRowFilter);  -- /usr/local/include/opencv2/imgproc.hpp:482
      pragma Import (CPP, Delete_BaseRowFilter, "_ZN2cv13BaseRowFilterD1Ev");

      procedure deleting_dtor (this : access BaseRowFilter);  -- /usr/local/include/opencv2/imgproc.hpp:482
      pragma Import (CPP, deleting_dtor, "_ZN2cv13BaseRowFilterD0Ev");

      procedure operator_op
        (this : access BaseRowFilter;
         src : access opencv2_core_cvdef_h.uchar;
         dst : access opencv2_core_cvdef_h.uchar;
         width : int;
         cn : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:484
   end;
   use Class_BaseRowFilter;
   package Class_BaseColumnFilter is
      type BaseColumnFilter is abstract tagged limited record
         ksize : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:516
         anchor : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:517
      end record;
      pragma Import (CPP, BaseColumnFilter);

      function New_BaseColumnFilter return BaseColumnFilter is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:508
      pragma CPP_Constructor (New_BaseColumnFilter, "_ZN2cv16BaseColumnFilterC1Ev");

      procedure Delete_BaseColumnFilter (this : access BaseColumnFilter);  -- /usr/local/include/opencv2/imgproc.hpp:510
      pragma Import (CPP, Delete_BaseColumnFilter, "_ZN2cv16BaseColumnFilterD1Ev");

      procedure deleting_dtor (this : access BaseColumnFilter);  -- /usr/local/include/opencv2/imgproc.hpp:510
      pragma Import (CPP, deleting_dtor, "_ZN2cv16BaseColumnFilterD0Ev");

      procedure operator_op
        (this : access BaseColumnFilter;
         src : System.Address;
         dst : access opencv2_core_cvdef_h.uchar;
         dststep : int;
         dstcount : int;
         width : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:512

      procedure reset (this : access BaseColumnFilter);  -- /usr/local/include/opencv2/imgproc.hpp:514
      pragma Import (CPP, reset, "_ZN2cv16BaseColumnFilter5resetEv");
   end;
   use Class_BaseColumnFilter;
   package Class_BaseFilter is
      type BaseFilter is abstract tagged limited record
         ksize : aliased opencv2_core_types_hpp.Class_Size.Size;  -- /usr/local/include/opencv2/imgproc.hpp:544
         anchor : aliased opencv2_core_types_hpp.Class_Point.Point;  -- /usr/local/include/opencv2/imgproc.hpp:545
      end record;
      pragma Import (CPP, BaseFilter);

      function New_BaseFilter return BaseFilter is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:536
      pragma CPP_Constructor (New_BaseFilter, "_ZN2cv10BaseFilterC1Ev");

      procedure Delete_BaseFilter (this : access BaseFilter);  -- /usr/local/include/opencv2/imgproc.hpp:538
      pragma Import (CPP, Delete_BaseFilter, "_ZN2cv10BaseFilterD1Ev");

      procedure deleting_dtor (this : access BaseFilter);  -- /usr/local/include/opencv2/imgproc.hpp:538
      pragma Import (CPP, deleting_dtor, "_ZN2cv10BaseFilterD0Ev");

      procedure operator_op
        (this : access BaseFilter;
         src : System.Address;
         dst : access opencv2_core_cvdef_h.uchar;
         dststep : int;
         dstcount : int;
         width : int;
         cn : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:540

      procedure reset (this : access BaseFilter);  -- /usr/local/include/opencv2/imgproc.hpp:542
      pragma Import (CPP, reset, "_ZN2cv10BaseFilter5resetEv");
   end;
   use Class_BaseFilter;
   package Class_FilterEngine is
      type FilterEngine is tagged limited record
         srcType : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:664
         dstType : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:665
         bufType : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:666
         ksize : aliased opencv2_core_types_hpp.Class_Size.Size;  -- /usr/local/include/opencv2/imgproc.hpp:667
         anchor : aliased opencv2_core_types_hpp.Class_Point.Point;  -- /usr/local/include/opencv2/imgproc.hpp:668
         maxWidth : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:669
         wholeSize : aliased opencv2_core_types_hpp.Class_Size.Size;  -- /usr/local/include/opencv2/imgproc.hpp:670
         roi : aliased opencv2_core_types_hpp.Class_Rect.Rect;  -- /usr/local/include/opencv2/imgproc.hpp:671
         dx1 : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:672
         dx2 : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:673
         rowBorderType : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:674
         columnBorderType : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:675
         borderTab : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/imgproc.hpp:676
         borderElemSize : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:677
         ringBuf : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/imgproc.hpp:678
         srcRow : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/imgproc.hpp:679
         constBorderValue : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/imgproc.hpp:680
         constBorderRow : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/imgproc.hpp:681
         bufStep : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:682
         startY : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:683
         startY0 : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:684
         endY : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:685
         rowCount : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:686
         dstY : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:687
         rows : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/imgproc.hpp:688
         filter2D : aliased opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:690
         rowFilter : aliased opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:691
         columnFilter : aliased opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:692
      end record;
      pragma Import (CPP, FilterEngine);

      function New_FilterEngine return FilterEngine;  -- /usr/local/include/opencv2/imgproc.hpp:626
      pragma CPP_Constructor (New_FilterEngine, "_ZN2cv12FilterEngineC1Ev");

      function New_FilterEngine
        (u_filter2D : access constant opencv2_core_cvstd_hpp.Class_Ptr.Ptr;
         u_rowFilter : access constant opencv2_core_cvstd_hpp.Class_Ptr.Ptr;
         u_columnFilter : access constant opencv2_core_cvstd_hpp.Class_Ptr.Ptr;
         srcType : int;
         dstType : int;
         bufType : int;
         u_rowBorderType : int;
         u_columnBorderType : int;
         u_borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return FilterEngine;  -- /usr/local/include/opencv2/imgproc.hpp:628
      pragma CPP_Constructor (New_FilterEngine, "_ZN2cv12FilterEngineC1ERKNS_3PtrINS_10BaseFilterEEERKNS1_INS_13BaseRowFilterEEERKNS1_INS_16BaseColumnFilterEEEiiiiiRKNS_7Scalar_IdEE");

      procedure Delete_FilterEngine (this : access FilterEngine);  -- /usr/local/include/opencv2/imgproc.hpp:636
      pragma Import (CPP, Delete_FilterEngine, "_ZN2cv12FilterEngineD1Ev");

      procedure deleting_dtor (this : access FilterEngine);  -- /usr/local/include/opencv2/imgproc.hpp:636
      pragma Import (CPP, deleting_dtor, "_ZN2cv12FilterEngineD0Ev");

      procedure init
        (this : access FilterEngine'Class;
         u_filter2D : access constant opencv2_core_cvstd_hpp.Class_Ptr.Ptr;
         u_rowFilter : access constant opencv2_core_cvstd_hpp.Class_Ptr.Ptr;
         u_columnFilter : access constant opencv2_core_cvstd_hpp.Class_Ptr.Ptr;
         srcType : int;
         dstType : int;
         bufType : int;
         u_rowBorderType : int;
         u_columnBorderType : int;
         u_borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar);  -- /usr/local/include/opencv2/imgproc.hpp:638
      pragma Import (CPP, init, "_ZN2cv12FilterEngine4initERKNS_3PtrINS_10BaseFilterEEERKNS1_INS_13BaseRowFilterEEERKNS1_INS_16BaseColumnFilterEEEiiiiiRKNS_7Scalar_IdEE");

      function start
        (this : access FilterEngine;
         wholeSize : opencv2_core_types_hpp.Class_Size.Size;
         roi : opencv2_core_types_hpp.Class_Rect.Rect;
         maxBufRows : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:646
      pragma Import (CPP, start, "_ZN2cv12FilterEngine5startENS_5Size_IiEENS_5Rect_IiEEi");

      function start
        (this : access FilterEngine;
         src : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
         srcRoi : access constant opencv2_core_types_hpp.Class_Rect.Rect;
         isolated : Extensions.bool;
         maxBufRows : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:648
      pragma Import (CPP, start, "_ZN2cv12FilterEngine5startERKNS_3MatERKNS_5Rect_IiEEbi");

      function proceed
        (this : access FilterEngine;
         src : access opencv2_core_cvdef_h.uchar;
         srcStep : int;
         srcCount : int;
         dst : access opencv2_core_cvdef_h.uchar;
         dstStep : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:651
      pragma Import (CPP, proceed, "_ZN2cv12FilterEngine7proceedEPKhiiPhi");

      procedure apply
        (this : access FilterEngine;
         src : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
         dst : access opencv2_core_mat_hpp.Class_Mat.Mat;
         srcRoi : access constant opencv2_core_types_hpp.Class_Rect.Rect;
         dstOfs : opencv2_core_types_hpp.Class_Point.Point;
         isolated : Extensions.bool);  -- /usr/local/include/opencv2/imgproc.hpp:654
      pragma Import (CPP, apply, "_ZN2cv12FilterEngine5applyERKNS_3MatERS1_RKNS_5Rect_IiEENS_6Point_IiEEb");

      function isSeparable (this : access constant FilterEngine'Class) return Extensions.bool;  -- /usr/local/include/opencv2/imgproc.hpp:659
      pragma Import (CPP, isSeparable, "_ZNK2cv12FilterEngine11isSeparableEv");

      function remainingInputRows (this : access constant FilterEngine'Class) return int;  -- /usr/local/include/opencv2/imgproc.hpp:661
      pragma Import (CPP, remainingInputRows, "_ZNK2cv12FilterEngine18remainingInputRowsEv");

      function remainingOutputRows (this : access constant FilterEngine'Class) return int;  -- /usr/local/include/opencv2/imgproc.hpp:662
      pragma Import (CPP, remainingOutputRows, "_ZNK2cv12FilterEngine19remainingOutputRowsEv");
   end;
   use Class_FilterEngine;
   package Class_GeneralizedHough is
      type GeneralizedHough is abstract limited new opencv2_core_hpp.Class_Algorithm.Algorithm with record
         null;
      end record;
      pragma Import (CPP, GeneralizedHough);

      procedure setTemplate
        (this : access GeneralizedHough;
         templ : opencv2_core_mat_hpp.InputArray'Class;
         templCenter : opencv2_core_types_hpp.Class_Point.Point) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:701

      procedure setTemplate
        (this : access GeneralizedHough;
         edges : opencv2_core_mat_hpp.InputArray'Class;
         dx : opencv2_core_mat_hpp.InputArray'Class;
         dy : opencv2_core_mat_hpp.InputArray'Class;
         templCenter : opencv2_core_types_hpp.Class_Point.Point) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:702

      procedure detect
        (this : access GeneralizedHough;
         image : opencv2_core_mat_hpp.InputArray'Class;
         positions : opencv2_core_mat_hpp.OutputArray'Class;
         votes : opencv2_core_mat_hpp.OutputArray'Class) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:705

      procedure detect
        (this : access GeneralizedHough;
         edges : opencv2_core_mat_hpp.InputArray'Class;
         dx : opencv2_core_mat_hpp.InputArray'Class;
         dy : opencv2_core_mat_hpp.InputArray'Class;
         positions : opencv2_core_mat_hpp.OutputArray'Class;
         votes : opencv2_core_mat_hpp.OutputArray'Class) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:706

      procedure setCannyLowThresh (this : access GeneralizedHough; cannyLowThresh : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:709

      function getCannyLowThresh (this : access constant GeneralizedHough) return int is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:710

      procedure setCannyHighThresh (this : access GeneralizedHough; cannyHighThresh : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:713

      function getCannyHighThresh (this : access constant GeneralizedHough) return int is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:714

      procedure setMinDist (this : access GeneralizedHough; minDist : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:717

      function getMinDist (this : access constant GeneralizedHough) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:718

      procedure setDp (this : access GeneralizedHough; dp : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:721

      function getDp (this : access constant GeneralizedHough) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:722

      procedure setMaxBufferSize (this : access GeneralizedHough; maxBufferSize : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:725

      function getMaxBufferSize (this : access constant GeneralizedHough) return int is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:726

      procedure Delete_GeneralizedHough (this : access GeneralizedHough);  -- /usr/local/include/opencv2/imgproc.hpp:697
      pragma Import (CPP, Delete_GeneralizedHough, "_ZN2cv16GeneralizedHoughD1Ev");

      procedure deleting_dtor (this : access GeneralizedHough);  -- /usr/local/include/opencv2/imgproc.hpp:697
      pragma Import (CPP, deleting_dtor, "_ZN2cv16GeneralizedHoughD0Ev");
   end;
   use Class_GeneralizedHough;
   package Class_GeneralizedHoughBallard is
      type GeneralizedHoughBallard is abstract limited new GeneralizedHough with record
         null;
      end record;
      pragma Import (CPP, GeneralizedHoughBallard);

      procedure setLevels (this : access GeneralizedHoughBallard; levels : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:735

      function getLevels (this : access constant GeneralizedHoughBallard) return int is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:736

      procedure setVotesThreshold (this : access GeneralizedHoughBallard; votesThreshold : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:739

      function getVotesThreshold (this : access constant GeneralizedHoughBallard) return int is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:740

      procedure Delete_GeneralizedHoughBallard (this : access GeneralizedHoughBallard);  -- /usr/local/include/opencv2/imgproc.hpp:731
      pragma Import (CPP, Delete_GeneralizedHoughBallard, "_ZN2cv23GeneralizedHoughBallardD1Ev");

      procedure deleting_dtor (this : access GeneralizedHoughBallard);  -- /usr/local/include/opencv2/imgproc.hpp:731
      pragma Import (CPP, deleting_dtor, "_ZN2cv23GeneralizedHoughBallardD0Ev");
   end;
   use Class_GeneralizedHoughBallard;
   package Class_GeneralizedHoughGuil is
      type GeneralizedHoughGuil is abstract limited new GeneralizedHough with record
         null;
      end record;
      pragma Import (CPP, GeneralizedHoughGuil);

      procedure setXi (this : access GeneralizedHoughGuil; xi : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:749

      function getXi (this : access constant GeneralizedHoughGuil) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:750

      procedure setLevels (this : access GeneralizedHoughGuil; levels : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:753

      function getLevels (this : access constant GeneralizedHoughGuil) return int is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:754

      procedure setAngleEpsilon (this : access GeneralizedHoughGuil; angleEpsilon : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:757

      function getAngleEpsilon (this : access constant GeneralizedHoughGuil) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:758

      procedure setMinAngle (this : access GeneralizedHoughGuil; minAngle : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:761

      function getMinAngle (this : access constant GeneralizedHoughGuil) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:762

      procedure setMaxAngle (this : access GeneralizedHoughGuil; maxAngle : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:765

      function getMaxAngle (this : access constant GeneralizedHoughGuil) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:766

      procedure setAngleStep (this : access GeneralizedHoughGuil; angleStep : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:769

      function getAngleStep (this : access constant GeneralizedHoughGuil) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:770

      procedure setAngleThresh (this : access GeneralizedHoughGuil; angleThresh : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:773

      function getAngleThresh (this : access constant GeneralizedHoughGuil) return int is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:774

      procedure setMinScale (this : access GeneralizedHoughGuil; minScale : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:777

      function getMinScale (this : access constant GeneralizedHoughGuil) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:778

      procedure setMaxScale (this : access GeneralizedHoughGuil; maxScale : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:781

      function getMaxScale (this : access constant GeneralizedHoughGuil) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:782

      procedure setScaleStep (this : access GeneralizedHoughGuil; scaleStep : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:785

      function getScaleStep (this : access constant GeneralizedHoughGuil) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:786

      procedure setScaleThresh (this : access GeneralizedHoughGuil; scaleThresh : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:789

      function getScaleThresh (this : access constant GeneralizedHoughGuil) return int is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:790

      procedure setPosThresh (this : access GeneralizedHoughGuil; posThresh : int) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:793

      function getPosThresh (this : access constant GeneralizedHoughGuil) return int is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:794

      procedure Delete_GeneralizedHoughGuil (this : access GeneralizedHoughGuil);  -- /usr/local/include/opencv2/imgproc.hpp:745
      pragma Import (CPP, Delete_GeneralizedHoughGuil, "_ZN2cv20GeneralizedHoughGuilD1Ev");

      procedure deleting_dtor (this : access GeneralizedHoughGuil);  -- /usr/local/include/opencv2/imgproc.hpp:745
      pragma Import (CPP, deleting_dtor, "_ZN2cv20GeneralizedHoughGuilD0Ev");
   end;
   use Class_GeneralizedHoughGuil;
   package Class_CLAHE is
      type CLAHE is abstract limited new opencv2_core_hpp.Class_Algorithm.Algorithm with record
         null;
      end record;
      pragma Import (CPP, CLAHE);

      procedure apply
        (this : access CLAHE;
         src : opencv2_core_mat_hpp.InputArray'Class;
         dst : opencv2_core_mat_hpp.OutputArray'Class) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:801

      procedure setClipLimit (this : access CLAHE; clipLimit : double) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:803

      function getClipLimit (this : access constant CLAHE) return double is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:804

      procedure setTilesGridSize (this : access CLAHE; tileGridSize : opencv2_core_types_hpp.Class_Size.Size) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:806

      function getTilesGridSize (this : access constant CLAHE) return opencv2_core_types_hpp.Class_Size.Size is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:807

      procedure collectGarbage (this : access CLAHE) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:809

      procedure Delete_CLAHE (this : access CLAHE);  -- /usr/local/include/opencv2/imgproc.hpp:798
      pragma Import (CPP, Delete_CLAHE, "_ZN2cv5CLAHED1Ev");

      procedure deleting_dtor (this : access CLAHE);  -- /usr/local/include/opencv2/imgproc.hpp:798
      pragma Import (CPP, deleting_dtor, "_ZN2cv5CLAHED0Ev");
   end;
   use Class_CLAHE;
   type Subdiv2D;
   type Vertex is record
      firstEdge : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:877
      c_type : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:878
      pt : aliased opencv2_core_types_hpp.Class_Point2f.Point2f;  -- /usr/local/include/opencv2/imgproc.hpp:879
   end record;
   pragma Convention (C_Pass_By_Copy, Vertex);
   type Subdiv2D_next_array is array (0 .. 3) of aliased int;
   type Subdiv2D_pt_array is array (0 .. 3) of aliased int;
   type QuadEdge is record
      next : aliased Subdiv2D_next_array;  -- /usr/local/include/opencv2/imgproc.hpp:888
      pt : aliased Subdiv2D_pt_array;  -- /usr/local/include/opencv2/imgproc.hpp:889
   end record;
   pragma Convention (C_Pass_By_Copy, QuadEdge);
   package Class_Subdiv2D is
      type Subdiv2D is limited record
         vtx : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/imgproc.hpp:892
         qedges : aliased cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;  -- /usr/local/include/opencv2/imgproc.hpp:893
         freeQEdge : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:894
         freePoint : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:895
         validGeometry : aliased Extensions.bool;  -- /usr/local/include/opencv2/imgproc.hpp:896
         recentEdge : aliased int;  -- /usr/local/include/opencv2/imgproc.hpp:898
         topLeft : aliased opencv2_core_types_hpp.Class_Point2f.Point2f;  -- /usr/local/include/opencv2/imgproc.hpp:899
         bottomRight : aliased opencv2_core_types_hpp.Class_Point2f.Point2f;  -- /usr/local/include/opencv2/imgproc.hpp:900
      end record;
      pragma Import (CPP, Subdiv2D);

      function New_Subdiv2D return Subdiv2D;  -- /usr/local/include/opencv2/imgproc.hpp:833
      pragma CPP_Constructor (New_Subdiv2D, "_ZN2cv8Subdiv2DC1Ev");

      function New_Subdiv2D (the_rect : opencv2_core_types_hpp.Class_Rect.Rect) return Subdiv2D;  -- /usr/local/include/opencv2/imgproc.hpp:834
      pragma CPP_Constructor (New_Subdiv2D, "_ZN2cv8Subdiv2DC1ENS_5Rect_IiEE");

      procedure initDelaunay (this : access Subdiv2D; the_rect : opencv2_core_types_hpp.Class_Rect.Rect);  -- /usr/local/include/opencv2/imgproc.hpp:835
      pragma Import (CPP, initDelaunay, "_ZN2cv8Subdiv2D12initDelaunayENS_5Rect_IiEE");

      function insert (this : access Subdiv2D; pt : opencv2_core_types_hpp.Class_Point2f.Point2f) return int;  -- /usr/local/include/opencv2/imgproc.hpp:837
      pragma Import (CPP, insert, "_ZN2cv8Subdiv2D6insertENS_6Point_IfEE");

      procedure insert (this : access Subdiv2D; ptvec : System.Address);  -- /usr/local/include/opencv2/imgproc.hpp:838
      pragma Import (CPP, insert, "_ZN2cv8Subdiv2D6insertERKSt6vectorINS_6Point_IfEESaIS3_EE");

      function locate
        (this : access Subdiv2D;
         pt : opencv2_core_types_hpp.Class_Point2f.Point2f;
         edge : access int;
         vertex : access int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:839
      pragma Import (CPP, locate, "_ZN2cv8Subdiv2D6locateENS_6Point_IfEERiS3_");

      function findNearest
        (this : access Subdiv2D;
         pt : opencv2_core_types_hpp.Class_Point2f.Point2f;
         nearestPt : access opencv2_core_types_hpp.Class_Point2f.Point2f) return int;  -- /usr/local/include/opencv2/imgproc.hpp:841
      pragma Import (CPP, findNearest, "_ZN2cv8Subdiv2D11findNearestENS_6Point_IfEEPS2_");

      procedure getEdgeList (this : access constant Subdiv2D; edgeList : System.Address);  -- /usr/local/include/opencv2/imgproc.hpp:842
      pragma Import (CPP, getEdgeList, "_ZNK2cv8Subdiv2D11getEdgeListERSt6vectorINS_3VecIfLi4EEESaIS3_EE");

      procedure getTriangleList (this : access constant Subdiv2D; triangleList : System.Address);  -- /usr/local/include/opencv2/imgproc.hpp:843
      pragma Import (CPP, getTriangleList, "_ZNK2cv8Subdiv2D15getTriangleListERSt6vectorINS_3VecIfLi6EEESaIS3_EE");

      procedure getVoronoiFacetList
        (this : access Subdiv2D;
         idx : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
         facetList : System.Address;
         facetCenters : System.Address);  -- /usr/local/include/opencv2/imgproc.hpp:844
      pragma Import (CPP, getVoronoiFacetList, "_ZN2cv8Subdiv2D19getVoronoiFacetListERKSt6vectorIiSaIiEERS1_IS1_INS_6Point_IfEESaIS7_EESaIS9_EERS9_");

      function getVertex
        (this : access constant Subdiv2D;
         vertex : int;
         firstEdge : access int) return opencv2_core_types_hpp.Class_Point2f.Point2f;  -- /usr/local/include/opencv2/imgproc.hpp:847
      pragma Import (CPP, getVertex, "_ZNK2cv8Subdiv2D9getVertexEiPi");

      function getEdge
        (this : access constant Subdiv2D;
         edge : int;
         nextEdgeType : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:849
      pragma Import (CPP, getEdge, "_ZNK2cv8Subdiv2D7getEdgeEii");

      function nextEdge (this : access constant Subdiv2D; edge : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:850
      pragma Import (CPP, nextEdge, "_ZNK2cv8Subdiv2D8nextEdgeEi");

      function rotateEdge
        (this : access constant Subdiv2D;
         edge : int;
         rotate : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:851
      pragma Import (CPP, rotateEdge, "_ZNK2cv8Subdiv2D10rotateEdgeEii");

      function symEdge (this : access constant Subdiv2D; edge : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:852
      pragma Import (CPP, symEdge, "_ZNK2cv8Subdiv2D7symEdgeEi");

      function edgeOrg
        (this : access constant Subdiv2D;
         edge : int;
         orgpt : access opencv2_core_types_hpp.Class_Point2f.Point2f) return int;  -- /usr/local/include/opencv2/imgproc.hpp:853
      pragma Import (CPP, edgeOrg, "_ZNK2cv8Subdiv2D7edgeOrgEiPNS_6Point_IfEE");

      function edgeDst
        (this : access constant Subdiv2D;
         edge : int;
         dstpt : access opencv2_core_types_hpp.Class_Point2f.Point2f) return int;  -- /usr/local/include/opencv2/imgproc.hpp:854
      pragma Import (CPP, edgeDst, "_ZNK2cv8Subdiv2D7edgeDstEiPNS_6Point_IfEE");

      function newEdge (this : access Subdiv2D) return int;  -- /usr/local/include/opencv2/imgproc.hpp:857
      pragma Import (CPP, newEdge, "_ZN2cv8Subdiv2D7newEdgeEv");

      procedure deleteEdge (this : access Subdiv2D; edge : int);  -- /usr/local/include/opencv2/imgproc.hpp:858
      pragma Import (CPP, deleteEdge, "_ZN2cv8Subdiv2D10deleteEdgeEi");

      function newPoint
        (this : access Subdiv2D;
         pt : opencv2_core_types_hpp.Class_Point2f.Point2f;
         isvirtual : Extensions.bool;
         firstEdge : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:859
      pragma Import (CPP, newPoint, "_ZN2cv8Subdiv2D8newPointENS_6Point_IfEEbi");

      procedure deletePoint (this : access Subdiv2D; vtx : int);  -- /usr/local/include/opencv2/imgproc.hpp:860
      pragma Import (CPP, deletePoint, "_ZN2cv8Subdiv2D11deletePointEi");

      procedure setEdgePoints
        (this : access Subdiv2D;
         edge : int;
         orgPt : int;
         dstPt : int);  -- /usr/local/include/opencv2/imgproc.hpp:861
      pragma Import (CPP, setEdgePoints, "_ZN2cv8Subdiv2D13setEdgePointsEiii");

      procedure splice
        (this : access Subdiv2D;
         edgeA : int;
         edgeB : int);  -- /usr/local/include/opencv2/imgproc.hpp:862
      pragma Import (CPP, splice, "_ZN2cv8Subdiv2D6spliceEii");

      function connectEdges
        (this : access Subdiv2D;
         edgeA : int;
         edgeB : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:863
      pragma Import (CPP, connectEdges, "_ZN2cv8Subdiv2D12connectEdgesEii");

      procedure swapEdges (this : access Subdiv2D; edge : int);  -- /usr/local/include/opencv2/imgproc.hpp:864
      pragma Import (CPP, swapEdges, "_ZN2cv8Subdiv2D9swapEdgesEi");

      function isRightOf
        (this : access constant Subdiv2D;
         pt : opencv2_core_types_hpp.Class_Point2f.Point2f;
         edge : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:865
      pragma Import (CPP, isRightOf, "_ZNK2cv8Subdiv2D9isRightOfENS_6Point_IfEEi");

      procedure calcVoronoi (this : access Subdiv2D);  -- /usr/local/include/opencv2/imgproc.hpp:866
      pragma Import (CPP, calcVoronoi, "_ZN2cv8Subdiv2D11calcVoronoiEv");

      procedure clearVoronoi (this : access Subdiv2D);  -- /usr/local/include/opencv2/imgproc.hpp:867
      pragma Import (CPP, clearVoronoi, "_ZN2cv8Subdiv2D12clearVoronoiEv");

      procedure checkSubdiv (this : access constant Subdiv2D);  -- /usr/local/include/opencv2/imgproc.hpp:868
      pragma Import (CPP, checkSubdiv, "_ZNK2cv8Subdiv2D11checkSubdivEv");
   end;
   use Class_Subdiv2D;
   package Class_LineSegmentDetector is
      type LineSegmentDetector is abstract limited new opencv2_core_hpp.Class_Algorithm.Algorithm with record
         null;
      end record;
      pragma Import (CPP, LineSegmentDetector);

      procedure detect
        (this : access LineSegmentDetector;
         u_image : opencv2_core_mat_hpp.InputArray'Class;
         u_lines : opencv2_core_mat_hpp.OutputArray'Class;
         width : opencv2_core_mat_hpp.OutputArray'Class;
         prec : opencv2_core_mat_hpp.OutputArray'Class;
         nfa : opencv2_core_mat_hpp.OutputArray'Class) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:925

      procedure drawSegments
        (this : access LineSegmentDetector;
         u_image : opencv2_core_mat_hpp.InputOutputArray'Class;
         lines : opencv2_core_mat_hpp.InputArray'Class) is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:936

      function compareSegments
        (this : access LineSegmentDetector;
         size : access constant opencv2_core_types_hpp.Class_Size.Size;
         lines1 : opencv2_core_mat_hpp.InputArray'Class;
         lines2 : opencv2_core_mat_hpp.InputArray'Class;
         u_image : opencv2_core_mat_hpp.InputOutputArray'Class) return int is abstract;  -- /usr/local/include/opencv2/imgproc.hpp:948

      procedure Delete_LineSegmentDetector (this : access LineSegmentDetector);  -- /usr/local/include/opencv2/imgproc.hpp:950
      pragma Import (CPP, Delete_LineSegmentDetector, "_ZN2cv19LineSegmentDetectorD1Ev");

      procedure deleting_dtor (this : access LineSegmentDetector);  -- /usr/local/include/opencv2/imgproc.hpp:950
      pragma Import (CPP, deleting_dtor, "_ZN2cv19LineSegmentDetectorD0Ev");
   end;
   use Class_LineSegmentDetector;
   function createLineSegmentDetectorPtr
     (u_refine : int;
      u_scale : double;
      u_sigma_scale : double;
      u_quant : double;
      u_ang_th : double;
      u_log_eps : double;
      u_density_th : double;
      u_n_bins : int) return opencv2_core_cvstd_hpp.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:954
   pragma Import (CPP, createLineSegmentDetectorPtr, "_ZN2cv28createLineSegmentDetectorPtrEiddddddi");

   function getKernelType (kernel : opencv2_core_mat_hpp.InputArray'Class; anchor : opencv2_core_types_hpp.Class_Point.Point) return int;  -- /usr/local/include/opencv2/imgproc.hpp:960
   pragma Import (CPP, getKernelType, "_ZN2cv13getKernelTypeERKNS_11_InputArrayENS_6Point_IiEE");

   function getLinearRowFilter
     (srcType : int;
      bufType : int;
      kernel : opencv2_core_mat_hpp.InputArray'Class;
      anchor : int;
      symmetryType : int) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:963
   pragma Import (CPP, getLinearRowFilter, "_ZN2cv18getLinearRowFilterEiiRKNS_11_InputArrayEii");

   function getLinearColumnFilter
     (bufType : int;
      dstType : int;
      kernel : opencv2_core_mat_hpp.InputArray'Class;
      anchor : int;
      symmetryType : int;
      c_delta : double;
      bits : int) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:968
   pragma Import (CPP, getLinearColumnFilter, "_ZN2cv21getLinearColumnFilterEiiRKNS_11_InputArrayEiidi");

   function getLinearFilter
     (srcType : int;
      dstType : int;
      kernel : opencv2_core_mat_hpp.InputArray'Class;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      c_delta : double;
      bits : int) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:974
   pragma Import (CPP, getLinearFilter, "_ZN2cv15getLinearFilterEiiRKNS_11_InputArrayENS_6Point_IiEEdi");

   function createSeparableLinearFilter
     (srcType : int;
      dstType : int;
      rowKernel : opencv2_core_mat_hpp.InputArray'Class;
      columnKernel : opencv2_core_mat_hpp.InputArray'Class;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      c_delta : double;
      rowBorderType : int;
      columnBorderType : int;
      borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return opencv2_core_cvstd_hpp.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:980
   pragma Import (CPP, createSeparableLinearFilter, "_ZN2cv27createSeparableLinearFilterEiiRKNS_11_InputArrayES2_NS_6Point_IiEEdiiRKNS_7Scalar_IdEE");

   function createLinearFilter
     (srcType : int;
      dstType : int;
      kernel : opencv2_core_mat_hpp.InputArray'Class;
      u_anchor : opencv2_core_types_hpp.Class_Point.Point;
      c_delta : double;
      rowBorderType : int;
      columnBorderType : int;
      borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return opencv2_core_cvstd_hpp.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:988
   pragma Import (CPP, createLinearFilter, "_ZN2cv18createLinearFilterEiiRKNS_11_InputArrayENS_6Point_IiEEdiiRKNS_7Scalar_IdEE");

   function getGaussianKernel
     (ksize : int;
      sigma : double;
      ktype : int) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/imgproc.hpp:994
   pragma Import (CPP, getGaussianKernel, "_ZN2cv17getGaussianKernelEidi");

   function createGaussianFilter
     (c_type : int;
      ksize : opencv2_core_types_hpp.Class_Size.Size;
      sigma1 : double;
      sigma2 : double;
      borderType : int) return opencv2_core_cvstd_hpp.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:997
   pragma Import (CPP, createGaussianFilter, "_ZN2cv20createGaussianFilterEiNS_5Size_IiEEddi");

   procedure getDerivKernels
     (kx : opencv2_core_mat_hpp.OutputArray'Class;
      ky : opencv2_core_mat_hpp.OutputArray'Class;
      dx : int;
      dy : int;
      ksize : int;
      normalize : Extensions.bool;
      ktype : int);  -- /usr/local/include/opencv2/imgproc.hpp:1002
   pragma Import (CPP, getDerivKernels, "_ZN2cv15getDerivKernelsERKNS_12_OutputArrayES2_iiibi");

   function createDerivFilter
     (srcType : int;
      dstType : int;
      dx : int;
      dy : int;
      ksize : int;
      borderType : int) return opencv2_core_cvstd_hpp.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1007
   pragma Import (CPP, createDerivFilter, "_ZN2cv17createDerivFilterEiiiiii");

   function getRowSumFilter
     (srcType : int;
      sumType : int;
      ksize : int;
      anchor : int) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1012
   pragma Import (CPP, getRowSumFilter, "_ZN2cv15getRowSumFilterEiiii");

   function getColumnSumFilter
     (sumType : int;
      dstType : int;
      ksize : int;
      anchor : int;
      scale : double) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1016
   pragma Import (CPP, getColumnSumFilter, "_ZN2cv18getColumnSumFilterEiiiid");

   function createBoxFilter
     (srcType : int;
      dstType : int;
      ksize : opencv2_core_types_hpp.Class_Size.Size;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      normalize : Extensions.bool;
      borderType : int) return opencv2_core_cvstd_hpp.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1020
   pragma Import (CPP, createBoxFilter, "_ZN2cv15createBoxFilterEiiNS_5Size_IiEENS_6Point_IiEEbi");

   function getGaborKernel
     (ksize : opencv2_core_types_hpp.Class_Size.Size;
      sigma : double;
      theta : double;
      lambd : double;
      gamma : double;
      psi : double;
      ktype : int) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/imgproc.hpp:1026
   pragma Import (CPP, getGaborKernel, "_ZN2cv14getGaborKernelENS_5Size_IiEEdddddi");

   function getMorphologyRowFilter
     (op : int;
      c_type : int;
      ksize : int;
      anchor : int) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1030
   pragma Import (CPP, getMorphologyRowFilter, "_ZN2cv22getMorphologyRowFilterEiiii");

   function getMorphologyColumnFilter
     (op : int;
      c_type : int;
      ksize : int;
      anchor : int) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1033
   pragma Import (CPP, getMorphologyColumnFilter, "_ZN2cv25getMorphologyColumnFilterEiiii");

   function getMorphologyFilter
     (op : int;
      c_type : int;
      kernel : opencv2_core_mat_hpp.InputArray'Class;
      anchor : opencv2_core_types_hpp.Class_Point.Point) return opencv2_core_cvstd_hpp.Class_Ptr.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1036
   pragma Import (CPP, getMorphologyFilter, "_ZN2cv19getMorphologyFilterEiiRKNS_11_InputArrayENS_6Point_IiEE");

   function morphologyDefaultBorderValue return opencv2_core_types_hpp.Class_Scalar.Scalar;  -- /usr/local/include/opencv2/imgproc.hpp:1040
   pragma Import (CPP, morphologyDefaultBorderValue, "_ZN2cvL28morphologyDefaultBorderValueEv");

   function createMorphologyFilter
     (op : int;
      c_type : int;
      kernel : opencv2_core_mat_hpp.InputArray'Class;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      rowBorderType : int;
      columnBorderType : int;
      borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar) return opencv2_core_cvstd_hpp.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1043
   pragma Import (CPP, createMorphologyFilter, "_ZN2cv22createMorphologyFilterEiiRKNS_11_InputArrayENS_6Point_IiEEiiRKNS_7Scalar_IdEE");

   function getStructuringElement
     (shape : int;
      ksize : opencv2_core_types_hpp.Class_Size.Size;
      anchor : opencv2_core_types_hpp.Class_Point.Point) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/imgproc.hpp:1048
   pragma Import (CPP, getStructuringElement, "_ZN2cv21getStructuringElementEiNS_5Size_IiEENS_6Point_IiEE");

   procedure medianBlur
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ksize : int);  -- /usr/local/include/opencv2/imgproc.hpp:1051
   pragma Import (CPP, medianBlur, "_ZN2cv10medianBlurERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure GaussianBlur
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ksize : opencv2_core_types_hpp.Class_Size.Size;
      sigmaX : double;
      sigmaY : double;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1054
   pragma Import (CPP, GaussianBlur, "_ZN2cv12GaussianBlurERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Size_IiEEddi");

   procedure bilateralFilter
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      d : int;
      sigmaColor : double;
      sigmaSpace : double;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1059
   pragma Import (CPP, bilateralFilter, "_ZN2cv15bilateralFilterERKNS_11_InputArrayERKNS_12_OutputArrayEiddi");

   procedure adaptiveBilateralFilter
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ksize : opencv2_core_types_hpp.Class_Size.Size;
      sigmaSpace : double;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1064
   pragma Import (CPP, adaptiveBilateralFilter, "_ZN2cv23adaptiveBilateralFilterERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Size_IiEEdNS_6Point_IiEEi");

   procedure boxFilter
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ddepth : int;
      ksize : opencv2_core_types_hpp.Class_Size.Size;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      normalize : Extensions.bool;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1069
   pragma Import (CPP, boxFilter, "_ZN2cv9boxFilterERKNS_11_InputArrayERKNS_12_OutputArrayEiNS_5Size_IiEENS_6Point_IiEEbi");

   procedure blur
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ksize : opencv2_core_types_hpp.Class_Size.Size;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1075
   pragma Import (CPP, blur, "_ZN2cv4blurERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Size_IiEENS_6Point_IiEEi");

   procedure filter2D
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ddepth : int;
      kernel : opencv2_core_mat_hpp.InputArray'Class;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      c_delta : double;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1080
   pragma Import (CPP, filter2D, "_ZN2cv8filter2DERKNS_11_InputArrayERKNS_12_OutputArrayEiS2_NS_6Point_IiEEdi");

   procedure sepFilter2D
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ddepth : int;
      kernelX : opencv2_core_mat_hpp.InputArray'Class;
      kernelY : opencv2_core_mat_hpp.InputArray'Class;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      c_delta : double;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1085
   pragma Import (CPP, sepFilter2D, "_ZN2cv11sepFilter2DERKNS_11_InputArrayERKNS_12_OutputArrayEiS2_S2_NS_6Point_IiEEdi");

   procedure Sobel
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ddepth : int;
      dx : int;
      dy : int;
      ksize : int;
      scale : double;
      c_delta : double;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1091
   pragma Import (CPP, Sobel, "_ZN2cv5SobelERKNS_11_InputArrayERKNS_12_OutputArrayEiiiiddi");

   procedure Scharr
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ddepth : int;
      dx : int;
      dy : int;
      scale : double;
      c_delta : double;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1097
   pragma Import (CPP, Scharr, "_ZN2cv6ScharrERKNS_11_InputArrayERKNS_12_OutputArrayEiiiddi");

   procedure Laplacian
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ddepth : int;
      ksize : int;
      scale : double;
      c_delta : double;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1102
   pragma Import (CPP, Laplacian, "_ZN2cv9LaplacianERKNS_11_InputArrayERKNS_12_OutputArrayEiiddi");

   procedure Canny
     (image : opencv2_core_mat_hpp.InputArray'Class;
      edges : opencv2_core_mat_hpp.OutputArray'Class;
      threshold1 : double;
      threshold2 : double;
      apertureSize : int;
      L2gradient : Extensions.bool);  -- /usr/local/include/opencv2/imgproc.hpp:1107
   pragma Import (CPP, Canny, "_ZN2cv5CannyERKNS_11_InputArrayERKNS_12_OutputArrayEddib");

   procedure cornerMinEigenVal
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      blockSize : int;
      ksize : int;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1112
   pragma Import (CPP, cornerMinEigenVal, "_ZN2cv17cornerMinEigenValERKNS_11_InputArrayERKNS_12_OutputArrayEiii");

   procedure cornerHarris
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      blockSize : int;
      ksize : int;
      k : double;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1117
   pragma Import (CPP, cornerHarris, "_ZN2cv12cornerHarrisERKNS_11_InputArrayERKNS_12_OutputArrayEiidi");

   procedure cornerEigenValsAndVecs
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      blockSize : int;
      ksize : int;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1122
   pragma Import (CPP, cornerEigenValsAndVecs, "_ZN2cv22cornerEigenValsAndVecsERKNS_11_InputArrayERKNS_12_OutputArrayEiii");

   procedure preCornerDetect
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ksize : int;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1127
   pragma Import (CPP, preCornerDetect, "_ZN2cv15preCornerDetectERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   procedure cornerSubPix
     (image : opencv2_core_mat_hpp.InputArray'Class;
      corners : opencv2_core_mat_hpp.InputOutputArray'Class;
      winSize : opencv2_core_types_hpp.Class_Size.Size;
      zeroZone : opencv2_core_types_hpp.Class_Size.Size;
      criteria : opencv2_core_types_hpp.Class_TermCriteria.TermCriteria);  -- /usr/local/include/opencv2/imgproc.hpp:1131
   pragma Import (CPP, cornerSubPix, "_ZN2cv12cornerSubPixERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Size_IiEES7_NS_12TermCriteriaE");

   procedure goodFeaturesToTrack
     (image : opencv2_core_mat_hpp.InputArray'Class;
      corners : opencv2_core_mat_hpp.OutputArray'Class;
      maxCorners : int;
      qualityLevel : double;
      minDistance : double;
      mask : opencv2_core_mat_hpp.InputArray'Class;
      blockSize : int;
      useHarrisDetector : Extensions.bool;
      k : double);  -- /usr/local/include/opencv2/imgproc.hpp:1136
   pragma Import (CPP, goodFeaturesToTrack, "_ZN2cv19goodFeaturesToTrackERKNS_11_InputArrayERKNS_12_OutputArrayEiddS2_ibd");

   procedure HoughLines
     (image : opencv2_core_mat_hpp.InputArray'Class;
      lines : opencv2_core_mat_hpp.OutputArray'Class;
      rho : double;
      theta : double;
      threshold : int;
      srn : double;
      stn : double);  -- /usr/local/include/opencv2/imgproc.hpp:1142
   pragma Import (CPP, HoughLines, "_ZN2cv10HoughLinesERKNS_11_InputArrayERKNS_12_OutputArrayEddidd");

   procedure HoughLinesP
     (image : opencv2_core_mat_hpp.InputArray'Class;
      lines : opencv2_core_mat_hpp.OutputArray'Class;
      rho : double;
      theta : double;
      threshold : int;
      minLineLength : double;
      maxLineGap : double);  -- /usr/local/include/opencv2/imgproc.hpp:1147
   pragma Import (CPP, HoughLinesP, "_ZN2cv11HoughLinesPERKNS_11_InputArrayERKNS_12_OutputArrayEddidd");

   procedure HoughCircles
     (image : opencv2_core_mat_hpp.InputArray'Class;
      circles : opencv2_core_mat_hpp.OutputArray'Class;
      method : int;
      dp : double;
      minDist : double;
      param1 : double;
      param2 : double;
      minRadius : int;
      maxRadius : int);  -- /usr/local/include/opencv2/imgproc.hpp:1152
   pragma Import (CPP, HoughCircles, "_ZN2cv12HoughCirclesERKNS_11_InputArrayERKNS_12_OutputArrayEiddddii");

   procedure erode
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      kernel : opencv2_core_mat_hpp.InputArray'Class;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      iterations : int;
      borderType : int;
      borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar);  -- /usr/local/include/opencv2/imgproc.hpp:1158
   pragma Import (CPP, erode, "_ZN2cv5erodeERKNS_11_InputArrayERKNS_12_OutputArrayES2_NS_6Point_IiEEiiRKNS_7Scalar_IdEE");

   procedure dilate
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      kernel : opencv2_core_mat_hpp.InputArray'Class;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      iterations : int;
      borderType : int;
      borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar);  -- /usr/local/include/opencv2/imgproc.hpp:1164
   pragma Import (CPP, dilate, "_ZN2cv6dilateERKNS_11_InputArrayERKNS_12_OutputArrayES2_NS_6Point_IiEEiiRKNS_7Scalar_IdEE");

   procedure morphologyEx
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      op : int;
      kernel : opencv2_core_mat_hpp.InputArray'Class;
      anchor : opencv2_core_types_hpp.Class_Point.Point;
      iterations : int;
      borderType : int;
      borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar);  -- /usr/local/include/opencv2/imgproc.hpp:1170
   pragma Import (CPP, morphologyEx, "_ZN2cv12morphologyExERKNS_11_InputArrayERKNS_12_OutputArrayEiS2_NS_6Point_IiEEiiRKNS_7Scalar_IdEE");

   procedure resize
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      dsize : opencv2_core_types_hpp.Class_Size.Size;
      fx : double;
      fy : double;
      interpolation : int);  -- /usr/local/include/opencv2/imgproc.hpp:1177
   pragma Import (CPP, resize, "_ZN2cv6resizeERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Size_IiEEddi");

   procedure warpAffine
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      M : opencv2_core_mat_hpp.InputArray'Class;
      dsize : opencv2_core_types_hpp.Class_Size.Size;
      flags : int;
      borderMode : int;
      borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar);  -- /usr/local/include/opencv2/imgproc.hpp:1182
   pragma Import (CPP, warpAffine, "_ZN2cv10warpAffineERKNS_11_InputArrayERKNS_12_OutputArrayES2_NS_5Size_IiEEiiRKNS_7Scalar_IdEE");

   procedure warpPerspective
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      M : opencv2_core_mat_hpp.InputArray'Class;
      dsize : opencv2_core_types_hpp.Class_Size.Size;
      flags : int;
      borderMode : int;
      borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar);  -- /usr/local/include/opencv2/imgproc.hpp:1189
   pragma Import (CPP, warpPerspective, "_ZN2cv15warpPerspectiveERKNS_11_InputArrayERKNS_12_OutputArrayES2_NS_5Size_IiEEiiRKNS_7Scalar_IdEE");

   procedure remap
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      map1 : opencv2_core_mat_hpp.InputArray'Class;
      map2 : opencv2_core_mat_hpp.InputArray'Class;
      interpolation : int;
      borderMode : int;
      borderValue : access constant opencv2_core_types_hpp.Class_Scalar.Scalar);  -- /usr/local/include/opencv2/imgproc.hpp:1196
   pragma Import (CPP, remap, "_ZN2cv5remapERKNS_11_InputArrayERKNS_12_OutputArrayES2_S2_iiRKNS_7Scalar_IdEE");

   procedure convertMaps
     (map1 : opencv2_core_mat_hpp.InputArray'Class;
      map2 : opencv2_core_mat_hpp.InputArray'Class;
      dstmap1 : opencv2_core_mat_hpp.OutputArray'Class;
      dstmap2 : opencv2_core_mat_hpp.OutputArray'Class;
      dstmap1type : int;
      nninterpolation : Extensions.bool);  -- /usr/local/include/opencv2/imgproc.hpp:1202
   pragma Import (CPP, convertMaps, "_ZN2cv11convertMapsERKNS_11_InputArrayES2_RKNS_12_OutputArrayES5_ib");

   function getRotationMatrix2D
     (center : opencv2_core_types_hpp.Class_Point2f.Point2f;
      angle : double;
      scale : double) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/imgproc.hpp:1207
   pragma Import (CPP, getRotationMatrix2D, "_ZN2cv19getRotationMatrix2DENS_6Point_IfEEdd");

   function getPerspectiveTransform (src : access constant opencv2_core_types_hpp.Class_Point2f.Point2f; dst : access constant opencv2_core_types_hpp.Class_Point2f.Point2f) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/imgproc.hpp:1210
   pragma Import (CPP, getPerspectiveTransform, "_ZN2cv23getPerspectiveTransformEPKNS_6Point_IfEES3_");

   function getAffineTransform (src : access constant opencv2_core_types_hpp.Class_Point2f.Point2f; dst : access constant opencv2_core_types_hpp.Class_Point2f.Point2f) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/imgproc.hpp:1213
   pragma Import (CPP, getAffineTransform, "_ZN2cv18getAffineTransformEPKNS_6Point_IfEES3_");

   procedure invertAffineTransform (M : opencv2_core_mat_hpp.InputArray'Class; iM : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1216
   pragma Import (CPP, invertAffineTransform, "_ZN2cv21invertAffineTransformERKNS_11_InputArrayERKNS_12_OutputArrayE");

   function getPerspectiveTransform (src : opencv2_core_mat_hpp.InputArray'Class; dst : opencv2_core_mat_hpp.InputArray'Class) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/imgproc.hpp:1218
   pragma Import (CPP, getPerspectiveTransform, "_ZN2cv23getPerspectiveTransformERKNS_11_InputArrayES2_");

   function getAffineTransform (src : opencv2_core_mat_hpp.InputArray'Class; dst : opencv2_core_mat_hpp.InputArray'Class) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/imgproc.hpp:1220
   pragma Import (CPP, getAffineTransform, "_ZN2cv18getAffineTransformERKNS_11_InputArrayES2_");

   procedure getRectSubPix
     (image : opencv2_core_mat_hpp.InputArray'Class;
      patchSize : opencv2_core_types_hpp.Class_Size.Size;
      center : opencv2_core_types_hpp.Class_Point2f.Point2f;
      patch : opencv2_core_mat_hpp.OutputArray'Class;
      patchType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1223
   pragma Import (CPP, getRectSubPix, "_ZN2cv13getRectSubPixERKNS_11_InputArrayENS_5Size_IiEENS_6Point_IfEERKNS_12_OutputArrayEi");

   procedure integral
     (src : opencv2_core_mat_hpp.InputArray'Class;
      sum : opencv2_core_mat_hpp.OutputArray'Class;
      sdepth : int);  -- /usr/local/include/opencv2/imgproc.hpp:1227
   pragma Import (CPP, integral, "_ZN2cv8integralERKNS_11_InputArrayERKNS_12_OutputArrayEi");

   procedure integral
     (src : opencv2_core_mat_hpp.InputArray'Class;
      sum : opencv2_core_mat_hpp.OutputArray'Class;
      sqsum : opencv2_core_mat_hpp.OutputArray'Class;
      sdepth : int);  -- /usr/local/include/opencv2/imgproc.hpp:1230
   pragma Import (CPP, integral, "_ZN2cv8integralERKNS_11_InputArrayERKNS_12_OutputArrayES5_i");

   procedure integral
     (src : opencv2_core_mat_hpp.InputArray'Class;
      sum : opencv2_core_mat_hpp.OutputArray'Class;
      sqsum : opencv2_core_mat_hpp.OutputArray'Class;
      tilted : opencv2_core_mat_hpp.OutputArray'Class;
      sdepth : int);  -- /usr/local/include/opencv2/imgproc.hpp:1234
   pragma Import (CPP, integral, "_ZN2cv8integralERKNS_11_InputArrayERKNS_12_OutputArrayES5_S5_i");

   procedure accumulate
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.InputOutputArray'Class;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1239
   pragma Import (CPP, accumulate, "_ZN2cv10accumulateERKNS_11_InputArrayERKNS_12_OutputArrayES2_");

   procedure accumulateSquare
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.InputOutputArray'Class;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1243
   pragma Import (CPP, accumulateSquare, "_ZN2cv16accumulateSquareERKNS_11_InputArrayERKNS_12_OutputArrayES2_");

   procedure accumulateProduct
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.InputOutputArray'Class;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1246
   pragma Import (CPP, accumulateProduct, "_ZN2cv17accumulateProductERKNS_11_InputArrayES2_RKNS_12_OutputArrayES2_");

   procedure accumulateWeighted
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.InputOutputArray'Class;
      alpha : double;
      mask : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1250
   pragma Import (CPP, accumulateWeighted, "_ZN2cv18accumulateWeightedERKNS_11_InputArrayERKNS_12_OutputArrayEdS2_");

   function phaseCorrelate
     (src1 : opencv2_core_mat_hpp.InputArray'Class;
      src2 : opencv2_core_mat_hpp.InputArray'Class;
      window : opencv2_core_mat_hpp.InputArray'Class;
      response : access double) return opencv2_core_types_hpp.Point2d;  -- /usr/local/include/opencv2/imgproc.hpp:1253
   pragma Import (CPP, phaseCorrelate, "_ZN2cv14phaseCorrelateERKNS_11_InputArrayES2_S2_Pd");

   procedure createHanningWindow
     (dst : opencv2_core_mat_hpp.OutputArray'Class;
      winSize : opencv2_core_types_hpp.Class_Size.Size;
      c_type : int);  -- /usr/local/include/opencv2/imgproc.hpp:1256
   pragma Import (CPP, createHanningWindow, "_ZN2cv19createHanningWindowERKNS_12_OutputArrayENS_5Size_IiEEi");

   function threshold
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      thresh : double;
      maxval : double;
      c_type : int) return double;  -- /usr/local/include/opencv2/imgproc.hpp:1259
   pragma Import (CPP, threshold, "_ZN2cv9thresholdERKNS_11_InputArrayERKNS_12_OutputArrayEddi");

   procedure adaptiveThreshold
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      maxValue : double;
      adaptiveMethod : int;
      thresholdType : int;
      blockSize : int;
      C : double);  -- /usr/local/include/opencv2/imgproc.hpp:1264
   pragma Import (CPP, adaptiveThreshold, "_ZN2cv17adaptiveThresholdERKNS_11_InputArrayERKNS_12_OutputArrayEdiiid");

   procedure pyrDown
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      dstsize : access constant opencv2_core_types_hpp.Class_Size.Size;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1269
   pragma Import (CPP, pyrDown, "_ZN2cv7pyrDownERKNS_11_InputArrayERKNS_12_OutputArrayERKNS_5Size_IiEEi");

   procedure pyrUp
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      dstsize : access constant opencv2_core_types_hpp.Class_Size.Size;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1273
   pragma Import (CPP, pyrUp, "_ZN2cv5pyrUpERKNS_11_InputArrayERKNS_12_OutputArrayERKNS_5Size_IiEEi");

   procedure buildPyramid
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArrayOfArrays'Class;
      maxlevel : int;
      borderType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1277
   pragma Import (CPP, buildPyramid, "_ZN2cv12buildPyramidERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   procedure undistort
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      cameraMatrix : opencv2_core_mat_hpp.InputArray'Class;
      distCoeffs : opencv2_core_mat_hpp.InputArray'Class;
      newCameraMatrix : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1281
   pragma Import (CPP, undistort, "_ZN2cv9undistortERKNS_11_InputArrayERKNS_12_OutputArrayES2_S2_S2_");

   procedure initUndistortRectifyMap
     (cameraMatrix : opencv2_core_mat_hpp.InputArray'Class;
      distCoeffs : opencv2_core_mat_hpp.InputArray'Class;
      R : opencv2_core_mat_hpp.InputArray'Class;
      newCameraMatrix : opencv2_core_mat_hpp.InputArray'Class;
      the_size : opencv2_core_types_hpp.Class_Size.Size;
      m1type : int;
      map1 : opencv2_core_mat_hpp.OutputArray'Class;
      map2 : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1287
   pragma Import (CPP, initUndistortRectifyMap, "_ZN2cv23initUndistortRectifyMapERKNS_11_InputArrayES2_S2_S2_NS_5Size_IiEEiRKNS_12_OutputArrayES7_");

   function initWideAngleProjMap
     (cameraMatrix : opencv2_core_mat_hpp.InputArray'Class;
      distCoeffs : opencv2_core_mat_hpp.InputArray'Class;
      imageSize : opencv2_core_types_hpp.Class_Size.Size;
      destImageWidth : int;
      m1type : int;
      map1 : opencv2_core_mat_hpp.OutputArray'Class;
      map2 : opencv2_core_mat_hpp.OutputArray'Class;
      projType : int;
      alpha : double) return float;  -- /usr/local/include/opencv2/imgproc.hpp:1292
   pragma Import (CPP, initWideAngleProjMap, "_ZN2cv20initWideAngleProjMapERKNS_11_InputArrayES2_NS_5Size_IiEEiiRKNS_12_OutputArrayES7_id");

   function getDefaultNewCameraMatrix
     (cameraMatrix : opencv2_core_mat_hpp.InputArray'Class;
      imgsize : opencv2_core_types_hpp.Class_Size.Size;
      centerPrincipalPoint : Extensions.bool) return opencv2_core_mat_hpp.Class_Mat.Mat;  -- /usr/local/include/opencv2/imgproc.hpp:1298
   pragma Import (CPP, getDefaultNewCameraMatrix, "_ZN2cv25getDefaultNewCameraMatrixERKNS_11_InputArrayENS_5Size_IiEEb");

   procedure undistortPoints
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      cameraMatrix : opencv2_core_mat_hpp.InputArray'Class;
      distCoeffs : opencv2_core_mat_hpp.InputArray'Class;
      R : opencv2_core_mat_hpp.InputArray'Class;
      P : opencv2_core_mat_hpp.InputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1302
   pragma Import (CPP, undistortPoints, "_ZN2cv15undistortPointsERKNS_11_InputArrayERKNS_12_OutputArrayES2_S2_S2_S2_");

   procedure calcHist
     (images : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      nimages : int;
      channels : access int;
      mask : opencv2_core_mat_hpp.InputArray'Class;
      hist : opencv2_core_mat_hpp.OutputArray'Class;
      dims : int;
      histSize : access int;
      ranges : System.Address;
      uniform : Extensions.bool;
      accumulate : Extensions.bool);  -- /usr/local/include/opencv2/imgproc.hpp:1307
   pragma Import (CPP, calcHist, "_ZN2cv8calcHistEPKNS_3MatEiPKiRKNS_11_InputArrayERKNS_12_OutputArrayEiS4_PPKfbb");

   procedure calcHist
     (images : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      nimages : int;
      channels : access int;
      mask : opencv2_core_mat_hpp.InputArray'Class;
      hist : access opencv2_core_mat_hpp.Class_SparseMat.SparseMat;
      dims : int;
      histSize : access int;
      ranges : System.Address;
      uniform : Extensions.bool;
      accumulate : Extensions.bool);  -- /usr/local/include/opencv2/imgproc.hpp:1313
   pragma Import (CPP, calcHist, "_ZN2cv8calcHistEPKNS_3MatEiPKiRKNS_11_InputArrayERNS_9SparseMatEiS4_PPKfbb");

   procedure calcHist
     (images : opencv2_core_mat_hpp.InputArrayOfArrays'Class;
      channels : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      mask : opencv2_core_mat_hpp.InputArray'Class;
      hist : opencv2_core_mat_hpp.OutputArray'Class;
      histSize : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      ranges : System.Address;
      accumulate : Extensions.bool);  -- /usr/local/include/opencv2/imgproc.hpp:1319
   pragma Import (CPP, calcHist, "_ZN2cv8calcHistERKNS_11_InputArrayERKSt6vectorIiSaIiEES2_RKNS_12_OutputArrayES7_RKS3_IfSaIfEEb");

   procedure calcBackProject
     (images : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      nimages : int;
      channels : access int;
      hist : opencv2_core_mat_hpp.InputArray'Class;
      backProject : opencv2_core_mat_hpp.OutputArray'Class;
      ranges : System.Address;
      scale : double;
      uniform : Extensions.bool);  -- /usr/local/include/opencv2/imgproc.hpp:1327
   pragma Import (CPP, calcBackProject, "_ZN2cv15calcBackProjectEPKNS_3MatEiPKiRKNS_11_InputArrayERKNS_12_OutputArrayEPPKfdb");

   procedure calcBackProject
     (images : access constant opencv2_core_mat_hpp.Class_Mat.Mat;
      nimages : int;
      channels : access int;
      hist : access constant opencv2_core_mat_hpp.Class_SparseMat.SparseMat;
      backProject : opencv2_core_mat_hpp.OutputArray'Class;
      ranges : System.Address;
      scale : double;
      uniform : Extensions.bool);  -- /usr/local/include/opencv2/imgproc.hpp:1333
   pragma Import (CPP, calcBackProject, "_ZN2cv15calcBackProjectEPKNS_3MatEiPKiRKNS_9SparseMatERKNS_12_OutputArrayEPPKfdb");

   procedure calcBackProject
     (images : opencv2_core_mat_hpp.InputArrayOfArrays'Class;
      channels : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector;
      hist : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      ranges : System.Address;
      scale : double);  -- /usr/local/include/opencv2/imgproc.hpp:1338
   pragma Import (CPP, calcBackProject, "_ZN2cv15calcBackProjectERKNS_11_InputArrayERKSt6vectorIiSaIiEES2_RKNS_12_OutputArrayERKS3_IfSaIfEEd");

   function compareHist
     (H1 : opencv2_core_mat_hpp.InputArray'Class;
      H2 : opencv2_core_mat_hpp.InputArray'Class;
      method : int) return double;  -- /usr/local/include/opencv2/imgproc.hpp:1344
   pragma Import (CPP, compareHist, "_ZN2cv11compareHistERKNS_11_InputArrayES2_i");

   function compareHist
     (H1 : access constant opencv2_core_mat_hpp.Class_SparseMat.SparseMat;
      H2 : access constant opencv2_core_mat_hpp.Class_SparseMat.SparseMat;
      method : int) return double;  -- /usr/local/include/opencv2/imgproc.hpp:1347
   pragma Import (CPP, compareHist, "_ZN2cv11compareHistERKNS_9SparseMatES2_i");

   procedure equalizeHist (src : opencv2_core_mat_hpp.InputArray'Class; dst : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1350
   pragma Import (CPP, equalizeHist, "_ZN2cv12equalizeHistERKNS_11_InputArrayERKNS_12_OutputArrayE");

   function EMD
     (signature1 : opencv2_core_mat_hpp.InputArray'Class;
      signature2 : opencv2_core_mat_hpp.InputArray'Class;
      distType : int;
      cost : opencv2_core_mat_hpp.InputArray'Class;
      lowerBound : access float;
      flow : opencv2_core_mat_hpp.OutputArray'Class) return float;  -- /usr/local/include/opencv2/imgproc.hpp:1352
   pragma Import (CPP, EMD, "_ZN2cv3EMDERKNS_11_InputArrayES2_iS2_PfRKNS_12_OutputArrayE");

   procedure watershed (image : opencv2_core_mat_hpp.InputArray'Class; markers : opencv2_core_mat_hpp.InputOutputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1357
   pragma Import (CPP, watershed, "_ZN2cv9watershedERKNS_11_InputArrayERKNS_12_OutputArrayE");

   procedure pyrMeanShiftFiltering
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      sp : double;
      sr : double;
      maxLevel : int;
      termcrit : opencv2_core_types_hpp.Class_TermCriteria.TermCriteria);  -- /usr/local/include/opencv2/imgproc.hpp:1360
   pragma Import (CPP, pyrMeanShiftFiltering, "_ZN2cv21pyrMeanShiftFilteringERKNS_11_InputArrayERKNS_12_OutputArrayEddiNS_12TermCriteriaE");

   procedure grabCut
     (img : opencv2_core_mat_hpp.InputArray'Class;
      mask : opencv2_core_mat_hpp.InputOutputArray'Class;
      the_rect : opencv2_core_types_hpp.Class_Rect.Rect;
      bgdModel : opencv2_core_mat_hpp.InputOutputArray'Class;
      fgdModel : opencv2_core_mat_hpp.InputOutputArray'Class;
      iterCount : int;
      mode : int);  -- /usr/local/include/opencv2/imgproc.hpp:1365
   pragma Import (CPP, grabCut, "_ZN2cv7grabCutERKNS_11_InputArrayERKNS_12_OutputArrayENS_5Rect_IiEES5_S5_ii");

   procedure distanceTransform
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      labels : opencv2_core_mat_hpp.OutputArray'Class;
      distanceType : int;
      maskSize : int;
      labelType : int);  -- /usr/local/include/opencv2/imgproc.hpp:1371
   pragma Import (CPP, distanceTransform, "_ZN2cv17distanceTransformERKNS_11_InputArrayERKNS_12_OutputArrayES5_iii");

   procedure distanceTransform
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      distanceType : int;
      maskSize : int);  -- /usr/local/include/opencv2/imgproc.hpp:1376
   pragma Import (CPP, distanceTransform, "_ZN2cv17distanceTransformERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   function floodFill
     (image : opencv2_core_mat_hpp.InputOutputArray'Class;
      seedPoint : opencv2_core_types_hpp.Class_Point.Point;
      newVal : opencv2_core_types_hpp.Class_Scalar.Scalar;
      the_rect : access opencv2_core_types_hpp.Class_Rect.Rect;
      loDiff : opencv2_core_types_hpp.Class_Scalar.Scalar;
      upDiff : opencv2_core_types_hpp.Class_Scalar.Scalar;
      flags : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:1381
   pragma Import (CPP, floodFill, "_ZN2cv9floodFillERKNS_12_OutputArrayENS_6Point_IiEENS_7Scalar_IdEEPNS_5Rect_IiEES6_S6_i");

   function floodFill
     (image : opencv2_core_mat_hpp.InputOutputArray'Class;
      mask : opencv2_core_mat_hpp.InputOutputArray'Class;
      seedPoint : opencv2_core_types_hpp.Class_Point.Point;
      newVal : opencv2_core_types_hpp.Class_Scalar.Scalar;
      the_rect : access opencv2_core_types_hpp.Class_Rect.Rect;
      loDiff : opencv2_core_types_hpp.Class_Scalar.Scalar;
      upDiff : opencv2_core_types_hpp.Class_Scalar.Scalar;
      flags : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:1387
   pragma Import (CPP, floodFill, "_ZN2cv9floodFillERKNS_12_OutputArrayES2_NS_6Point_IiEENS_7Scalar_IdEEPNS_5Rect_IiEES6_S6_i");

   procedure cvtColor
     (src : opencv2_core_mat_hpp.InputArray'Class;
      dst : opencv2_core_mat_hpp.OutputArray'Class;
      code : int;
      dstCn : int);  -- /usr/local/include/opencv2/imgproc.hpp:1393
   pragma Import (CPP, cvtColor, "_ZN2cv8cvtColorERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   procedure demosaicing
     (u_src : opencv2_core_mat_hpp.InputArray'Class;
      u_dst : opencv2_core_mat_hpp.OutputArray'Class;
      code : int;
      dcn : int);  -- /usr/local/include/opencv2/imgproc.hpp:1396
   pragma Import (CPP, demosaicing, "_ZN2cv11demosaicingERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   function moments (c_array : opencv2_core_mat_hpp.InputArray'Class; binaryImage : Extensions.bool) return opencv2_core_types_hpp.Class_Moments.Moments;  -- /usr/local/include/opencv2/imgproc.hpp:1399
   pragma Import (CPP, moments, "_ZN2cv7momentsERKNS_11_InputArrayEb");

   procedure HuMoments (moments : access constant opencv2_core_types_hpp.Class_Moments.Moments; hu : access double);  -- /usr/local/include/opencv2/imgproc.hpp:1402
   pragma Import (CPP, HuMoments, "_ZN2cv9HuMomentsERKNS_7MomentsEPd");

   procedure HuMoments (m : access constant opencv2_core_types_hpp.Class_Moments.Moments; hu : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1404
   pragma Import (CPP, HuMoments, "_ZN2cv9HuMomentsERKNS_7MomentsERKNS_12_OutputArrayE");

   procedure matchTemplate
     (image : opencv2_core_mat_hpp.InputArray'Class;
      templ : opencv2_core_mat_hpp.InputArray'Class;
      result : opencv2_core_mat_hpp.OutputArray'Class;
      method : int);  -- /usr/local/include/opencv2/imgproc.hpp:1407
   pragma Import (CPP, matchTemplate, "_ZN2cv13matchTemplateERKNS_11_InputArrayES2_RKNS_12_OutputArrayEi");

   function connectedComponents
     (image : opencv2_core_mat_hpp.InputArray'Class;
      labels : opencv2_core_mat_hpp.OutputArray'Class;
      connectivity : int;
      ltype : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:1417
   pragma Import (CPP, connectedComponents, "_ZN2cv19connectedComponentsERKNS_11_InputArrayERKNS_12_OutputArrayEii");

   function connectedComponentsWithStats
     (image : opencv2_core_mat_hpp.InputArray'Class;
      labels : opencv2_core_mat_hpp.OutputArray'Class;
      stats : opencv2_core_mat_hpp.OutputArray'Class;
      centroids : opencv2_core_mat_hpp.OutputArray'Class;
      connectivity : int;
      ltype : int) return int;  -- /usr/local/include/opencv2/imgproc.hpp:1420
   pragma Import (CPP, connectedComponentsWithStats, "_ZN2cv28connectedComponentsWithStatsERKNS_11_InputArrayERKNS_12_OutputArrayES5_S5_ii");

   procedure findContours
     (image : opencv2_core_mat_hpp.InputOutputArray'Class;
      contours : opencv2_core_mat_hpp.OutputArrayOfArrays'Class;
      hierarchy : opencv2_core_mat_hpp.OutputArray'Class;
      mode : int;
      method : int;
      offset : opencv2_core_types_hpp.Class_Point.Point);  -- /usr/local/include/opencv2/imgproc.hpp:1426
   pragma Import (CPP, findContours, "_ZN2cv12findContoursERKNS_12_OutputArrayES2_S2_iiNS_6Point_IiEE");

   procedure findContours
     (image : opencv2_core_mat_hpp.InputOutputArray'Class;
      contours : opencv2_core_mat_hpp.OutputArrayOfArrays'Class;
      mode : int;
      method : int;
      offset : opencv2_core_types_hpp.Class_Point.Point);  -- /usr/local/include/opencv2/imgproc.hpp:1431
   pragma Import (CPP, findContours, "_ZN2cv12findContoursERKNS_12_OutputArrayES2_iiNS_6Point_IiEE");

   procedure approxPolyDP
     (curve : opencv2_core_mat_hpp.InputArray'Class;
      approxCurve : opencv2_core_mat_hpp.OutputArray'Class;
      epsilon : double;
      closed : Extensions.bool);  -- /usr/local/include/opencv2/imgproc.hpp:1435
   pragma Import (CPP, approxPolyDP, "_ZN2cv12approxPolyDPERKNS_11_InputArrayERKNS_12_OutputArrayEdb");

   function arcLength (curve : opencv2_core_mat_hpp.InputArray'Class; closed : Extensions.bool) return double;  -- /usr/local/include/opencv2/imgproc.hpp:1440
   pragma Import (CPP, arcLength, "_ZN2cv9arcLengthERKNS_11_InputArrayEb");

   function boundingRect (points : opencv2_core_mat_hpp.InputArray'Class) return opencv2_core_types_hpp.Class_Rect.Rect;  -- /usr/local/include/opencv2/imgproc.hpp:1443
   pragma Import (CPP, boundingRect, "_ZN2cv12boundingRectERKNS_11_InputArrayE");

   function contourArea (contour : opencv2_core_mat_hpp.InputArray'Class; oriented : Extensions.bool) return double;  -- /usr/local/include/opencv2/imgproc.hpp:1446
   pragma Import (CPP, contourArea, "_ZN2cv11contourAreaERKNS_11_InputArrayEb");

   function minAreaRect (points : opencv2_core_mat_hpp.InputArray'Class) return opencv2_core_types_hpp.Class_RotatedRect.RotatedRect;  -- /usr/local/include/opencv2/imgproc.hpp:1449
   pragma Import (CPP, minAreaRect, "_ZN2cv11minAreaRectERKNS_11_InputArrayE");

   procedure boxPoints (box : opencv2_core_types_hpp.Class_RotatedRect.RotatedRect; points : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1452
   pragma Import (CPP, boxPoints, "_ZN2cv9boxPointsENS_11RotatedRectERKNS_12_OutputArrayE");

   procedure minEnclosingCircle
     (points : opencv2_core_mat_hpp.InputArray'Class;
      center : access opencv2_core_types_hpp.Class_Point2f.Point2f;
      radius : access float);  -- /usr/local/include/opencv2/imgproc.hpp:1455
   pragma Import (CPP, minEnclosingCircle, "_ZN2cv18minEnclosingCircleERKNS_11_InputArrayERNS_6Point_IfEERf");

   function matchShapes
     (contour1 : opencv2_core_mat_hpp.InputArray'Class;
      contour2 : opencv2_core_mat_hpp.InputArray'Class;
      method : int;
      parameter : double) return double;  -- /usr/local/include/opencv2/imgproc.hpp:1459
   pragma Import (CPP, matchShapes, "_ZN2cv11matchShapesERKNS_11_InputArrayES2_id");

   procedure convexHull
     (points : opencv2_core_mat_hpp.InputArray'Class;
      hull : opencv2_core_mat_hpp.OutputArray'Class;
      clockwise : Extensions.bool;
      returnPoints : Extensions.bool);  -- /usr/local/include/opencv2/imgproc.hpp:1463
   pragma Import (CPP, convexHull, "_ZN2cv10convexHullERKNS_11_InputArrayERKNS_12_OutputArrayEbb");

   procedure convexityDefects
     (contour : opencv2_core_mat_hpp.InputArray'Class;
      convexhull : opencv2_core_mat_hpp.InputArray'Class;
      convexityDefects : opencv2_core_mat_hpp.OutputArray'Class);  -- /usr/local/include/opencv2/imgproc.hpp:1467
   pragma Import (CPP, convexityDefects, "_ZN2cv16convexityDefectsERKNS_11_InputArrayES2_RKNS_12_OutputArrayE");

   function isContourConvex (contour : opencv2_core_mat_hpp.InputArray'Class) return Extensions.bool;  -- /usr/local/include/opencv2/imgproc.hpp:1470
   pragma Import (CPP, isContourConvex, "_ZN2cv15isContourConvexERKNS_11_InputArrayE");

   function intersectConvexConvex
     (u_p1 : opencv2_core_mat_hpp.InputArray'Class;
      u_p2 : opencv2_core_mat_hpp.InputArray'Class;
      u_p12 : opencv2_core_mat_hpp.OutputArray'Class;
      handleNested : Extensions.bool) return float;  -- /usr/local/include/opencv2/imgproc.hpp:1473
   pragma Import (CPP, intersectConvexConvex, "_ZN2cv21intersectConvexConvexERKNS_11_InputArrayES2_RKNS_12_OutputArrayEb");

   function fitEllipse (points : opencv2_core_mat_hpp.InputArray'Class) return opencv2_core_types_hpp.Class_RotatedRect.RotatedRect;  -- /usr/local/include/opencv2/imgproc.hpp:1477
   pragma Import (CPP, fitEllipse, "_ZN2cv10fitEllipseERKNS_11_InputArrayE");

   procedure fitLine
     (points : opencv2_core_mat_hpp.InputArray'Class;
      line : opencv2_core_mat_hpp.OutputArray'Class;
      distType : int;
      param : double;
      reps : double;
      aeps : double);  -- /usr/local/include/opencv2/imgproc.hpp:1480
   pragma Import (CPP, fitLine, "_ZN2cv7fitLineERKNS_11_InputArrayERKNS_12_OutputArrayEiddd");

   function pointPolygonTest
     (contour : opencv2_core_mat_hpp.InputArray'Class;
      pt : opencv2_core_types_hpp.Class_Point2f.Point2f;
      measureDist : Extensions.bool) return double;  -- /usr/local/include/opencv2/imgproc.hpp:1484
   pragma Import (CPP, pointPolygonTest, "_ZN2cv16pointPolygonTestERKNS_11_InputArrayENS_6Point_IfEEb");

   function createCLAHE (clipLimit : double; tileGridSize : opencv2_core_types_hpp.Class_Size.Size) return opencv2_core_cvstd_hpp.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1486
   pragma Import (CPP, createCLAHE, "_ZN2cv11createCLAHEEdNS_5Size_IiEE");

   function createGeneralizedHoughBallard return opencv2_core_cvstd_hpp.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1490
   pragma Import (CPP, createGeneralizedHoughBallard, "_ZN2cv29createGeneralizedHoughBallardEv");

   function createGeneralizedHoughGuil return opencv2_core_cvstd_hpp.Ptr;  -- /usr/local/include/opencv2/imgproc.hpp:1494
   pragma Import (CPP, createGeneralizedHoughGuil, "_ZN2cv26createGeneralizedHoughGuilEv");

end opencv2_imgproc_hpp;
