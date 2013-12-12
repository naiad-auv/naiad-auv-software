with Ada.Real_Time;
with Ada.Text_IO;
with Ada.Float_Text_IO;

with MotionControl.Dispatcher;
with MotionControl.Thrusters;

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
   xTimeSpan : Ada.Real_Time.Time_Span := Ada.Real_Time.Time_Span_Zero;
   iSeconds : integer;
   iMilliSeconds : integer;
   iMicroSeconds : integer;
   iNanoSeconds : integer;

   tfThrusterValues : MotionControl.Thrusters.TThrusterValuesArray;
   pxDispatcher : MotionControl.Dispatcher.pCDispatcher;

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
   pxDispatcher := MotionControl.Dispatcher.pxCreate;

      pxDispatcher.Update_Current_Absolute_Position(xNewCurrentAbsolutePosition => xPosition);
      pxDispatcher.Update_Wanted_Absolute_Position(xNewWantedAbsolutePosition => xWantedPosition);
      pxDispatcher.Update_Current_Absolute_Orientation(xNewCurrentAbsoluteOrientation => xOrientation);
      pxDispatcher.Update_Wanted_Absolute_Orientation(xNewWantedAbsoluteOrientation => xWantedOrientation);


   loop


      xTimeStop := Ada.Real_Time.Clock;
      xTimeSpan := xTimeSpan + (xTimeStop - xTimeStart);

      iSeconds := xTimeSpan / Ada.Real_Time.Seconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Seconds(1) * iSeconds);

      iMilliSeconds := xTimeSpan / Ada.Real_Time.Milliseconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Milliseconds(1) * iMilliSeconds);

      iMicroSeconds := xTimeSpan / Ada.Real_Time.Microseconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Microseconds(1) * iMicroSeconds);

      iNanoSeconds := xTimeSpan / Ada.Real_Time.Nanoseconds(1);
      xTimeSpan := xTimeSpan - (Ada.Real_Time.Nanoseconds(1) * iNanoSeconds);

      fDeltaTime := fDeltaTime + float(iSeconds) + (float(iMilliSeconds) * 0.001) + (float(iMicroSeconds) * 0.000001) +
        (float(iNanoSeconds) * 0.000000001);

      if fDeltaTime >= 0.1 then
         pxDispatcher.Get_Thruster_Values(fDeltaTime => fDeltaTime,
                                          tfValues   => tfThrusterValues);

         Ada.Text_IO.Put_Line("Time in seconds since last iteration: ");
         Ada.Float_Text_IO.Put(fDeltaTime, AFT=>18, EXP=>0);
         Ada.Text_IO.New_Line;

         xOrientation := xOrientation * xMatrixMultiplier;
         xWantedOrientation := xWantedOrientation * xMatrixMultiplier;
         xPosition := xPosition + xVectorChanger;
         xWantedPosition := xWantedPosition + xVectorChanger;

         pxDispatcher.Update_Current_Absolute_Position(xNewCurrentAbsolutePosition => xPosition);
         pxDispatcher.Update_Wanted_Absolute_Position(xNewWantedAbsolutePosition => xWantedPosition);
         pxDispatcher.Update_Current_Absolute_Orientation(xNewCurrentAbsoluteOrientation => xOrientation);
         pxDispatcher.Update_Wanted_Absolute_Orientation(xNewWantedAbsoluteOrientation => xWantedOrientation);

         xTimeStart := xTimeStop;
         fDeltaTime := fDeltaTime - 0.1;
      end if;
   end loop;

end Main;
