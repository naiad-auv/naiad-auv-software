package Navigation.Thrusters is
   type CThruster is tagged private;
   type pCThruster is access CThruster;

   type EThrusterEffectsComponents is (XPosition, YPosition, ZPosition, XRotation, YRotation, ZRotation);
   type TThrusterEffects is array (XPosition .. ZRotation) of float;
   type TThrusterEffectsMatrix is array (POSITIVE range <>) of TThrusterEffects;
   type TThrusterValuesArray is array (POSITIVE range <>) of float;

   function pxCreate (tfThrusterEffects : in TThrusterEffects) return pCThruster;

   function iGet_Count (this : in CThruster) return integer;
   procedure Add_Thruster_With_Effects (this : in out CThruster; tfThrusterEffects : in TThrusterEffects);
   function txGet_Thruster_Effects_Matrix (this : in CThruster) return TThrusterEffectsMatrix;

   procedure Change_Thruster_Effects (this : in out CThruster; iThrusterIndex : integer; tfThrusterEffects : in TThrusterEffects);
   function tfMake_Thruster_Effects (fXPosition, fYPosition, FZPosition, fXRotation, fYRotation, fZRotation : in float) return TThrusterEffects;
   function "+" (tfLeftOperand : in TThrusterEffects; tfRightOperand : in TThrusterEffects) return TThrusterEffects;

private
   procedure Put_Thruster_Effects_Into_Matrix (this : in CThruster; txThrusterEffectsMatrix : in out TThrusterEffectsMatrix; iThrusterIndex : in integer);

   type CThruster is tagged
      record
         pxNextThruster : pCThruster;
         tfThrusterEffects : TThrusterEffects;
      end record;

end Navigation.Thrusters;
