package body Navigation.Dispatcher is

   function pxCreate return pCDispatcher is
      pxNewDispatcher : pCDispatcher;
   begin
      pxNewDispatcher := new CDispatcher;

      pxNewDispatcher.pxCurrentAbsoluteOrientation := Math.Matrices.pxCreate_Identity;
      pxNewDispatcher.pxWantedAbsoluteOrientation := Math.Matrices.pxCreate_Identity;

      pxNewDispatcher.pxCurrentAbsolutePosition := Math.Vectors.pxCreate(fX => 0.0,
                                                                         fY => 0.0,
                                                                         fZ => 0.0);

      pxNewDispatcher.pxWantedAbsolutePosition := Math.Vectors.pxCreate(fX => 0.0,
                                                                        fY => 0.0,
                                                                        fZ => 0.0);

      pxNewDispatcher.pxOrientationalController := Navigation.Orientational_Controller.pxCreate(pxCurrentAbsoluteOrientation => pxNewDispatcher.pxCurrentAbsoluteOrientation,
                                                                                                pxWantedAbsoluteOrientation  => pxNewDispatcher.pxWantedAbsoluteOrientation);
      pxNewDispatcher.pxPositionalController := Navigation.Positional_Controller.pxCreate(pxCurrentAbsolutePosition    => pxNewDispatcher.pxCurrentAbsolutePosition,
                                                                                          pxWantedAbsolutePosition     => pxNewDispatcher.pxWantedAbsolutePosition,
                                                                                          pxCurrentAbsoluteOrientation => pxNewDispatcher.pxCurrentAbsoluteOrientation);

      return pxNewDispatcher;
   end pxCreate;


   function tfGet_Thruster_Values(this : in CDispatcher) return Navigation.Thrusters.TThrusterValuesArray is
      tfThrusterValues : Navigation.Thrusters.TThrusterValuesArray(1 .. this.pxThrusterConfigurator.iGet_Number_Of_Thrusters);
      tfThrusterEffectsMatrix : Navigation.Thrusters.TThrusterEffectsMatrix;
      tfPositionalValues : Navigation.Thrusters.TThrusterEffects;
      tfOrientationalValues : Navigation.Thrusters.TThrusterEffects;
      tfCombinedValues : Navigation.Thrusters.TThrusterEffects;
      iThrusterCount : integer;
      iIterator : integer;

   begin
      iThrusterCount := this.pxThrusterConfigurator.iGet_Number_Of_Thrusters;
      tfThrusterEffectsMatrix := this.pxThrusterConfigurator.tfGet_Thruster_Effects_Matrix;

      this.pxPositionalController.Update_Current_Errors;
      this.pxOrientationalController.Update_Current_Errors;

      tfPositionalValues := this.pxPositionalController.xGet_Positional_Thruster_Control_Values(fDeltaTime);
      tfOrientationalValues := this.pxOrientationalController.xGet_Orientational_Thruster_Control_Values(fDeltaTime);

      tfCombinedValues := tfPositionalValues + tfOrientationalValues;

      for i in Navigation.Thrusters.XPosition .. Navigation.Thrusters.ZRotation
      loop
         tfThrusterEffectsMatrix(iThrusterCount + 1)(i) := tfCombinedValues(i);
      end loop;

      -- KAOSA HÄR!!

      if bThruster_Values_Need_Scaling(tfThrusterValues) then
         tfCombinedValues := tfPositionalValues;
         for i in Navigation.Thrusters.XPosition .. Navigation.Thrusters.ZRotation
         loop
            tfThrusterEffectsMatrix(iThrusterCount + 1)(i) := tfCombinedValues(i);
         end loop;
         -- KAOSA IGEN
         if bThruster_Values_Need_Scaling(tfThrusterValues) then
            iIterator := 1;
            for i in Navigation.Thrusters.XPosition .. Navigation.Thrusters.ZRotation
            loop
               tfThrusterValues(iIterator) := tfThrusterEffectsMatrix(iThrusterCount + 1)(i);
               iIterator := iIterator + 1;
            end loop;
            tfScale_Thruster_Values(tfThrusterValues);
         end if;
      end if;



      return (others => 0.0);
   end tfGet_Thruster_Values;


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


   procedure Update_Current_Absolute_Position(this : in out CDispatcher; xNewCurrentAbsolutePosition : in Math.Vectors.pCVector) is
   begin
      this.pxCurrentAbsolutePosition.Copy_From(xNewCurrentAbsolutePosition);
   end Update_Current_Absolute_Position;


   procedure Update_Wanted_Absolute_Position(this : in out CDispatcher; xNewWantedAbsolutePosition : in Math.Vectors.pCVector) is
   begin
      this.pxWantedAbsolutePosition.Copy_From(xNewWantedAbsolutePosition);
   end Update_Wanted_Absolute_Position;


   procedure Update_Current_Absolute_Orientation(this : in out CDispatcher; xNewCurrentAbsoluteOrientation : in Math.Matrices.pCMatrix) is
   begin
      this.pxCurrentAbsoluteOrientation.Copy_From(xNewCurrentAbsoluteOrientation);
   end Update_Current_Absolute_Orientation;

   procedure Update_Wanted_Absolute_Orientation(this : in out CDispatcher; xNewWantedAbsoluteOrientation : in Math.Matrices.pCMatrix) is
   begin
      this.pxWantedAbsoluteOrientation.Copy_From(xNewWantedAbsoluteOrientation);
   end Update_Wanted_Absolute_Orientation;





   function pxGet_New_Thruster_Control_Values(this : in CDispatcher; fDeltaTime : in float) return Navigation.Thrusters.TThrusterEffects is
      use Navigation.Thrusters;
      tfOrientationalValues : Navigation.Thrusters.TThrusterEffects;
      tfPositionalValues : Navigation.Thrusters.TThrusterEffects;
      tfCombinedValues : Navigation.Thrusters.TThrusterEffects;

      iMaxComponent : Navigation.Thrusters.EThrusterEffectsComponents;
      fRatio : float;
   begin

      this.pxPositionalController.Update_Current_Errors;
      this.pxOrientationalController.Update_Current_Errors;

      tfPositionalValues := this.pxPositionalController.xGet_Positional_Thruster_Control_Values(fDeltaTime);
      tfOrientationalValues := this.pxOrientationalController.xGet_Orientational_Thruster_Control_Values(fDeltaTime);

      tfCombinedValues := tfPositionalValues + tfOrientationalValues;

      for iComponent in Navigation.Thrusters.XPosition .. Navigation.Thrusters.ZRotation
      loop
         if abs(tfCombinedValues(iComponent)) > 100.0 then
            tfCombinedValues := tfPositionalValues;
            exit;
         end if;
      end loop;

      iMaxComponent := Navigation.Thrusters.XPosition;
      for iComponent in Navigation.Thrusters.YPosition .. Navigation.Thrusters.ZRotation
      loop
         if abs(tfCombinedValues(iComponent)) > abs(tfCombinedValues(iMaxComponent)) then
            iMaxComponent := iComponent;
         end if;
      end loop;

      if abs(tfCombinedValues(iMaxComponent)) > 100.0 then
         fRatio := 100.0 / abs(tfCombinedValues(iMaxComponent));
         for iComponent in Navigation.Thrusters.XPosition .. Navigation.Thrusters.ZRotation
         loop
            tfCombinedValues(iComponent) := tfCombinedValues(iComponent) * fRatio;
         end loop;
      end if;

      return tfCombinedValues;
   end pxGet_New_Thruster_Control_Values;

   function tfScale_Thruster_Values (tfThrusterValues : in Navigation.Thrusters.TThrusterValuesArray) return Navigation.Thrusters.TThrusterValuesArray is
      tfScaledThrusterValues : Navigation.Thrusters.TThrusterValuesArray(1 .. tfThrusterValues'Length);
   begin

      return (others => 0.0);

   end tfScale_Thruster_Values;

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
