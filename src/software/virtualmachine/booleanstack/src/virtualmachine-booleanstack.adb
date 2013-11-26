package body VirtualMachine.BooleanStack is

   -------------
   -- xCreate --
   -------------

   function xCreate (bValue : Boolean) return TBooleanStackData is
      xNewStackData : TBooleanStackData;
   begin
      xNewStackData.bValue := bValue;
      return xNewStackData;
   end xCreate;

   ----------------
   -- fGet_Value --
   ----------------

   function bGet_Value (xStackObject : TBooleanStackData) return Boolean is
   begin
      return xStackObject.bValue;
   end bGet_Value;

end VirtualMachine.BooleanStack;
