with Navigation;

package body Navigation.Vectors is
   function Create (fX, fY, fZ : float) return pCVector is
      pxNew_Vector : pCVector := new CVector;
   begin
      pxNew_Vector.fX := fX;
      pxNew_Vector.fY := fY;
      pxNew_Vector.fZ := fZ;
      return pxNew_Vector;
   end Create;

end Navigation.Vectors;
