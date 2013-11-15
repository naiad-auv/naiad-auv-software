---------------------------------------------------------------------------
-- This code tests how much time it takes to execute the INS update cycle.

-- Rewritten by Nils Brynedal Ignell  and Daniel Lindqvist for the Naiad AUV project
-- Last changed (yyyy-mm-dd): 2013-11-12

---------------------------------------------------------------------------

with My_Memcpy;
with My_Secondary_Stack;
with My_Last_Chance_Handler;

with Digital_IO;

--with Math.Vectors;
--with Math.Matrices;
--use Math.Matrices;

with test;

procedure Ins_Test is
   pragma Suppress (All_Checks);



--     xOrientationMatrix : Math.Matrices.CMatrix;
--
--     xOrientationMatrixInverse : Math.Matrices.CMatrix;
--     xRelativeAccelerationVector : math.Vectors.CVector;
--     xFixedAccelerationVector : math.Vectors.CVector;
   --     xFixedVelocityVector : math.Vectors.CVector := math.Vectors.xCreate(0.0,0.0,0.0);
--     xFixedVelocityVector : math.Vectors.CVector;

--     xFixedPositionVector : math.Vectors.CVector := math.Vectors.xCreate(0.0,0.0,0.0);
--     fDeltaTime : float := 0.01;
--
   bOut : Boolean := true;


  my_test_var : test.my_type := test.xCreate(fX => 0.0,
                                                 fY => 0.0,
                                                 fZ => 0.0);

begin

   Digital_IO.Make_Output_Pin(1);
   Digital_IO.Set_Pin(1);

   declare
--        my_test_var : test.my_type;
--        my_test_var1 : test.my_type;

--      xRelativeAccelerationVector : math.Vectors.CVector;
   begin

      Digital_IO.Make_Output_Pin(2);
      Digital_IO.Set_Pin(2);


     -- xRelativeAccelerationVector := math.Vectors.xCreate(0.0,0.0,0.0);
   end;

--     xOrientationMatrix := Math.Matrices.xCreate_Rotation_Around_X_Axis(25.0);
--       * Math.Matrices.xCreate_Rotation_Around_Y_Axis(25.0)
--       * Math.Matrices.xCreate_Rotation_Around_Z_Axis(25.0);
--
--     xRelativeAccelerationVector := math.Vectors.xCreate(13.1,10.2,-5.3);

   loop

      if bOut then
         Digital_IO.Set_Pin(1);
         bOut := false;
      else
         Digital_IO.Clear_Pin(1);
         bOut := true;
      end if;



      -- xOrientationMatrixInverse := xOrientationMatrix.xGet_Inverse;
--        xFixedAccelerationVector := xOrientationMatrixInverse * xRelativeAccelerationVector;
--
--        -- xFixedVelocityVector := xFixedVelocityVector +
--        --xFixedAccelerationVector * fDeltaTime;
--
--        xFixedVelocityVector :=  Math.Vectors."+"(xFixedVelocityVector,
--                                                  math.Vectors."*"(xFixedAccelerationVector, fDeltaTime));
--
--        xFixedPositionVector :=  Math.Vectors."+"(xFixedPositionVector,
--                                                  math.Vectors."*"(xFixedVelocityVector, fDeltaTime));
      --        xFixedPositionVector := xFixedPositionVector +
      --          xFixedVelocityVector * fDeltaTime;
   end loop;

--     null;

end Ins_Test;



