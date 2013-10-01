with Math;

package Math.Matrices is
   type CMatrix is tagged private;
   type pCMatrix is access CMatrix;

   function Dummy return boolean;

private
   type CMatrix is tagged
      record
	null;
      end record;

end Math.Matrices;
