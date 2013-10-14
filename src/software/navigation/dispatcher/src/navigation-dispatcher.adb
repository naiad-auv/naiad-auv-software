package body Navigation.Dispatcher is

   function pxCreate return pCDispatcher is
   begin
      return null;
   end pxCreate;

   function pxGet_New_Thruster_Control_Values(this : in CDispatcher; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects is
      tfOrientationalValues : Navigation.Thrusters.TThrusterEffects;
      tfPositionalValues : Navigation.Thrusters.TThrusterEffects;
      tfCombinedValues : Navigation.Thrusters.TThrusterEffects;

      iMaxComponent : integer;
      fRatio : float;
   begin
      tfPositionalValues := this.pxPositionalController.xGet_Positional_Thruster_Control_Values(fDeltaTime);
      tfOrientationalValues := this.pxOrientationalController.xGet_Orientational_Thruster_Control_Values(fDeltaTime);

      tfCombinedValues := tfPositionalValues + tfOrientationalValues;

      for iComponent in 1 .. this.pxThrusterConfigurator.iGet_Number_Of_Thrusters
      loop
         if abs(tfCombinedValues(iComponent)) > 100.0 then
            tfCombinedValues := tfPositionalValues;
            exit;
         end if;
      end loop;

      iMaxComponent := 1;
      for iComponent in 2 .. this.pxThrusterConfigurator.iGet_Number_Of_Thrusters
      loop
         if abs(tfCombinedValues(iComponent)) > abs(tfCombinedValues(iMaxComponent)) then
            iMaxComponent := iComponent;
         end if;
      end loop;

      if abs(tfCombinedValues(iMaxComponent)) > 100.0 then
         fRatio := 100.0 / abs(tfCombinedValues(iMaxComponent));
         for iComponent in 1 .. this.pxThrusterConfigurator.iGet_Number_Of_Thrusters
         loop
            tfCombinedValues(iComponent) := tfCombinedValues(iComponent) * fRatio;
         end loop;
      end if;

      return tfCombinedValues;
   end pxGet_New_Thruster_Control_Values;

   procedure Set_New_Component_PID_Scalings(this : in out CDispatcher; eComponentToChange : Navigation.Motion_Component.EMotionComponent;xNewPIDSCalings : in Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToChange is
         when Navigation.Motion_Component.X .. Navigation.Motion_Component.Z =>
            this.pxPositionalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                       xNewPIDScaling     => xNewPIDSCalings);
         when Navigation.Motion_Component.Direction .. Navigation.Motion_Component.Plane =>
            this.pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                          xNewPIDScaling     => xNewPIDSCalings);
         when Navigation.Motion_Component.AllComponents =>
            this.pxPositionalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                       xNewPIDScaling     => xNewPIDSCalings);
            this.pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                          xNewPIDScaling     => xNewPIDSCalings);
         when Navigation.Motion_Component.Unknown =>
            raise Numeric_Error;
      end case;

   end Set_New_Component_PID_Scalings;


   procedure Update_Current_Absolute_Position(this : in out CDispatcher; xNewCurrentAbsolutePosition : in Math.Vectors.CVector) is
   begin
      this.pxCurrentAbsolutePosition := xNewCurrentAbsolutePosition.pxGet_Copy;
      this.pxPositionalController.Update_Current_Absolute_Position(this.pxCurrentAbsolutePosition);
   end Update_Current_Absolute_Position;


   procedure Update_Wanted_Absolute_Position(this : in out CDispatcher; xNewWantedAbsolutePosition : in Math.Vectors.CVector) is
   begin
      this.pxWantedAbsolutePosition := xNewWantedAbsolutePosition.pxGet_Copy;
      this.pxPositionalController.Update_Wanted_Absolute_Position(this.pxWantedAbsolutePosition);
   end Update_Wanted_Absolute_Position;


   procedure Update_Current_Absolute_Orientation(this : in out CDispatcher; xNewCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix) is
   begin
      this.pxCurrentAbsoluteOrientation := xNewCurrentAbsoluteOrientation.pxGet_Copy;
      this.pxOrientationalController.Update_Current_Absolute_Orientation(this.pxCurrentAbsoluteOrientation);
      this.pxPositionalController.Update_Current_Absolute_Orientation(this.pxCurrentAbsoluteOrientation);
   end Update_Current_Absolute_Orientation;

   procedure Update_Wanted_Absolute_Orientation(this : in out CDispatcher; xNewWantedAbsoluteOrientation : in Math.Matrices.pCMatrix) is
   begin
      this.pxWantedAbsoluteOrientation := xNewWantedAbsoluteOrientation.pxGet_Copy;
      this.pxOrientationalController.Update_Wanted_Absolute_Orientation(this.pxWantedAbsoluteOrientation);
   end Update_Wanted_Absolute_Orientation;



end Navigation.Dispatcher;
