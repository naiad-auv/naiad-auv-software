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


      function iCount(xObjectType : in TObjectListItem'Class) return integer is
         pxObjectListsIterator : pCObjectListsListItem;
      begin

         while pxObjectListsIterator /= null and then
           pxObjectListsIterator.pxObjectList /= null and then
           not xObjectType.bIs_Same_Type_As(pxObjectListsIterator.pxObjectList.all) loop

            pxObjectListsIterator := pxObjectListsIterator.pxNextObjectList;

         end loop;

         if pxObjectListsIterator /= null and then
           pxObjectListsIterator.pxObjectList /= null and then
           xObjectType.bIs_Same_Type_As(pxObjectListsIterator.pxObjectList.all) then

            return pxObjectListsIterator.pxObjectList.iCount;
         end if;

         return 0;
      end iCount;

      ---------
      -- Add --
      ---------

      procedure Add(xNewObject : in TObjectListItem'Class) is
         pxObjectListsIterator : pCObjectListsListItem;
         pxNewObject : pTObjectListItem;
      begin
         if pxObjectList = null then

            pxObjectList := new CObjectListsListItem;
            pxObjectList.pxObjectList := new TObjectListItem'class'(xNewObject);
            pxObjectList.pxObjectList.pxNextObject := null;
            pxObjectList.pxNextObjectList := null;

         else

            pxObjectListsIterator := pxObjectList;

            while pxObjectListsIterator /= null and then
              pxObjectListsIterator.pxObjectList /= null and then
              not xNewObject.bIs_Same_Type_As(pxObjectListsIterator.pxObjectList.all) loop

               pxObjectListsIterator := pxObjectListsIterator.pxNextObjectList;

            end loop;

            if pxObjectListsIterator /= null and then
              pxObjectListsIterator.pxObjectList /= null and then
              xNewObject.bIs_Same_Type_As(pxObjectListsIterator.pxObjectList.all) then

               -- found list
               pxNewObject := new TObjectListItem'class'(xNewObject);
               pxNewObject.pxNextObject := pxObjectListsIterator.pxObjectList;
               pxObjectListsIterator.pxObjectList := pxNewObject;

            else

               -- no list found
               pxObjectListsIterator := pxObjectList;

               while pxObjectListsIterator.pxNextObjectList /= null loop
                  pxObjectListsIterator := pxObjectListsIterator.pxNextObjectList;
               end loop;

               pxObjectListsIterator.pxNextObjectList := new CObjectListsListItem;
               pxObjectListsIterator := pxObjectListsIterator.pxNextObjectList;
               pxObjectListsIterator.pxObjectList := new TObjectListItem'class'(xNewObject);
               pxObjectListsIterator.pxObjectList.pxNextObject := null;

            end if;

         end if;

      end Add;

      ------------
      -- Remove --
      ------------

      procedure Remove(xObjectRemoved : in out TObjectListItem'Class) is
         pxObjectListsIterator : pCObjectListsListItem;
         pxTrailingObjectListsIterator : pCObjectListsListItem;
         pxObject : pTObjectListItem;
         pxTrailingObject : pTObjectListItem;
      begin
         if pxObjectList = null then
            null;
         else

            pxObjectListsIterator := pxObjectList;

            while pxObjectListsIterator /= null and then
              pxObjectListsIterator.pxObjectList /= null and then
              not xObjectRemoved.bIs_Same_Type_As(pxObjectListsIterator.pxObjectList.all) loop

               pxTrailingObjectListsIterator := pxObjectListsIterator;
               pxObjectListsIterator := pxObjectListsIterator.pxNextObjectList;

            end loop;

            if pxObjectListsIterator /= null and then
              pxObjectListsIterator.pxObjectList /= null and then
              xObjectRemoved.bIs_Same_Type_As(pxObjectListsIterator.pxObjectList.all) then

               -- list found

               pxObject := pxObjectListsIterator.pxObjectList;
               if pxObject.pxNextObject = null then
                  -- only 1 item in object list
                  xObjectRemoved := pxObject.all;
                  Free(pxObjectListsIterator.pxObjectList);
               else
                  -- more than 1 items in object list
                  while pxObject.pxNextObject /= null loop
                     -- goto last item
                     pxTrailingObject := pxObject;
                     pxObject := pxObject.pxNextObject;
                  end loop;
                  xObjectRemoved := pxObject.all;
                  Free(pxTrailingObject.pxNextObject);
               end if;

               if pxObjectListsIterator.pxObjectList = null then
                  -- object list is now empty
                  if pxObjectListsIterator = pxObjectList then
                     -- object list is the only list left
                     Free(pxObjectList);
                  else
                     -- object list is one among many
                     Free(pxTrailingObjectListsIterator.pxNextObjectList);
                  end if;
               end if;
            else
               null;
            end if;

         end if;

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
   -- bIs_Same_Type_As --
   ----------------

   function bIs_Same_Type_As
     (this : in TObjectListItem'Class;
      xCompareWith : in TObjectListItem'Class)
      return boolean
   is
   begin
      return this in xCompareWith;
   end bIs_Same_Type_As;

   function iCount(this : in TObjectListItem'Class) return integer is
   begin
      if this.pxNextObject = null then
         return 1;
      end if;
      return this.pxNextObject.iCount + 1;
   end iCount;


end MissionControl.SharedTypes;
