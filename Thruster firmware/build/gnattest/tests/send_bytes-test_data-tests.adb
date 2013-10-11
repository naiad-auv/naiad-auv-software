--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into SEND_bytes.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body SEND_bytes.Test_Data.Tests is

   procedure Test_TMBAsendByteToMotor (Gnattest_T : in out Test);
   procedure Test_TMBAsendByteToMotor_f8abae (Gnattest_T : in out Test) renames Test_TMBAsendByteToMotor;
   procedure Test_TMBAsendByteToMotor (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
      BT:Byte_I_8;
      Res:TMotorByteArray;
      use type interfaces.Integer_8;
   begin
      BT(1):= -127;
      BT(2):= -110;
      BT(3) := -30;
      BT(4) := -10;
      BT(5) := 0;
      BT(6) := 20;
      BT(7) := 40;
      BT(8) := 127;
      Res := TMBAsendByteToMotor(8,BT);
      AUnit.Assertions.Assert((Res(1)=-127) and (Res(2)=-110) and (Res(3)=-30)
                              and (Res(4)=-10) and (Res(5)=0) and (Res(6)=20)
                              and (Res(7)=40) and (Res(8)=127),"Extracting data from CAN Message failed");
   end Test_TMBAsendByteToMotor;


   procedure Test_Command_Motor (Gnattest_T : in out Test);
   procedure Test_Command_Motor_18d79a (Gnattest_T : in out Test) renames Test_Command_Motor;
   procedure Test_Command_Motor (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
      var1 : Interfaces.Unsigned_8 := 0;
      X1 : Interfaces.Unsigned_16;
      use type Interfaces.Unsigned_16;
   begin
      Command_Motor(var1,X1 );
      AUnit.Assertions.Assert
        (X1=255,
         "Starting PWM signal failed");
   end Test_Command_Motor;

procedure Test_Initialize_PWM (Gnattest_T : in out Test);
procedure Test_Initialize_PWM_1b0c92 (Gnattest_T : in out Test) renames Test_Initialize_PWM;
procedure Test_Initialize_PWM (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
      PWM : boolean;
begin
      Initialize_PWM(PWM);
      AUnit.Assertions.Assert(PWM=TRUE,"Initialization of PWM failed");
end Test_Initialize_PWM;


procedure Test_Signed_8ToUnsigned_8 (Gnattest_T : in out Test);
procedure Test_Signed_8ToUnsigned_8_853abe (Gnattest_T : in out Test) renames Test_Signed_8ToUnsigned_8;
procedure Test_Signed_8ToUnsigned_8 (Gnattest_T : in out Test) is
   pragma Unreferenced (Gnattest_T);
      Unsg:interfaces.Unsigned_8;
      use type Interfaces.Integer_8;
      use type Interfaces.Unsigned_8;
   begin
      Unsg := Signed_8ToUnsigned_8(-128);
      Ada.Text_IO.Put_Line("The Unsgn value is : " & interfaces.Unsigned_8'Image(Unsg) );
      AUnit.Assertions.Assert(Unsg=0,"Signed_8ToUnsigned_8 failed");
end Test_Signed_8ToUnsigned_8;



procedure Test_Stop_Motor (Gnattest_T : in out Test);
procedure Test_Stop_Motor_98df65 (Gnattest_T : in out Test) renames Test_Stop_Motor;
procedure Test_Stop_Motor (Gnattest_T : in out Test) is
      pragma Unreferenced (Gnattest_T);
      STOP:boolean;
begin
 	Stop_Motor(STOP);
        AUnit.Assertions.Assert(STOP=TRUE,"Could not stop PWM");
end Test_Stop_Motor;

end SEND_bytes.Test_Data.Tests;
