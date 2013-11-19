package body VirtualMachine.VectorStack is

   -------------
   -- xCreate --
   -------------

   function xCreate (xValue : Math.Vectors.CVector) return TVectorStackData is
      xNewStackData : TVectorStackData;
   begin
      xNewStackData.xValue := xValue;
      return xNewStackData;
   end xCreate;

   ----------------
   -- xGet_Value --
   ----------------

   function xGet_Value (xStackObject : TVectorStackData) return Math.Vectors.CVector is
   begin
      return xStackObject.xValue;
   end xGet_Value;

end VirtualMachine.VectorStack;
