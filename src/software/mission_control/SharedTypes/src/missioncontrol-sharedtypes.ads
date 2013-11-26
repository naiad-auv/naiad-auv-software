with MissionControl;
--with AVR.AT90CAN128.CAN;
with Ada.Unchecked_Deallocation;

package MissionControl.SharedTypes is

   type CAN_Message is null record; -- temporary until this can be built with AT90CAN128 messages

   type CCANMessageListItem is tagged private;
   type pCCANMessageListItem is access CCANMessageListItem;

   type CObjectListsListItem is tagged private;
   type pCObjectListsListItem is access CObjectListsListItem;

   type TObjectListItem is tagged private;
   type pTObjectListItem is access TObjectListItem'class;


   protected type TCANMessageList is
      procedure Add(xCANMessage : in CAN_Message);
      procedure Remove(xCANMessage : out CAN_Message);
      function bEmpty return boolean;
      private
      pxCANMessageList : pCCANMessageListItem;
   end TCANMessageList;

   protected type TObjectList is
      procedure Add(xNewObject : in TObjectListItem);
      procedure Remove(xObjectRemoved : out TObjectListItem);
      function bEmpty return boolean;
      private
      pxObjectList : pCObjectListsListItem;
   end TObjectList;


   xCANOutMessageList : TCANMessageList;
   xCANInMessageList : TCANMessageList;
   xCANSimulatedMessageList : TCANMessageList;

   xObjectsInList : TObjectList;
   xObjectsOutList : TObjectList;


private

   type TObjectListItem is tagged
      record
         pxNextObject : pTObjectListItem;
      end record;

   type CCANMessageListItem is tagged
      record
         xMessage : CAN_Message;--AVR.AT90CAN128.CAN.CAN_Message;
         pxNextMessage : pCCANMessageListItem;
      end record;

   type CObjectListsListItem is tagged
      record
         pxObjectList : pTObjectListItem;
         pxNextObjectList : pCObjectListsListItem;
      end record;

   procedure Add(this : in out CObjectListsListItem; pxObjectListItem : in pTObjectListItem);
   function bSame_Type(this : in TObjectListItem'Class; xCompareWith : in TObjectListItem'Class) return boolean;
   procedure Free is new Ada.Unchecked_Deallocation(CCANMessageListItem, pCCANMessageListItem);

end MissionControl.SharedTypes;
