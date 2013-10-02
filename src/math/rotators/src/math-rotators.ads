
package Math.Rotators is

   type CRotator is tagged private;
   type pCRotator is access CRotator;

   type TAngle is new float range -180.0 .. 180.0;

   function pxCreate(fYaw : in float; fPitch : in float; fRoll : in float) return pCRotator;

   function "+" (pxLeftOperandRotator : in pCRotator; pxRightOperandRotator : in pCRotator) return pCRotator;
   function "-" (pxLeftOperandRotator : in pCRotator; pxRightOperandRotator : in pCRotator) return pCRotator;

   function tfGet_Yaw (this : in CRotator) return TAngle;
   function tfGet_Pitch (this : in CRotator) return TAngle;
   function tfGet_Roll (this : in CRotator) return TAngle;

private
   function fGet_Angle_In_Range(fAngle : in float; fRangeFrom : in float) return float;
   type CRotator is tagged
      record
         tfYaw : TAngle;
         tfPitch : TAngle;
         tfRoll : TAngle;
      end record;
end Math.Rotators;
