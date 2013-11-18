with VirtualMachine;
with VirtualMachine.MemoryStack;
with Math.Vectors;

package VirtualMachine.VectorStack is

      -- Type of data on the stack.  It extends StackData so we can push these
   -- objects.
   type TVectorStackData is new VirtualMachine.MemoryStack.TStackData with private;

   -- An easy to way to build these.
   function xCreate(xValue : Math.Vectors.CVector) return TVectorStackData;

   -- Get the value.
   function xGet_Value(xStackObject : TVectorStackData) return Math.Vectors.CVector;

private
   -- Its really just a record with an integer in it.
   type TVectorStackData is new VirtualMachine.MemoryStack.TStackData with
      record
         xValue : Math.Vectors.CVector;
      end record;

end VirtualMachine.VectorStack;
