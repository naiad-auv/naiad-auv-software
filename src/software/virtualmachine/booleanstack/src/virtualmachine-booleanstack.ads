with VirtualMachine;
with VirtualMachine.MemoryStack;

package VirtualMachine.BooleanStack is

      -- Type of data on the stack.  It extends StackData so we can push these
   -- objects.
   type TBooleanStackData is new VirtualMachine.MemoryStack.TStackData with private;

   -- An easy to way to build these.
   function xCreate(bValue : Boolean) return TBooleanStackData;

   -- Get the value.
   function bGet_Value(xStackObject : TBooleanStackData) return Boolean;

private
   -- Its really just a record with an integer in it.
   type TBooleanStackData is new VirtualMachine.MemoryStack.TStackData with
      record
         bValue : Boolean;
      end record;

end VirtualMachine.BooleanStack;
