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
                                                  xNewPIDSCalings    => (1.0,1.0,1.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.Y,
                                                  xNewPIDSCalings    => (1.0,1.0,1.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.Z,
                                                  xNewPIDSCalings    => (1.0,1.0,1.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.Direction,
                                                  xNewPIDSCalings    => (1.0,1.0,1.0));
      pxWrapper.pxDispatcher.Set_New_Component_PID_Scalings(eComponentToChange => Navigation.Motion_Component.Plane,
                                                  xNewPIDSCalings    => (1.0,1.0,1.0));

      return pxWrapper;

   end pxCreate_Wrap_Dispatcher;

   ---------------------
   -- pxUpdate_Values --
   ---------------------

   procedure Update_Values
     (this : in out CWrapDispatcher;
      pxNewCurrentAbsolutePosition : in math.Vectors.pCVector;
      pxNewCurrentOrientation : in math.Matrices.pCMatrix;
      tfMotorValuesSubmarine : out simulator.submarine.TMotorForce ;
      fDeltaTime : in float) is


      tfMotorValuesTThrustesValuesArray : navigation.Thrusters.TThrusterValuesArray(1..6);
   begin
      this.pxDispatcher.Update_Current_Absolute_Position(pxNewCurrentAbsolutePosition.pxGet_Copy);
      this.pxDispatcher.Update_Current_Absolute_Orientation(pxNewCurrentOrientation.pxGet_Copy);
      tfMotorValuesTThrustesValuesArray := this.pxDispatcher.tfGet_Thruster_Values(fDeltaTime => fDeltaTime);
      tfMotorValuesSubmarine(1) := tfMotorValuesTThrustesValuesArray(1);
      tfMotorValuesSubmarine(2) := tfMotorValuesTThrustesValuesArray(2);
      tfMotorValuesSubmarine(3) := tfMotorValuesTThrustesValuesArray(3);
      tfMotorValuesSubmarine(4) := tfMotorValuesTThrustesValuesArray(4);
      tfMotorValuesSubmarine(5) := tfMotorValuesTThrustesValuesArray(5);
      tfMotorValuesSubmarine(6) := tfMotorValuesTThrustesValuesArray(6);

   end Update_Values;


   ------------------------------
   -- pxUpdate_Wanted_Position --
   ------------------------------

   procedure Update_Wanted_Position (this : in out CWrapDispatcher;
                                      pxWantedPosition : in math.Vectors.pCVector ;
                                     pxWantedOrientation : in math.Matrices.pCMatrix ) is

   begin
      this.pxDispatcher.Update_Wanted_Absolute_Position(pxWantedPosition);
      this.pxDispatcher.Update_Wanted_Absolute_Orientation(pxWantedOrientation);
   end Update_Wanted_Position;

end simulator.Motion_Control_Wrapper;
