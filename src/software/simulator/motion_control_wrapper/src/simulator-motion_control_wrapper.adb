package body simulator.Motion_Control_Wrapper is

   -----------------------------
   -- pxInitialize_Dispatcher --
   -----------------------------


   function pxCreate_Wrap_Dispatcher return pCWrapDispatcher is
      pxWrapper : pCWrapDispatcher;
    begin
      pxWrapper := new CWrapDispatcher;
      pxWrapper.pxDispatcher := navigation.Dispatcher.pxCreate;

      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.PositionX,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.PositionY,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.PositionZ,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.RotationX,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.RotationY,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.RotationZ,
                                                            xNewPIDSCalings    => (0.0,0.0,0.0));

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

      this.pxDispatcher.Get_Thruster_Values(fDeltaTime => fDeltaTime,
                                            tfValues   => tfMotorValuesTThrustesValuesArray);

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


      this.pxDispatcher.Update_Wanted_Absolute_Position(xWantedPosition);
      this.pxDispatcher.Update_Wanted_Absolute_Orientation(xWantedOrientation);
   end Update_Wanted_Position;

   procedure Update_Pid_Scaling(this : in CWrapDispatcher ; xComponentScaling : TPIDComponentScalings; eComponentToScale : EMotionComponent) is

   begin
      this.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => navigation.Motion_Component.EMotionComponent(eComponentToScale),
                                                       xNewPIDSCalings    => navigation.PID_Controller.TPIDComponentScalings(xComponentScaling));

   end Update_Pid_Scaling;


   procedure Restart(this : in out CWrapDispatcher) is
   begin
      this.pxDispatcher.Simulational_Reset;
  end Restart;

   function xGet_Motional_Errors(this : in CWrapDispatcher) return Navigation.Dispatcher.TMotionalErrors is
   begin
      return this.pxDispatcher.fGetMotionalErrors;
   end xGet_Motional_Errors;

end simulator.Motion_Control_Wrapper;
