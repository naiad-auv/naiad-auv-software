--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body SEND_bytes.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.SEND_bytes.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_TMBAsendByteToMotor_f8abae : aliased Runner_1.Test_Case;
   Case_2_1_Test_Command_Motor_18d79a : aliased Runner_1.Test_Case;
   Case_3_1_Test_Initialize_PWM_1b0c92 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Signed_8ToUnsigned_8_853abe : aliased Runner_1.Test_Case;
   Case_5_1_Test_Stop_Motor_98df65 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_TMBAsendByteToMotor_f8abae,
         "send_bytes.ads:11:4:",
         Test_TMBAsendByteToMotor_f8abae'Access);
      Runner_1.Create
        (Case_2_1_Test_Command_Motor_18d79a,
         "send_bytes.ads:12:4:",
         Test_Command_Motor_18d79a'Access);
      Runner_1.Create
        (Case_3_1_Test_Initialize_PWM_1b0c92,
         "send_bytes.ads:13:4:",
         Test_Initialize_PWM_1b0c92'Access);
      Runner_1.Create
        (Case_4_1_Test_Signed_8ToUnsigned_8_853abe,
         "send_bytes.ads:14:4:",
         Test_Signed_8ToUnsigned_8_853abe'Access);
      Runner_1.Create
        (Case_5_1_Test_Stop_Motor_98df65,
         "send_bytes.ads:15:4:",
         Test_Stop_Motor_98df65'Access);

      Result.Add_Test (Case_1_1_Test_TMBAsendByteToMotor_f8abae'Access);
      Result.Add_Test (Case_2_1_Test_Command_Motor_18d79a'Access);
      Result.Add_Test (Case_3_1_Test_Initialize_PWM_1b0c92'Access);
      Result.Add_Test (Case_4_1_Test_Signed_8ToUnsigned_8_853abe'Access);
      Result.Add_Test (Case_5_1_Test_Stop_Motor_98df65'Access);

      return Result'Access;

   end Suite;

end SEND_bytes.Test_Data.Tests.Suite;
--  end read only
