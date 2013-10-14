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


   function tfGet_Thruster_Values(this : in CDispatcher; fDeltaTime : in float) return Navigation.Thrusters.TThrusterValuesArray is
      use Navigation.Thrusters;
      tfThrusterValues : Navigation.Thrusters.TThrusterValuesArray(1 .. this.pxThrusterConfigurator.iGet_Number_Of_Thrusters);
      tfThrusterEffectsMatrix : Navigation.Thrusters.TThrusterEffectsMatrix(1 .. this.pxThrusterConfigurator.iGet_Number_Of_Thrusters+1);
      tfPositionalValues : Navigation.Thrusters.TThrusterEffects;
      tfOrientationalValues : Navigation.Thrusters.TThrusterEffects;
      tfCombinedValues : Navigation.Thrusters.TThrusterEffects;
      iThrusterCount : integer;

   begin
      iThrusterCount := this.pxThrusterConfigurator.iGet_Number_Of_Thrusters;
      tfThrusterEffectsMatrix := this.pxThrusterConfigurator.tfGet_Thruster_Effects_Matrix;

      this.pxPositionalController.Update_Current_Errors;
      this.pxOrientationalController.Update_Current_Errors;

      tfPositionalValues := this.pxPositionalController.xGet_Positional_Thruster_Control_Values(fDeltaTime);
      tfOrientationalValues := this.pxOrientationalController.xGet_Orientational_Thruster_Control_Values(fDeltaTime);

      tfCombinedValues := tfPositionalValues + tfOrientationalValues;

      Insert_Values_Into_Matrix(tfValues                => tfCombinedValues,
                                tfThrusterEffectsMatrix => tfThrusterEffectsMatrix);

      -- KAOSA HÄR!!

      Get_Thruster_Values(tfThrusterEffectsMatrix => tfThrusterEffectsMatrix,
                          tfThrusterValues        => tfThrusterValues);

      if bThruster_Values_Need_Scaling(tfThrusterValues) then
         Insert_Values_Into_Matrix(tfValues                => tfPositionalValues,
                                   tfThrusterEffectsMatrix => tfThrusterEffectsMatrix);
         -- KAOSA IGEN
         Get_Thruster_Values(tfThrusterEffectsMatrix => tfThrusterEffectsMatrix,
                             tfThrusterValues        => tfThrusterValues);
         if bThruster_Values_Need_Scaling(tfThrusterValues) then
            Scale_Thruster_Values(tfThrusterValues);
         end if;
      end if;

      return tfThrusterValues;
   end tfGet_Thruster_Values;

   procedure Insert_Values_Into_Matrix(tfValues : in Navigation.Thrusters.TThrusterEffects; tfThrusterEffectsMatrix : in out Navigation.Thrusters.TThrusterEffectsMatrix) is
   begin
      for i in tfValues'Range
      loop
         tfThrusterEffectsMatrix(tfThrusterEffectsMatrix'Last)(i) := tfValues(i);
      end loop;
   end Insert_Values_Into_Matrix;


   procedure Get_Thruster_Values(tfThrusterEffectsMatrix : in Navigation.Thrusters.TThrusterEffectsMatrix; tfThrusterValues : in out Navigation.Thrusters.TThrusterValuesArray) is
      iIterator : integer := 1;
   begin
      for i in tfThrusterEffectsMatrix(tfThrusterEffectsMatrix'Last)'First .. tfThrusterEffectsMatrix(tfThrusterEffectsMatrix'Last)'Last
      loop
         tfThrusterValues(iIterator) := tfThrusterEffectsMatrix(tfThrusterEffectsMatrix'Last)(i);
         iIterator := iIterator + 1;
      end loop;
   end Get_Thruster_Values;


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
