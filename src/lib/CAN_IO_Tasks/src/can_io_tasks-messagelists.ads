with Ada.Unchecked_Deallocation;
with CAN_Defs;

package CAN_IO_Tasks.MessageLists is

   type CCANMessageListItem is tagged private;
   type pCCANMessageListItem is access CCANMessageListItem;

   protected type TCANMessageList is
      procedure Add(xCANMessage : in CAN_Defs.CAN_Message);
      procedure Remove(xCANMessage : out CAN_Defs.CAN_Message);
      function iCount return integer;

   private
      pxCANMessageList : pCCANMessageListItem;
   end TCANMessageList;


   xCANOutMessageList : TCANMessageList;
   xCANInMessageList : TCANMessageList;


private

   type CCANMessageListItem is tagged
      record
         xMessage : CAN_Defs.CAN_Message;
         pxNextMessage : pCCANMessageListItem;
      end record;

   function iCount(this : in CCANMessageListItem) return integer;

   -- memory deallocation
   procedure Free is new Ada.Unchecked_Deallocation(CCANMessageListItem, pCCANMessageListItem);

end CAN_IO_Tasks.MessageLists;
