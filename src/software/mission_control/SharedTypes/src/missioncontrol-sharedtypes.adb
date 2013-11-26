package body MissionControl.SharedTypes is

   protected body TCANMessageList is
      procedure Add(xCANMessage : in CAN_Message) is
         pxNewCANMessageListItem : pCCANMessageListItem;
      begin
         pxNewCANMessageListItem := new CCANMessageListItem;
         pxNewCANMessageListItem.xMessage := xCANMessage;
         pxNewCANMessageListItem.pxNextMessage := pxCANMessageList;
         pxCANMessageList := pxNewCANMessageListItem;
      end Add;

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

      function iCount return integer is
      begin
         if pxCANMessageList = null then
            return 0;
         end if;

         return pxCANMessageList.iCount;
      end iCount;
   end TCANMessageList;


   protected body TObjectList is
      function iCount return integer is
      begin
         if pxObjectList = null then
            return 0;
         end if;
         return pxObjectList.iCount;
      end iCount;

      procedure Add(xNewObject : in TListObject'Class) is
         pxNewObject : pTListObject;
      begin
         pxNewObject := new TListObject'class'(xNewObject);
         pxNewObject.pxNextObject := pxObjectList;
         pxObjectList := pxNewObject;
      end Add;

      procedure Remove(pxObjectRemoved : out pTListObject) is
         pxObject : pTListObject;
         pxTrailingObject : pTListObject;
      begin
         if pxObjectList /= null then
            if pxObjectList.pxNextObject = null then
               pxObjectRemoved := new TListObject'class'(pxObjectList.all);
               Free(pxObjectList);
            else
               pxObject := pxObjectList;
               while pxObject.pxNextObject /= null loop
                  pxTrailingObject := pxObject;
                  pxObject := pxObject.pxNextObject;
               end loop;
               pxObjectRemoved := new TListObject'class'(pxObject.all);
               Free(pxTrailingObject.pxNextObject);
            end if;
         end if;
      end Remove;
   end TObjectList;


   function bIs_Same_Type_As (this : in TListObject'Class; xCompareWith : in TListObject'Class) return boolean is
   begin
      return this in xCompareWith;
   end bIs_Same_Type_As;

   function iCount(this : in TListObject'Class) return integer is
   begin
      if this.pxNextObject = null then
         return 1;
      end if;
      return this.pxNextObject.iCount + 1;
   end iCount;

   function iCount(this : in CCANMessageListItem) return integer is
   begin
      if this.pxNextMessage = null then
         return 1;
      end if;
      return this.pxNextMessage.iCount + 1;
   end iCount;

   procedure Dealloc(pxListObject : in out pTListObject) is
   begin
      Free(pxListObject);
   end Dealloc;

   function xGet_CAN_Message_From_Object(this : in TListObject'Class) return CAN_Message is
      xCANMessage : CAN_Message;
   begin
      -- TODO: build CAN message based on object
      -- Types inheriting from TListObject should override this function
      return xCANMessage;
   end xGet_CAN_Message_From_Object;

   function xGet_Object_From_CAN_Message(xCANMessage : in CAN_Message) return TListObject'Class is
      xObject : TListObject;
   begin
      -- TODO: this function should be overridden in inheriting types
      return xObject;
   end xGet_Object_From_CAN_Message;


end MissionControl.SharedTypes;
