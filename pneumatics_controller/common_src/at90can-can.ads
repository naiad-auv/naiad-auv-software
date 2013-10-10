package AT90CAN.CAN is

   -- General_Register


   type Full_MOB_ID is range 0..15;
   for Full_MOB_ID'size use 4;

   subtype MOB_ID is Full_MOB_ID range 0..14;

   type MOB_Array is array (MOB_ID) of Boolean;
   pragma Pack (MOB_Array);


   CANGCON  : General_Register;
   for CANGCON'Address use System'To_Address (16#D8#);

   CANSTA  : General_Register;
   for CANSTA'Address use System'To_Address (16#D9#);

   CANIT  : General_Register;
   for CANIT'Address use System'To_Address (16#DA#);

   CANGIE  : General_Register;
   for CANGIE'Address use System'To_Address (16#DB#);

   CANEN  : MOB_Array;
   for CANEN'Address use System'To_Address (16#DC#);

   CANIE  : MOB_Array;
   for CANIE'Address use System'To_Address (16#DE#);

   CANSIT  : MOB_Array;
   for CANSIT'Address use System'To_Address (16#E0#);

   CANBT1  : Unsigned_8;
   for CANBT1'Address use System'To_Address (16#E2#);

   CANBT2  : Unsigned_8;
   for CANBT2'Address use System'To_Address (16#E3#);

   CANBT3  : Unsigned_8;
   for CANBT3'Address use System'To_Address (16#E4#);

   CANTCON  : Unsigned_8;
   for CANTCON'Address use System'To_Address (16#E5#);

   CANTIM  : Unsigned_16;
   for CANTIM'Address use System'To_Address (16#E6#);

   CANTTC  : Unsigned_16;
   for CANTTC'Address use System'To_Address (16#E8#);

   CANTEC  : Unsigned_8;
   for CANTEC'Address use System'To_Address (16#EA#);

   CANREC  : Unsigned_8;
   for CANREC'Address use System'To_Address (16#EB#);


   type CAN_Message_Index is range 0..7;
   for CAN_Message_Index'size use 3;

   type CAN_Page_Type is record
      MOB : Full_MOB_ID;
      Auto_Increment : Boolean;
      Index          : CAN_Message_Index;
   end record;

   for CAN_Page_Type use record
      MOB at 0 range 4..7;
      Auto_Increment at 0 range 3..3;
      Index at 0 range 0..2;
   end record;

   for CAN_Page_Type'size use 8;



   type MOB_State is (Disable,
                      Enable_Transmission,
                      Enable_Reception,
                      Enable_Frame_Buffer_Reception);
   for MOB_State'size use 2;

   type DLC_Type is range 0..8;
   for DLC_Type'size use 4;

   type CAN_MOB_Control is record
      State : MOB_State;
      Reply_Valid : Boolean;
      Extended_ID : Boolean;
      DLC         : DLC_Type;
   end record;
   for CAN_MOB_Control use record
      State       at 0 range 6..7;
      Reply_Valid at 0 range 5..5;
      Extended_ID at 0 range 4..4;
      DLC         at 0 range 0..3;
   end record;
   for CAN_MOB_Control'size use 8;

   CANHPMOB  : CAN_Page_Type;
   for CANHPMOB'Address use System'To_Address (16#EC#);

   CANPAGE  : CAN_Page_Type;
   for CANPAGE'Address use System'To_Address (16#ED#);

   CANSTMOB  : aliased General_Register;
   for CANSTMOB'Address use System'To_Address (16#EE#);

   CANCDMOB  : CAN_MOB_Control;
   for CANCDMOB'Address use System'To_Address (16#EF#);

   CANIDTX  : Unsigned_16;
   for CANIDTX'Address use System'To_Address (16#F0#);

   CANIDT  : Unsigned_16;
   for CANIDT'Address use System'To_Address (16#F2#);


   CANIDMX  : Unsigned_16;
   for CANIDMX'Address use System'To_Address (16#F4#);

   CANIDM  : Unsigned_16;
   for CANIDM'Address use System'To_Address (16#F6#);


   CANSTM  : Unsigned_16;
   for CANSTM'Address use System'To_Address (16#F8#);

   CANMSG  : Unsigned_8;
   for CANMSG'Address use System'To_Address (16#FA#);


end AT90CAN.CAN;
