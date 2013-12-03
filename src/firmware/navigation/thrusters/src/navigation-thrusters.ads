
package Navigation.Thrusters is
   NumberOfThrusters : constant := 6;

   type CThrusterList is private;

   type EThrusterEffectsComponents is (XPosition, YPosition, ZPosition, XRotation, YRotation, ZRotation);
   type TThrusterEffects is array (XPosition .. ZRotation) of float;
   type TThrusterEffectsMatrix is array (1 .. 6) of TThrusterEffects;
   type TThrusterValuesArray is array (1 .. 6) of float;

   function xCreate return CThrusterList;

   procedure Add_Thruster_With_Effects (this : in out CThrusterList; tfThrusterEffects : in TThrusterEffects; iIndex : in Positive);
   function txGet_Thruster_Effects_Matrix (this : in CThrusterList) return TThrusterEffectsMatrix;

   function tfMake_Thruster_Effects (fXPosition, fYPosition, FZPosition, fXRotation, fYRotation, fZRotation : in float) return TThrusterEffects;
   function "+" (tfLeftOperand : in TThrusterEffects; tfRightOperand : in TThrusterEffects) return TThrusterEffects;

private

   type CThrusterList is
      record
         tfThrusterEffects : TThrusterEffectsMatrix;
      end record;

end Navigation.Thrusters;
