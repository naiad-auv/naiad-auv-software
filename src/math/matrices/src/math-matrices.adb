with Ada.Numerics;
with Ada.Numerics.Elementary_Functions;
with Math.Angles;


package body Math.Matrices is

   ------------------------------
   -- pxCreate_From_Quaternion --
   ------------------------------


   function pxCreate_From_Quaternion
     (pxFromQuaternion : in Math.Quaternions.pCQuaternion)
      return pCMatrix
   is
      pxNewMatrix : pCMatrix;
   begin
      pxNewMatrix := new CMatrix;

      -- first row
      -- 1-2y2-2z2
      pxNewMatrix.tfMatrix(1,1) := 1.0 - (2.0 * pxFromQuaternion.fGet_Y * pxFromQuaternion.fGet_Y) - (2.0 * pxFromQuaternion.fGet_Z * pxFromQuaternion.fGet_Z);

      -- 2xy-2wz
      pxNewMatrix.tfMatrix(1,2) := (2.0 * pxFromQuaternion.fGet_X * pxFromQuaternion.fGet_Y) - (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_Z);

      -- 2xz+2wy
      pxNewMatrix.tfMatrix(1,3) := (2.0 * pxFromQuaternion.fGet_X * pxFromQuaternion.fGet_Z) + (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_Y);


      -- second row
      -- 2xy+2wz
      pxNewMatrix.tfMatrix(2,1) := (2.0 * pxFromQuaternion.fGet_X + pxFromQuaternion.fGet_Y) + (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_Z);

      -- 1-2x2-2z2
      pxNewMatrix.tfMatrix(2,2) := 1.0 - (2.0 * pxFromQuaternion.fGet_X * pxFromQuaternion.fGet_X) - (2.0 * pxFromQuaternion.fGet_Z * pxFromQuaternion.fGet_Z);

      -- 2yz+2wx
      pxNewMatrix.tfMatrix(2,3) := (2.0 * pxFromQuaternion.fGet_Y * pxFromQuaternion.fGet_Z) + (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_X);


      -- third row
      -- 2xz-2wy
      pxNewMatrix.tfMatrix(3,1) := (2.0 * pxFromQuaternion.fGet_X * pxFromQuaternion.fGet_Z) - (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_Y);

      -- 2yz-2wx
      pxNewMatrix.tfMatrix(3,2) := (2.0 * pxFromQuaternion.fGet_Y * pxFromQuaternion.fGet_Z) - (2.0 * pxFromQuaternion.fGet_W * pxFromQuaternion.fGet_X);

      -- 1-2x2-2y2
      pxNewMatrix.tfMatrix(3,3) := 1.0 - (2.0 * pxFromQuaternion.fGet_X * pxFromQuaternion.fGet_X) - (2.0 * pxFromQuaternion.fGet_Y * pxFromQuaternion.fGet_Y);

      return pxNewMatrix;
   end pxCreate_From_Quaternion;

   -------------------------------------
   -- pxCreate_Rotation_Around_X_Axis --
   -------------------------------------

   function pxCreate_Rotation_Around_X_Axis
     (tfAngle : in Math.Angles.TAngle)
      return pCMatrix
   is
      pxNewMatrix : pCMatrix;
      fCosAngle : float;
      fSinAngle : float;
   begin
      fCosAngle := Ada.Numerics.Elementary_Functions.Cos((float(tfAngle) * Ada.Numerics.Pi) / 180.0);
      fSinAngle := Ada.Numerics.Elementary_Functions.Sin((float(tfAngle) * Ada.Numerics.Pi) / 180.0);

      pxNewMatrix := new CMatrix;

      pxNewMatrix.tfMatrix := ( (1.0, 0.0, 0.0),
                                (0.0, fCosAngle, -fSinAngle),
                                (0.0, fSinAngle, fCosAngle));
      return pxNewMatrix;
   end pxCreate_Rotation_Around_X_Axis;


   function pxCreate
     (tfMatrix : in TMatrix)
      return pCMatrix
   is
      pxNewMatrix : pCMatrix;
   begin
      pxNewMatrix := new CMatrix;
      pxNewMatrix.tfMatrix := tfMatrix;
      return pxNewMatrix;
   end pxCreate;


   -------------------------------------
   -- pxCreate_Rotation_Around_Y_Axis --
   -------------------------------------

   function pxCreate_Rotation_Around_Y_Axis
     (tfAngle : in Math.Angles.TAngle)
      return pCMatrix
   is
      pxNewMatrix : pCMatrix;
      fCosAngle : float;
      fSinAngle : float;
   begin
      fCosAngle := Ada.Numerics.Elementary_Functions.Cos((float(tfAngle) * Ada.Numerics.Pi) / 180.0);
      fSinAngle := Ada.Numerics.Elementary_Functions.Sin((float(tfAngle) * Ada.Numerics.Pi) / 180.0);

      pxNewMatrix := new CMatrix;

      pxNewMatrix.tfMatrix := ( (fCosAngle, 0.0, -fSinAngle),
                                (0.0, 1.0, 0.0),
                                (fSinAngle, 0.0, fCosAngle));
      return pxNewMatrix;
   end pxCreate_Rotation_Around_Y_Axis;


   -------------------------------------
   -- pxCreate_Rotation_Around_Z_Axis --
   -------------------------------------

   function pxCreate_Rotation_Around_Z_Axis
     (tfAngle : in Math.Angles.TAngle)
      return pCMatrix
   is
      pxNewMatrix : pCMatrix;
      fCosAngle : float;
      fSinAngle : float;
   begin
      fCosAngle := Ada.Numerics.Elementary_Functions.Cos((float(tfAngle) * Ada.Numerics.Pi) / 180.0);
      fSinAngle := Ada.Numerics.Elementary_Functions.Sin((float(tfAngle) * Ada.Numerics.Pi) / 180.0);

      pxNewMatrix := new CMatrix;

      pxNewMatrix.tfMatrix := ( (fCosAngle, -fSinAngle, 0.0),
                                (fSinAngle, fCosAngle, 0.0),
                                (0.0, 0.0, 1.0));
      return pxNewMatrix;
   end pxCreate_Rotation_Around_Z_Axis;



   -----------------------
   -- pxCreate_Identity --
   -----------------------

   function pxCreate_Identity return pCMatrix is
      pxNewMatrix : pCMatrix;
   begin
      pxNewMatrix := new CMatrix;
      pxNewMatrix.tfMatrix := ((1.0,0.0,0.0),(0.0,1.0,0.0),(0.0,0.0,1.0));
      return pxNewMatrix;
   end pxCreate_Identity;

   ---------
   -- "*" --
   ---------

   function "*"
     (pxLeftOperandMatrix : in pCMatrix;
      pxRightOperandMatrix : in pCMatrix)
      return pCMatrix
   is
      tfMatrix : TMatrix;
   begin
      tfMatrix := (( (pxLeftOperandMatrix.tfMatrix(1,1) * pxRightOperandMatrix.tfMatrix(1,1)) +
                   (pxLeftOperandMatrix.tfMatrix(1,2) * pxRightOperandMatrix.tfMatrix(2,1)) +
                   (pxLeftOperandMatrix.tfMatrix(1,3) * pxRightOperandMatrix.tfMatrix(3,1)),

                   (pxLeftOperandMatrix.tfMatrix(1,1) * pxRightOperandMatrix.tfMatrix(1,2)) +
                   (pxLeftOperandMatrix.tfMatrix(1,2) * pxRightOperandMatrix.tfMatrix(2,2)) +
                   (pxLeftOperandMatrix.tfMatrix(1,3) * pxRightOperandMatrix.tfMatrix(3,2)),

                   (pxLeftOperandMatrix.tfMatrix(1,1) * pxRightOperandMatrix.tfMatrix(1,3)) +
                   (pxLeftOperandMatrix.tfMatrix(1,2) * pxRightOperandMatrix.tfMatrix(2,3)) +
                   (pxLeftOperandMatrix.tfMatrix(1,3) * pxRightOperandMatrix.tfMatrix(3,3))),

                   ( (pxLeftOperandMatrix.tfMatrix(2,1) * pxRightOperandMatrix.tfMatrix(1,1)) +
                   (pxLeftOperandMatrix.tfMatrix(2,2) * pxRightOperandMatrix.tfMatrix(2,1)) +
                   (pxLeftOperandMatrix.tfMatrix(2,3) * pxRightOperandMatrix.tfMatrix(3,1)),

                   (pxLeftOperandMatrix.tfMatrix(2,1) * pxRightOperandMatrix.tfMatrix(1,2)) +
                   (pxLeftOperandMatrix.tfMatrix(2,2) * pxRightOperandMatrix.tfMatrix(2,2)) +
                   (pxLeftOperandMatrix.tfMatrix(2,3) * pxRightOperandMatrix.tfMatrix(3,2)),

                   (pxLeftOperandMatrix.tfMatrix(2,1) * pxRightOperandMatrix.tfMatrix(1,3)) +
                   (pxLeftOperandMatrix.tfMatrix(2,2) * pxRightOperandMatrix.tfMatrix(2,3)) +
                   (pxLeftOperandMatrix.tfMatrix(2,3) * pxRightOperandMatrix.tfMatrix(3,3))),

                  ( (pxLeftOperandMatrix.tfMatrix(3,1) * pxRightOperandMatrix.tfMatrix(1,1)) +
                   (pxLeftOperandMatrix.tfMatrix(3,2) * pxRightOperandMatrix.tfMatrix(2,1)) +
                   (pxLeftOperandMatrix.tfMatrix(3,3) * pxRightOperandMatrix.tfMatrix(3,1)),

                   (pxLeftOperandMatrix.tfMatrix(3,1) * pxRightOperandMatrix.tfMatrix(1,2)) +
                   (pxLeftOperandMatrix.tfMatrix(3,2) * pxRightOperandMatrix.tfMatrix(2,2)) +
                   (pxLeftOperandMatrix.tfMatrix(3,3) * pxRightOperandMatrix.tfMatrix(3,2)),

                   (pxLeftOperandMatrix.tfMatrix(3,1) * pxRightOperandMatrix.tfMatrix(1,3)) +
                   (pxLeftOperandMatrix.tfMatrix(3,2) * pxRightOperandMatrix.tfMatrix(2,3)) +
                   (pxLeftOperandMatrix.tfMatrix(3,3) * pxRightOperandMatrix.tfMatrix(3,3)))

                  );
      return Math.Matrices.pxCreate(tfMatrix => tfMatrix);
   end "*";

   ---------
   -- "*" --
   ---------

   function "*"
     (pxLeftOperandMatrix : in pCMatrix;
      pxRightOperandVector : in Math.Vectors.pCVector)
      return Math.Vectors.pCVector
   is
      pxProductVector : Math.Vectors.pCVector;
   begin
      pxProductVector := Math.Vectors.pxCreate(fX =>
                                                 ( (pxLeftOperandMatrix.tfMatrix(1,1) * pxRightOperandVector.fGet_X) +
                                                  (pxLeftOperandMatrix.tfMatrix(1,2) * pxRightOperandVector.fGet_Y) +
                                                  (pxLeftOperandMatrix.tfMatrix(1,3) * pxRightOperandVector.fGet_Z) ),

                                               fY =>
                                                 ( (pxLeftOperandMatrix.tfMatrix(2,1) * pxRightOperandVector.fGet_X) +
                                                  (pxLeftOperandMatrix.tfMatrix(2,2) * pxRightOperandVector.fGet_Y) +
                                                  (pxLeftOperandMatrix.tfMatrix(2,3) * pxRightOperandVector.fGet_Z) ),

                                               fZ =>
                                                 ( (pxLeftOperandMatrix.tfMatrix(3,1) * pxRightOperandVector.fGet_X) +
                                                  (pxLeftOperandMatrix.tfMatrix(3,2) * pxRightOperandVector.fGet_Y) +
                                                  (pxLeftOperandMatrix.tfMatrix(3,3) * pxRightOperandVector.fGet_Z) ));

      return pxProductVector;
   end "*";


   ---------
   -- "*" --
   ---------

   function "*"
     (pxLeftOperandMatrix : in pCMatrix;
      pxRightOperandPlane : in Math.Planes.pCPlane)
      return Math.Planes.pCPlane
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, """*"" unimplemented");
      raise Program_Error;
      return "*" (pxLeftOperandMatrix, pxRightOperandPlane);
   end "*";

   -------------------
   -- pxGet_Inverse --
   -------------------

   function pxGet_Inverse (this : in CMatrix) return pCMatrix is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "pxGet_Inverse unimplemented");
      raise Program_Error;
      return pxGet_Inverse (this);
   end pxGet_Inverse;

   ----------------
   -- pxGet_Copy --
   ----------------

   function pxGet_Copy (this : in CMatrix) return pCMatrix is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "pxGet_Copy unimplemented");
      raise Program_Error;
      return pxGet_Copy (this);
   end pxGet_Copy;

   ---------------------
   -- pxGet_Transpose --
   ---------------------

   function pxGet_Transpose (this : in CMatrix) return pCMatrix is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "pxGet_Transpose unimplemented");
      raise Program_Error;
      return pxGet_Transpose (this);
   end pxGet_Transpose;

end Math.Matrices;
