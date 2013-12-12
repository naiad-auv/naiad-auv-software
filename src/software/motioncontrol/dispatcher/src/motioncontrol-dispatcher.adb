with Ada.Text_IO;
package body MotionControl.Dispatcher is

   function pxCreate return pCDispatcher is
      pxNewDispatcher : pCDispatcher;
   begin
      pxNewDispatcher := new CDispatcher;

      pxNewDispatcher.pxThrusterConfigurator := MotionControl.Thruster_Configurator.pxCreate;

      pxNewDispatcher.pxCurrentAbsoluteOrientation := Math.Matrices.xCreate_Identity.pxGet_Allocated_Copy;
      pxNewDispatcher.pxWantedAbsoluteOrientation := pxNewDispatcher.pxCurrentAbsoluteOrientation.pxGet_Allocated_Copy;
      pxNewDispatcher.pxCurrentAbsoluteOrientationInverse := pxNewDispatcher.pxCurrentAbsoluteOrientation.pxGet_Allocated_Copy;


      pxNewDispatcher.pxCurrentAbsolutePosition := Math.Vectors.xCreate(fX => 0.0,
                                                                         fY => 0.0,
                                                                         fZ => 0.0).pxGet_Allocated_Copy;

      pxNewDispatcher.pxWantedAbsolutePosition := Math.Vectors.xCreate(fX => 0.0,
                                                                        fY => 0.0,
                                                                        fZ => 0.0).pxGet_Allocated_Copy;

      pxNewDispatcher.pxOrientationalController := MotionControl.Orientational_Controller.pxCreate(pxCurrentAbsoluteOrientation => pxNewDispatcher.pxCurrentAbsoluteOrientation,
                                                                                                pxWantedAbsoluteOrientation  => pxNewDispatcher.pxWantedAbsoluteOrientation,
                                                                                               pxCurrentAbsoluteOrientationInverse => pxNewDispatcher.pxCurrentAbsoluteOrientationInverse);
      pxNewDispatcher.pxPositionalController := MotionControl.Positional_Controller.pxCreate(pxCurrentAbsolutePosition    => pxNewDispatcher.pxCurrentAbsolutePosition,
                                                                                          pxWantedAbsolutePosition     => pxNewDispatcher.pxWantedAbsolutePosition,
                                                                                          pxCurrentAbsoluteOrientation => pxNewDispatcher.pxCurrentAbsoluteOrientation,
                                                                                         pxCurrentAbsoluteOrientationInverse => pxNewDispatcher.pxCurrentAbsoluteOrientationInverse);

      return pxNewDispatcher;
   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "MotionControl.Dispatcher.pxCreate return pCDispatcher");
         return pxNewDispatcher;
   end pxCreate;

   procedure Update_Motional_Errors(this : in CDispatcher) is
   begin
      this.pxPositionalController.Update_Current_Errors;
      this.pxOrientationalController.Update_Current_Errors;
   end Update_Motional_Errors;

   procedure Get_Thruster_Values(this : in CDispatcher; fDeltaTime : in float; tfValues : out MotionControl.Thrusters.TThrusterValuesArray) is
      use MotionControl.Thrusters;

      tfPositionalValues : MotionControl.Thrusters.TThrusterEffects;
      tfOrientationalValues : MotionControl.Thrusters.TThrusterEffects;
      tfCombinedValues : MotionControl.Thrusters.TThrusterEffects;
   begin

      Update_Motional_Errors(this);

      this.pxPositionalController.Get_Positional_Thruster_Control_Values(fDeltaTime               => fDeltaTime,
                                                                         tfValues   => tfPositionalValues);
      this.pxOrientationalController.Get_Orientational_Thruster_Control_Values(fDeltaTime => fDeltaTime,
                                                                               tfValues   => tfOrientationalValues);


      tfCombinedValues := tfPositionalValues + tfOrientationalValues;
      tfValues := this.pxThrusterConfigurator.tfGet_Thruster_Values(tfComponentValues => tfCombinedValues);


      if bThruster_Values_Need_Scaling(tfValues) then
         tfValues := this.pxThrusterConfigurator.tfGet_Thruster_Values(tfComponentValues => tfPositionalValues);
         if bThruster_Values_Need_Scaling(tfValues) then
            Scale_Thruster_Values(tfValues);
         end if;
      end if;

   exception
      when E : others =>
         Exception_Handling.Reraise_Exception(E       => E,
                                              Message => "MotionControl.Dispatcher.tfGet_Thruster_Values(this : in CDispatcher; fDeltaTime : in float) return MotionControl.Thrusters.TThrusterValuesArray");
   end Get_Thruster_Values;

   procedure Set_New_Component_PID_Scalings(this : in CDispatcher; eComponentToChange : MotionControl.Motion_Component.EMotionComponent;xNewPIDSCalings : in MotionControl.PID_Controller.TPIDComponentScalings) is
   begin
      case eComponentToChange is
         when MotionControl.Motion_Component.PositionX .. MotionControl.Motion_Component.PositionZ =>
            this.pxPositionalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                       xNewPIDScaling     => xNewPIDSCalings);
         when MotionControl.Motion_Component.RotationX .. MotionControl.Motion_Component.RotationZ =>
            this.pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                          xNewPIDScaling     => xNewPIDSCalings);
         when MotionControl.Motion_Component.AllComponents =>
            this.pxPositionalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                       xNewPIDScaling     => xNewPIDSCalings);
            this.pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => eComponentToChange,
                                                                          xNewPIDScaling     => xNewPIDSCalings);

         when MotionControl.Motion_Component.AllRotation =>
            this.pxOrientationalController.Set_New_PID_Component_Scalings(eComponentToUpdate => MotionControl.Motion_Component.AllComponents,
                                                                          xNewPIDScaling     => xNewPIDScalings);
         when MotionControl.Motion_Component.AllPosition =>
            this.pxPositionalController.Set_New_PID_Component_Scalings(eComponentToUpdate => MotionControl.Motion_Component.AllComponents,
                                                                       xNewPIDScaling     => xNewPIDScalings);

