package body simulator.Motion_Control_Wrapper is

   -----------------------------
   -- pxInitialize_Dispatcher --
   -----------------------------


   function pxCreate_Wrap_Dispatcher return pCWrapDispatcher is
      pxWrapper : pCWrapDispatcher;
    begin
      pxWrapper := new CWrapDispatcher;
      pxWrapper.pxDispatcher := navigation.Dispatcher.pxCreate;

      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.X,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.Y,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.Z,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.RotationX,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.RotationY,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.RotationZ,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.DriftX,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.DriftY,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.DriftZ,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxWantedPositionVector:=math.Vectors.xCreate(0.0,0.0,0.0).pxGet_Allocated_Copy;
      pxWrapper.pxWantedOrientationMatrix:= math.Matrices.xCreate_Identity.pxGet_Allocated_Copy;

      return pxWrapper;

   end pxCreate_Wrap_Dispatcher;

   ---------------------
   -- pxUpdate_Values --
   ---------------------

   procedure Update_Values
     (this : in out CWrapDispatcher;
      xNewCurrentAbsolutePosition : in math.Vectors.CVector;
      xNewCurrentOrientation : in math.Matrices.CMatrix;
      tfMotorValuesSubmarine : out simulator.submarine.TMotorForce ;
      fDeltaTime : in float) is

      tfMotorValuesTThrustesValuesArray : navigation.Thrusters.TThrusterValuesArray;
   begin
      this.pxDispatcher.Update_Current_Absolute_Position(xNewCurrentAbsolutePosition);
      this.pxDispatcher.Update_Current_Absolute_Orientation(xNewCurrentOrientation);

      tfMotorValuesTThrustesValuesArray := this.pxDispatcher.tfGet_Thruster_Values(fDeltaTime => fDeltaTime);

      tfMotorValuesSubmarine(1) := tfMotorValuesTThrustesValuesArray(1)*6.8*9.82*0.01;
      tfMotorValuesSubmarine(2) := tfMotorValuesTThrustesValuesArray(2)*6.8*9.82*0.01;
      tfMotorValuesSubmarine(3) := tfMotorValuesTThrustesValuesArray(3)*6.8*9.82*0.01;
      tfMotorValuesSubmarine(4) := tfMotorValuesTThrustesValuesArray(4)*6.8*9.82*0.01;
      tfMotorValuesSubmarine(5) := tfMotorValuesTThrustesValuesArray(5)*6.8*9.82*0.01;
      tfMotorValuesSubmarine(6) := tfMotorValuesTThrustesValuesArray(6)*6.8*9.82*0.01;

   end Update_Values;


   ------------------------------
   -- Update_Wanted_Position --
   ------------------------------

   procedure Update_Wanted_Position (this : in out CWrapDispatcher;
                                     xWantedPosition : in math.Vectors.CVector ;
                                     xWantedOrientation : in math.Matrices.CMatrix) is

   begin
      this.pxWantedPositionVector.Copy_From(xWantedPosition);
      this.pxWantedOrientationMatrix.Copy_From(xWantedOrientation);

      this.pxDispatcher.Update_Wanted_Absolute_Position(xWantedPosition);
      this.pxDispatcher.Update_Wanted_Absolute_Orientation(xWantedOrientation);
   end Update_Wanted_Position;

   function xGet_Wanted_Position(this : in CWrapDispatcher) return math.Vectors.CVector is

   begin
     return this.pxWantedPositionVector.all;
   end xGet_Wanted_Position;

   function xGet_Wanted_Orientation(this : in CWrapDispatcher) return math.Matrices.CMatrix is

   begin
      return this.pxWantedOrientationMatrix.all;
   end xGet_Wanted_Orientation;

   procedure Update_Pid_Scaling(this : in CWrapDispatcher ; xComponentScaling : TPIDComponentScalings; eComponentToScale : EMotionComponent) is

   begin
      this.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => navigation.Motion_Component.EMotionComponent(eComponentToScale),
                                                       xNewPIDSCalings    => navigation.PID_Controller.TPIDComponentScalings(xComponentScaling));

   end Update_Pid_Scaling;


   procedure Restart(this : in out CWrapDispatcher) is
   begin
      Navigation.Dispatcher.Free(pxDispatcherToDeallocate => this.pxDispatcher);
      this.pxDispatcher := Navigation.Dispatcher.pxCreate;
      this.pxDispatcher.Update_Wanted_Absolute_Position(xNewWantedAbsolutePosition => this.pxWantedPositionVector.all);
      this.pxDispatcher.Update_Wanted_Absolute_Orientation(xNewWantedAbsoluteOrientation => this.pxWantedOrientationMatrix.all);
   end Restart;




end simulator.Motion_Control_Wrapper;
