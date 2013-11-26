package body Navigation.Thrusters is

   --------------
   -- pxCreate --
   --------------

   function xCreate return CThrusterList is
      xNewThrusterList : CThrusterList;
   begin
      xNewThrusterList.tfThrusterEffects := (others => (others => 0.0));
      return xNewThrusterList;
   end xCreate;

   -------------------------------
   -- Add_Thruster_With_Effects --
   -------------------------------

   procedure Add_Thruster_With_Effects
     (this : in out CThrusterList;
      tfThrusterEffects : in TThrusterEffects;
     iIndex : in Positive)
   is
   begin
      for iRow in tfThrusterEffects'Range loop
         this.tfThrusterEffects(iIndex)(iRow) := tfThrusterEffects(iRow);
      end loop;
   end Add_Thruster_With_Effects;

   -----------------------------------
   -- txGet_Thruster_Effects_Matrix --
   -----------------------------------

   function txGet_Thruster_Effects_Matrix
     (this : in CThrusterList)
      return TThrusterEffectsMatrix
   is
   begin
      return this.tfThrusterEffects;
   end txGet_Thruster_Effects_Matrix;

   -----------------------------
   -- tfMake_Thruster_Effects --
   -----------------------------

   function tfMake_Thruster_Effects
     (fXPosition, fYPosition, FZPosition, fXRotation, fYRotation, fZRotation : in float)
      return TThrusterEffects
   is
      tfNewThrusterEffects : TThrusterEffects;
   begin
      tfNewThrusterEffects(XPosition) := fXPosition;
      tfNewThrusterEffects(YPosition) := fYPosition;
      tfNewThrusterEffects(ZPosition) := fZPosition;
      tfNewThrusterEffects(XRotation) := fXRotation;
      tfNewThrusterEffects(YRotation) := fYRotation;
      tfNewThrusterEffects(ZRotation) := fZRotation;

      return tfNewThrusterEffects;
   end tfMake_Thruster_Effects;



   function "+" (tfLeftOperand : in TThrusterEffects; tfRightOperand : in TThrusterEffects) return TThrusterEffects is
   begin
      return TThrusterEffects'(tfLeftOperand(XPosition) + tfRightOperand(XPosition),
                               tfLeftOperand(YPosition) + tfRightOperand(YPosition),
                               tfLeftOperand(ZPosition) + tfRightOperand(ZPosition),
                               tfLeftOperand(XRotation) + tfRightOperand(XRotation),
                               tfLeftOperand(YRotation) + tfRightOperand(YRotation),
                               tfLeftOperand(ZRotation) + tfRightOperand(ZRotation));

   end "+";



end Navigation.Thrusters;
