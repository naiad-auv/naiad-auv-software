package body CAN_Convertions_Math is

   ------------------------------------
   -- Create_Can_Message_From_Matrix --
   ------------------------------------

   function Create_Can_Message_From_Matrix(xMatrix : math.Matrices.CMatrix) return CAN_Defs.Byte8 is
      tRawMatrix : math.matrices.TMAtrix;
      fFloats : Can_Float_Conversions.TOrientation_Matrix_Float_Array;
      xData : CAN_Defs.Byte8;
   begin
      tRawMAtrix := math.Matrices.tfGet_Raw_Matrix(xMatrix);
      fFloats(1) := tRawMAtrix(1,1);
      fFloats(2) := tRawMAtrix(2,1);
      fFloats(3) := tRawMAtrix(3,1);
      fFloats(4) := tRawMAtrix(1,2);
      fFloats(5) := tRawMAtrix(2,2);
      fFloats(6) := tRawMAtrix(3,2);
      Can_Float_Conversions.OrientationMatrix_To_Message(fFloats => fFloats ,b8Message => xData);
      return xData;
   end Create_Can_Message_From_Matrix;

   ------------------------------------
   -- Create_Matrix_From_CAN_Message --
   ------------------------------------

   function Create_Matrix_From_CAN_Message (xData : CAN_Defs.Byte8) return math.Matrices.CMatrix is
      fFloats : Can_Float_Conversions.TOrientation_Matrix_Float_Array;
      xVectorX : math.Vectors.CVector;
      xVectorY : math.Vectors.CVector;
      xVectorZ : math.Vectors.CVector;
      tRawMatrix : math.Matrices.TMatrix;
   begin
      Can_Float_Conversions.Message_To_OrientationMatrix(fFloats   => fFloats,
                                                         b8Message => xData);
      xVectorX := math.Vectors.xCreate(fX => fFloats(1),
                                       fY => fFloats(2),
                                       fZ => fFloats(3));
      xVectorY := math.Vectors.xCreate(fX => fFloats(4),
                                       fY => fFloats(5),
                                       fZ => fFloats(6));
      xVectorZ := math.Vectors.xCross_Product(xLeftOperandVector  => xVectorX,
                                              xRightOperandVector => xVectorY);
      tRawMatrix(1,1) := xVectorX.fGet_X;
      tRawMatrix(2,1) := xVectorX.fGet_Y;
      tRawMatrix(3,1) := xVectorX.fGet_Z;

      tRawMatrix(1,2) := xVectorY.fGet_X;
      tRawMatrix(2,2) := xVectorY.fGet_Y;
      tRawMatrix(3,2) := xVectorY.fGet_Z;

      tRawMatrix(1,3) := xVectorZ.fGet_X;
      tRawMatrix(2,3) := xVectorZ.fGet_Y;
      tRawMatrix(3,3) := xVectorZ.fGet_Z;
      return math.Matrices.xCreate(tfMatrix => tRawMatrix);
   end Create_Matrix_From_CAN_Message;

   function Create_Can_Message_From_Vector(xVector : math.Vectors.CVector; fMaxValue : float) return CAN_Defs.Byte8 is
      xData : CAN_Defs.Byte8;
   begin
      Can_Float_Conversions.Vector_To_Message(fX        => xVector.fGet_X,
                                              fY        => xVector.fGet_Y,
                                              fZ        => xVector.fGet_Z,
                                              b8Message => xData,
                                              fMax      => fMaxValue);
      return xData;
   end Create_Can_Message_From_Vector;

   function Create_Vector_From_CAN_Message(xData : CAN_Defs.Byte8; fMaxValue : float) return math.Vectors.CVector is
      fX,fY,fZ : float;
   begin
      Can_Float_Conversions.Message_To_Vector(fX            => fX,
                                              fY            => fY,
                                              fZ            => fZ,
                                              b8Message     => xData,
                                              fMax          => fMaxValue);
      return math.Vectors.xCreate(fX,fY,fZ);
   end Create_Vector_From_CAN_Message;


end CAN_Convertions_Math;
