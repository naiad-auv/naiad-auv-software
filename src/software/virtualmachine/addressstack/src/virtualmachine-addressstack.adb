package body VirtualMachine.AddressStack is

   -------------
   -- xCreate --
   -------------

   function xCreate (tiValue : TStackAddress) return TAddressStackData is
      xNewStackData : TAddressStackData;
   begin
      xNewStackData.tiValue := tiValue;
      return xNewStackData;
   end xCreate;

   -----------------
   -- tiGet_Value --
   -----------------

   function tiGet_Value
     (xStackObject : TAddressStackData)
      return TStackAddress
   is
   begin
      return xStackObject.tiValue;
   end tiGet_Value;

end VirtualMachine.AddressStack;
