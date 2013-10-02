
package Math.Rotators is

   type CRotator is tagged private;
   type pCRotator is access CRotator;

   type TAngle is new float range -180.0 .. 180.0;


private
   type CRotator is tagged
      record
         fYaw : float;
         fPitch : float;
         fRoll : float;
      end record;
end Math.Rotators;
