--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into simulator.Motion_Control_Wrapper.CWrapDispatcher_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with math.Vectors; use Math.Vectors;
with math.Matrices; use math.Matrices;
with ada.Text_IO; use ada.Text_IO;
with Navigation.Dispatcher;use Navigation.Dispatcher;

package body simulator.Motion_Control_Wrapper.CWrapDispatcher_Test_Data.CWrapDispatcher_Tests is

type TArrayOfPidScalings is array (X .. DriftZ) of simulator.Motion_Control_Wrapper.TPIDComponentScalings;

--  begin read only
   procedure Test_Update_Pid_Scaling (Gnattest_T : in out Test_CWrapDispatcher);
   procedure Test_Update_Pid_Scaling_b06b9e (Gnattest_T : in out Test_CWrapDispatcher) renames Test_Update_Pid_Scaling;
--  id:2.1/b06b9e1a2872346d/Update_Pid_Scaling/1/0/
   procedure Test_Update_Pid_Scaling (Gnattest_T : in out Test_CWrapDispatcher) is
   --  simulator-motion_control_wrapper.ads:23:4:Update_Pid_Scaling
--  end read only

      pragma Unreferenced (Gnattest_T);



      pxWrapDispatcher : simulator.Motion_Control_Wrapper.pCWrapDispatcher;
      xWantedOrientation : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(15.7);

      xWantedPosition : math.Vectors.CVector := math.Vectors.xCreate(1.0,0.0,0.0);
      tForce : simulator.submarine.TMotorForce;

      txPidScalings : TArrayOfPidScalings;
   begin
      pxWrapDispatcher := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;

      txPidScalings(X) :=(0.1,0.2,0.5);
      txPidScalings(Y) :=(0.3,0.6,0.7);
      txPidScalings(Z) :=(0.8,0.9,1.0);
      txPidScalings(Plane) :=(1.1,1.2,1.5);
      txPidScalings(Direction) :=(1.3,1.4,1.6);
      txPidScalings(DriftX) :=(1.7,1.8,1.9);
      txPidScalings(DriftY) :=(2.0,2.1,2.2);
      txPidScalings(DriftZ) :=(2.3,2.4,2.5);

      for i in simulator.Motion_Control_Wrapper.EMotionComponent(X) .. simulator.Motion_Control_Wrapper.EMotionComponent(DriftZ) loop
               pxWrapDispatcher.Update_Pid_Scaling(xComponentScaling => txPidScalings(i),
                                                   eComponentToScale => i);
      end loop;
      pxWrapDispatcher.Update_Wanted_Position(xWantedPosition    => xWantedPosition,
                                              xWantedOrientation => math.Matrices.xCreate_Identity);
      pxWrapDispatcher.Update_Values(xNewCurrentAbsolutePosition => math.Vectors.xCreate(0.0,0.0,0.0),
                                     xNewCurrentOrientation      => math.Matrices.xCreate_Identity,
                                     tfMotorValuesSubmarine      => tForce,
                                     fDeltaTime                  => 1.0);
      Aunit.Assertions.Assert(Condition => tForce(1)=-tForce(3),
                              Message   => "Simulator.Motion_Control_Wrapper.Update_Pid_Scalings failed, faulty force after initiating values on pid scalings");


--  begin read only
   end Test_Update_Pid_Scaling;
--  end read only


--  begin read only
   procedure Test_Update_Values (Gnattest_T : in out Test_CWrapDispatcher);
   procedure Test_Update_Values_909a4a (Gnattest_T : in out Test_CWrapDispatcher) renames Test_Update_Values;
