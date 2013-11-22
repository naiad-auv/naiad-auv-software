with VirtualMachine;
with VirtualMachine.MemoryStack;

package VirtualMachine.FloatStack is

      -- Type of data on the stack.  It extends StackData so we can push these
   -- objects.
   type TFloatStackData is new VirtualMachine.MemoryStack.TStackData with private;

   -- An easy to way to build these.
   function xCreate(fValue : Float) return TFloatStackData;

   -- Get the value.
   function fGet_Value(xStackObject : TFloatStackData) return Float;

private
   -- Its really just a record with an integer in it.
   type TFloatStackData is new VirtualMachine.MemoryStack.TStackData with
      record
         fValue : Float;
      end record;

end VirtualMachine.FloatStack;
