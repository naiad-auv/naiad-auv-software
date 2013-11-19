package body VirtualMachine.IntegerStack is

   -------------
   -- xCreate --
   -------------

   function xCreate (iValue : Integer) return TIntegerStackData is
      xNewStackData : TIntegerStackData;
   begin
      xNewStackData.iValue := iValue;
      return xNewStackData;
   end xCreate;

   ----------------
   -- iGet_Value --
   ----------------

   function iGet_Value (xStackObject : TIntegerStackData) return Integer is
   begin
      return xStackObject.iValue;
   end iGet_Value;

end VirtualMachine.IntegerStack;
