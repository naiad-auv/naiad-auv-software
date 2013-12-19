with AVR.AT90CAN128;
with AVR.AT90CAN128.CAN;
with AVR.AT90CAN128.CLOCK;
with Interfaces;
with Thruster;
with Ada.Unchecked_Conversion;
with CAN_Defs;

procedure Thruster_Main is
   use type Interfaces.Integer_8;
   use type Interfaces.Unsigned_8 ;
   use type Interfaces.Unsigned_16;
   use CAN_Defs;
   u8MotorID : Interfaces.Unsigned_8 := 2 ; -- signed motor id: 1->6
   cMsg_Received: CAN_Defs.CAN_Message;
   bCANGetRet : boolean := FALSE;
   s8ActuateVal : Thruster.Byte_I_8;
   u8var :Interfaces.Unsigned_8;
   u : Interfaces.Unsigned_8;
   u16CurPWMval : Interfaces.Unsigned_16 := 383;
   I8VAR: Interfaces.Integer_8;
   u16ThrusterVal:Interfaces.Unsigned_16;
   u16PWMInit:Interfaces.Unsigned_16;
   Command : interfaces.Unsigned_16;

   function U8var_To_I_8 is
     new Ada.Unchecked_Conversion (Source => Interfaces.Unsigned_8,
                                   Target => Interfaces.Integer_8);

begin
   AVR.AT90CAN128.DDRE.Bit_4 := TRUE;
   AVR.AT90CAN128.PORTE.Bit_4 := FAlSE;
   cMsg_Received.ID.isExtended := FALSE;
   cMsg_Received.ID.Identifier := 16#2#;
   cMsg_Received.Len := 8;
   cMsg_Received.Data(1) := 0;
   cMsg_Received.Data(2) := 0;
   cMsg_Received.Data(3) := 0;
   cMsg_Received.Data(4) := 0;
   cMsg_Received.Data(5) := 0;
   cMsg_Received.Data(6) := 0;
   cMsg_Received.Data(7) := 0;
   cMsg_Received.Data(8) := 0;

   Thruster.Initialize_PWM(u16PWMInit);
   u16CurPWMval := u16PWMInit ;

   AVR.AT90CAN128.CAN.Can_Init(CAN_Defs.K250);
    AVR.AT90CAN128.CAN.Can_Set_All_MOB_ID_MASK( (0,False),(0,False) );
   AVR.AT90CAN128.CLOCK.Delay_ms(1000);
   AVR.AT90CAN128.CAN.Can_Send(cMsg_Received);

   loop
     AVR.AT90CAN128.CAN.Can_Get(cMsg_Received ,bCANGetRet ,AVR.AT90CAN128.CLOCK.Time_Duration(-1));
      if bCANGetRet = TRUE  then
         if cMsg_Received.ID.Identifier=16#1# then
            U8VAR := cMsg_Received.Data ( CAN_Defs.DLC_Type ( u8MotorID ) );
            I8VAR := U8VAR_To_I_8 ( U8VAR );
            s8ActuateVal ( CAN_Defs.DLC_Type ( u8MotorID ) ) := I8VAR;
            U := Thruster.Signed_8ToUnsigned_8 ( I8VAR );
--            --  if U > 229 then
--              --   U := 229;
--             -- elsif U < 26 then
--             --      U := 26;
--             -- else
--              --   null;
--             -- end if;
            while_loop:
            while ( u16CurPWMval - 255 ) /= Interfaces.Unsigned_16 ( U ) loop
               if ( u16CurPWMval-255 ) > Interfaces.Unsigned_16 ( U ) then
                  u16CurPWMval := u16CurPWMval - 1;
                  Thruster.Command_Motor ( u16CurPWMval-255 , u16ThrusterVal ) ;
                  AVR.AT90CAN128.CLOCK.Delay_ms ( 100 ) ;
               elsif ( u16CurPWMval-255 ) < Interfaces.Unsigned_16( U ) then
                  u16CurPWMval := u16CurPWMval + 1;
                  AVR.AT90CAN128.CLOCK.Delay_ms ( 100 );
                  Thruster.Command_Motor ( u16CurPWMval-255 , u16ThrusterVal );
               end if;
            end loop while_loop;
         else
            null;
         end if;
      else
         null;
      end if;
   end  loop;
end Thruster_Main;
