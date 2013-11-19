with VirtualMachine;
with VirtualMachine.MemoryStack;

package VirtualMachine.IntegerStack is

      -- Type of data on the stack.  It extends StackData so we can push these
   -- objects.
   type TIntegerStackData is new VirtualMachine.MemoryStack.TStackData with private;

   -- An easy to way to build these.
   function xCreate(iValue : Integer) return TIntegerStackData;

   -- Get the value.
   function iGet_Value(xStackObject : TIntegerStackData) return Integer;

private
   -- Its really just a record with an integer in it.
   type TIntegerStackData is new VirtualMachine.MemoryStack.TStackData with
      record
         iValue : Integer;
      end record;

end VirtualMachine.IntegerStack;
