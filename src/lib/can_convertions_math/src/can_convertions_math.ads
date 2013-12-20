with CAN_Defs;
with math.Matrices;
with math.Vectors;
with Can_Float_Conversions;

package CAN_Convertions_Math is

   type TMotorValues is array (1..6) of float;

   function Create_Can_Message_From_Matrix(xMatrix : math.Matrices.CMatrix) return CAN_Defs.Byte8;
   function Create_Matrix_From_CAN_Message(xData : CAN_Defs.Byte8) return math.Matrices.CMatrix;

   function Create_Can_Message_From_Vector(xVector : math.Vectors.CVector; fMaxValue : float) return CAN_Defs.Byte8;
   function Create_Vector_From_CAN_Message(xData : CAN_Defs.Byte8; fMaxValue : float) return math.Vectors.CVector;

   function Create_Can_Message_From_Motor_Value(tMotors : TMotorValues) return CAN_Defs.Byte8;
   function Create_Motor_Value_From_Can_Message(xData : CAN_Defs.Byte8) return TMotorValues;

end CAN_Convertions_Math;
