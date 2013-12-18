with CAN_Defs;
with math.Matrices;
with math.Vectors;
with Can_Float_Conversions;

package CAN_Convertions_Matrix is

   function Create_Can_Message_From_Matrix(xMatrix : math.Matrices.CMatrix) return CAN_Defs.Byte8;
   function Create_Matrix_From_CAN_Message(xData : CAN_Defs.Byte8) return math.Matrices.CMatrix;

end CAN_Convertions_Matrix;
