with Navigation;
with Math.Vectors;
with Math.Matrices;

package Navigation.Globals is

         xCurrentAbsolutePosition : Math.Vectors.CVector;
         xWantedAbsolutePosition : Math.Vectors.CVector;

         xCurrentAbsoluteOrientation : Math.Matrices.CMatrix;
         xWantedAbsoluteOrientation : Math.Matrices.CMatrix;
         xCurrentAbsoluteOrientationInverse : Math.Matrices.CMatrix;

end Navigation.Globals;
