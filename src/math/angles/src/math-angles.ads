with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;

package Math.Angles is

   type TAngle is new float range -180.0 .. 180.0;
   --  <summary>Angle in degrees in range [-180.0, 180.0].</summary>

   function fGet_Angle_Degrees_In_Range(fAngle : in float; fRangeFromExclusive : in float) return float;
   --  <summary>Returns an angle in degrees in range (fRangeFromExclusive, fRangeFromExcluse+360].</summary>
   --  <parameter name="fAngle">The angle in degrees to convert.</parameter>
   --  <parameter name="fRangeFromExcluse">The start of the range, the returned value will always be higher than this parameter.</parameter>
   --  <seealso>fGet_Angle_Radians_In_Range</seealso>


   function fGet_Angle_Radians_In_Range(fAngle : in float; fRangeFromExclusive : in float) return float;
   --  <summary>Returns an angle in radians in range (fRangeFromExclusive, fRangeFromExcluse+2Pi].</summary>
   --  <parameter name="fAngle">The angle in radians to convert.</parameter>
   --  <parameter name="fRangeFromExcluse">The start of the range, the returned value will always be higher than this parameter.</parameter>
   --  <seealso>fGet_Angle_Degrees_In_Range</seealso>

   function fRadians_To_Degrees (fAngle : in float) return float;
   --  <summary>Returns fAngle converted from radians to degrees.</summary>
   --  <parameter name="fAngle">The angle in radians to convert.</parameter>
   --  <seealso>fDegrees_To_Radians</seealso>

   function fDegrees_To_Radians (fAngle : in float) return float;
   --  <summary>Returns fAngle converted from degrees to radians.</summary>
   --  <parameter name="fAngle">The angle in degrees to convert.</parameter>
   --  <seealso>fRadians_To_Degrees</seealso>

   function fTAngle_To_FAngle (tfAngle : in TAngle) return float;
   --  <summary>Returns tfAngle converted from TAngle to float. The returned angle will be in range [-180.0, 180.0].</summary>
   --  <parameter name="tfAngle">The TAngle to convert to float.</parameter>
   --  <seealso>tfFAngle_To_TAngle</seealso>

   function tfFAngle_To_TAngle (fAngle : in float) return TAngle;
   --  <summary>Returns fAngle converted from float to TAngle. The returned angle will be in range (-180.0, 180.0].</summary>
   --  <parameter name="fAngle">The angle to convert to TAngle.</parameter>
   --  <seealso>fTAngle_To_FAngle</seealso>

end Math.Angles;
