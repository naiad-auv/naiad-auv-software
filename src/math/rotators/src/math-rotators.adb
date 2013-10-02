package body Math.Rotators is

   function pxCreate(fYaw : in float; fPitch : in float; fRoll : in float) return pCRotator is
      pxNewRotator : pCRotator;
      tfYaw : TAngle;
      tfPitch : TAngle;
      tfRoll : TAngle;
   begin
      tfYaw := TAngle(fGet_Angle_In_Range(fAngle     => fYaw,
                                          fRangeFrom => -180.0));
      tfPitch := TAngle(fGet_Angle_In_Range(fAngle     => fPitch,
                                            fRangeFrom => -180.0));
      tfRoll := TAngle(fGet_Angle_In_Range(fAngle     => fRoll,
                                           fRangeFrom => -180.0));
      pxNewRotator := new CRotator;
      pxNewRotator.tfYaw := tfYaw;
      pxNewRotator.tfPitch := tfPitch;
      pxNewRotator.tfRoll := tfRoll;
      return pxNewRotator;
   end pxCreate;


   function "+" (pxLeftOperandRotator : in pCRotator; pxRightOperandRotator : in pCRotator) return pCRotator is
      pxSumRotator : pCRotator;
   begin
      pxSumRotator := Math.Rotators.pxCreate(fYaw   => float(pxLeftOperandRotator.tfYaw) + float(pxRightOperandRotator.tfYaw),
                                             fPitch => float(pxLeftOperandRotator.tfPitch) + float(pxRightOperandRotator.tfPitch),
                                             fRoll  => float(pxLeftOperandRotator.tfRoll) + float(pxRightOperandRotator.tfRoll));
      return pxSumRotator;
   end "+";

   function "-" (pxLeftOperandRotator : in pCRotator; pxRightOperandRotator : in pCRotator) return pCRotator is
      pxDifferenceRotator : pCRotator;
   begin
      pxDifferenceRotator := Math.Rotators.pxCreate(fYaw   => float(pxLeftOperandRotator.tfYaw) - float(pxRightOperandRotator.tfYaw),
                                                    fPitch => float(pxLeftOperandRotator.tfPitch) - float(pxRightOperandRotator.tfPitch),
                                                    fRoll  => float(pxLeftOperandRotator.tfRoll) - float(pxRightOperandRotator.tfRoll));
      return pxDifferenceRotator;
   end "-";


   function tfGet_Yaw (this : in CRotator) return TAngle is
   begin
      return this.tfYaw;
   end tfGet_Yaw;

   function tfGet_Pitch (this : in CRotator) return TAngle is
   begin
      return this.tfPitch;
   end tfGet_Pitch;

   function tfGet_Roll (this : in CRotator) return TAngle is
   begin
      return this.tfRoll;
   end tfGet_Roll;



   function fGet_Angle_In_Range(fAngle : in float; fRangeFrom : in float) return float is
      fNewAngle : float;
   begin
      fNewAngle := fAngle;
      while fNewAngle <= fRangeFrom loop
         fNewAngle := fNewAngle + 360.0;
      end loop;
      while fNewAngle > (fRangeFrom + 360.0) loop
         fNewAngle := fNewAngle - 360.0;
      end loop;
      return fNewAngle;
   end fGet_Angle_In_Range;

end Math.Rotators;
