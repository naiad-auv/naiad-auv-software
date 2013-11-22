with VirtualMachine;
with VirtualMachine.MemoryStack;
with Math.Matrices;

package VirtualMachine.MatrixStack is

      -- Type of data on the stack.  It extends StackData so we can push these
   -- objects.
   type TMatrixStackData is new VirtualMachine.MemoryStack.TStackData with private;

   -- An easy to way to build these.
   function xCreate(xValue : Math.Matrices.CMatrix) return TMatrixStackData;

   -- Get the value.
   function xGet_Value(xStackObject : TMatrixStackData) return Math.Matrices.CMatrix;

private
   -- Its really just a record with an integer in it.
   type TMatrixStackData is new VirtualMachine.MemoryStack.TStackData with
      record
         xValue : Math.Matrices.CMatrix;
      end record;

end VirtualMachine.MatrixStack;
