package body simulator.Viewmodel_Set_Wanted_Position is


   ----------
   -- Free --
   ----------

   procedure Free(pxViewmodel_Set_Wanted_Position : in out pCViewmodel_Set_Wanted_Position) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CViewmodel_Set_Wanted_Position, pCViewmodel_Set_Wanted_Position);
   begin
      Dealloc(pxViewmodel_Set_Wanted_Position);
   end;

   --------------
   -- pxCreate --
   --------------

    function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewmodel_Set_Wanted_Position is
      pxNewViewModel : pCViewmodel_Set_Wanted_Position;

   begin
      pxNewViewModel := new CViewmodel_Set_Wanted_Position;
      pxNewViewModel.pxModel := pxModel;

      return pxNewViewModel;
         exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return null;
   end pxCreate;



   -----------------------------------------
   -- Set_Wanted_Position_And_Orientation --
   -----------------------------------------

   procedure Set_Wanted_Position_And_Orientation(this : in CViewmodel_Set_Wanted_Position; fPositionX : float ;  fPositionY : float ; fPositionZ : float ; fRotationX : float ;fRotationY : float ;fRotationZ : float) is
      use math.Matrices;
      xWantedPosition : math.Vectors.CVector := math.Vectors.xCreate(fX => fPositionX,
                                                                      fY => fPositionY,
                                                                      fZ => fPositionZ);
      xWantedOrientation : math.Matrices.CMatrix := math.Matrices.xCreate_Rotation_Around_Z_Axis(math.Angles.TAngle(fRotationZ))*math.Matrices.xCreate_Rotation_Around_Y_Axis(math.Angles.TAngle(fRotationY))*math.Matrices.xCreate_Rotation_Around_X_Axis(math.Angles.TAngle(fRotationX));

   begin
      this.pxModel.Set_Wanted_Position_And_Orientation(xWantedPosition    => xWantedPosition,
                                                       xWantedOrientation => xWantedOrientation);
            exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
   end Set_Wanted_Position_And_Orientation;


end simulator.Viewmodel_Set_Wanted_Position;
