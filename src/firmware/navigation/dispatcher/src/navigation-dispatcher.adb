package body Navigation.Dispatcher is

   function xCreate return CDispatcher is
      xNewDispatcher : CDispatcher;
   begin
      xNewDispatcher.xThrusterConfigurator := Navigation.Thruster_Configurator.xCreate;

      xNewDispatcher.xCurrentAbsoluteOrientation := Math.Matrices.xCreate_Identity;
      xNewDispatcher.xWantedAbsoluteOrientation := Math.Matrices.xCreate_Identity;
      xNewDispatcher.xCurrentAbsoluteOrientationInverse := Math.Matrices.xCreate_Identity;


      xNewDispatcher.xCurrentAbsolutePosition := Math.Vectors.xCreate(fX => 0.0,
                                                                         fY => 0.0,
                                                                         fZ => 0.0);

      xNewDispatcher.xWantedAbsolutePosition := Math.Vectors.xCreate(fX => 0.0,
                                                                     fY => 0.0,
                                                                     fZ => 0.0);

      xNewDispatcher.xOrientationalController := Navigation.Orientational_Controller.xCreate(pxCurrentAbsoluteOrientation => xNewDispatcher.xCurrentAbsoluteOrientation'Access,
                                                                                             pxWantedAbsoluteOrientation  => xNewDispatcher.xWantedAbsoluteOrientation'Access,
                                                                                             pxCurrentAbsoluteOrientationInverse => xNewDispatcher.xCurrentAbsoluteOrientationInverse'Access);

      xNewDispatcher.xPositionalController := Navigation.Positional_Controller.xCreate(pxCurrentAbsolutePosition    => xNewDispatcher.xCurrentAbsolutePosition'Access,
                                                                                       pxWantedAbsolutePosition     => xNewDispatcher.xWantedAbsolutePosition'Access,
                                                                                       pxCurrentAbsoluteOrientation => xNewDispatcher.xCurrentAbsoluteOrientation'Access,
                                                                                       pxCurrentAbsoluteOrientationInverse => xNewDispatcher.xCurrentAbsoluteOrientationInverse'Access);

      return xNewDispatcher;
   end xCreate;

   procedure Get_Thruster_Values(this : in out CDispatcher; fDeltaTime : in float; tfThrusterValues : out Navigation.Thrusters.TThrusterValuesArray) is
      use Navigation.Thrusters;
      tfPositionalValues : Navigation.Thrusters.TThrusterEffects;
      tfOrientationalValues : Navigation.Thrusters.TThrusterEffects;
   begin

      this.xPositionalController.Update_Current_Errors;
      this.xOrientationalController.Update_Current_Errors;

      this.xPositionalController.Get_Positional_Thruster_Control_Values(fDeltaTime => fDeltaTime,
                                                                        tfValues   => tfPositionalValues);
      this.xOrientationalController.Get_Orientational_Thruster_Control_Values(fDeltaTime => fDeltaTime,
                                                                              tfValues   => tfOrientationalValues);

      tfThrusterValues := this.xThrusterConfigurator.tfGet_Thruster_Values(tfComponentValues => tfPositionalValues + tfOrientationalValues);

      if bThruster_Values_Need_Scaling(tfThrusterValues) then
         tfThrusterValues := this.xThrusterConfigurator.tfGet_Thruster_Values(tfComponentValues => tfPositionalValues);
         if bThruster_Values_Need_Scaling(tfThrusterValues) then
            Scale_Thruster_Values(tfThrusterValues);
         end if;
      end if;
   end Get_Thruster_Values;

   procedure Set_New_Component_PID_Scalings(this : in out CDispatcher; eComponentToChange : Navigation.Motion_Component.EMotionComponent;xNewPIDSCalings : in Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToChange is
         when Navigation.Motion_Component.PositionX .. Navigation.Motion_Component.PositionZ =>
            this.xPositionalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                       xNewPIDScaling     => xNewPIDSCalings);
         when Navigation.Motion_Component.RotationX .. Navigation.Motion_Component.RotationZ =>
            this.xOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                          xNewPIDScaling     => xNewPIDSCalings);
         when Navigation.Motion_Component.AllComponents =>
            this.xPositionalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                       xNewPIDScaling     => xNewPIDSCalings);
            this.xOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                         xNewPIDScaling     => xNewPIDSCalings);
      end case;

   end Set_New_Component_PID_Scalings;

   procedure Update_Current_Absolute_Position (this : in out CDispatcher; xNewCurrentAbsolutePosition : in Math.Vectors.CVector) is
   begin
      this.xCurrentAbsolutePosition.Copy_From(xNewCurrentAbsolutePosition);
   end Update_Current_Absolute_Position;

   procedure Update_Wanted_Absolute_Position (this : in out CDispatcher; xNewWantedAbsolutePosition : in Math.Vectors.CVector) is
   begin
      this.xWantedAbsolutePosition.Copy_From(xNewWantedAbsolutePosition);
   end Update_Wanted_Absolute_Position;

   procedure Update_Current_Absolute_Orientation (this : in out CDispatcher; xNewCurrentAbsoluteOrientation : in Math.Matrices.CMatrix) is
   begin
      this.xCurrentAbsoluteOrientation.Copy_From(xNewCurrentAbsoluteOrientation);
      this.xCurrentAbsoluteOrientationInverse.Copy_From(xSourceMatrix => this.xCurrentAbsoluteOrientation.xGet_Inverse);
   end Update_Current_Absolute_Orientation;

   procedure Update_Wanted_Absolute_Orientation (this : in out CDispatcher; xNewWantedAbsoluteOrientation : in Math.Matrices.CMatrix) is
   begin
      this.xWantedAbsoluteOrientation.Copy_From(xNewWantedAbsoluteOrientation);
   end Update_Wanted_Absolute_Orientation;

   procedure Scale_Thruster_Values (tfThrusterValues : in out Navigation.Thrusters.TThrusterValuesArray) is
      fScaleRatio : float;
      fMaxValue : float := 0.0;
   begin

      for t in tfThrusterValues'Range
      loop
         if abs(tfThrusterValues(t)) > fMaxValue then
            fMaxValue := abs(tfThrusterValues(t));
         end if;
      end loop;

      fScaleRatio := 100.0 / fMaxValue;

      for t in tfThrusterValues'Range
      loop
         tfThrusterValues(t) := tfThrusterValues(t) * fScaleRatio;
      end loop;
   end Scale_Thruster_Values;

   function bThruster_Values_Need_Scaling (tfThrusterValues : in Navigation.Thrusters.TThrusterValuesArray) return boolean is
   begin
      for t in tfThrusterValues'Range
      loop
         if abs(tfThrusterValues(t)) > 100.0 then
            return true;
         end if;
      end loop;
      return false;
   end bThruster_Values_Need_Scaling;


end Navigation.Dispatcher;