--  id:2.1/909a4a9d6247e7fa/Update_Values/1/0/
   procedure Test_Update_Values (Gnattest_T : in out Test_CWrapDispatcher) is
   --  simulator-motion_control_wrapper.ads:25:4:Update_Values
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxWrapDispatcher : simulator.Motion_Control_Wrapper.pCWrapDispatcher := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;
      xNewCurrentAbsolutePosition : math.Vectors.CVector;
      xNewCurrentOrientation : math.Matrices.CMatrix;
      tfMotorValuesSubmarine : simulator.submarine.TMotorForce;
      fDeltaTime : float;
      txPidScalings : TArrayOfPidScalings;
   begin
      pxWrapDispatcher := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;

      txPidScalings(X) :=(0.1,0.2,0.5);
      txPidScalings(Y) :=(0.3,0.6,0.7);
      txPidScalings(Z) :=(0.8,0.9,1.0);
      txPidScalings(Plane) :=(1.1,1.2,1.5);
      txPidScalings(Direction) :=(1.3,1.4,1.6);
      txPidScalings(DriftX) :=(1.7,1.8,1.9);
      txPidScalings(DriftY) :=(2.0,2.1,2.2);
      txPidScalings(DriftZ) :=(2.3,2.4,2.5);

      for i in simulator.Motion_Control_Wrapper.EMotionComponent(X) .. simulator.Motion_Control_Wrapper.EMotionComponent(DriftZ) loop
               pxWrapDispatcher.Update_Pid_Scaling(xComponentScaling => txPidScalings(i),
                                                   eComponentToScale => i);
      end loop;
      xNewCurrentAbsolutePosition := math.Vectors.xCreate(0.0,0.0,0.0);
      xNewCurrentOrientation := math.Matrices.xCreate_Identity;
      fDeltaTime := 0.1;
      pxWrapDispatcher.Update_Wanted_Position(xWantedPosition    => math.Vectors.xCreate(1.0,0.0,0.0),
                                              xWantedOrientation => math.Matrices.xCreate_Identity);
      pxWrapDispatcher.Update_Values(xNewCurrentAbsolutePosition, xNewCurrentOrientation, tfMotorValuesSubmarine,fDeltaTime);

      Put_Line("Value Motor 1: " & tfMotorValuesSubmarine(1)'img);
      Put_Line("Value Motor 2: " & tfMotorValuesSubmarine(2)'img);
      Put_Line("Value Motor 3: " & tfMotorValuesSubmarine(3)'img);
      Put_Line("Value Motor 4: " & tfMotorValuesSubmarine(4)'img);
      Put_Line("Value Motor 5: " & tfMotorValuesSubmarine(5)'img);
      Put_Line("Value Motor 6: " & tfMotorValuesSubmarine(6)'img);



      AUnit.Assertions.Assert(tfMotorValuesSubmarine(1)=-tfMotorValuesSubmarine(3),
                              "Simulator.Motion_Control_Wrapper.Update_Values Failed, MotorValues Wrong");
      AUnit.Assertions.Assert(tfMotorValuesSubmarine(2)=0.0,
                              "Simulator.Motion_Control_Wrapper.Update_Values Failed, MotorValues Wrong");
      AUnit.Assertions.Assert(tfMotorValuesSubmarine(4)=0.0,
                              "Simulator.Motion_Control_Wrapper.Update_Values Failed, MotorValues Wrong");
      AUnit.Assertions.Assert(tfMotorValuesSubmarine(5)=0.0,
                              "Simulator.Motion_Control_Wrapper.Update_Values Failed, MotorValues Wrong");
      AUnit.Assertions.Assert(tfMotorValuesSubmarine(6)=0.0,
                              "Simulator.Motion_Control_Wrapper.Update_Values Failed, MotorValues Wrong");

--  begin read only
   end Test_Update_Values;
--  end read only


--  begin read only
   procedure Test_Restart (Gnattest_T : in out Test_CWrapDispatcher);
   procedure Test_Restart_f94679 (Gnattest_T : in out Test_CWrapDispatcher) renames Test_Restart;
--  id:2.1/f94679263193296f/Restart/1/0/
   procedure Test_Restart (Gnattest_T : in out Test_CWrapDispatcher) is
   --  simulator-motion_control_wrapper.ads:32:4:Restart
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxWrapDispatcher : simulator.Motion_Control_Wrapper.pCWrapDispatcher := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;
      pxWrapClone : navigation.Dispatcher.pCDispatcher := pxWrapDispatcher.pxDispatcher;
   begin
      pxWrapDispatcher.Restart;
      AUnit.Assertions.Assert(pxWrapDispatcher.pxDispatcher = pxWrapClone,
                              "Simulator.Motion_Control_Wrapper.Restart failed, not creating a new dispatcher");


--  begin read only
   end Test_Restart;
--  end read only


--  begin read only
   procedure Test_Update_Wanted_Position (Gnattest_T : in out Test_CWrapDispatcher);
   procedure Test_Update_Wanted_Position_4e7de4 (Gnattest_T : in out Test_CWrapDispatcher) renames Test_Update_Wanted_Position;
--  id:2.1/4e7de4cb72f3de71/Update_Wanted_Position/1/0/
   procedure Test_Update_Wanted_Position (Gnattest_T : in out Test_CWrapDispatcher) is
   --  simulator-motion_control_wrapper.ads:33:4:Update_Wanted_Position
--  end read only
      pragma Unreferenced (Gnattest_T);
      pxWrapDispatcher : simulator.Motion_Control_Wrapper.pCWrapDispatcher;
      xWantedPosition : math.Vectors.CVector := math.Vectors.xCreate(1.0,2.1,0.7);
      xWantedOrientation : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(15.7);
   begin
      pxWrapDispatcher := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;
      pxWrapDispatcher.Update_Wanted_Position(xWantedPosition => xWantedPosition,xWantedOrientation => xWantedOrientation);
      AUnit.Assertions.Assert(pxWrapDispatcher.pxWantedPositionVector.all = xWantedPosition,
                              "Simulator.Motion_Control_Wrapper.UpdateWantedPosition Failed, Faulty value copying");
      --  begin read only
   end Test_Update_Wanted_Position;
--  end read only



--  begin read only
   procedure Test_xGet_Wanted_Position (Gnattest_T : in out Test_CWrapDispatcher);
   procedure Test_xGet_Wanted_Position_f355f1 (Gnattest_T : in out Test_CWrapDispatcher) renames Test_xGet_Wanted_Position;
--  id:2.1/f355f11f223a0795/xGet_Wanted_Position/1/0/
   procedure Test_xGet_Wanted_Position (Gnattest_T : in out Test_CWrapDispatcher) is
   --  simulator-motion_control_wrapper.ads:36:4:xGet_Wanted_Position
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxWrapDispatcher : simulator.Motion_Control_Wrapper.pCWrapDispatcher := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;
      xPositionVector : math.Vectors.CVector := math.Vectors.xCreate(4.1,3.6,1.2);
   begin
      pxWrapDispatcher.pxWantedPositionVector := xPositionVector.pxGet_Allocated_Copy;
      Aunit.Assertions.Assert(pxWrapDispatcher.xGet_Wanted_Position=xPositionVector,
                              "Simulator.Motion_Control_Wrapper.xGet_Wanted_Position Failed, Faulty position vector");



--  begin read only
   end Test_xGet_Wanted_Position;
--  end read only





--  begin read only
   procedure Test_xGet_Wanted_Orientation (Gnattest_T : in out Test_CWrapDispatcher);
   procedure Test_xGet_Wanted_Orientation_a3ab5f (Gnattest_T : in out Test_CWrapDispatcher) renames Test_xGet_Wanted_Orientation;
--  id:2.1/a3ab5f87e0138aef/xGet_Wanted_Orientation/1/0/
   procedure Test_xGet_Wanted_Orientation (Gnattest_T : in out Test_CWrapDispatcher) is
   --  simulator-motion_control_wrapper.ads:37:4:xGet_Wanted_Orientation
--  end read only

      pragma Unreferenced (Gnattest_T);
      pxWrapDispatcher : simulator.Motion_Control_Wrapper.pCWrapDispatcher := simulator.Motion_Control_Wrapper.pxCreate_Wrap_Dispatcher;
      xOrientationMatrix : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_X_Axis(30.4);
   begin
      pxWrapDispatcher.pxWantedOrientationMatrix := xOrientationMatrix.pxGet_Allocated_Copy;
      Aunit.Assertions.Assert(pxWrapDispatcher.xGet_Wanted_Orientation=xOrientationMatrix,
                              "Simulator.Motion_Control_Wrapper.xGet_Orientation Failed, Faulty orientation matrix");
--  begin read only
   end Test_xGet_Wanted_Orientation;
--  end read only

end simulator.Motion_Control_Wrapper.CWrapDispatcher_Test_Data.CWrapDispatcher_Tests;
