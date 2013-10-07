pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Extensions;
with stddef_h;
limited with cpp_4_7_4_bits_stl_vector_h;

package opencv2_core_types_hpp is

   --  skipped empty struct Complexf

   --  skipped empty struct Complexd

   type Point_u;
   subtype Point2i is Point_u;

   type Point_u;
   subtype Point2f is Point_u;

   --  skipped empty struct Point2d

   subtype Point is Point_u;

   --  skipped empty struct Point3i

   --  skipped empty struct Point3f

   --  skipped empty struct Point3d

   type Size_u;
   subtype Size2i is Size_u;

   type Size_u;
   subtype Size2f is Size_u;

   subtype Size is Size_u;

   type Rect_u;
   subtype Rect is Rect_u;

   package Class_RotatedRect is
      type RotatedRect is limited record
         center : aliased Point2f;  -- /usr/local/include/opencv2/core/types.hpp:397
         size : aliased Size2f;  -- /usr/local/include/opencv2/core/types.hpp:398
         angle : aliased float;  -- /usr/local/include/opencv2/core/types.hpp:399
      end record;
      pragma Import (CPP, RotatedRect);

      function New_RotatedRect return RotatedRect;  -- /usr/local/include/opencv2/core/types.hpp:1539
      pragma CPP_Constructor (New_RotatedRect, "_ZN2cv11RotatedRectC1Ev");

      function New_RotatedRect
        (u_center : System.Address;
         u_size : System.Address;
         u_angle : float) return RotatedRect;  -- /usr/local/include/opencv2/core/types.hpp:1543
      pragma CPP_Constructor (New_RotatedRect, "_ZN2cv11RotatedRectC1ERKNS_6Point_IfEERKNS_5Size_IfEEf");

      procedure points (this : access constant RotatedRect; pts : access Point2f);  -- /usr/local/include/opencv2/core/types.hpp:393
      pragma Import (CPP, points, "_ZNK2cv11RotatedRect6pointsEPNS_6Point_IfEE");

      function boundingRect (this : access constant RotatedRect) return Rect;  -- /usr/local/include/opencv2/core/types.hpp:395
      pragma Import (CPP, boundingRect, "_ZNK2cv11RotatedRect12boundingRectEv");
   end;
   use Class_RotatedRect;
   package Class_c_Range is
      type c_Range is limited record
         start : aliased int;  -- /usr/local/include/opencv2/core/types.hpp:440
         c_end : aliased int;  -- /usr/local/include/opencv2/core/types.hpp:440
      end record;
      pragma Import (CPP, c_Range);

      function operator_as (this : access c_Range; arg2 : access constant c_Range) return access c_Range;  -- /usr/local/include/opencv2/core/types.hpp:431
      pragma Import (CPP, operator_as, "_ZN2cv5RangeaSERKS0_");

      function New_c_Range return c_Range;  -- /usr/local/include/opencv2/core/types.hpp:1551
      pragma CPP_Constructor (New_c_Range, "_ZN2cv5RangeC1Ev");

      function New_c_Range (u_start : int; u_end : int) return c_Range;  -- /usr/local/include/opencv2/core/types.hpp:1555
      pragma CPP_Constructor (New_c_Range, "_ZN2cv5RangeC1Eii");

      function size (this : access constant c_Range) return int;  -- /usr/local/include/opencv2/core/types.hpp:1559
      pragma Import (CPP, size, "_ZNK2cv5Range4sizeEv");

      function empty (this : access constant c_Range) return Extensions.bool;  -- /usr/local/include/opencv2/core/types.hpp:1565
      pragma Import (CPP, empty, "_ZNK2cv5Range5emptyEv");

      function c_all return c_Range;  -- /usr/local/include/opencv2/core/types.hpp:1571
      pragma Import (CPP, c_all, "_ZN2cv5Range3allEv");
   end;
   use Class_c_Range;
   type Scalar_u;
   subtype Scalar is Scalar_u;

   package Class_KeyPoint is
      type KeyPoint is limited record
         pt : aliased Point2f;  -- /usr/local/include/opencv2/core/types.hpp:567
         size : aliased float;  -- /usr/local/include/opencv2/core/types.hpp:568
         angle : aliased float;  -- /usr/local/include/opencv2/core/types.hpp:569
         response : aliased float;  -- /usr/local/include/opencv2/core/types.hpp:572
         octave : aliased int;  -- /usr/local/include/opencv2/core/types.hpp:573
         class_id : aliased int;  -- /usr/local/include/opencv2/core/types.hpp:574
      end record;
      pragma Import (CPP, KeyPoint);

      function New_KeyPoint return KeyPoint;  -- /usr/local/include/opencv2/core/types.hpp:1878
      pragma CPP_Constructor (New_KeyPoint, "_ZN2cv8KeyPointC1Ev");

      function New_KeyPoint
        (u_pt : access Point2f;
         u_size : float;
         u_angle : float;
         u_response : float;
         u_octave : int;
         u_class_id : int) return KeyPoint;  -- /usr/local/include/opencv2/core/types.hpp:1882
      pragma CPP_Constructor (New_KeyPoint, "_ZN2cv8KeyPointC1ENS_6Point_IfEEfffii");

      function New_KeyPoint
        (x : float;
         y : float;
         u_size : float;
         u_angle : float;
         u_response : float;
         u_octave : int;
         u_class_id : int) return KeyPoint;  -- /usr/local/include/opencv2/core/types.hpp:1886
      pragma CPP_Constructor (New_KeyPoint, "_ZN2cv8KeyPointC1Efffffii");

      function hash (this : access constant KeyPoint) return stddef_h.size_t;  -- /usr/local/include/opencv2/core/types.hpp:551
      pragma Import (CPP, hash, "_ZNK2cv8KeyPoint4hashEv");

      procedure convert
        (keypoints : System.Address;
         points2f : System.Address;
         keypointIndexes : access constant cpp_4_7_4_bits_stl_vector_h.Class_vector.vector);  -- /usr/local/include/opencv2/core/types.hpp:554
      pragma Import (CPP, convert, "_ZN2cv8KeyPoint7convertERKSt6vectorIS0_SaIS0_EERS1_INS_6Point_IfEESaIS7_EERKS1_IiSaIiEE");

      procedure convert
        (points2f : System.Address;
         keypoints : System.Address;
         size : float;
         response : float;
         octave : int;
         class_id : int);  -- /usr/local/include/opencv2/core/types.hpp:558
      pragma Import (CPP, convert, "_ZN2cv8KeyPoint7convertERKSt6vectorINS_6Point_IfEESaIS3_EERS1_IS0_SaIS0_EEffii");

      function overlap (kp1 : System.Address; kp2 : System.Address) return float;  -- /usr/local/include/opencv2/core/types.hpp:565
      pragma Import (CPP, overlap, "_ZN2cv8KeyPoint7overlapERKS0_S2_");
   end;
   use Class_KeyPoint;
   package Class_DMatch is
      type DMatch is limited record
         queryIdx : aliased int;  -- /usr/local/include/opencv2/core/types.hpp:611
         trainIdx : aliased int;  -- /usr/local/include/opencv2/core/types.hpp:612
         imgIdx : aliased int;  -- /usr/local/include/opencv2/core/types.hpp:613
         distance : aliased float;  -- /usr/local/include/opencv2/core/types.hpp:615
      end record;
      pragma Import (CPP, DMatch);

      function New_DMatch return DMatch;  -- /usr/local/include/opencv2/core/types.hpp:1894
      pragma CPP_Constructor (New_DMatch, "_ZN2cv6DMatchC1Ev");

      function New_DMatch
        (u_queryIdx : int;
         u_trainIdx : int;
         u_distance : float) return DMatch;  -- /usr/local/include/opencv2/core/types.hpp:1898
      pragma CPP_Constructor (New_DMatch, "_ZN2cv6DMatchC1Eiif");

      function New_DMatch
        (u_queryIdx : int;
         u_trainIdx : int;
         u_imgIdx : int;
         u_distance : float) return DMatch;  -- /usr/local/include/opencv2/core/types.hpp:1902
      pragma CPP_Constructor (New_DMatch, "_ZN2cv6DMatchC1Eiiif");

      function operator_lt (this : access constant DMatch; m : System.Address) return Extensions.bool;  -- /usr/local/include/opencv2/core/types.hpp:1906
      pragma Import (CPP, operator_lt, "_ZNK2cv6DMatchltERKS0_");
   end;
   use Class_DMatch;
   package Class_TermCriteria is
      type TermCriteria is limited record
         c_type : aliased int;  -- /usr/local/include/opencv2/core/types.hpp:663
         maxCount : aliased int;  -- /usr/local/include/opencv2/core/types.hpp:664
         epsilon : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:665
      end record;
      pragma Import (CPP, TermCriteria);

      function New_TermCriteria return TermCriteria;  -- /usr/local/include/opencv2/core/types.hpp:1916
      pragma CPP_Constructor (New_TermCriteria, "_ZN2cv12TermCriteriaC1Ev");

      function New_TermCriteria
        (u_type : int;
         u_maxCount : int;
         u_epsilon : double) return TermCriteria;  -- /usr/local/include/opencv2/core/types.hpp:1920
      pragma CPP_Constructor (New_TermCriteria, "_ZN2cv12TermCriteriaC1Eiid");


   end;
   use Class_TermCriteria;
   package Class_Moments is
      type Moments is limited record
         m00 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:686
         m10 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:686
         m01 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:686
         m20 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:686
         m11 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:686
         m02 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:686
         m30 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:686
         m21 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:686
         m12 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:686
         m03 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:686
         mu20 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:688
         mu11 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:688
         mu02 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:688
         mu30 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:688
         mu21 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:688
         mu12 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:688
         mu03 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:688
         nu20 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:690
         nu11 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:690
         nu02 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:690
         nu30 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:690
         nu21 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:690
         nu12 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:690
         nu03 : aliased double;  -- /usr/local/include/opencv2/core/types.hpp:690
      end record;
      pragma Import (CPP, Moments);

      function New_Moments return Moments;  -- /usr/local/include/opencv2/core/types.hpp:676
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
         m03 : double) return Moments;  -- /usr/local/include/opencv2/core/types.hpp:678
      pragma CPP_Constructor (New_Moments, "_ZN2cv7MomentsC1Edddddddddd");


   end;
   use Class_Moments;
   function operator_eq (r1 : access constant c_Range; r2 : access constant c_Range) return Extensions.bool;  -- /usr/local/include/opencv2/core/types.hpp:1578
   pragma Import (CPP, operator_eq, "_ZN2cveqERKNS_5RangeES2_");

   function operator_ne (r1 : access constant c_Range; r2 : access constant c_Range) return Extensions.bool;  -- /usr/local/include/opencv2/core/types.hpp:1584
   pragma Import (CPP, operator_ne, "_ZN2cvneERKNS_5RangeES2_");

   function operator_u (r : access constant c_Range) return Extensions.bool;  -- /usr/local/include/opencv2/core/types.hpp:1590
   pragma Import (CPP, operator_u, "_ZN2cvntERKNS_5RangeE");

   function operator_a (r1 : access constant c_Range; r2 : access constant c_Range) return c_Range;  -- /usr/local/include/opencv2/core/types.hpp:1596
   pragma Import (CPP, operator_a, "_ZN2cvanERKNS_5RangeES2_");

   function operator_ae (r1 : access c_Range; r2 : access constant c_Range) return access c_Range;  -- /usr/local/include/opencv2/core/types.hpp:1604
   pragma Import (CPP, operator_ae, "_ZN2cvaNERNS_5RangeERKS0_");

   function operator_p (r1 : access constant c_Range; c_delta : int) return c_Range;  -- /usr/local/include/opencv2/core/types.hpp:1611
   pragma Import (CPP, operator_p, "_ZN2cvplERKNS_5RangeEi");

   function operator_p (c_delta : int; r1 : access constant c_Range) return c_Range;  -- /usr/local/include/opencv2/core/types.hpp:1617
   pragma Import (CPP, operator_p, "_ZN2cvplEiRKNS_5RangeE");

   function operator_m (r1 : access constant c_Range; c_delta : int) return c_Range;  -- /usr/local/include/opencv2/core/types.hpp:1623
   pragma Import (CPP, operator_m, "_ZN2cvmiERKNS_5RangeEi");

end opencv2_core_types_hpp;