--           when MotionControl.Motion_Component.Unknown =>
--              Exception_Handling.Raise_Exception(E       => Exception_Handling.UnknownMotionComponent'Identity,
--                                             Message => "MotionControl.Dispatcher.Set_New_Component_PID_Scalings(this : in out CDispatcher; eComponentToChange : MotionControl.Motion_Component.EMotionComponent;xNewPIDSCalings : in MotionControl.PID_Controller.TPIDComponentScalings)");
      end case;

   end Set_New_Component_PID_Scalings;

   procedure Update_Current_Absolute_Position (this : in CDispatcher; xNewCurrentAbsolutePosition : in Math.Vectors.CVector) is
   begin
      this.pxCurrentAbsolutePosition.Copy_From(xNewCurrentAbsolutePosition);
   end Update_Current_Absolute_Position;

   procedure Update_Wanted_Absolute_Position (this : in CDispatcher; xNewWantedAbsolutePosition : in Math.Vectors.CVector) is
   begin
      this.pxWantedAbsolutePosition.Copy_From(xNewWantedAbsolutePosition);
   end Update_Wanted_Absolute_Position;

   procedure Update_Current_Absolute_Orientation (this : in CDispatcher; xNewCurrentAbsoluteOrientation : in Math.Matrices.CMatrix) is
   begin
      this.pxCurrentAbsoluteOrientation.Copy_From(xNewCurrentAbsoluteOrientation);
      this.pxCurrentAbsoluteOrientationInverse.Copy_From(xSourceMatrix => this.pxCurrentAbsoluteOrientation.xGet_Inverse);
   end Update_Current_Absolute_Orientation;

   procedure Update_Wanted_Absolute_Orientation (this : in CDispatcher; xNewWantedAbsoluteOrientation : in Math.Matrices.CMatrix) is
   begin
      this.pxWantedAbsoluteOrientation.Copy_From(xNewWantedAbsoluteOrientation);
   end Update_Wanted_Absolute_Orientation;

   procedure Scale_Thruster_Values (tfThrusterValues : in out MotionControl.Thrusters.TThrusterValuesArray) is
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

   function bThruster_Values_Need_Scaling (tfThrusterValues : in MotionControl.Thrusters.TThrusterValuesArray) return boolean is
   begin
      for t in tfThrusterValues'Range
      loop
         if abs(tfThrusterValues(t)) > 100.0 then
            return true;
         end if;
      end loop;
      return false;
   end bThruster_Values_Need_Scaling;

   procedure Free(pxDispatcherToDeallocate : in out pCDispatcher) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CDispatcher, pCDispatcher);
   begin
      Dealloc(pxDispatcherToDeallocate);
   end Free;

   procedure Finalize (this : in out CDispatcher) is
      use MotionControl.Thruster_Configurator;
      use MotionControl.Orientational_Controller;
      use MotionControl.Positional_Controller;
      use Math.Vectors;
      use Math.Matrices;
   begin
      if this.pxThrusterConfigurator /= null then
         MotionControl.Thruster_Configurator.Free(pxThrusterConfiguratorToDeallocate => this.pxThrusterConfigurator);
      end if;

      if this.pxOrientationalController /= null then
         MotionControl.Orientational_Controller.Free(pxOrientationalControllerToDeallocate => this.pxOrientationalController);
      end if;

      if this.pxPositionalController /= null then
         MotionControl.Positional_Controller.Free(pxPositionalControllerToDeallocate => this.pxPositionalController);
      end if;

      if this.pxCurrentAbsolutePosition /= null then
         Math.Vectors.Free(pxVectorToDeallocate => this.pxCurrentAbsolutePosition);
      end if;

      if this.pxWantedAbsolutePosition /= null then
         Math.Vectors.Free(pxVectorToDeallocate => this.pxWantedAbsolutePosition);
      end if;

      if this.pxCurrentAbsoluteOrientation /= null then
         Math.Matrices.Free(pxMatrixToDeallocate => this.pxCurrentAbsoluteOrientation);
      end if;

      if this.pxWantedAbsoluteOrientation /= null then
         Math.Matrices.Free(pxMatrixToDeallocate => this.pxWantedAbsoluteOrientation);
      end if;

      if this.pxCurrentAbsoluteOrientationInverse /= null then
         Math.Matrices.Free(pxMatrixToDeallocate => this.pxCurrentAbsoluteOrientationInverse);
      end if;
   end Finalize;

   function fGetMotionalErrors(this : in CDispatcher) return TMotionalErrors is

      PositionalErrors : MotionControl.Positional_Controller.TPositionalErrors;
      OrientationalErrors : MotionControl.Orientational_Controller.TOrientationalErrors;

   begin
      PositionalErrors := this.pxPositionalController.fGetCurrentErrors;
      OrientationalErrors := this.pxOrientationalController.fGetCurrentErrors;

      return TMotionalErrors'(MotionControl.Motion_Component.PositionX => PositionalErrors(MotionControl.Motion_Component.PositionX),
                              MotionControl.Motion_Component.PositionY => PositionalErrors(MotionControl.Motion_Component.PositionY),
                              MotionControl.Motion_Component.PositionZ => PositionalErrors(MotionControl.Motion_Component.PositionZ),
                              MotionControl.Motion_Component.RotationX => OrientationalErrors(MotionControl.Motion_Component.RotationX),
                              MotionControl.Motion_Component.RotationY => OrientationalErrors(MotionControl.Motion_Component.RotationY),
                              MotionControl.Motion_Component.RotationZ => OrientationalErrors(MotionControl.Motion_Component.RotationZ));
   end fGetMotionalErrors;


   procedure Simulational_Reset(this : in CDispatcher) is
   begin
      this.Update_Current_Absolute_Position(Math.Vectors.xCreate(0.0,0.0,0.0));
      this.Update_Wanted_Absolute_Position(Math.Vectors.xCreate(0.0,0.0,0.0));

      this.Update_Current_Absolute_Orientation(Math.Matrices.xCreate_Identity);
      this.Update_Wanted_Absolute_Orientation(Math.Matrices.xCreate_Identity);

      Update_Motional_Errors(this);
   end Simulational_Reset;


end MotionControl.Dispatcher;
