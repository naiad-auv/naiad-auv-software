package body simulator.ViewModel_Wanted_Pos is

   --------------
   -- pxCreate --
   --------------

   function pxCreate (pxModel : Simulator.Model.pCModel) return pCViewModel_Wanted_Pos is

      pxNewViewModel : pCViewModel_Wanted_Pos;

   begin
      pxNewViewModel := new CViewModel_Wanted_Pos;
      pxNewViewModel.pxModel := pxModel;

      return pxNewViewModel;
         exception
      when E : others =>
         Exception_Handling.Unhandled_Exception(E);
         return null;

   end pxCreate;

   ----------
   -- Free --
   ----------

   procedure Free (pxViewmodel_Wanted_Pos : in out pCViewModel_Wanted_Pos) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CViewModel_Wanted_Pos, pCViewModel_Wanted_Pos);
   begin
      Dealloc(pxViewmodel_Wanted_Pos);
   end Free;

   -----------------------------------------
   -- Set_Wanted_Position_And_Orientation --
   -----------------------------------------

   procedure Set_Wanted_Position_And_Orientation (this : in CViewModel_Wanted_Pos; fPositionX : float; fPositionY : float; fPositionZ : float; fRotationX : float; fRotationY : float; fRotationZ : float) is
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

end simulator.ViewModel_Wanted_Pos;
