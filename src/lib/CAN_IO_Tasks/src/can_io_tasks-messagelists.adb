package body CAN_IO_Tasks.MessageLists is
   protected body TCANMessageList is
      procedure Add(xCANMessage : in CAN_Defs.CAN_Message) is
         pxNewCANMessageListItem : pCCANMessageListItem;
      begin
         pxNewCANMessageListItem := new CCANMessageListItem;
         pxNewCANMessageListItem.xMessage := xCANMessage;
         pxNewCANMessageListItem.pxNextMessage := pxCANMessageList;
         pxCANMessageList := pxNewCANMessageListItem;
      end Add;

      procedure Remove(xCANMessage : out CAN_Defs.CAN_Message) is
         pxListItem : pCCANMessageListItem;
         pxTrailingListItem : pCCANMessageListItem;
      begin
         if pxCANMessageList /= null then
            if pxCANMessageList.pxNextMessage = null then
               xCANMessage := pxCANMessageList.xMessage;
               Free(pxCANMessageList);
               pxCANMessageList := null;
            else
               pxTrailingListItem := pxCANMessageList;
               pxListItem := pxCANMessageList.pxNextMessage;
               while pxListItem.pxNextMessage /= null loop
                  pxTrailingListItem := pxListItem;
                  pxListItem := pxListItem.pxNextMessage;
               end loop;
               xCANMessage := pxListItem.xMessage;
               Free(pxTrailingListItem.pxNextMessage);
               pxTrailingListItem.pxNextMessage := null;
            end if;
         end if;
      end Remove;

      function iCount return integer is
      begin
         if pxCANMessageList = null then
            return 0;
         end if;

         return pxCANMessageList.iCount;
      end iCount;
   end TCANMessageList;

   function iCount(this : in CCANMessageListItem) return integer is
   begin
      if this.pxNextMessage = null then
         return 1;
      end if;
      return this.pxNextMessage.iCount + 1;
   end iCount;
end CAN_IO_Tasks.MessageLists;
