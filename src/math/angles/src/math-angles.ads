with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;

package Math.Angles is

   type TAngle is new float range -180.0 .. 180.0;
   --  <summary>Angle in degrees ranging from -180.0 to 180.0.</summary>

   function fGet_Angle_Degrees_In_Range(fAngle : in float; fRangeFromExclusive : in float) return float;
   function fGet_Angle_Radians_In_Range(fAngle : in float; fRangeFromExclusive : in float) return float;
   function fRadians_To_Degrees (fAngle : in float) return float;
   function fDegrees_To_Radians (fAngle : in float) return float;
   function fTAngle_To_FAngle (tfAngle : in TAngle) return float;
   function tfFAngle_To_TAngle (fAngle : in float) return TAngle;

end Math.Angles;
