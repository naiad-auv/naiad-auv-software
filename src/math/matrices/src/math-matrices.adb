with Math;

package body Math.Matrices is

   function pxCreate_From_Quaternion (pxFromQuaternion : in Math.Quaternions.pCQuaternion) return pCMatrix is
      pxNewMatrix : pCMatrix;
   begin
      pxNewMatrix := new CMatrix;

      -- first row
      -- 1-2y2-2z2
      pxNewMatrix.fAA := 1.0 - (2.0 * pxFromQuaternion.fGet_Y * pxFromQuaternion.fGet_Y) - (2.0 * pxFromQuaternion.fGet_Z * pxFromQuaternion.fGet_Z);

      -- 2xy-2wz
      pxNewMatrix.fAB := (2.0 * pxFromQuaternion.fGet_X * pxFromQuaternion.fGet_Y) - (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_Z);

      -- 2xz+2wy
      pxNewMatrix.fAC := (2.0 * pxFromQuaternion.fGet_X * pxFromQuaternion.fGet_Z) + (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_Y);


      -- second row
      -- 2xy+2wz
      pxNewMatrix.fBA := (2.0 * pxFromQuaternion.fGet_X + pxFromQuaternion.fGet_Y) + (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_Z);

      -- 1-2x2-2z2
      pxNewMatrix.fBB := 1.0 - (2.0 * pxFromQuaternion.fGet_X * pxFromQuaternion.fGet_X) - (2.0 * pxFromQuaternion.fGet_Z * pxFromQuaternion.fGet_Z);

      -- 2yz+2wx
      pxNewMatrix.fBC := (2.0 * pxFromQuaternion.fGet_Y * pxFromQuaternion.fGet_Z) + (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_X);


      -- third row
      -- 2xz-2wy
      pxNewMatrix.fCA := (2.0 * pxFromQuaternion.fGet_X * pxFromQuaternion.fGet_Z) - (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_Y);

      -- 2yz-2wx
      pxNewMatrix.fCB := (2.0 * pxFromQuaternion.fGet_Y * pxFromQuaternion.fGet_Z) - (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_X);

      -- 1-2x2-2y2
      pxNewMatrix.fCC := 1.0 - (2.0 * pxFromQuaternion.fGet_X * pxFromQuaternion.fGet_X) - (2.0 * pxFromQuaternion.fGet_Y * pxFromQuaternion.fGet_Y);

      return pxNewMatrix;
   end pxCreate_From_Quaternion;


end Math.Matrices;
