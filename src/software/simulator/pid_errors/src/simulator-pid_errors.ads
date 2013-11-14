with Math.Matrices;
with math.Quaternions;
with math.Planes;
with math.Angles;
with math.Vectors;
with Navigation.Motion_Component;

package Simulator.Pid_Errors is

   type CPidErrors is tagged private;
   type pCPidErrors is access CPidErrors;
   type EMotionComponent is new Navigation.Motion_Component.EMotionComponent;
   type TPIDErrors is array (PositionX .. RotationZ) of float;

   function pxCreate return pCPidErrors;
   procedure Free(pxPidErrors: in out pCPidErrors);
   procedure Update_Errors (this : in out CPidErrors ; xCurrentAbsolutePosition : math.Vectors.CVector ; xWantedAbsolutePosition : math.Vectors.CVector ; xCurrentAbsoluteOrientation : math.Matrices.CMatrix; xWantedAbsoluteOrientation : math.Matrices.CMatrix);
   function tGet_PID_Errors(this : in CPidErrors) return TPIDErrors;





private

   procedure Update_Current_Positional_Errors(this : in out CPidErrors ; xWantedAbsolutePosition : math.Vectors.CVector ; xCurrentAbsolutePosition : math.Vectors.CVector; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) ;
   procedure Update_Current_Z_Rotation_Error (this : in out CPidErrors; xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix);
   procedure Update_Current_Y_Rotation_Error (this : in out CPidErrors; xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix);
   procedure Update_Current_X_Rotation_Error (this : in out CPidErrors; xWantedAbsoluteOrientation : math.Matrices.CMatrix ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix);

   type CPidErrors is tagged
      record
         tfPIDErrors : TPIDErrors := (others => 0.0);
      end record;


end Simulator.Pid_Errors;
