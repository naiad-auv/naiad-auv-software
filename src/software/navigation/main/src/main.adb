with Ada.Real_Time;
with Ada.Text_IO;

with Navigation.Dispatcher;
with Navigation.Thrusters;

with Math.Matrices;
with Math.Vectors;
with Math.Angles;

procedure Main is
   use Ada.Real_Time;
   use Math.Matrices;
   use Math.Vectors;

   fDeltaTime : float := 0.0;
   xTimeStart : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   xTimeStop : Ada.Real_Time.Time;

   tfThrusterValues : Navigation.Thrusters.TThrusterValuesArray;
   pxDispatcher : Navigation.Dispatcher.pCDispatcher;

   xPosition : Math.Vectors.CVector;
   xWantedPosition : Math.Vectors.CVector;
   xVectorChanger : Math.Vectors.CVector;

   xOrientation : Math.Matrices.CMatrix;
   xWantedOrientation : Math.Matrices.CMatrix;
   xMatrixMultiplier : Math.Matrices.CMatrix;
begin

   xPosition := Math.Vectors.xCreate(fX => 5.0,
                                     fY => 0.0,
                                     fZ => 0.0);
   xWantedPosition := Math.Vectors.xCreate(fX => 15.0,
                                           fY => 0.0,
                                           fZ => 0.0);
   xVectorChanger := Math.Vectors.xCreate(fX => 1.0,
                                           fY => 5.0,
                                           fZ => 7.0);
   xOrientation := Math.Matrices.xCreate_Rotation_Around_X_Axis(tfAngleInDegrees => Math.Angles.TAngle(45.0));
   xWantedOrientation := Math.Matrices.xCreate_Rotation_Around_X_Axis(tfAngleInDegrees => Math.Angles.TAngle(50.0));
   xMatrixMultiplier := Math.Matrices.xCreate_Rotation_Around_Y_Axis(tfAngleInDegrees => Math.Angles.TAngle(5.0));
   pxDispatcher := Navigation.Dispatcher.pxCreate;

      pxDispatcher.Update_Current_Absolute_Position(xNewCurrentAbsolutePosition => xPosition);
      pxDispatcher.Update_Wanted_Absolute_Position(xNewWantedAbsolutePosition => xWantedPosition);
      pxDispatcher.Update_Current_Absolute_Orientation(xNewCurrentAbsoluteOrientation => xOrientation);
      pxDispatcher.Update_Wanted_Absolute_Orientation(xNewWantedAbsoluteOrientation => xWantedOrientation);


   loop


      xTimeStop := Ada.Real_Time.Clock;
      fDeltaTime := float(Ada.Real_Time.To_Duration(xTimeStop - xTimeStart));

      if fDeltaTime >= 0.1 then
         pxDispatcher.Get_Thruster_Values(fDeltaTime => float(Ada.Real_Time.To_Duration(xTimeStop - xTimeStart)),
                                          tfValues   => tfThrusterValues);

         Ada.Text_IO.Put_Line(fDeltaTime'Img);

         xOrientation := xOrientation * xMatrixMultiplier;
         xWantedOrientation := xWantedOrientation * xMatrixMultiplier;
         xPosition := xPosition + xVectorChanger;
         xWantedPosition := xWantedPosition + xVectorChanger;

         pxDispatcher.Update_Current_Absolute_Position(xNewCurrentAbsolutePosition => xPosition);
         pxDispatcher.Update_Wanted_Absolute_Position(xNewWantedAbsolutePosition => xWantedPosition);
         pxDispatcher.Update_Current_Absolute_Orientation(xNewCurrentAbsoluteOrientation => xOrientation);
         pxDispatcher.Update_Wanted_Absolute_Orientation(xNewWantedAbsoluteOrientation => xWantedOrientation);

         xTimeStart := xTimeStop;
      end if;

   end loop;

end Main;
