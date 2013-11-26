package body MissionControl.SharedTypes is

   ---------------------
   -- TCANMessageList --
   ---------------------

   protected body TCANMessageList is

      ---------
      -- Add --
      ---------

      procedure Add(xCANMessage : in CAN_Message) is
         pxNewCANMessageListItem : pCCANMessageListItem;
      begin
         pxNewCANMessageListItem := new CCANMessageListItem;
         pxNewCANMessageListItem.xMessage := xCANMessage;
         pxNewCANMessageListItem.pxNextMessage := pxCANMessageList;
         pxCANMessageList := pxNewCANMessageListItem;
      end Add;

      ------------
      -- Remove --
      ------------

      procedure Remove(xCANMessage : out CAN_Message) is
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

      ------------
      -- bEmpty --
      ------------

      function bEmpty return boolean is
      begin
         return pxCANMessageList = null;
      end bEmpty;

   end TCANMessageList;

   -----------------
   -- TObjectList --
   -----------------

   protected body TObjectList is

      ---------
      -- Add --
      ---------

      procedure Add(xNewObject : in TObjectListItem) is
      begin
         null;
      end Add;

      ------------
      -- Remove --
      ------------

      procedure Remove(xObjectRemoved : out TObjectListItem) is
      begin
         null;
      end Remove;

      ------------
      -- bEmpty --
      ------------

      function bEmpty return boolean is
      begin
         return pxObjectList = null;
      end bEmpty;

   end TObjectList;

   ----------------
   -- bSame_Type --
   ----------------

   function bSame_Type
     (this : in TObjectListItem'Class;
      xCompareWith : in TObjectListItem'Class)
      return boolean
   is
   begin
      return this in xCompareWith;
   end bSame_Type;


end MissionControl.SharedTypes;
