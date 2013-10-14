with AVR.AT90CAN128;
with AVR.AT90CAN128.CAN;
with Interfaces;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with SEND_bytes;

procedure Main is
   PRA: Interfaces.Unsigned_8;
   use type Interfaces.Integer_8;
   use type Interfaces.Unsigned_8;
   V,T: boolean;
   z,Z1,z2,z3,z4,z5,z6: Interfaces.Unsigned_16;
begin
   Ada.Text_IO.Put ( "A" );
   Ada.Text_Io.New_Line;
   SEND_bytes.Stop_Motor ( V );
   SEND_bytes.Initialize_PWM ( T );
   SEND_bytes.Command_Motor ( 120 , Z ) ;
   SEND_bytes.Command_Motor ( -128 , Z1 ) ;
   SEND_bytes.Command_Motor ( -70 , Z2 ) ;
   SEND_bytes.Command_Motor ( -30 , Z3 ) ;
   SEND_bytes.Command_Motor ( 0 , Z4 ) ;
   SEND_bytes.Command_Motor ( 13 , Z5 ) ;
   SEND_bytes.Command_Motor ( 127 , Z6 ) ;
   PRA := Send_bytes.Signed_8ToUnsigned_8(-127);
   Ada.Text_IO.Put_Line(" PRA values is :" & Interfaces.Unsigned_8'Image ( PRA ) );
end Main;
