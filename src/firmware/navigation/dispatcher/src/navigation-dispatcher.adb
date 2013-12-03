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

      Navigation.Positional_Controller.Update_Current_Errors(this.xPositionalController);
      Navigation.Orientational_Controller.Update_Current_Errors(this.xOrientationalController);

      Navigation.Positional_Controller.Get_Positional_Thruster_Control_Values(this       => this.xPositionalController,
                                                                              fDeltaTime => fDeltaTime,
                                                                              tfValues   => tfPositionalValues);
      Navigation.Orientational_Controller.Get_Orientational_Thruster_Control_Values(this       => this.xOrientationalController,
                                                                                    fDeltaTime => fDeltaTime,
                                                                                    tfValues   => tfOrientationalValues);

      tfThrusterValues := Navigation.Thruster_Configurator.tfGet_Thruster_Values(this              => this.xThrusterConfigurator,
                                                                                 tfComponentValues => tfPositionalValues + tfOrientationalValues);

      if bThruster_Values_Need_Scaling(tfThrusterValues) then
         tfThrusterValues := Navigation.Thruster_Configurator.tfGet_Thruster_Values(this              => this.xThrusterConfigurator,
                                                                                    tfComponentValues => tfPositionalValues);
         if bThruster_Values_Need_Scaling(tfThrusterValues) then
            Scale_Thruster_Values(tfThrusterValues);
         end if;
      end if;
   end Get_Thruster_Values;

   procedure Set_New_Component_PID_Scalings(this : in out CDispatcher; eComponentToChange : Navigation.Motion_Component.EMotionComponent;xNewPIDSCalings : in Navigation.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToChange is
         when Navigation.Motion_Component.PositionX .. Navigation.Motion_Component.PositionZ =>
            Navigation.Positional_Controller.Set_New_PID_Component_Scalings(this               => this.xPositionalController,
                                                                            eComponentToUpdate => eComponentToChange,
                                                                            xNewPIDScaling     => xNewPIDSCalings);
         when Navigation.Motion_Component.RotationX .. Navigation.Motion_Component.RotationZ =>
            Navigation.Orientational_Controller.Set_New_PID_Component_Scalings(this               => this.xOrientationalController,
                                                                               eComponentToUpdate => eComponentToChange,
                                                                               xNewPIDScaling     => xNewPIDSCalings);
         when Navigation.Motion_Component.AllComponents =>
            Navigation.Positional_Controller.Set_New_PID_Component_Scalings(this               => this.xPositionalController,
                                                                            eComponentToUpdate => eComponentToChange,
                                                                            xNewPIDScaling     => xNewPIDSCalings);
            Navigation.Orientational_Controller.Set_New_PID_Component_Scalings(this               => this.xOrientationalController,
                                                                               eComponentToUpdate => eComponentToChange,
                                                                               xNewPIDScaling     => xNewPIDSCalings);
      end case;

   end Set_New_Component_PID_Scalings;

   procedure Update_Current_Absolute_Position (this : in out CDispatcher; xNewCurrentAbsolutePosition : in Math.Vectors.CVector) is
   begin
      Math.Vectors.Copy_From(this          => this.xCurrentAbsolutePosition,
                             xSourceVector => xNewCurrentAbsolutePosition);
   end Update_Current_Absolute_Position;

   procedure Update_Wanted_Absolute_Position (this : in out CDispatcher; xNewWantedAbsolutePosition : in Math.Vectors.CVector) is
   begin
      Math.Vectors.Copy_From(this          => this.xWantedAbsolutePosition,
                             xSourceVector => xNewWantedAbsolutePosition);
   end Update_Wanted_Absolute_Position;

   procedure Update_Current_Absolute_Orientation (this : in out CDispatcher; xNewCurrentAbsoluteOrientation : in Math.Matrices.CMatrix) is
   begin
      Math.Matrices.Copy_From(this          => this.xCurrentAbsoluteOrientation,
                              xSourceMatrix => xNewCurrentAbsoluteOrientation);
      Math.Matrices.Copy_From(this          => this.xCurrentAbsoluteOrientationInverse,
                              xSourceMatrix => Math.Matrices.xGet_Inverse(this.xCurrentAbsoluteOrientation));
   end Update_Current_Absolute_Orientation;

   procedure Update_Wanted_Absolute_Orientation (this : in out CDispatcher; xNewWantedAbsoluteOrientation : in Math.Matrices.CMatrix) is
   begin
      Math.Matrices.Copy_From(this          => this.xWantedAbsoluteOrientation,
                              xSourceMatrix => xNewWantedAbsoluteOrientation);
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
