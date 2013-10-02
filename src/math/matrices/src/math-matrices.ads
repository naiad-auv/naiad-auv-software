with Math;
with Math.Quaternions;


package Math.Matrices is
   type CMatrix is tagged private;
   type pCMatrix is access CMatrix;

   function pxCreate_From_Quaternion (pxFromQuaternion : in Math.Quaternions.pCQuaternion) return pCMatrix;

private
   type CMatrix is tagged
      record
         fAA : float;
         fAB : float;
         fAC : float;
         fBA : float;
         fBB : float;
         fBC : float;
         fCA : float;
         fCB : float;
         fCC : float;
      end record;

end Math.Matrices;
