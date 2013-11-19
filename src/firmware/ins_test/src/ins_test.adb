---------------------------------------------------------------------------
-- This code tests how much time it takes to execute the INS update cycle.

-- Rewritten by Nils Brynedal Ignell  and Daniel Lindqvist for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-19

---------------------------------------------------------------------------

with My_Secondary_Stack;
with My_Last_Chance_Handler;
with My_Memcpy;

with Digital_IO;

--  with Math.Elementary;
 with Math.Vectors;
with Math.Matrices;
use Math.Matrices;


procedure Ins_Test is
   pragma Suppress (All_Checks);



   xOrientationMatrix : Math.Matrices.CMatrix;

   xOrientationMatrixInverse : Math.Matrices.CMatrix;
   xRelativeAccelerationVector : math.Vectors.CVector;
   xFixedAccelerationVector : math.Vectors.CVector;
   xFixedVelocityVector : math.Vectors.CVector := math.Vectors.xCreate(0.0,0.0,0.0);
   xFixedPositionVector : math.Vectors.CVector := math.Vectors.xCreate(0.0,0.0,0.0);
   fDeltaTime : float := 0.01;

   bOut : Boolean := false;

begin

   Digital_IO.Make_Output_Pin(0);

   xOrientationMatrix := Math.Matrices.xCreate_Rotation_Around_X_Axis(25.0)
     * Math.Matrices.xCreate_Rotation_Around_Y_Axis(25.0)
     * Math.Matrices.xCreate_Rotation_Around_Z_Axis(25.0);

   xRelativeAccelerationVector := math.Vectors.xCreate(13.1,10.2,-5.3);

   loop
      bOut := not bOut;
      if bOut then
         Digital_IO.Set_Pin(0);
      else
         Digital_IO.Clear_Pin(0);
      end if;

      xOrientationMatrixInverse := xOrientationMatrix.xGet_Inverse;
      xFixedAccelerationVector := xOrientationMatrixInverse * xRelativeAccelerationVector;

      -- xFixedVelocityVector := xFixedVelocityVector +
      --xFixedAccelerationVector * fDeltaTime;

      xFixedVelocityVector :=  Math.Vectors."+"(xFixedVelocityVector,
                                                math.Vectors."*"(xFixedAccelerationVector, fDeltaTime));

      xFixedPositionVector :=  Math.Vectors."+"(xFixedPositionVector,
                                                math.Vectors."*"(xFixedVelocityVector, fDeltaTime));
      --        xFixedPositionVector := xFixedPositionVector +
      --          xFixedVelocityVector * fDeltaTime;
   end loop;

--     null;

end Ins_Test;



