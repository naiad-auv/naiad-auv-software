with Ada.Unchecked_Deallocation;

package body VirtualMachine.MemoryStack is
   -- Deallocators needed here.
   procedure Free is new Ada.Unchecked_Deallocation(TNode, pTNode);
   procedure Free is new Ada.Unchecked_Deallocation(TStackData'Class, pTStackData);

   -- Make and return a copy of the stack nodes.  Recursion saves a lot of
   -- of picky detail work.
   function CopyOf(pxNode : pTNode) return pTNode is
      pxData: pTStackData;           -- Pointer to the dymically-allocated data.
      pxRestCopied: pTNode;     -- Copy of the rest of the list.
   begin
      if pxNode = null then
         return null;
      else
         -- Copy the rest of the list.  Get a pointer to it.
         pxRestCopied := CopyOf(pxNode.pxNext);

         -- Allocate space for the data.  This form of new (eccch) will
         -- allocate an object of the same dynamic type as P.Data.all.
         pxData := new TStackData'class'(pxNode.pxData.all);

         -- Make a node to hold those two wonderful fields we just created.
         return new TNode'(pxData, pxRestCopied);
      end if;
   end CopyOf;

   -- Destroy the list.
   procedure Destroy(pxNode : in out pTNode) is
   begin
      if pxNode /= null then
         -- Destroy the rest of the list.
         Destroy(pxNode.pxNext);

         -- Obliterate the data space, then the node, and clear the pointer.
         Free(pxNode.pxData);
         Free(pxNode);
         pxNode := null;
      end if;
   end;

   -- Create the stack empty.  Not too hard.
   procedure Initialize (this : in out CMemoryStack) is
   begin
      this.pxHead := null;
   end Initialize;

   -- Destroy a stack on its way out.
   procedure Finalize (this : in out CMemoryStack) is
   begin
      Destroy(this.pxHead);
   end;

   -- Adjust the copy after assignment.  This involves making an
   -- independent copy of nodes.
   procedure Adjust (this : in out CMemoryStack) is
   begin
      this.pxHead := CopyOf(this.pxHead);
   end;

   -- Stack operations.
   procedure Push (this : in out CMemoryStack; xStackData : TStackData'class) is
      pxData: pTStackData;           -- Pointer to the dymically-allocated data.
   begin
      -- Allocate a dynamic copy of the data.  The object allocated takes
      -- the value of D, and also its type, which can be StackData or any of
      -- its descendants.
      pxData := new TStackData'class'(xStackData);

      -- Add a node with this data to the front of the list.
      this.pxHead := new TNode'(pxData, this.pxHead);
   end Push;

   procedure Pop (this : in out CMemoryStack; xStackData : in out TStackData'class) is
      pxOldNode: pTNode;         -- Node to be deleted.
   begin
      if this.pxHead /= null then
         -- Retain the existing head pointer, then advance it.
         pxOldNode := this.pxHead;
         this.pxHead := this.pxHead.pxNext;

         -- Report the data from the former head node to the caller.
         xStackData := pxOldNode.pxData.all;

         -- Free the data part, and also the node itself.
         Free(pxOldNode.pxData);
         Free(pxOldNode);
      end if;
   end Pop;

   procedure Peek(this : in out CMemoryStack; xStackData : in out TStackData'class; iIndex : in integer) is
      pxNode : pTNode := this.pxHead;
   begin
      for i in 1 .. iIndex loop
         pxNode := pxNode.pxNext;
      end loop;
      xStackData := pxNode.pxData.all;
   end Peek;

   procedure Change(this : in out CMemoryStack; xStackData : in out TStackData'class; iIndex : in integer) is
      pxNode : pTNode := this.pxHead;
   begin
      for i in 1 .. iIndex loop
         pxNode := pxNode.pxNext;
      end loop;
      pxNode.pxData.all := xStackData;
   end Change;



   -- Fill in Data with the top of the stack, if any.
   procedure Top (this : CMemoryStack; xStackData : in out TStackData'class) is
   begin
      if this.pxHead /= null then
         xStackData := this.pxHead.pxData.all;
      end if;
   end Top;

   -- Tell if the generalized stack is empty.
   function Empty (this : CMemoryStack) return Boolean is
   begin
      return this.pxHead = null;
   end Empty;

   procedure Free(pxMemoryStackToDeallocate : in out pCMemoryStack) is
      procedure Dealloc is new Ada.Unchecked_Deallocation(CMemoryStack, pCMemoryStack);
   begin
      Dealloc(pxMemoryStackToDeallocate);
   end Free;

end VirtualMachine.MemoryStack;
