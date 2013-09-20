with Navigation;

package Navigation.Vectors is
   type CVector is tagged private;
   type pCVector is access CVector;

   function Create (fX, fY, fZ : float) return pCVector;


private
   type CVector is tagged
      record
         fX : float;
         fY : float;
         fZ : float;
      end record;


end Navigation.Vectors;
