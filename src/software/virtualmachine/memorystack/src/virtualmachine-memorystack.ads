with VirtualMachine;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;

package VirtualMachine.MemoryStack is

   -- This is the stack type.
   type CMemoryStack is new Ada.Finalization.Controlled with private;
   type pCMemoryStack is access CMemoryStack;

   -- This is the base type for nodes.  Client packages must derive their
   -- nodes from StackData.  Since it comes from Controlled, the user can
   -- override the Initialize, Adjust, and Finalize methods as needed.
   type TStackData is new Ada.Finalization.Controlled with null record;

   -- Initialization operations.
   procedure Initialize(this : in out CMemoryStack);
   procedure Adjust(this : in out CMemoryStack);
   procedure Finalize(this : in out CMemoryStack);

   -- Memory deallocation
   procedure Free(pxMemoryStackToDeallocate : in out pCMemoryStack);

   -- Stack operations.
   procedure Push(this : in out CMemoryStack; xStackData : TStackData'class);
   procedure Pop(this : in out CMemoryStack; xStackData : in out TStackData'class);
   procedure Top(this : CMemoryStack; xStackData : in out TStackData'class);
   function Empty(this : CMemoryStack) return Boolean;

private
   -- Pointer to the node type.
   type TNode;
   type pTNode is access TNode;

   -- Here is the generalized stack itself.  We would just make it the
   -- pointer itself, but it needs to be a record so it can be in a with.
   type CMemoryStack is new Ada.Finalization.Controlled with
      record
         pxHead: pTNode;
      end record;

   -- Now, we need a pointer to the data part.
   type pTStackData is access TStackData'Class;

   -- This is the node type.
   type TNode is record
      pxData: pTStackData;
      pxNext: pTNode;
   end record;

end VirtualMachine.MemoryStack;
