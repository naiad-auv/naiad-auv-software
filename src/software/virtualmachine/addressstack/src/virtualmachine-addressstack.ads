with VirtualMachine;
with VirtualMachine.MemoryStack;

package VirtualMachine.AddressStack is

   type TStackAddress is new Integer;
   -- Type of data on the stack.  It extends StackData so we can push these
   -- objects.
   type TAddressStackData is new VirtualMachine.MemoryStack.TStackData with private;

   -- An easy to way to build these.
   function xCreate(tiValue : TStackAddress) return TAddressStackData;

   -- Get the value.
   function tiGet_Value(xStackObject : TAddressStackData) return TStackAddress;

private
   -- Its really just a record with an integer in it.
   type TAddressStackData is new VirtualMachine.MemoryStack.TStackData with
      record
         tiValue : TStackAddress;
      end record;

end VirtualMachine.AddressStack;
