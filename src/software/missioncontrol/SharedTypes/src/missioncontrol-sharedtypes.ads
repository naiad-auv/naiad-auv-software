with MissionControl;
--with AVR.AT90CAN128.CAN;
with Ada.Unchecked_Deallocation;
with Ada.Tags;
--with Ada.Text_IO; -- for testing

package MissionControl.SharedTypes is

   type CAN_Message is null record; -- temporary until this can be built with AT90CAN128 messages

   type CCANMessageListItem is tagged private;
   type pCCANMessageListItem is access CCANMessageListItem;


   type TListObject is tagged private;
   type pTListObject is access TListObject'class;





   protected type TCANMessageList is
      procedure Add(xCANMessage : in CAN_Message);
      procedure Remove(xCANMessage : out CAN_Message);
      function iCount return integer;

   private
      pxCANMessageList : pCCANMessageListItem;
   end TCANMessageList;

   protected type TObjectList is
      procedure Add(xNewObject : in TListObject'Class);
      procedure Remove (pxObjectRemoved : out pTListObject); -- NEEDS TO FREE pxObjectRemoved AFTER!
      function iCount return integer;

   private
      pxObjectList : pTListObject;
   end TObjectList;


   xCANOutMessageList : TCANMessageList;
   xCANInMessageList : TCANMessageList;
   xCANSimulatedMessageList : TCANMessageList;

   xObjectsInList : TObjectList;
   xObjectsOutList : TObjectList;

   function xGet_CAN_Message_From_Object(this : in TListObject'Class) return CAN_Message;
   function xGet_Object_From_CAN_Message(xCANMessage : in CAN_Message) return TListObject'Class;
   procedure Dealloc(pxListObject : in out pTListObject);

private

   type TListObject is tagged
      record
         xCANMessage : CAN_Message;
         pxNextObject : pTListObject;
      end record;

   function iCount(this : in TListObject'Class) return integer;
   function bIs_Same_Type_As(this : in TListObject'Class; xCompareWith : in TListObject'Class) return boolean;


   type CCANMessageListItem is tagged
      record
         xMessage : CAN_Message;--AVR.AT90CAN128.CAN.CAN_Message;
         pxNextMessage : pCCANMessageListItem;
      end record;

   function iCount(this : in CCANMessageListItem) return integer;




   -- memory deallocation
   procedure Free is new Ada.Unchecked_Deallocation(CCANMessageListItem, pCCANMessageListItem);
   procedure Free is new Ada.Unchecked_Deallocation(TListObject'Class, pTListObject);

end MissionControl.SharedTypes;
