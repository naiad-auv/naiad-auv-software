package body VirtualMachine.FloatStack is

   -------------
   -- xCreate --
   -------------

   function xCreate (fValue : Float) return TFloatStackData is
      xNewStackData : TFloatStackData;
   begin
      xNewStackData.fValue := fValue;
      return xNewStackData;
   end xCreate;

   ----------------
   -- fGet_Value --
   ----------------

   function fGet_Value (xStackObject : TFloatStackData) return Float is
   begin
      return xStackObject.fValue;
   end fGet_Value;

end VirtualMachine.FloatStack;
