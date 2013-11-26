

package body Math.Angles is

   function fGet_Angle_Degrees_In_Range
     (fAngle : in float;
      fRangeFromExclusive : in float)
      return float
   is
      fNewAngle : float;
   begin
      fNewAngle := fAngle;
      while fNewAngle <= fRangeFromExclusive loop
         fNewAngle := fNewAngle + 360.0;
      end loop;
      while fNewAngle > (fRangeFromExclusive + 360.0) loop
         fNewAngle := fNewAngle - 360.0;
      end loop;
      return fNewAngle;
   end fGet_Angle_Degrees_In_Range;

   function fGet_Angle_Radians_In_Range
     (fAngle : in float;
      fRangeFromExclusive : in float)
      return float
   is
      fNewAngle : float;
   begin
      fNewAngle := fAngle;
      while fNewAngle <= fRangeFromExclusive loop
         fNewAngle := fNewAngle + (2.0 * Math.Elementary.Pi);
      end loop;
      while fNewAngle > (fRangeFromExclusive + (2.0 * Math.Elementary.Pi)) loop
         fNewAngle := fNewAngle - (2.0 * Math.Elementary.Pi);
      end loop;
      return fNewAngle;
   end fGet_Angle_Radians_In_Range;


   function fRadians_To_Degrees (fAngle : in float) return float is
   begin
      return (fAngle * 180.0) / Math.Elementary.Pi;
   end fRadians_To_Degrees;


   function fDegrees_To_Radians (fAngle : in float) return float is
   begin
      return (fAngle * Math.Elementary.Pi) / 180.0;
   end fDegrees_To_Radians;

   function fTAngle_To_FAngle (tfAngle : in TAngle) return float is
   begin
      return float(tfAngle);
   end fTAngle_To_FAngle;

   function tfFAngle_To_TAngle (fAngle : in float) return TAngle is
   begin
      return TAngle(Math.Angles.fGet_Angle_Degrees_In_Range(fAngle              => fAngle,
                                                     fRangeFromExclusive => -180.0));
   end tfFAngle_To_TAngle;



end Math.Angles;
