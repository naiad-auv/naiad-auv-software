package body VirtualMachine.MatrixStack is

   -------------
   -- xCreate --
   -------------

   function xCreate (xValue : Math.Matrices.CMatrix) return TMatrixStackData is
      xNewStackData : TMatrixStackData;
   begin
      xNewStackData.xValue := xValue;
      return xNewStackData;
   end xCreate;

   ----------------
   -- xGet_Value --
   ----------------

   function xGet_Value (xStackObject : TMatrixStackData) return Math.Matrices.CMatrix is
   begin
      return xStackObject.xValue;
   end xGet_Value;

end VirtualMachine.MatrixStack;
