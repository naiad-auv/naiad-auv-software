with Math.Matrices;
with math.Quaternions;
with math.Planes;
with math.Angles;
with math.Vectors;
with simulator.Model;
with motioncontrol.Motion_Component;


package Simulator.Pid_Errors is

   type EMotionComponent is new simulator.Model.EMotionComponent;

   subtype EMotionComponentPosAndOrientation is EMotionComponent range PositionX .. RotationZ;
   type TPIDErrors is array (PositionX .. RotationZ) of float;

   function fCalculate_Error_Component (eErrorComponent : EMotionComponentPosAndOrientation ; xCurrentAbsolutePosition : math.Vectors.CVector ; xWantedAbsolutePosition : math.Vectors.CVector ; xCurrentAbsoluteOrientation : math.Matrices.CMatrix; xWantedAbsoluteOrientation : math.Matrices.CMatrix) return float;





private


   subtype EmotionComponentPosition is EMotionComponent range PositionX .. PositionZ;
   function fCalculate_Current_Positional_Errors(ePositionComponent : EmotionComponentPosition; xWantedAbsolutePosition : math.Vectors.CVector ; xCurrentAbsolutePosition : math.Vectors.CVector; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) return float;
   function fCalculate_Current_Z_Rotation_Error (xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) return float;
   function fCalculate_Current_Y_Rotation_Error (xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) return float;
   function fCalculate_Current_X_Rotation_Error (xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) return float;



end Simulator.Pid_Errors;
